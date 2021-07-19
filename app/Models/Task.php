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

}
