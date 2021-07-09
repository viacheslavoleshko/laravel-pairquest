<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;

    public $timestamps = false;

    public function user_level()
    {
        return $this->belongsTo(UserLevel::class);
    }

    public function preference()
    {
        return $this->belongsTo(UserLevel::class);
    }

    public function duration()
    {
        return $this->belongsTo(Duration::class);
    }

    public function gender()
    {
        return $this->belongsTo(Gender::class);
    }

    public function partner_tasks()
    {
        return $this->belongsToMany(PartnerTask::class, 'task_combinations');
    }

    public function generated_tasks()
    {
        return $this->hasMany(GeneratedTask::class);
    }

    public function likes()
    {
        return $this->hasMany(Like::class);
    }
}
