<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SustainabilityVideo extends Model
{
    use HasFactory;
    protected $fillable = [
        'title',
        'embed_code',
        'serial',
        'status',
        'created_by',
    ];
}
