<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'image',
        'summery',
        'rating',
        'serial',
        'icon',
        'status',
        'created_by',
    ];
}
