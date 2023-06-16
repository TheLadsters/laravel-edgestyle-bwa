<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class DeletedMessage extends Model
{
    public $timestamps = FALSE;
    protected $fillable = [
        'messages_id', // Message ID that is to be deleted
        'users_id', // Which perspective of user the message will be deleted from
    ];

    protected $casts = [
        'created_at' => 'datetime', // date time the message is deleted
    ];

    // Clear entries cache upon modifying an entry
    protected static function boot()
    {
        parent::boot();

        static::saving(function() {
            Cache::forget('deleted_messages');
        });
    }
}