<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends \TCG\Voyager\Models\User
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'gender_id',
        'user_level_id',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function gender()
    {
        return $this->belongsTo(Gender::class);
    }

    public function user_levels()
    {
        return $this->belongsToMany(UserLevel::class, 'user_level_stack');
    }

    public function preferences()
    {
        return $this->belongsToMany(Preference::class, 'user_preference');
    }

    public function locations()
    {
        return $this->hasMany(Location::class);
    }

    public function generated_task()
    {
        return $this->hasOne(GeneratedTask::class);
    }

    public function likes()
    {
        return $this->hasMany(Like::class);
    }
}
