<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Mailgun, Postmark, AWS and more. This file provides the de facto
    | location for this type of information, allowing packages to have
    | a conventional file to locate the various service credentials.
    |
    */

    'mailgun' => [
        'domain' => env('MAILGUN_DOMAIN'),
        'secret' => env('MAILGUN_SECRET'),
        'endpoint' => env('MAILGUN_ENDPOINT', 'api.mailgun.net'),
        'scheme' => 'https',
    ],

    'postmark' => [
        'token' => env('POSTMARK_TOKEN'),
    ],

    'ses' => [
        'key' => env('AWS_ACCESS_KEY_ID'),
        'secret' => env('AWS_SECRET_ACCESS_KEY'),
        'region' => env('AWS_DEFAULT_REGION', 'us-east-1'),
    ],

    // 'github' => [
    //     'client_id' => env('GITHUB_CLIENT_ID'),
    //     'client_secret' => env('GITHUB_CLIENT_SECRET'),
    //     'redirect' => env('REDIRECT_CALLBACK_AFTER_AUTH', 'http://127.0.0.1:8000'),
    // ],

    'google' => [
        'client_id' => env('GOOGLE_CLIENT_ID', '705262571369-kv5fksc6pcrraodlu4u2a867gfd1oej8.apps.googleusercontent.com'),
        'client_secret' => env('GOOGLE_CLIENT_SECRET', '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'),
        'redirect' => env('REDIRECT_CALLBACK_GOOGLE_AUTH', 'https://pathgriho.org/public/o-auth/google/callback'),
    ],

];
