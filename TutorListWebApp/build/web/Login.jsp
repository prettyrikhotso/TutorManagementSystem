<%-- 
    Document   : Login
    Created on : 05 Jun 2024, 10:07:32 PM
    Author     : Foward
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
            * {
                box-sizing: border-box;
                font-family: 'Arial', sans-serif;
            }
            
            body {
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }
            
            .login-container {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                padding: 30px;
                width: 100%;
                max-width: 400px;
            }
            
            h1 {
                color: #333;
                text-align: center;
                margin-bottom: 10px;
            }
            
            p {
                color: #666;
                text-align: center;
                margin-bottom: 25px;
            }
            
            form {
                display: flex;
                flex-direction: column;
            }
            
            table {
                width: 100%;
                border-collapse: collapse;
            }
            
            tr:not(:last-child) {
                margin-bottom: 15px;
            }
            
            td {
                padding: 8px 0;
            }
            
            td:first-child {
                font-weight: bold;
                color: #555;
                width: 30%;
            }
            
            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 14px;
                transition: border-color 0.3s;
            }
            
            input[type="text"]:focus,
            input[type="password"]:focus {
                border-color: #4CAF50;
                outline: none;
            }
            
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 12px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                font-weight: bold;
                transition: background-color 0.3s;
                width: 100%;
            }
            
            input[type="submit"]:hover {
                background-color: #45a049;
            }
            
            .links {
                margin-top: 20px;
                text-align: center;
            }
            
            .links a {
                color: #4CAF50;
                text-decoration: none;
                margin: 0 5px;
                transition: color 0.3s;
            }
            
            .links a:hover {
                color: #45a049;
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h1>Login</h1>
            <p>Fill in your credentials to access your account</p>
            <form action="j_security_check" method="POST">
                <table>
                    <tbody>
                        <tr>
                            <td>Username:</td>
                            <td><input type="text" name="j_username" placeholder="Enter your username" required></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type="password" name="j_password" placeholder="Enter your password" required></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="submit" value="Login"></td>
                        </tr>
                    </tbody>
                </table>
            </form>
            <div class="links">
                <p>Please click <a href="menu.html">here</a> to go back to menu or <a href="EndSessionServlet.do">here</a> to logout</p>
            </div>
        </div>
    </body>
</html>