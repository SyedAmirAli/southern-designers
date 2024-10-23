<?php

namespace App\Http\Controllers\client;

use App\Helper\SinglePageDataKeyManager;
use App\Http\Controllers\Controller;

class ClientController extends Controller
{
    public function home()
    {
        return view("client.home");
    }
}
