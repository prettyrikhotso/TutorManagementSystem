<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tutor Not Found Page</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #fff3e0;
            color: #d84315;
            text-align: center;
            padding: 60px;
            animation: fadeIn 0.8s ease;
        }

        h1 {
            font-size: 36px;
            color: #bf360c;
            margin-bottom: 20px;
            animation: bounceIn 1s ease;
        }

        p {
            font-size: 18px;
            color: #5d4037;
            margin: 15px 0;
        }

        a {
            text-decoration: none;
            font-weight: bold;
            color: #ef6c00;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #e65100;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes bounceIn {
            0% { transform: scale(0.95); opacity: 0; }
            60% { transform: scale(1.05); opacity: 1; }
            100% { transform: scale(1); }
        }
    </style>
</head>
<body>
    <%
        Long tut_number = (Long) request.getAttribute("tut_number");
    %>
    <h1>❌ Tutor Not Found</h1>
    <p>The tutor with staff number <strong><%= tut_number %></strong> was not found in the database.</p>
    <p>Please click <a href="menu.html">here</a> to go back to menu or 
       <a href="EndSessionServlet.do">here</a> to logout.</p>
</body>
</html>
