<%-- 
    Document   : view_tutors
    Created on : 05 Jun 2024, 8:48:55 PM
    Author     : Foward
--%>

<%@page import="java.util.Base64"%>
<%@page import="ac.za.tut.model.entities.Image"%>
<%@page import="java.util.List"%>
<%@page import="ac.za.tut.model.entities.Tutor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Tutors Page</title>
    </head>
    <body>
        <%
            List<Tutor> tutors=(List<Tutor>)request.getAttribute("tutors");
            String h1=(String)request.getAttribute("h1");
            String p=(String)request.getAttribute("p");
        %>
        
        <h1><%=h1%></h1>
        <p><%=p%></p>
        <%
          for (int i = 0; i < tutors.size(); i++) {
               
        Tutor tutor=tutors.get(i);
        String tut_name=tutor.getName();
        Long tut_number=tutor.getId();
        Integer tut_age=tutor.getAge();
        String tut_gender=tutor.getGender();
        List<Image> images=tutor.getImages();
        List<String> subjects=tutor.getSubjects();
        %>
        <table>
            
            <tbody>
                <tr>
                    <td>Tutor Stuff Number: </td>
                    <td><%=tut_number%></td>
                </tr>
                <tr>
                    <td>Tutor Name:</td>
                    <td><%=tut_name%></td>
                </tr>
                <tr>
                    <td>Tutor Age:</td>
                    <td><%=tut_age%></td>
                </tr>
                <tr>
                    <td>Tutor Gender:</td>
                    <td><%=tut_gender%></td>
                </tr>
                <tr>
                    <td>Tutor Subjects</td>
                    <td>
                        <ol>
                        <%   
                        for (int x = 0; x < subjects.size(); x++) {
                         String subject=subjects.get(x);
                         %>
                         <li><%=subject%></li>
                         <%
                        }
                        %>
                         </ol>
                    </td>
                </tr>
                <tr>
                    <td>Tutor Images:</td>
                    <td>
                        <%
                        for (int y = 0; y < images.size(); y++) {
                         String image_name=images.get(y).getName();
                         String image_source="data:image/png;base64,"+Base64.getEncoder().encodeToString(images.get(y).getImage_source());;
                        %>
                        <img src=<%=image_source%> width="200px" height="200px">
                        <%
                        }
                        %>
                    </td>
                </tr>
            </tbody>
        </table>
         <%}    
%>   
<p>Please click <a href="menu.html">here</a> to go back to menu or <a href="EndSessionServlet.do">here</a> to logout</p>

    </body>
</html>
