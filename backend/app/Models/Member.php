<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Member extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'title',
        'phone',
        'email',
        'fb_icon',
        'fb_url',
        'fb_target',
        'x_icon',
        'x_url',
        'x_target',
        'instagram_icon',
        'instagram_url',
        'instagram_target',
        'linkedin_icon',
        'linkedin_url',
        'linkedin_target',
        'serial',
        'status',
        'created_by',
        'image',
    ];
}
