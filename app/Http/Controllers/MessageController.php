<?php

namespace App\Http\Controllers;

use App\Events\NewMessageEvent;
use App\Models\Message;
use App\Models\DeletedMessage;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

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
        $currentDate = date('Y-m-d H:i:s');
        $senderId = $request->input('sender_id', 0);
        $conversationId = $request->input('conversation_id', 0);
        $messageType = $request->input('message_type', 0);

        if ($messageType != 0)
            $messageType = $messageType === 'on' ? 1 : 0;

        if ($messageType === 0)
            $this->validate($request, [
                'message' => 'max:1000',
            ]);
        else
            $this->validate($request, [
                'message' => 'max:1000|nullable',
            ]);

        $message = new Message(
            $request->only([
                'message',
            ]) +
            [
                'sender_id' => (int) $senderId,
                'conversation_id' => (int) $conversationId,
                'message_type' => (int) $messageType,
                'created_at' => $currentDate,
                // Set the current datetime for created_at field
                'updated_at' => $currentDate,
                // Set the current datetime for created_at field
                'deleted_at' => null, // Set the current datetime for deleted_at field
            ]
        );

        // For attributes in $hidden array
        $message->setAttribute('guid', Str::orderedUuid());

        $message->save();

        // Create a new Response instance and set the JSON content
        $response = new Response();
        $response->setContent(json_encode(['message' => 'Successfully Store New Message']));
        $response->setStatusCode(200);
        $response->header('Content-Type', 'application/json');

        event(new NewMessageEvent("/get_messages"));

        return $response;
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