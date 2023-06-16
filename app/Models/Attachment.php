<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class Attachment extends Model
{
    public $timestamps = FALSE;
    protected $fillable = [
        'messages_id', // Message ID the attachment is tied to (message type should be 1)
        'thumb_url',
        'file_url',
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    // Clear entries cache upon modifying an entry
    protected static function boot()
    {
        parent::boot();

        static::saving(function() {
            Cache::forget('attachments');
        });
    }
}