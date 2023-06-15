<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\User;

class MessageFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'guid' => $this->faker->text($maxNbChars = 255),
            'conversation_id' => User::inRandomOrder()->value('id'),
            'sender_id' => User::inRandomOrder()->value('id'),
            'message_type' => $this->faker->numberBetween(0,2),
            'message' => $this->faker->text($maxNbChars = 255),
            'created_at' => $this->faker->dateTime(),
            'deleted_at' => null,
        ];
    }
}