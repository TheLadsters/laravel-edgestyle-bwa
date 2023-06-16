<?php

use App\Http\Controllers\AttachmentController;
use App\Http\Controllers\ConversationController;
use App\Http\Controllers\DeletedConversationController;
use App\Http\Controllers\DeletedMessageController;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\ParticipantsController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    $userController = new UserController;
    $conversationController = new ConversationController;
    $participantsController = new ParticipantsController;
    $messageController = new MessageController;
    $deletedMessageController = new DeletedMessageController;
    $deletedConversationController = new DeletedConversationController;
    $attachmentController = new AttachmentController;

    $users = $userController->retrieveAll();
    $conversations = $conversationController->retrieveAll();
    $participants = $participantsController->retrieveAll();
    $messages = $messageController->retrieveAll();
    $deletedMessages = $deletedMessageController->retrieveAll();
    $deletedConversations = $deletedConversationController->retrieveAll();
    $attachments = $attachmentController->retrieveAll();

    return view('welcome', [
        'users'=>$users,
        'conversations'=>$conversations,
        'participants'=>$participants,
        'messages'=>$messages,
        'deleted_messages'=>$deletedMessages,
        'deleted_conversations'=>$deletedConversations,
        'attachments'=>$attachments,
    ]);
});