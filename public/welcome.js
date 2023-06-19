window.addEventListener('DOMContentLoaded', () => { 
    /*
        'email' => $request->input('email'),
        'password' => $request->input('password'),
        'first_name' => $request->input('first_name'),
        'middle_name' => $request->input('middle_name'),
        'last_name' => $request->input('last_name'),
        'is_active' => false, // Set a default value for is_active field
        'type' => 0, // Set a default value for type field
        'created_at' => now(), // Set the current datetime for created_at field
        'updated_at' => now(), // Set the current datetime for updated_at field
    */

    let userTypeCheckbox = document.getElementById('usertype')
    let addUserForm = document.getElementById('add_user')
    let addMessageForm = document.getElementById('add_message')

    if(userTypeCheckbox)
        userTypeCheckbox.addEventListener('click', (e)=> {
           console.log(e.target.checked) 
        })

    // Add an event listener for form submission
    addUserForm.addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent the form from submitting normally

        // Serialize form data
        let formData = new FormData($(this)[0]);

        $.ajax({
            url: 'api/add_user',
            method: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            dataType:"json",
            success: function (response) {
                // Handle the response data
                console.log(response);
            },
            error: function (error) {
                // Handle any errors
                console.error(error);
            }
        });
   });

    // Add an event listener for form submission
    addMessageForm.addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent the form from submitting normally

        // Serialize form data
        let formData = new FormData($(this)[0]);

        $.ajax({
            url: 'api/add_message',
            method: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            dataType:"json",
            success: function (response) {
                // Handle the response data
                console.log(response);
            },
            error: function (error) {
                // Handle any errors
                console.error(error);
            }
        });
   });
})