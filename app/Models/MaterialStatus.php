<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MaterialStatus extends Model
{
    use HasFactory;
    protected $table = 'material_status';
    protected $fillable = [
        'material_status',
        'created_by'
    ];
}
