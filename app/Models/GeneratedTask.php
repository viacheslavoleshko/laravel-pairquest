<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GeneratedTask extends Model
{
    use HasFactory;

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function location()
    {
        return $this->belongsTo(Location::class);
    }

    public function task()
    {
        return $this->belongsTo(Task::class);
    }

    public function task_combination()
    {
        return $this->belongsTo(TaskCombination::class);
    }

    public function accessory()
    {
        return $this->belongsTo(Accessory::class);
    }

    public function likes()
    {
        return $this->hasMany(Like::class);
    }
}