<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class Message extends Model
{
    use HasFactory;

    protected $fillable = [
        'message_type',
        // 0 - Text, 1 - Attachment
        'message',
        'translated_message',
        'sender_id',
        'conversation_id',
        // Conversation this message is a part of
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $hidden = [
        'guid', // Universal ID for each message
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // Clear entries cache upon modifying an entry
    protected static function boot()
    {
        parent::boot();

        static::saving(function () {
            Cache::forget('messages');
        });
    }
}