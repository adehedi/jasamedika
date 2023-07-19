<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Patrol extends Model
{
    use HasFactory;

    protected $table = 'patrol';
    protected $fillable = [
        'id',
        'location_id',
        'user_id',
        'condition',
        'condition_note',
        'photo_one',
        'photo_two',
        'photo_three',
        'video',
    ];

    protected $casts = [
        'created_at' => 'datetime:Y-m-d H:i:s',
    ];

    protected static function booted(): void
    {
        static::creating(function (self $model) {
            $model->updated_at = null;
        });
    }

    public function getCreatedAtAttribute($date)
    {
        return Carbon::parse($date)->setTimezone('Asia/Jakarta')->format('Y-m-d H:i:s');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function location()
    {
        return $this->belongsTo(Location::class);
    }
}
