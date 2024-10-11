<?php

use App\Http\Controllers\Admin\AboutBannerController;
use App\Http\Controllers\Admin\AboutController;
use App\Http\Controllers\Admin\BrandsController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ContactBannerController;
use App\Http\Controllers\Admin\ContactController;
use App\Http\Controllers\Admin\MediaBannerController;
use App\Http\Controllers\Admin\MediaController;
use App\Http\Controllers\Admin\MediaGalleryController;
use App\Http\Controllers\Admin\OthersServicesController;
use App\Http\Controllers\Admin\PrimaryServicesController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\ReviewsController;
use App\Http\Controllers\Admin\ServicesCounterController;
use App\Http\Controllers\Admin\ServicesProductController;
use App\Http\Controllers\Admin\SustainabilityController;
use App\Http\Controllers\Admin\SustainabilityVideosController;
use App\Http\Controllers\client\ClientController;
use App\Http\Controllers\HomepageSetupController;
use Illuminate\Support\Facades\Route;

Route::group(['as' => 'admin.', 'prefix' => 'admin', 'middleware' => ['admin_permission', /* 'role_has_permission' */]], function () {
    Route::resource('home-page-setup', HomepageSetupController::class);
    Route::resource('home-page-services-product', ServicesProductController::class);
    Route::resource('home-page-primary-services', PrimaryServicesController::class);
    Route::resource('home-page-services-counter', ServicesCounterController::class);
    Route::resource('home-page-others-services', OthersServicesController::class);
    Route::resource('home-page-reviews', ReviewsController::class);
    Route::resource('home-page-brands', BrandsController::class);

    Route::resource('product', ProductController::class);
    Route::resource('category', CategoryController::class);

    Route::resource('media', MediaController::class);
    Route::resource('media-banner', MediaBannerController::class);
    Route::resource('media-gallery', MediaGalleryController::class);

    Route::resource('sustainability', SustainabilityController::class);
    Route::resource('sustainability-videos', SustainabilityVideosController::class);

    Route::resource('contacts', ContactController::class);
    Route::resource('contacts-banner', ContactBannerController::class);

    Route::resource('about-us', AboutController::class);
    Route::resource('about-banner', AboutBannerController::class);
});

// This routing group only applicable for front-end public's pages!
Route::group(['as' => 'frontend.'], function () {
    Route::controller(ClientController::class)->group(function () {
        Route::get('/', 'home')->name('home');
    });
});

Route::middleware('un_auth')->group(function () {});

Route::get('/1', function () {
    $adminMenu = App\Models\AdminMenu::select(['name', 'id',])/* ->whereNotIn('id', [1, 2, 3, 5, 43, 44, 80, 73]) */->latest('id')->get();

    return $adminMenu;
});
