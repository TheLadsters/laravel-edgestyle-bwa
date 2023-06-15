<?php

namespace App\Http\Controllers;

use App\Models\Message;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class HomeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $entries = Cache::remember('messages', 3600, function() {
            return Message::orderBy('created_at', 'ASC')->get();
        });

        $moods = Cache::remember('users', 3600, function() {
            return User::all();
        });

        return view('home', compact('messages', 'users'));
    }
}