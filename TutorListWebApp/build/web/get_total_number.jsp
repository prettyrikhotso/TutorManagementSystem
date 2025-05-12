<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Get Total Number Of Tutors Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #e0f7fa, #fff);
            text-align: center;
            padding: 50px;
            animation: fadeIn 1s ease-in;
        }

        h1 {
            color: #00796b;
            animation: slideIn 1s ease-out;
        }

        p {
            font-size: 18px;
            color: #333;
        }

        .highlight {
            font-size: 24px;
            font-weight: bold;
            color: #004d40;
            animation: pulse 1.5s infinite;
        }

        a {
            color: #00695c;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideIn {
            from { transform: translateY(-20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }
    </style>
</head>
<body>
    <h1>Total Number Of Tutors</h1>
    <p>This is the total number of tutors</p>
    <%
        Integer totalNumberOfTutors = (Integer) request.getAttribute("totalNumberOfTutors");
    %>
    <p class="highlight">The total number of tutors is: <%= totalNumberOfTutors %></p>
    <p>Please click <a href="menu.html">here</a> to go back to menu or 
       <a href="EndSessionServlet.do">here</a> to logout</p>
</body>
</html>
