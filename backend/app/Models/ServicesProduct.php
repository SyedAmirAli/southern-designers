<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ServicesProduct extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'image',
        'summery',
        'icon',
        'status',
        'serial',
        'created_by',
    ];
}
