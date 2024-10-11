<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Mail\PasswordResetMail;
use App\Models\PasswordReset;
use App\Models\User;
use Carbon\Carbon;
use Exception;
use Illuminate\Auth\Notifications\ResetPassword;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;

class PasswordResetController extends Controller
{
    public static $code_validated_duration = 10; // 5 minutes
    public function passwordReset(Request $request){
        if($request->isMethod("GET")) return view('admin.password-reset.reset_password');

        if($request->isMethod('POST')){
            $request->validate(['password'=> 'required|max:24', 'new_password'=> 'required|max:24|min:8', 'conf_password'=> 'required|max:24|min:8']);
            
            $password = $request->password;
            $new_password = $request->new_password;
            $conf_password = $request->conf_password;

            if($new_password != $conf_password) return redirect()->back()->withErrors("Your new password and confirm password aren't same!");

            $user = User::findOrFail(Auth::id());

            if(Hash::check($password, $user->password)){
                $user->password = Hash::make($new_password);
                $user->save();

                return redirect()->route('admin.dashboard')->withSuccessMessage('Your Password Reset Successfully!');
            }

            return redirect()->back()->withErrors("Your Password doesn't match with your current password!");
        }

        return redirect()->back()->withErrors('Invalid Request!');
    }

    public function changeEmailOrUsername(Request $request){
        if($request->isMethod("GET")) return view('admin.password-reset.reset_password');

        if($request->isMethod('POST')){
            $request->validate(['password'=> 'required|max:24', 'email'=> 'required|email', 'user_name'=> 'required']);
            
            $password = $request->password;
            $email = $request->email;
            $user_name = $request->user_name;

            $user = User::findOrFail(Auth::id());

            $is_exist_email_or_username = User::whereNot('id', $user->id)->where('email', $email)->where('user_name', $user_name)->exists();
            if($is_exist_email_or_username){
                return redirect()->back()->withErrors("Your email or user name is already exists!");
            }

            if(Hash::check($password, $user->password)){
                $user->user_name = $user_name;
                $user->email = $email;
                $user->save();

                return redirect()->route('admin.dashboard')->withSuccessMessage('E-mail/Username Updated Successfully!');
            }

            return redirect()->back()->withErrors("Your Password doesn't match with your registered/login password!");
        }

        return redirect()->back()->withErrors('Invalid Request!');
    }

    public function forgotPassword(Request $request){
        if($request->isMethod('GET')) return view('admin.password-reset.forgot_password');

        $responseArray = array(
            'status'=> 403,
            'type'=> 'error',
            'notification'=> "Unknown Code", 
            'message'=> 'Can not found reset password request!', 
            'result'=>null,
        );

        if($request->isMethod('POST')) {
            // $responseArray['status'] = 300;
            // $responseArray['type'] = 'success';
            // $responseArray['notification'] = 'Congratulations';
            // $responseArray['message'] = 'Request Sended Successfully!';
            // $responseArray['result'] = $request->all();

            $id = $request->id;
            $code = is_array($request->code) ? ((int) implode('', $request->code)) : null;
            $email = $request->email;

            if(empty($code)){
                $responseArray['status'] = 302;
                $responseArray['notification'] = 'Code not found!';
                $responseArray['message'] = 'Please Insert all the codes.';

                return response()->json($responseArray, $responseArray['status']);
            }

            if(empty($email)){
                $responseArray['status'] = 302;
                $responseArray['notification'] = 'Email not found!';
                $responseArray['message'] = 'Please Insert the email carefully';

                return response()->json($responseArray, $responseArray['status']);
            }

            // where('id', $id)->
            $reset_password = PasswordReset::where('email', $email)->where('code', $code);
            
            if($reset_password->exists()){
                if($reset_password->latest('id')->first()->code == $code){
                    $reset_password_data = $reset_password->where('start_time', '<=', Carbon::now()->toISOString())
                        ->where('expired_time', '>=', Carbon::now()->toISOString())
                        ->first();

                    if($reset_password_data){
                        $responseArray['status'] = 200;
                        $responseArray['type'] = 'success';
                        $responseArray['notification'] = 'Congratulations';
                        $responseArray['message'] = 'Request Sended Successfully!';
                        $responseArray['result'] = $reset_password_data;
                    
                        $reset_password->update(['verify'=> true]);
                        return response()->json($responseArray, $responseArray['status']);
                    }

                    $responseArray['notification'] = 'EXPIRED';
                    $responseArray['message'] = 'Code validity has expired';
                    return response()->json($responseArray, $responseArray['status']);
                }

                $responseArray['message'] = 'Password reset code is invalid!';
                return response()->json($responseArray, $responseArray['status']);
            }
             
            // $responseArray['notification'] = $code;
            return response()->json($responseArray, $responseArray['status']);
        };
    }

