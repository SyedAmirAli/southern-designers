<?php

namespace App\Helper;

class SinglePageDataKeyManager
{
    static $asset = 'http://localhost/pathgriho/public/';
    const HOME_PAGE = "HOME_PAGE_SETUP";
    const MEDIA_PAGE = "MEDIA_PAGE_ITEMS";
    const SUSTAINABILITY_PAGE = "SUSTAINABILITY_PAGE_ITEMS";
    const ABOUT_PAGE = "ABOUT_PAGE_ITEMS";
    const CONTACT_PAGE = "CONTACT_PAGE_ITEMS";
    const APP_SETTINGS = "APP_SETTINGS_ITEMS";
    const AUTHENTICATION_PAGE = "AUTHENTICATION__PAGE__DETAILS__STATIC__ITEMS";

    public static function clientAssets()
    {
        return array(
            'man' => 'https://staging.pathgriho.org/public/media/testimonial/2024-03-03-gySCRHDCsI5hOmLgh5jrQuIski06gS9xukiHIxN8.jpg',
            'paymentImage' => asset('assets/images/media/sslcommerz-banner.png'),
            'image' => asset('assets/images/media/sslcommerz-banner.png'),
            'images' => array(
                asset('assets/images/logo.jpg'),
                asset('assets/images/banner-1.jpg'),
                asset('assets/images/banner-2.jpg'),
                asset('assets/images/banner-3.jpg'),
                asset('assets/images/banner-4.jpg'),
                asset('assets/images/banner-5.jpg'),
                asset('assets/images/hiring.webp'),
                asset('assets/images/team-profile3.webp'),
            )
        );
    }
}
