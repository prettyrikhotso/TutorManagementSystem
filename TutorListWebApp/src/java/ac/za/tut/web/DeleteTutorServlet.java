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
public class DeleteTutorServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @EJB TutorFacadeLocal tfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long tut_number=Long.parseLong(request.getParameter("tut_number"));
        Tutor tutor=tfl.find(tut_number);
        String path;
        if(tutor == null)
        {
            request.setAttribute("tut_number", tut_number);
             path="tutor_not_found.jsp";
        }
        else
        {
            path="tutor_output.jsp";
            
            request.setAttribute("h1", "Delete Tutor Output");
            request.setAttribute("p", "Tutor Deleted Successfully!");
        }
        request.setAttribute("tutor", tutor);
        tfl.remove(tutor);
        RequestDispatcher disp =request.getRequestDispatcher(path);
        disp.forward(request, response);
    }
}
