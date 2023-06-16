<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class Message extends Model
{
    use HasFactory;

    public $timestamps = FALSE;
    protected $fillable = [
        'message',
        'translated_message', 
        'sender_id',
        'conversation_id', // Conversation this message is a part of
    ];

    protected $hidden = [
        'guid', // Universal ID for each message
        'message_type', // 0 - Text, 1 - Attachment
    ];

    protected $casts = [
        'created_at' => 'datetime',
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

        static::saving(function() {
            Cache::forget('messages');
        });
    }
}