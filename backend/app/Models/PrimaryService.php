<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PrimaryService extends Model
{
    use HasFactory;
    protected $fillable  = [
        'name',
        'image',
        'summery',
        'btn_title',
        'btn_url',
        'btn_target',
        'btn_icon',
        'status',
        'serial',
        'created_by',
    ];
}
