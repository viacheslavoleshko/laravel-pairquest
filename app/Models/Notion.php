<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notion extends Model
{
    use HasFactory;

    public $timestamps = false;

    public function detailed_tasks()
    {
        return $this->belongsToMany(DetailedTask::class, 'detailed_task_notion');
    }
}
