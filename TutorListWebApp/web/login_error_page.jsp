<%@page isErrorPage="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login Error Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8d7da;
                color: #721c24;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .container {
                background-color: #fff;
                padding: 30px;
                border: 1px solid #f5c6cb;
                border-left: 5px solid #dc3545;
                border-radius: 8px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                text-align: center;
            }
            h1 {
                margin-bottom: 20px;
                color: #dc3545;
            }
            p {
                margin: 10px 0;
            }
            a {
                display: inline-block;
                margin-top: 20px;
                padding: 10px 20px;
                background-color: #dc3545;
                color: #fff;
                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.3s ease;
            }
            a:hover {
                background-color: #c82333;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Access Denied</h1>
            <p>Your login credentials are incorrect or you do not have access.</p>
            <p>
                <a href="index.html">Try Again</a><br>
                <a href="EndSessionServlet.do">Logout</a>
            </p>
        </div>
    </body>
</html>
