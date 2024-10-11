<?php

namespace App\Http\Controllers\client;

use App\Helper\SinglePageDataKeyManager;
use App\Http\Controllers\Controller;
use App\Models\SinglePageData;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Laravel\Socialite\Facades\Socialite;
use Laravel\Socialite\Two\InvalidStateException;

class AuthController extends Controller
{
    public function googleRedirect()
    {

        /* info(json_encode([
            'client_id' => getenv('GOOGLE_CLIENT_ID'),
            'client_secret' => getenv('GOOGLE_CLIENT_SECRET'),
            'redirect' => getenv('REDIRECT_CALLBACK_GOOGLE_AUTH'),
        ],JSON_PRETTY_PRINT)); */

        return Socialite::driver('google')->redirect();
    }

    public function callbackGoogle()
    {
        try {
            $google_user = Socialite::driver('google')->user();
            $user = User::where('email', $google_user->getEmail());

            if ($user->exists()) {
                $_user = $user->first();

                if (!$_user->google_id) {
                    $user->update(['google_id' => $google_user->getId()]);
                }

                if (!$_user->image) {
                    $user->update(['image' => $google_user->getAvatar()]);
                }

                if (!$_user->user_name) {
                    $username = strtolower(str_replace(" ", "", $google_user->getName()));

                    $username = $this->generateUniqueUsername($username);
                    $user->update(['user_name' => $username]);
                }

                Auth::login($user->first());
                return redirect()->route('admin.dashboard')->withSuccessMessage("You're Logged In!");
            } else {
                $name = $google_user->getName();
                $username = strtolower(str_replace(' ', '', $name));
                $username = $this->generateUniqueUsername($username);

                $user = User::create([
                    'google_id' => $google_user->getId(),
                    'name' => $name,
                    'user_name' => $username,
                    'image' => $google_user->getAvatar(),
                    'email' => $google_user->getEmail(),
                    'role' => 1
                ]);

                $user->assignRole('General User'); // add role into new user
                Auth::login($user);
                return redirect()->route('admin.dashboard')->withSuccessMessage("You're Logged In!");
            }
        } catch (InvalidStateException $e) {
            Log::error($e->getMessage());
            return response("Something Went Wrong...\n<br />\n<a href='/auth/o-auth/'>Back</a>" . $e->getMessage(), 500);
        }
    }


    public function oAuth(Request $request)
    {
        $data = SinglePageData::where('enum', SinglePageDataKeyManager::AUTHENTICATION_PAGE)->latest('id')->first();
        $details = $data->contents ? json_decode($data->contents, true) : array();

        return view('client.auth.o-auth', compact('details'));
    }

    public function login(Request $request)
    {
        $request->validate([
            'username_or_email' => 'required',
            'password' => 'required|min:8|max:24'
        ]);

        // Determine the column based on the identity type
        $column = filter_var($request->username_or_email, FILTER_VALIDATE_EMAIL) ? 'email' : 'user_name';

        // Use a single query to retrieve the user based on the identity
        $user = User::where($column, $request->username_or_email)->latest('id')->first();

        if ($user) {
            info('Not Authenticated');
            if (Hash::check($request->password, $user->password)) {
                info('Authenticated');
                Auth::login($user);
                return redirect()->route('admin.dashboard')->withSuccessMessage("You're Logged In!");
            }

            return redirect()->back()->with("error", "Wrong Password!");
        }

        return redirect()->back()->with("error", "Sorry User Not Found! Please Register an Account!");
    }
    public function register(Request $request)
    {
        $request->validate([
            'username_or_email' => 'required|unique:users,email',
            'password' => 'required|min:8|max:24'
        ]);

        $email = "";
        $username = "";
        $identity = $request->username_or_email;

        if (filter_var($identity, FILTER_VALIDATE_EMAIL)) {
            $request->validate([
                'username_or_email' => 'required|unique:users,email',
                'password' => 'required|min:8|max:24'
            ]);

            $email = $identity;
            $username = strtolower(str_replace(" ", "", $identity));
        } else {
            $request->validate([
                'username_or_email' => 'required|unique:users,user_name',
                'password' => 'required|min:8|max:24'
            ]);

            $email = null;
            $username = strtolower(str_replace(" ", "", $identity));
        }

        $password = Hash::make($request->password);

        $user = User::create([
            'email' => $email,
            'user_name' => $username,
            'password' => $password,
            'name' => $request->name,
            'role' => 1,
        ]);

        if (!$user) {
            return redirect()->back()->with("error", "Something Went Wrong! Please try again.");
        }

        $user->assignRole('General User');
        Auth::login($user);

        return redirect()->route('admin.dashboard')->withSuccessMessage("Registered Successfully!");
    }

    public function handle(Request $request)
    {
        $evt = $request->input('evt');
        switch ($evt['type']) {
            case 'user.created':
                // Handle user created event
                $firstName = $evt['data']['first_name'];
                $lastName = $evt['data']['last_name'];
                $emails = $evt['data']['email_addresses'];

                info(json_encode($evt, JSON_PRETTY_PRINT));
                break;
                // Add cases for other event types as needed
            default:
                info('DEFAULT');
                info(json_encode($evt, JSON_PRETTY_PRINT));
                // Handle unknown event type
                break;
        }
    }

    public function facebookRedirect()
    {
        return redirect()->route('frontend.auth.o_auth')->with('success', 'Facebook Authentication is currently unavailable. Please continue with google!');
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
