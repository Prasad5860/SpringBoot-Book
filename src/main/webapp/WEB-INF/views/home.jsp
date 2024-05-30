<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"],
        input[type="submit"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        #error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }

        @media screen and (max-width: 480px) {
            .login-container {
                padding: 10px;
            }
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form id="loginForm">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <input type="submit" value="Login">
        </form>
        <div id="error-message"></div>
    </div>

    <script>
        $(document).ready(function() {
            $("#loginForm").on("submit", function(event) {
                event.preventDefault();
                var user = {
                    username: $("#username").val(),
                    password: $("#password").val()
                };
                $.ajax({
                    type: "POST",
                    url: "login",
                    contentType: "application/json",
                    data: JSON.stringify(user),
                    success: function(response) {
                        window.location.href = "display";
                    },
                    error: function(xhr, status, error) {
                        $("#error-message").text(xhr.responseText);
                    }
                });
            });
        });
    </script>
</body>
</html>
