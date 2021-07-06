<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Preference extends Model
{
    use HasFactory;

    public function users()
    {
        return $this->belongsToMany(User::class);
    }

    public function accessory()
    {
        return $this->belongsTo(Accessory::class);
    }

    public function tasks()
    {
        return $this->hasMany(Task::class);
    }
}
