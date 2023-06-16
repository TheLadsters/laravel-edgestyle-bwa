<?php

namespace App\Http\Controllers;

use App\Models\Conversation;
use App\Models\DeletedConversation;
use App\Models\User;
use GuzzleHttp\RequestOptions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class DeletedConversationController extends Controller
{
    /**
     * Display all entries
     *
     * @return \Illuminate\Http\Response
     */
    public function retrieveAll()
    {
        $deletedConversationCacheKey = 'all_deleted_conversations';

        // Check if the data is already cached
        if (Cache::has($deletedConversationCacheKey)) {
            return Cache::get($deletedConversationCacheKey);
        }

        // Retrieve the data from the database
        $deletedConversations = DeletedConversation::all();

        // Store the data in the cache
        Cache::put($deletedConversationCacheKey, $deletedConversations, 60); // Cache for 60 minutes

        return $deletedConversations;
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
            'title' => 'string',
            'creator_id' => 'integer',
            'channel_id' => 'integer',
            'created_at' => 'datetime',
            'updated_at' => 'datetime|nullable',
            'deleted_at' => 'datetime|nullable',
        ]);

        Conversation::create($request->all());

        return response("Successfully Store New Conversation");

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Conversation  $message
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, Conversation $conversation)
    {
        $this->validate($request, [
            'title' => 'string',
            'creator_id' => 'integer',
            'channel_id' => 'integer',
            'created_at' => 'datetime',
            'updated_at' => 'datetime|nullable',
            'deleted_at' => 'datetime|nullable',
        ]);

        $updatedConversation = $request->all();
        $conversation->update($updatedConversation);

        // TODO: assign each column with specific value
        $newDeletedConversation = new DeletedConversation;
        $newDeletedConversation->messages_id = $conversation->id;
        // TODO: getCurrentUserSession()->id = $newDeletedMessage->users_id; 
        // TODO: $newDeletedMessage->created_at = Date Time Now;
        $newDeletedConversation->save();

        return response("Successfully Deleted Conversation");
    }
}