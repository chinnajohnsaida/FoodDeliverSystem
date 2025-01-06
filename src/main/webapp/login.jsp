<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        /* General Styling */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(90deg, #76b852, #8DC26F);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            display: flex;
            width: 800px;
            height: 450px;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        /* Left Image Section */
        .login-image {
            flex: 1;
            background: url('images/login_logo.png') no-repeat center center;
            background-size: cover;
        }

        /* Right Form Section */
        .login-form-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background: #f9f9f9;
        }

        .form {
            width: 100%;
            max-width: 300px;
            text-align: center;
        }

        .form h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        .form input {
            font-family: Arial, sans-serif;
            outline: none;
            background: #f2f2f2;
            width: 100%;
            border: none;
            margin-bottom: 15px;
            padding: 12px;
            font-size: 14px;
            border-radius: 5px;
        }

        .form button {
            background: #4CAF50;
            color: white;
            font-size: 14px;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form button:hover {
            background: #43A047;
        }

        .form .message {
            margin-top: 15px;
            font-size: 14px;
            color: #666;
        }

        .form .message a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }

        .form .message a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <!-- Left Image Section -->
        <div class="login-image"></div>

        <!-- Right Form Section -->
        <div class="login-form-container">
            <div class="form">
                <h2>Welcome Back!</h2>
                <form class="login-form" action="Login" method="post">
                    <input type="text" placeholder="Email" name="Email" required />
                    <input type="password" placeholder="Password" name="password" required />
                    <button type="submit">Login</button>
                    <p class="message">Not registered? <a href="registration.html">Create an account</a></p>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
