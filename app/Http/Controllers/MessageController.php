<?php

namespace App\Http\Controllers;

use App\Models\Message;
use App\Models\DeletedMessage;
use App\Models\User;
use GuzzleHttp\RequestOptions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class MessageController extends Controller
{
    /**
     * Display all entries
     *
     * @return \Illuminate\Http\Response
     */
    public function retrieveAll()
    {
        /*$messagesCacheKey = 'all_messages';

        // Check if the data is already cached
        if (Cache::has($messagesCacheKey)) {
            return Cache::get($messagesCacheKey);
        }*/

        // Retrieve the data from the database
        $messages = Message::orderBy('id', 'ASC')->get();

        // Store the data in the cache
        //Cache::put($messagesCacheKey, $messages, 60); // Cache for 60 minutes

        return $messages;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
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

        return response("Successfully Store New Message");

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Message  $message
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, Message $message)
    {
        $this->validate($request, [
            'guid' => 'required|string',
            'conversation_id' => 'required|integer',
            'sender_id' => 'required|integer',
            'message_type' => 'required|integer',
            'message' => 'required|longText',
            'translated_message' => 'required|longText',
            'created_at' => 'required|datetime',
            'deleted_at' => 'required|datetime',
        ]);

        $updatedMessage = $request->all();
        $message->update($updatedMessage);

        // TODO: assign each column with specific value
        $newDeletedMessage = new DeletedMessage;
        $newDeletedMessage->messages_id = $message->id;
        // TODO: getCurrentUserSession()->id = $newDeletedMessage->users_id; 
        // TODO: $newDeletedMessage->created_at = Date Time Now;
        $newDeletedMessage->save();

        return response("Successfully Deleted Message");
    }
}