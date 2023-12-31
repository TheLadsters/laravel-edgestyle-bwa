<?php

use App\Events\ConsoleLogEvent;
use App\Http\Controllers\UserController;
use App\Http\Controllers\MessageController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/user', function (Request $request) {
        return $request->user();
    });

    // Users Table Endpoints
    Route::post('/add_user', [UserController::class, 'store']);
    Route::get('/get_users', [UserController::class, 'retrieveAll']);

    // Messages Table Endpoints
    Route::post('/add_message', [MessageController::class, 'store']);
    Route::get('/get_messages', [MessageController::class, 'retrieveAll']);

    // Strapi Translations Template Endpoints
    Route::get('/get_strapi_translations_templates', function () {
        $products = DB::connection('mysql_strapi')
            ->table("translations")
            ->select(['id', 'english', 'japanese', 'category'])
            ->where('published_at', '!=', null)
            ->get();

        return ($products);
    });


    Route::apiResource('/users', UserController::class);
});

Route::post('/signup', [AuthController::class, 'signup']);
Route::post('/login', [AuthController::class, 'login']);

Route::post('/consoleLog', function (Request $request) {
    event(new ConsoleLogEvent('This is a new message'));

    // Return the response
    return response()->json(['message' => 'POST request handled']);
});