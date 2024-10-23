<?php

namespace App\Helper;

use App\Models\AdminSetting;

class AdditionalResources
{
    /** 
     * @uses appInfoData get frontend and backend app info data.
     */
    public static function appInfo(string|NULL $key = null)
    {
        $data = array(
            'title' => 'Southern Designers',
            'meta_keyword' => '',
            'meta_description' => '',
            'favicon' => '/favicon.ico',
        );
        if ($key && isset($data[$key])) return $data[$key];

        return $data;
    }

    /**
     * @uses self::function ClientsRoute
     */
    public static function ClientsRoute() {}


    public static function adminAppInfo(?string $key = null)
    {
        $app = AdminSetting::latest('id')->first();

        $data = array(
            'title' => $app->title,
            'primary_color' => $app->primary_color ?? '#3753e9',
            'secondary_color' => $app->secondary_color ?? '#415FFF',
            'favicon' => isset($app->favicon) ? asset($app->favicon) : null,
            'logo' => isset($app->logo) ? asset($app->logo) : null,
            'facebook' => $app->facebook,
            'whatsapp' => $app->whatsapp,
            'twitter' => $app->twitter,
            'linkedin' => $app->linkedin,
            'google' => $app->google,
            'footer_text' => $app->footer_text,
        );

        if (!$key) return $data;

        if (isset($data[$key])) {
            return $data[$key];
        } else {
            return null;
        }
    }

    // set the rating star
    public static function serializeElement(int $ratings = 1, int $lim = 5, string $primary_el = "<i class='fa-solid fa-star'></i>", string $secondary_el = "<i class='fa-regular fa-star'></i>")
    {
        $stars = array();

        foreach (range(1, $ratings) as $rating) {
            $stars[] = $primary_el;
        }

        foreach (range($ratings + 1, $lim) as $rating) {
            $stars[] = $secondary_el;
        }

        return implode(" ", $stars);
    }
}
