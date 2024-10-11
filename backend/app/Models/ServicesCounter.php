<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ServicesCounter extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'value',
        'icon',
        'status',
        'serial',
        'created_by',
    ];
}
