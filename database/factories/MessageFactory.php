<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Conversation;
use App\Models\User;
use Illuminate\Support\Str;


class MessageFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $created_date = $this->faker->dateTime();

        return [
            'guid' => Str::orderedUuid(),
            'conversation_id' => User::inRandomOrder()->value('id'),
            'sender_id' => User::inRandomOrder()->value('id'),
            'message_type' => $this->faker->numberBetween(0, 1),
            'message' => $this->faker->text($maxNbChars = 255),
            'translated_message' => null,
            'created_at' => $created_date,
            'updated_at' => $created_date,
            'deleted_at' => null,
        ];
    }
}