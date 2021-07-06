<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;

    public function user_level()
    {
        return $this->belongsTo(UserLevel::class);
    }

    public function preference()
    {
        return $this->belongsTo(UserLevel::class);
    }

    public function duration()
    {
        return $this->belongsTo(Duration::class);
    }

    public function gender()
    {
        return $this->belongsTo(Gender::class);
    }
}
