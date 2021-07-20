<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PartnerRule extends Model
{
    use HasFactory;

    public $timestamps = false;

    public function partner_tasks()
    {
        return $this->belongsToMany(PartnerTask::class, 'partner_task_rule');
    }
}
