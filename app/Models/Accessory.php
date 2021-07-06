<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Accessory extends Model
{
    use HasFactory;

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function preferences()
    {
        return $this->hasMany(Preference::class);
    }

    public function generated_tasks()
    {
        return $this->hasMany(GeneratedTask::class);
    }
}
