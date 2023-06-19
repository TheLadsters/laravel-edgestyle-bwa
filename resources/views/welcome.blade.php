<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>

<body>
    <div class="container">
        <h1>Query Response</h1>
        <div class="container">
            <table class="table">
                <tbody>
                    <tr>
                        <form id="add_user">
                            @csrf
                            <td> <input type="email" class="form-control" name="email" placeholder="Email"
                                    required /> </td>
                            <td> <input type="password" name="password" class="form-control" placeholder="Password"
                                    required /> </td>
                            <td><input type="text" class="form-control" name="first_name" placeholder="First Name"
                                    required /></td>
                            <td><input type="text" class="form-control" name="middle_name"
                                    placeholder="Middle Name" /></td>
                            <td><input type="text" class="form-control" name="last_name" placeholder="Last Name"
                                    required /></td>
                            <td>
                                <input class="form-check-input" type="checkbox" name="type">
                                <label class="form-check-label" for="type">
                                    Is Operator?
                                </label>
                            </td>
                            <td><button type="submit">Add New User</button></td>
                        </form>
                    </tr>
                    <tr>
                        <form id="add_message">
                            @csrf
                            <td>
                                <textarea class="form-control" name="message" rows="3" placeholder="Enter a message..."></textarea>
                            </td>
                            <td> <input type="number" name="conversation_id" class="form-control"
                                    placeholder="Conversation ID" required /> </td>
                            <td><input type="number" class="form-control" name="sender_id" placeholder="Sender ID"
                                    required /></td>
                            <td>
                                <input class="form-check-input" type="checkbox" name="message_type">
                                <label class="form-check-label" for="message_type">
                                    Is Attachment?
                                </label>
                            </td>
                            <td><button type="submit">Add New Message</button></td>
                        </form>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="container">
        <h1>Tables</h1>
        <div class="container">
            <div class="row">
                <h2>Users</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>First Name</th>
                            <th>Middle Name</th>
                            <th>Last Name</th>
                            <th>Type</th>
                            <th>Is Active</th>
                            <th>Created At</th>
                            <th>Updated At</th>
                            <!-- Add more table headers as needed -->
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($users as $row)
                            <tr>
                                <td>{{ $row['id'] }}</td>
                                <td>{{ $row['email'] }}</td>
                                <td>{{ $row['password'] }}</td>
                                <td>{{ $row['first_name'] }}</td>
                                <td>{{ $row['middle_name'] }}</td>
                                <td>{{ $row['last_name'] }}</td>
                                <td>{{ $row['type'] }}</td>
                                <td>{{ $row['is_active'] }}</td>
                                <td>{{ $row['created_at'] }}</td>
                                <td>{{ $row['updated_at'] }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="row">
                <h2>Conversations</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Title</th>
                            <th>Creator ID</th>
                            <th>Channel ID</th>
                            <th>Created At</th>
                            <th>Updated At</th>
                            <th>Deleted At</th>
                            <!-- Add more table headers as needed -->
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($conversations as $row)
                            <tr>
                                <td>{{ $row['id'] }}</td>
                                <td>{{ $row['title'] }}</td>
                                <td>{{ $row['creator_id'] }}</td>
                                <td>{{ $row['channel_id'] }}</td>
                                <td>{{ $row['created_at'] }}</td>
                                <td>{{ $row['updated_at'] }}</td>
                                <td>{{ $row['deleted_at'] }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="row">
                <h2>Participants</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Conversation ID</th>
                            <th>Users ID</th>
                            <th>Type</th>
                            <th>Created At</th>
                            <th>Updated At</th>
                            <th>Deleted At</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($participants as $row)
                            <tr>
                                <td>{{ $row['id'] }}</td>
                                <td>{{ $row['conversation_id'] }}</td>
                                <td>{{ $row['users_id'] }}</td>
                                <td>{{ $row['type'] }}</td>
                                <td>{{ $row['created_at'] }}</td>
                                <td>{{ $row['updated_at'] }}</td>
                                <td>{{ $row['deleted_at'] }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="row">
                <h2>Messages</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>guid</th>
                            <th>Message Type</th>
                            <th>Conversation ID</th>
                            <th>Sender ID</th>
                            <th>Message</th>
                            <th>Translated Message</th>
                            <th>Created At</th>
                            <th>Updated At</th>
                            <th>Deleted At</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($messages as $row)
                            <tr>
                                <td>{{ $row['id'] }}</td>
                                <td>{{ $row['guid'] }}</td>
                                <td>{{ $row['message_type'] }}</td>
                                <td>{{ $row['conversation_id'] }}</td>
                                <td>{{ $row['sender_id'] }}</td>
                                <td>{{ $row['message'] }}</td>
                                <td>{{ $row['translated_message'] }}</td>
                                <td>{{ $row['created_at'] }}</td>
                                <td>{{ $row['updated_at'] }}</td>
                                <td>{{ $row['deleted_at'] }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="row">
                <h2>Deleted Conversations</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Conversation ID</th>
                            <th>Users ID</th>
                            <th>Created At</th>
                            <!-- Add more table headers as needed -->
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($deleted_conversations as $row)
                            <tr>
                                <td>{{ $row['id'] }}</td>
                                <td>{{ $row['conversation_id'] }}</td>
                                <td>{{ $row['users_id'] }}</td>
                                <td>{{ $row['created_at'] }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="row">
                <h2>Deleted Messsages</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>messsages_id</th>
                            <th>users_id</th>
                            <th>created_at</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($deleted_messages as $row)
                            <tr>
                                <td>{{ $row['id'] }}</td>
                                <td>{{ $row['messsages_id'] }}</td>
                                <td>{{ $row['users_id'] }}</td>
                                <td>{{ $row['created_at'] }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="row">
                <h2>Attachments</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Messages ID</th>
                            <th>Thumb URL</th>
                            <th>File URL</th>
                            <th>Created At</th>
                            <th>Updated At</th>
                            <!-- Add more table headers as needed -->
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($attachments as $row)
                            <tr>
                                <td>{{ $row['id'] }}</td>
                                <td>{{ $row['messages_id'] }}</td>
                                <td>{{ $row['thumb_url'] }}</td>
                                <td>{{ $row['file_url'] }}</td>
                                <td>{{ $row['created_at'] }}</td>
                                <td>{{ $row['updated_at'] }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous">
    </script>
    <script src="welcome.js"></script>
</body>

</html>
