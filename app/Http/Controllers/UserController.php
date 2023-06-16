<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function retrieveAll()
    {
        /*$usersCacheKey = 'all_users';

        // Check if the data is already cached
        if (Cache::has($usersCacheKey)) {
            return Cache::get($usersCacheKey);
        }
        */

        // Retrieve the data from the database
        $users = User::all();

        /*// Store the data in the cache
        Cache::put($usersCacheKey, $users, 60); // Cache for 60 minutes
        */

        return $users;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $type = $request->input('type', 0);
        if($type != 0)
            $type = $type === 'on' ? 0 : 1; 


        $this->validate($request, [
            'email' => 'required|string',
            'password' => 'required|string',
            'first_name' => 'required|string',
            'middle_name' => 'nullable|string',
            'last_name' => 'required|string',
        ]);

        $user = new User(
            $request->only([
                'email',
                'password',
                'first_name',
                'middle_name',
                'last_name',
            ]) + 
            [
                'type' => (int)$type, // Set a default value for is_active field
                'is_active' => false, // Set a default value for is_active field
                'created_at' => date('Y-m-d H:i:s'), // Set the current datetime for created_at field
                'updated_at' => date('Y-m-d H:i:s'), // Set the current datetime for updated_at field
            ]
        );

        $user->save();

        return redirect('/')->with("Successfully Created New User");
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $mood
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        $this->validate($request, [
            'email' => 'required|string',
            'password' => 'required|string',
            'first_name' => 'required|string',
            'middle_name' => 'string',
            'last_name' => 'required|string',
            'is_active' => 'boolean',
            'type' => 'integer',
            'created_at' => 'datetime',
            'updated_at' => 'datetime',
        ]);

        $updatedUser = $request->all();
        $user->update($updatedUser);

      return response("Successfully Updated User");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        $user->delete();

        return response("Successfully Deleted User");
    }
}