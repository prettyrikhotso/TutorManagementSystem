<%-- 
    Document   : error_page
    Created on : 05 Jun 2024, 11:22:26 PM
    Author     : Foward
--%>

<%@page isErrorPage="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
        <style>
            :root {
                --error-color: #e63946;
                --secondary-color: #1d3557;
                --light-color: #f1faee;
                --accent-color: #a8dadc;
            }

            * {
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
                margin: 0;
                padding: 0;
            }

            body {
                background-color: #f8f9fa;
                color: #333;
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 20px;
                line-height: 1.6;
            }

            main.error-container {
                background-color: white;
                border-radius: 12px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                padding: 40px;
                max-width: 600px;
                width: 100%;
                text-align: center;
                animation: scaleIn 0.4s ease-out forwards;
                border-left: 5px solid var(--error-color);
                transform-origin: center;
            }

            h1 {
                color: var(--error-color);
                font-size: 2.5rem;
                margin-bottom: 20px;
                position: relative;
                display: inline-block;
            }

            h1::after {
                content: '!';
                position: absolute;
                right: -20px;
                top: -10px;
                font-size: 3rem;
                color: var(--error-color);
                animation: pulse 1.5s infinite;
            }

            .error-icon {
                font-size: 4rem;
                color: var(--error-color);
                margin-bottom: 20px;
                animation: shake 0.5s ease-in-out;
            }

            .error-message {
                background-color: #ffecec;
                padding: 15px;
                border-radius: 8px;
                margin: 20px 0;
                border-left: 3px solid var(--error-color);
                text-align: left;
                word-break: break-word;
            }

            .error-message pre {
                white-space: pre-wrap;
                font-family: Consolas, "Courier New", Courier, monospace;
                color: var(--secondary-color);
                overflow-wrap: break-word;
            }

            .action-links {
                margin-top: 30px;
                display: flex;
                justify-content: center;
                gap: 15px;
                flex-wrap: wrap;
            }

            .action-link {
                padding: 10px 20px;
                border-radius: 6px;
                text-decoration: none;
                font-weight: 500;
                transition: all 0.3s ease;
                display: inline-block;
            }

            .menu-link {
                background-color: var(--secondary-color);
                color: white;
            }

            .menu-link:hover {
                background-color: #14213d;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .logout-link {
                background-color: var(--error-color);
                color: white;
            }

            .logout-link:hover {
                background-color: #d62839;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            @keyframes scaleIn {
                from {
                    transform: scale(0.95);
                    opacity: 0;
                }
                to {
                    transform: scale(1);
                    opacity: 1;
                }
            }

            @keyframes pulse {
                0% {
                    transform: scale(1);
                }
                50% {
                    transform: scale(1.2);
                }
                100% {
                    transform: scale(1);
                }
            }

            @keyframes shake {
                0%, 100% {
                    transform: translateX(0);
                }
                10%, 30%, 50%, 70%, 90% {
                    transform: translateX(-5px);
                }
                20%, 40%, 60%, 80% {
                    transform: translateX(5px);
                }
            }

            @media (max-width: 600px) {
                main.error-container {
                    padding: 25px;
                }

                h1 {
                    font-size: 2rem;
                }

                .action-links {
                    flex-direction: column;
                    gap: 10px;
                }

                .action-link {
                    width: 100%;
                    text-align: center;
                }
            }
        </style>
    </head>
    <body>
        <main class="error-container">
            <div class="error-icon" role="img" aria-label="Warning icon">⚠️</div>
            <h1>Error Occurred</h1>

            <div class="error-message">
                <p><strong>Details:</strong></p>
                <pre><%
                    String errMessage = (exception != null) ? exception.getMessage() : "Unknown error occurred";
                    out.print(errMessage != null ? errMessage : "No detailed message available");
                %></pre>
            </div>

            <div class="action-links">
                <a href="menu.html" class="action-link menu-link">Return to Menu</a>
                <a href="EndSessionServlet.do" class="action-link logout-link">Logout</a>
            </div>
        </main>
    </body>
</html>
