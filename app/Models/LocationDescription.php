<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LocationDescription extends Model
{
    use HasFactory;

    protected $fillable = [
        'description',
        'partner_description',
        'location_id',
    ];

    public $timestamps = false;

    public function location()
    {
        return $this->belongsTo(Location::class);
    }

    public function generated_tasks()
    {
        return $this->hasMany(GeneratedTask::class);
    }
}
