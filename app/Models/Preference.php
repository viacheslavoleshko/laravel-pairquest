<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Preference extends Model
{
    use HasFactory;

    public $timestamps = false;


    public function users()
    {
        return $this->belongsToMany(User::class, 'user_preference');
    }

    public function tasks()
    {
        return $this->hasMany(DetailedTask::class);
    }
}
