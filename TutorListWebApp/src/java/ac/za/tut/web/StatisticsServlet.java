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
public class StatisticsServlet extends HttpServlet {

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
            Integer totalMales=tfl.getTotalNumber("Male");
            Integer totalFemales=tfl.getTotalNumber("Female");
            
            Double maleGenderAvarage=tfl.getAverage("Male");
            Double FemalesGenderAvarage=tfl.getAverage("Female");
            
            Tutor youngestTutor=tfl.getYoungestTutor();
            request.setAttribute("totalMales", totalMales);
            request.setAttribute("totalFemales", totalFemales);
            request.setAttribute("maleGenderAvarage", maleGenderAvarage);
            request.setAttribute("FemalesGenderAvarage", FemalesGenderAvarage);
            request.setAttribute("youngestTutor", youngestTutor);
            
            RequestDispatcher disp =request.getRequestDispatcher("statistics_outcome.jsp");
            disp.forward(request, response);
    }
}