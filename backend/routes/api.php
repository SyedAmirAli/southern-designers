<?php

use App\Http\Controllers\Admin\ContactController;
use App\Http\Controllers\Frontend\FrontendController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::prefix('/v1/frontend')->as('frontend.v1.')->controller(FrontendController::class)->group(function () {
    Route::get('/homepage-items', 'homepageItems');
    Route::get('/about-items', 'aboutItems');
    Route::get('/media-items', 'mediaItems');
    Route::get('/contact-items', 'contactItems');
    Route::get('/sustainability-items', 'sustainabilityItems');
    Route::get('/categories', 'categories');
    Route::get('/category-with-products/{slug}', 'categoryWithProducts');

    Route::get('/settings', 'settings');

    Route::post('send-contact-message', [ContactController::class, 'store']);
});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
