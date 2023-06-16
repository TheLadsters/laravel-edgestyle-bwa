<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserSeeder extends Seeder
{
  /**
   * Run the database seeds.
   *
   * @return void
   */
    public function run()
    {
        DB::table('users')->insert([
            'email' => 'abc@xyz.com',
            'password' => '123',
            'first_name' => 'John',
            'last_name' => 'Smith',
            'is_active' => '0',
            'is_operator' => '1',
            'created_at' => '2010-01-03 04:30:43',
            'updated_at' => '2010-01-03 04:30:43',
        ]);

        DB::table('users')->insert([
            'email' => 'def@xyz.com',
            'password' => '123',
            'first_name' => 'Jane',
            'last_name' => 'Williams',
            'is_active' => '0',
            'is_operator' => '0',
            'created_at' => '2010-01-03 04:30:43',
            'updated_at' => '2010-01-03 04:30:43',
        ]);
    }
}