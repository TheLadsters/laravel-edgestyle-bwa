<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ConversationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('conversations')->insert([
            'title' => 'Customer# 123',
            // Conversation Title
            'creator_id' => 1,
            // Who created the conversation
            'channel_id' => 0,
            // For grouping different conversations in Conversations List
            'created_at' => '2010-01-03 04:30:43',
            'updated_at' => '2010-01-03 04:30:43',
            'deleted_at' => null,
        ]);
    }
}