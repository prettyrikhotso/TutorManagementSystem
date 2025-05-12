<%-- 
    Document   : get_students_outcome
    Created on : 24 May 2024, 8:25:45 PM
    Author     : Foward
--%>

<%@page import="java.util.List"%>
<%@page import="ac.za.tut.model.entities.Tutor"%>
<%@page import="ac.za.tut.model.entities.Image"%>
<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tutor Management System - All Tutors</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
        <style>
            :root {
                --primary-color: #4361ee;
                --secondary-color: #3a0ca3;
                --accent-color: #4cc9f0;
                --light-color: #f8f9fa;
                --text-color: #2b2d42;
                --border-color: #e0e0e0;
            }
            
            * {
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
                margin: 0;
                padding: 0;
            }
            
            body {
                background-color: #f5f7fa;
                color: var(--text-color);
                line-height: 1.6;
                padding: 20px;
            }
            
            .container {
                max-width: 1200px;
                margin: 0 auto;
            }
            
            h1 {
                color: var(--secondary-color);
                text-align: center;
                margin: 20px 0 30px;
                font-size: 2.2rem;
                position: relative;
                padding-bottom: 10px;
            }
            
            h1::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 50%;
                transform: translateX(-50%);
                width: 100px;
                height: 3px;
                background: linear-gradient(to right, var(--primary-color), var(--accent-color));
            }
            
            .tutor-card {
                background: white;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                padding: 25px;
                margin-bottom: 30px;
                transition: transform 0.3s, box-shadow 0.3s;
            }
            
            .tutor-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            }
            
            .tutor-info {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 20px;
                margin-bottom: 20px;
            }
            
            .info-item {
                margin-bottom: 10px;
            }
            
            .info-label {
                font-weight: 500;
                color: var(--secondary-color);
                display: block;
                margin-bottom: 5px;
            }
            
            .info-value {
                color: #495057;
                padding: 8px 0;
                border-bottom: 1px dashed var(--border-color);
            }
            
            .subjects-container {
                display: flex;
                flex-wrap: wrap;
                gap: 8px;
                margin-top: 10px;
            }
            
            .subject-tag {
                background-color: var(--accent-color);
                color: white;
                padding: 4px 12px;
                border-radius: 20px;
                font-size: 0.85rem;
            }
            
            .images-container {
                display: flex;
                flex-wrap: wrap;
                gap: 15px;
                margin-top: 20px;
                padding-top: 20px;
                border-top: 1px solid var(--border-color);
            }
            
            .tutor-image {
                border-radius: 8px;
                border: 1px solid var(--border-color);
                object-fit: cover;
                transition: transform 0.3s;
            }
            
            .tutor-image:hover {
                transform: scale(1.05);
            }
            
            .action-links {
                text-align: center;
                margin: 40px 0 20px;
            }
            
            .action-links a {
                color: var(--primary-color);
                text-decoration: none;
                margin: 0 15px;
                font-weight: 500;
                transition: all 0.3s;
                position: relative;
            }
            
            .action-links a::after {
                content: '';
                position: absolute;
                bottom: -2px;
                left: 0;
                width: 0;
                height: 2px;
                background: var(--primary-color);
                transition: width 0.3s;
            }
            
            .action-links a:hover::after {
                width: 100%;
            }
            
            @media (max-width: 768px) {
                .tutor-info {
                    grid-template-columns: 1fr;
                }
                
                .images-container {
                    justify-content: center;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Tutor Management System</h1>
            
            <%
                List<Tutor> tutors = (List<Tutor>) request.getAttribute("tutors");
                if (tutors != null && !tutors.isEmpty()) {
                    for (Tutor tutor : tutors) {
                        Long studentNumber = tutor.getId();
                        String name = tutor.getName();
                        Integer age = tutor.getAge();
                        String gender = tutor.getGender();
                        String date = tutor.getDate().toString();
                        List<String> subjects = tutor.getSubjects();
                        List<Image> images = tutor.getImages();
            %>
            
            <div class="tutor-card">
                <div class="tutor-info">
                    <div class="info-item">
                        <span class="info-label">Tutor Number:</span>
                        <span class="info-value"><%=studentNumber%></span>
                    </div>
                    
                    <div class="info-item">
                        <span class="info-label">Full Name:</span>
                        <span class="info-value"><%=name%></span>
                    </div>
                    
                    <div class="info-item">
                        <span class="info-label">Age:</span>
                        <span class="info-value"><%=age%></span>
                    </div>
                    
                    <div class="info-item">
                        <span class="info-label">Gender:</span>
                        <span class="info-value"><%=gender%></span>
                    </div>
                    
                    <div class="info-item">
                        <span class="info-label">Date Added:</span>
                        <span class="info-value"><%=date%></span>
                    </div>
                </div>
                
                <div class="info-item">
                    <span class="info-label">Subjects:</span>
                    <div class="subjects-container">
                        <% for (String subject : subjects) { %>
                            <span class="subject-tag"><%=subject%></span>
                        <% } %>
                    </div>
                </div>
                
                <% if (images != null && !images.isEmpty()) { %>
                <div class="info-item">
                    <span class="info-label">Images:</span>
                    <div class="images-container">
                        <% for (Image img : images) { 
                            String imageSource = "data:image/jpg;base64," + Base64.getEncoder().encodeToString(img.getImage_source());
                        %>
                            <img src="<%=imageSource%>" class="tutor-image" height="200" width="200" alt="Tutor image">
                        <% } %>
                    </div>
                </div>
                <% } %>
            </div>
            
            <%
                    }
                } else {
            %>
                <div style="text-align: center; padding: 40px; background: white; border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.05);">
                    <p style="font-size: 1.2rem; color: #6c757d;">No tutors found in the system.</p>
                </div>
            <%
                }
            %>
            
            <div class="action-links">
                <a href="menu.html">Back to Menu</a> | 
                <a href="EndSessionServlet.do">Logout</a>
            </div>
        </div>
    </body>
</html>