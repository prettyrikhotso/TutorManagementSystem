<%@page import="java.util.Base64"%>
<%@page import="ac.za.tut.model.entities.Image"%>
<%@page import="java.util.List"%>
<%@page import="ac.za.tut.model.entities.Tutor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tutor Output Page</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f3f4f6;
            padding: 40px;
            color: #374151;
            text-align: center;
            animation: fadeIn 0.8s ease-in;
        }

        h1 {
            color: #1e3a8a;
            font-size: 32px;
            animation: slideInDown 0.6s ease-out;
        }

        p {
            font-size: 18px;
            margin-bottom: 25px;
        }

        table {
            margin: auto;
            border-collapse: collapse;
            width: 70%;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        td {
            padding: 14px 18px;
            border-bottom: 1px solid #e5e7eb;
            text-align: left;
        }

        td:first-child {
            font-weight: bold;
            color: #111827;
            width: 30%;
        }

        ol {
            padding-left: 20px;
            text-align: left;
        }

        img {
            margin: 8px;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.15);
            transition: transform 0.3s ease;
        }

        img:hover {
            transform: scale(1.05);
        }

        a {
            color: #2563eb;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            color: #1d4ed8;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(10px);}
            to {opacity: 1; transform: translateY(0);}
        }

        @keyframes slideInDown {
            from {opacity: 0; transform: translateY(-20px);}
            to {opacity: 1; transform: translateY(0);}
        }
    </style>
</head>
<body>
<%
    String h1 = (String) request.getAttribute("h1");
    String p = (String) request.getAttribute("p");
    Tutor tutor = (Tutor) request.getAttribute("tutor");

    String tut_name = tutor.getName();
    Long tut_number = tutor.getId();
    Integer tut_age = tutor.getAge();
    String tut_gender = tutor.getGender();
    List<Image> images = tutor.getImages();
    List<String> subjects = tutor.getSubjects();
%>

<h1><%= h1 %></h1>
<p><%= p %></p>

<table>
    <tbody>
        <tr>
            <td>Tutor Staff Number:</td>
            <td><%= tut_number %></td>
        </tr>
        <tr>
            <td>Tutor Name:</td>
            <td><%= tut_name %></td>
        </tr>
        <tr>
            <td>Tutor Age:</td>
            <td><%= tut_age %></td>
        </tr>
        <tr>
            <td>Tutor Gender:</td>
            <td><%= tut_gender %></td>
        </tr>
        <tr>
            <td>Tutor Subjects:</td>
            <td>
                <ol>
                    <% for (String subject : subjects) { %>
                        <li><%= subject %></li>
                    <% } %>
                </ol>
            </td>
        </tr>
        <tr>
            <td>Tutor Images:</td>
            <td>
                <% for (Image image : images) {
                    String image_source = "data:image/png;base64," + Base64.getEncoder().encodeToString(image.getImage_source());
                %>
                    <img src="<%= image_source %>" width="200px" height="200px" alt="Tutor Image">
                <% } %>
            </td>
        </tr>
    </tbody>
</table>

<p>
    Please click <a href="menu.html">here</a> to go back to menu or
    <a href="EndSessionServlet.do">here</a> to logout.
</p>

</body>
</html>
