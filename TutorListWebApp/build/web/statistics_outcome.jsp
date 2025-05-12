<%@page import="ac.za.tut.model.entities.Tutor"%>
<%@page import="ac.za.tut.model.entities.Image"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Statistics Outcome Page</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #f8f9fa, #e3f2fd);
            padding: 40px;
            text-align: center;
            animation: fadeIn 1s ease-in;
        }

        h1, h3 {
            color: #0d47a1;
            animation: slideIn 0.8s ease-out;
        }

        table {
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #ffffffcc;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 60%;
        }

        td {
            padding: 12px 15px;
            border-bottom: 1px solid #ccc;
            text-align: left;
        }

        td:first-child {
            font-weight: bold;
            color: #37474f;
        }

        ol {
            padding-left: 20px;
            text-align: left;
        }

        img {
            margin: 10px;
            border-radius: 10px;
            transition: transform 0.3s ease;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        }

        img:hover {
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideIn {
            from { transform: translateY(-20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
    </style>
</head>
<body>
    <h1>Statistics Outcome</h1>
    <p>These are the statistics!</p>
    <%
        Integer totalMales = (Integer) request.getAttribute("totalMales");
        Integer totalFemales = (Integer) request.getAttribute("totalFemales");
        Double maleGenderAvarage = (Double) request.getAttribute("maleGenderAvarage");
        Double FemalesGenderAvarage = (Double) request.getAttribute("FemalesGenderAvarage");
        Tutor tutor = (Tutor) request.getAttribute("youngestTutor");

        String tut_name = tutor.getName();
        Long tut_number = tutor.getId();
        Integer tut_age = tutor.getAge();
        String tut_gender = tutor.getGender();
        List<Image> images = tutor.getImages();
        List<String> subjects = tutor.getSubjects();
    %> 
    <table>
        <tbody>
            <tr>
                <td>Total Number Of Males</td>
                <td><%= totalMales %></td>
            </tr>
            <tr>
                <td>Total Number Of Females</td>
                <td><%= totalFemales %></td>
            </tr>
            <tr>
                <td>Average Age Of Males</td>
                <td><%= maleGenderAvarage %></td>
            </tr>
            <tr>
                <td>Average Age Of Females</td>
                <td><%= FemalesGenderAvarage %></td>
            </tr>
        </tbody>
    </table>

    <h3>Youngest Tutor</h3>
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
                    <% for (Image img : images) {
                        String image_source = "data:image/png;base64," + Base64.getEncoder().encodeToString(img.getImage_source());
                    %>
                        <img src="<%= image_source %>" width="200px" height="200px">
                    <% } %>
                </td>
            </tr>
        </tbody>
    </table>
                <p>Please click <a href="menu.html">here</a> to go back to menu or 
       <a href="EndSessionServlet.do">here</a> to logout</p>
</body>
</html>
