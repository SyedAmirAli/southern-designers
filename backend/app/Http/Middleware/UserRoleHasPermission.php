<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Symfony\Component\HttpFoundation\Response;

class UserRoleHasPermission
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if($request->user()->hasRole("admin") || $request->user()->hasRole('System Admin')) {
            return $next($request);
        }

        if($request->isMethod(Request::METHOD_GET)) {
            $current_route = implode('_', explode('-', explode('.', Route::currentRouteName())[1]));
            return $next($request);
        }

        return redirect()->back()->withErrors("You don't have a permission to do this.");
    }
}
