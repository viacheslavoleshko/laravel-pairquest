<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rule extends Model
{
    use HasFactory;

    public $timestamps = false;

    public function tasks()
    {
        return $this->belongsToMany(Task::class, 'task_rule');
    }
}
