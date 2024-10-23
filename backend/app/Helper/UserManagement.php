<?php
namespace App\Helper;

use Illuminate\Support\Facades\Auth;

class UserManagement{
    public static function role($role_type){
        switch ($role_type){
            case 'admin':
            case 'system-admin':
            case 'System Admin':
            case 'SystemAdmin':
            case 'systemAdmin':
            case 'systemadmin':
            case 'App Admin':
            case 'app-admin':
            case 'Main Admin':
            case 'main-admin':
                return Auth::user()->hasRole('admin') || Auth::user()->hasRole('System Admin') || (Auth::id() == 1);

            default:
                return false;
        }
    }
}