<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PartnerTask extends Model
{
    use HasFactory;

    protected $fillable = [
        'description',
        'gender_id'
    ];

    public $timestamps = false;

    public function tasks()
    {
        return $this->belongsToMany(Task::class, 'task_combinations');
    }

    public function gender()
    {
        return $this->belongsTo(Gender::class);
    }

    public function partner_rules()
    {
        return $this->belongsToMany(PartnerRule::class, 'partner_task_rule');
    }
}
