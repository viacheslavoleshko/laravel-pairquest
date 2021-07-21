<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;

    protected $fillable = [
        'description',
        'partner_description',
        'location_type_id',
        'preference_id',
    ];

    public $timestamps = false;

    public function location_type()
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
