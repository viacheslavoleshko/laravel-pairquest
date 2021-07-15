<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserLevel extends Model
{
    use HasFactory;

    public $timestamps = false;

    public function users()
    {
        return $this->belongsToMany(User::class, 'user_level_stack');
    }

    public function tasks()
    {
        return $this->hasMany(Preference::class);
    }
}
