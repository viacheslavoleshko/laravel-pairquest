<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;

    public $timestamps = false;

    public function location_types()
    {
        return $this->belongsTo(LocationType::class);
    }

    public function preference()
    {
        return $this->belongsTo(Preference::class);
    }

    public function generated_tasks()
    {
        return $this->hasMany(GeneratedTask::class);
    }

    public function rules()
    {
        return $this->belongsToMany(Rule::class, 'task_rule');
    }
}
