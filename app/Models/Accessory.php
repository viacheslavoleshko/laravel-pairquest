<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Accessory extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'name',
        'preference_id',
    ];

    public function tasks()
    {
        return $this->belongsToMany(Task::class, 'task_accessory');
    }
}
