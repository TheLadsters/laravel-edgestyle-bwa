<?php

namespace App\Http\Controllers;

use App\Models\Participants;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class ParticipantsController extends Controller
{
    /**
     * Display all entries
     *
     * @return \Illuminate\Http\Response
     */
    public function retrieveAll()
    {
        $participantsCacheKey = 'all_participants';

        // Check if the data is already cached
        if (Cache::has($participantsCacheKey)) {
            return Cache::get($participantsCacheKey);
        }

        // Retrieve the data from the database
        $participants = Participants::all();

        // Store the data in the cache
        Cache::put($participantsCacheKey, $participants, 60); // Cache for 60 minutes

        return $participants;
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
            'conversation_id' => 'integer',
            'users_id' => 'integer',
            'type' => 'integer',
            'created_at' => 'datetime',
            'deleted_at' => 'datetime|nullable',
        ]);

        Participants::create($request->all());

        return response("Successfully Store New Conversation");

    }
}