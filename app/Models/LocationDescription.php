<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LocationDescription extends Model
{
    use HasFactory;

    public $timestamps = false;

    public function location()
    {
        return $this->belongsTo(Location::class);
    }

    public function generated_tasks()
    {
        return $this->hasMany(GeneratedTask::class);
    }
}
