<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    use HasFactory;

    public $timestamps = false;

    public function user()
    {
        return $this->belongsToMany(User::class, 'user_location');
    }

    public function location_type()
    {
        return $this->belongsTo(LocationType::class);
    }

    public function generated_tasks()
    {
        return $this->hasMany(GeneratedTask::class);
    }
}
