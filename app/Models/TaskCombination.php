<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TaskCombination extends Model
{
    use HasFactory;

    public function generated_tasks()
    {
        return $this->hasMany(GeneratedTask::class);
    }
}
