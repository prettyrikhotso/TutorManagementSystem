/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.za.tut.web;

import ac.za.tut.model.bl.TutorFacadeLocal;
import ac.za.tut.model.entities.Tutor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Foward
 */
public class ViewAllTutorsServlet extends HttpServlet {
    @EJB TutorFacadeLocal tfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Tutor> tutors=tfl.findAll();
        request.setAttribute("tutors", tutors);
        request.setAttribute("h1", "All tutors");
        request.setAttribute("p", "This are all tutors in the database");
        RequestDispatcher disp =request.getRequestDispatcher("view_tutors.jsp");
        disp.forward(request, response);
    }

}
