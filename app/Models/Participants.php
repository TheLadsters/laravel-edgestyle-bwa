<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class Participants extends Model
{
    use HasFactory;

    public $timestamps = FALSE;
    protected $fillable = [
        'conversation_id', // Conversation Linked to this entry
        'users_id', // Users in the conversation specified in conversation_id
    ];
    protected $hidden = [
        'type' // Type of participant the user_id is in the conversation
        // 0 - Editor, 1 - Viewer (Cannot Send Message)
    ];
    protected $casts = [
        'created_at' => 'datetime',
        'deleted_at' => 'datetime', // Participant is removed from conversation
    ];

    // Clear entries cache upon modifying an entry
    protected static function boot()
    {
        parent::boot();

        static::saving(function() {
            Cache::forget('participants');
        });
    }
}