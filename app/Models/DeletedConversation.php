<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class DeletedConversation extends Model
{
    public $timestamps = FALSE;
    protected $fillable = [
        'conversation_id', // Converation to be deleted
        'users_id' // Which perspective/user the conversation is deleted/not shown
    ];

    protected $casts = [
        'created_at' => 'datetime', // date time the conversation was deleted
    ];

    // Clear entries cache upon modifying an entry
    protected static function boot()
    {
        parent::boot();

        static::saving(function() {
            Cache::forget('deleted_conversations');
        });
    }
}