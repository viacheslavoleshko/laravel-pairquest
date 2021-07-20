<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetailedTask extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'preference_id',
        'duration_id',
        'user_level_id',
        'is_partner_task',
        'description',
        'is_accessories',
        'gender_id'
    ];


    public $timestamps = false;

    public function user_level()
    {
        return $this->belongsTo(UserLevel::class);
    }

    public function location_types()
    {
        return $this->belongsTo(LocationType::class);
    }

    public function preference()
    {
        return $this->belongsTo(Preference::class);
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

    public function accessories()
    {
        return $this->belongsToMany(Accessory::class, 'task_accessory');
    }

    public function notions()
    {
        return $this->belongsToMany(Notion::class, 'detailed_task_notion');
    }
}
