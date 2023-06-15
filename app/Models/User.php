<?php
/*
namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];
}
*/


namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class User extends Model
{
    public $timestamps = FALSE;
    protected $fillable = [
        'first_name',
        'last_name',
        'email',
        'password',
    ];

    protected $hidden = [
        'password',
        'remember_token',
        'is_active',
        'is_operator',
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'password' => 'hashed',
    ];
    // Get the entries for a specific mood.
    public function entries()
    {
        return $this->hasMany(User::class);
    }

    // Clear moods cache upon modifying a mood entry
    protected static function boot()
    {
        parent::boot();

        static::saving(function() {
            Cache::forget('users');
        });
    }
}