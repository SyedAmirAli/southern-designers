<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\AdminMenuController;
use App\Http\Controllers\Admin\AdminSettingController;
use App\Http\Controllers\Admin\AdminMenuActionController;
use App\Http\Controllers\Admin\AppSettingsController;
use App\Http\Controllers\Admin\AuthPageSetupController;
use App\Http\Controllers\Admin\PasswordResetController;
use App\Http\Controllers\client\AuthController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::group(['as' => 'admin.', 'prefix' => 'admin', 'middleware' => ['admin_permission', /* 'role_has_permission' */]], function () {
    Route::resource('/auth-page', AuthPageSetupController::class);

    Route::controller(PasswordResetController::class)->group(function () {
        Route::match(['GET', 'POST'], 'password-reset', 'passwordReset')->name('password_reset');
        Route::match(['GET', 'POST'], 'change-email-or-username', 'changeEmailOrUsername')->name('change_email_or_user_name');
    });
});

// This routing group only applicable for front-end public's pages!
Route::group(['as' => 'frontend.'], function () {
    Route::group(['prefix' => 'password-forgot'], function () {
        Route::controller(PasswordResetController::class)->group(function () {
            Route::match(['GET', 'POST'], '/', 'forgotPassword')->name('password_forgot');
            Route::match(['GET', 'POST'], '/find-user', 'findUser')->name('find_user');
            Route::post('/set-new-password', 'setNewPasswordByForgot')->name('set_new_password');
        });
    });
});

Route::middleware('un_auth')->group(function () {
    Route::group(['as' => 'frontend.auth.', 'prefix' => 'auth'], function () {
        Route::controller(AuthController::class)->group(function () {
            Route::post('/login', 'login')->name('login');
            Route::get('/o-auth', 'oAuth')->name('o_auth');
            Route::post('/register', 'register')->name('register');
            Route::post('/webhook/o-auth', 'handle')->name('clerk-auth');
        });
    });

    Route::group(['as' => 'frontend.o-auth.google.', 'prefix' => 'o-auth', 'middleware' => 'web'], function () {
        Route::controller(AuthController::class)->group(function () {
            Route::get('/google', 'googleRedirect')->name('redirect');
            Route::get('/google/callback', 'callbackGoogle')->name('callback');
        });
    });

    Route::group(['as' => 'frontend.o-auth.facebook.', 'prefix' => 'o-auth'], function () {
        Route::controller(AuthController::class)->group(function () {
            Route::get('/facebook', 'facebookRedirect')->name('redirect');
            Route::get('/facebook/callback', 'callbackFacebook')->name('callback');
        });
    });

    Route::get('/login', fn() => redirect('auth/o-auth'));
});

Route::group(['as' => 'admin.', 'prefix' => 'admin'], function () {
    Route::get('/', fn() => redirect()->route('frontend.auth.o_auth'))->name('login.index');
    Route::post('/login', fn() => redirect()->route('frontend.auth.o_auth'))->name('login');
});


Route::get("/extra", function () {
    return
        '<h1>
            Now Times: <span></span>
            
            <script>
                setInterval(()=> document.querySelector("span").innerHTML = (new Date()).toLocaleTimeString(), 1000);
            </script>
        </h1>';
})->name("extra");


/**
 * @name All route for admin setting 
 */

Route::group(['as' => 'admin.', 'prefix' => 'admin', 'middleware' => ['admin_permission']], function () {
    Route::get('/dashboard', [AdminController::class, 'dashboard'])->name('dashboard');

    Route::post('/sidebar', [AdminController::class, 'sidebar'])->name('sidebar');
    Route::get('/profile', [AdminController::class, 'edit'])->name('profile.index');
    Route::put('/change-images', [AdminController::class, 'changeImages'])->name('change-images');
    Route::put('/change-password', [AdminController::class, 'changePassword'])->name('change-password');
    Route::put('/profile', [AdminController::class, 'update'])->name('profile.update');

    // User Management
    Route::resource('/user', UserController::class);
    Route::get('/user/{id}/password', [UserController::class, 'changePassword'])->name('user.password');
    Route::put('/user/password/{id}', [UserController::class, 'passwordUpdate'])->name('user.password-update');

    // Role Management
    Route::resource('/role', RoleController::class);

    // Permission Management
    Route::get('/permission/{id}', [RoleController::class, 'rolePermissionEdit'])->name('rolePermission.edit');
    Route::put('/permission/permissions-update/{id}', [RoleController::class, 'rolePermissionUpdate'])->name('rolePermission.update');

    // Admin Menu Management
    Route::resource('/admin-menu', AdminMenuController::class);

    // Admin Menu Actions Management
    Route::get('/admin-menu-actions/{id}', [AdminMenuActionController::class, 'index'])->name('admin-menuAction.index');
    Route::post('/admin-menu-actions/{id}/store', [AdminMenuActionController::class, 'store'])->name('admin-menuAction.store');
    Route::get('/admin-menu-actions/{id}/edit', [AdminMenuActionController::class, 'edit'])->name('admin-menuAction.edit');
    Route::put('/admin-menu-actions/{id}', [AdminMenuActionController::class, 'update'])->name('admin-menuAction.update');
    Route::delete('/admin-menu-actions/{id}', [AdminMenuActionController::class, 'destroy'])->name('admin-menuAction.destroy');
    Route::get('/admin-menu-actions-status/{id}', [AdminMenuActionController::class, 'status'])->name('admin-menuAction.status');
    Route::get('/admin-menu-actions/{id}/create', [AdminMenuActionController::class, 'create'])->name('admin-menuAction.create');

    // Admin Settings Management
    Route::resource('/admin-settings', AdminSettingController::class);

    // Settings Management
    Route::resource('/settings', AppSettingsController::class);
});


require __DIR__ . '/auth.php';

/** ----------- utility start ---------- */
Route::get('/clear', function () {
    Artisan::call('cache:clear');
    Artisan::call('config:clear');
    Artisan::call('config:cache');
    Artisan::call('view:clear');
    Artisan::call('route:clear');
    Artisan::call('clear-compiled');
    return redirect()->back()->withSuccessMessage('Cleared Successfully!');
});

Route::get('/storage-link', function () {
    Artisan::call('storage:link');
    return redirect()->back()->withSuccessMessage('Linked Successfully!');
});

Route::get('/toggle-debug', function () {
    $path = base_path('.env');
    $test = file_get_contents($path);

    $prev_status = $_ENV['APP_DEBUG'];
    if ($prev_status == 'true' && file_exists($path)) {
        file_put_contents($path, str_replace('APP_DEBUG=true', 'APP_DEBUG=false', $test));
    }
    if ($prev_status == 'false' && file_exists($path)) {
        file_put_contents($path, str_replace('APP_DEBUG=false', 'APP_DEBUG=true', $test));
    }
    Artisan::call('config:clear');
    return redirect()->back()->withSuccessMessage('changed successfully!');
});

Route::view('/welcome', 'admin.team_page.index');



/** ----------- utility end ---------- */
