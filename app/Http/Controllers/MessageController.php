<?php

namespace App\Http\Controllers;

use App\Models\Message;
use App\Models\DeletedMessage;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class MessageController extends Controller
{
    /**
     * Display all entries
     *
     * @return \Illuminate\Http\Response
     */
    public function getMessages()
    {
        $messagesCacheKey = 'all_messages';

        // Check if the data is already cached
        if (Cache::has($messagesCacheKey)) {
            return Cache::get($messagesCacheKey);
        }

        // Retrieve the data from the database
        $messages = Message::orderBy('id', 'ASC')->get();

        // Store the data in the cache
        Cache::put($messagesCacheKey, $messages, 60); // Cache for 60 minutes

        return $messages;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storeMessage(Request $request)
    {

        // Date must be in format Y-M-D. Must also not already exist in entries table date column
        // Selected mood_id must exist in the moods table under column id
        $request->validate([
            'sender_id' => 'required|exists:users,id',
            'message' => 'longText',
            'conversation_id' => 'integer',
            'guid' => 'string',
            'message_type' => 'integer',
            'created_at' => 'datetime',
            'deleted_at' => 'datetime|nullable',
        ]);

        Message::create($request->all());

        return $this->getAllMessages();

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Message  $message
     * @return \Illuminate\Http\Response
     */
    public function deleteMessage(Message $message)
    {
        // TODO: Implement delete function for message
        // Add message to deleted_messages table
    }
}