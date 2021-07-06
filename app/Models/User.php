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
        return $this->hasOne(Gender::class);
    }

    public function user_level()
    {
        return $this->hasOne(UserLevel::class);
    }

    public function preferences()
    {
        return $this->belongsToMany(Preferences::class);
    }

    public function locations()
    {
        return $this->hasMany(Location::class);
    }

    public function accessories()
    {
        return $this->belongsToMany(Accessory::class);
    }
}