    public function findUser(Request $request){
        $identity = $request->user_identity;

        if(empty($identity)){
            return response()->json([
                'status'=> 403,
                'duration'=> 60,
                'type'=> 'error',
                'notification'=> 'Invalid E-mail/Username!', 
                'message'=> 'Your Username/E-mail is empty',
            ], 403);
        }

        if(filter_var($identity, FILTER_VALIDATE_EMAIL)){
            $user = User::where('email', $identity)->latest('id')->first();
        } else {
            $user = User::where('user_name', $identity)->latest('id')->first();
        }

        if($user){
            $code = mt_rand(100000, 999999);  
            $responseArray = array(
                'status'=> 200,
                'type'=> 'success',
                'duration'=> 5,
                'notification'=> 'User Founded!', 
                'message'=> "We send a code into your email account <span class='font-semibold text-primary px-1'>{$user->email}</span> to verify the account.",
                'validity'=> array(
                    'id'=> 0,
                    'start'=> 60,
                    'end'=> 60,
                ),
            );

            $start_time = Carbon::now()->toISOString();
            $expired_time = Carbon::parse(Carbon::now()->addMinutes(static::$code_validated_duration))->toISOString();

            try{
                $mail = Mail::to($user->email)->send(new PasswordResetMail($code));
                $create_reset_ref = PasswordReset::create(array(
                    'user_id'=> $user->id,
                    'email'=> $user->email,
                    'code'=> $code,
                    'start_time'=> $start_time,
                    'expired_time'=> $expired_time,
                ));

                $responseArray['validity'] = array(
                    'id'=> $create_reset_ref->id,
                    'start'=> $create_reset_ref->start_time,
                    'end'=> $create_reset_ref->expired_time,
                );
            } catch (Exception $e) {
                $message = 'Password Reset E-mail Exception Error => '. $e->getMessage();
                Log::error($message);

                $responseArray['status'] = 500;
                $responseArray['type'] = 'error';
                $responseArray['message'] = $message;
                $responseArray['notification'] = 'SERVER_ERR: Please try again latter!';
                return response()->json($responseArray, $responseArray['status']);
            }

            return response()->json($responseArray, $responseArray['status']);
        }

        return response()->json([
            'status'=> 404,
            'type'=> 'error',
            'duration'=> 60,
            'notification'=> 'User Not Founded!', 
            'message'=> "Sorry we can't found any users on this {$identity}.",
        ], 404);
    }

    public function setNewPasswordByForgot(Request $request){
        $responseArray = array(
            'status'=> 403,
            'type'=> 'error',
            'notification'=> "Dined Request!", 
            'message'=> 'Reset code are not verified!', 
            'result'=>null,
        );

        $password = $request->new_password;
        $retype_password = $request->retype_password;

        if(empty($password) || empty($retype_password) || ($password != $retype_password)){
            $responseArray['notification'] = 'Password Problem!';
            $responseArray['message'] = 'Password does not matched!';

            return response()->json($responseArray, $responseArray['status']);
        }

        $id = $request->id;
        $code = is_array($request->code) ? ((int) implode('', $request->code)) : null;
        $email = $request->email;

        if(empty($code)){
            $responseArray['status'] = 302;
            $responseArray['notification'] = 'Code not found!';
            $responseArray['message'] = 'Please Insert all the codes.';

            return response()->json($responseArray, $responseArray['status']);
        }

        if(empty($email)){
            $responseArray['status'] = 302;
            $responseArray['notification'] = 'Email not found!';
            $responseArray['message'] = 'Please Insert the email carefully';

            return response()->json($responseArray, $responseArray['status']);
        }

        $reset_password = PasswordReset::where('email', $email)->where('code', $code)->latest('id')->first();

        if($reset_password->is_reset){
            $responseArray['notification'] = 'Bad Request!';
            $responseArray['message'] = 'This reset password code is already used yet!';
            return response()->json($responseArray, $responseArray['status']);
        }

        if($reset_password->verify){
            $user = User::findOrFail($reset_password->user_id);
            $user->password = Hash::make($password);
            $user->save();
            $reset_password->update(['is_reset'=> true]);

            return response()->json(array(
                'status'=> 200,
                'type'=> 'success',
                'notification'=> "Password Changed!", 
                'message'=> 'New Password Recorded successfully!', 
                'result'=>null,
            ), 200);
        }

        return response()->json($responseArray, $responseArray['status']);
    }
}
