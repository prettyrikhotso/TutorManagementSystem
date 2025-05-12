/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.za.tut.web;
import ac.za.tut.model.bl.TutorFacadeLocal;
import ac.za.tut.model.entities.Image;
import ac.za.tut.model.entities.StuffNumberInvalid;
import ac.za.tut.model.entities.Tutor;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class AddTutorServlet extends HttpServlet {
    @EJB TutorFacadeLocal tfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            Long tut_number=Long.parseLong(request.getParameter("tut_number"));
            String tut_name=request.getParameter("tut_name");
            Integer tut_age=Integer.parseInt(request.getParameter("tut_age"));
            String tut_gender=request.getParameter("tut_gender");
            Collection<Part> tut_parts=request.getParts();
            List<Image> images=new ArrayList<>();
            for(Part part:tut_parts)
            {
                if(part.getContentType()!=null)
                {
                    String image_name=part.getSubmittedFileName();
                    InputStream part_stream=part.getInputStream();
                    byte[] image_blob=getPartBlob(part_stream);
                    images.add(new Image(image_name, image_blob));
                }
            }
            String[] tut_subjects=request.getParameterValues("tut_subjects");
            List<String> subjects=new ArrayList<>();
            for (int i = 0; i < tut_subjects.length; i++) {
                subjects.add(tut_subjects[i]);
            }
            Tutor tutor=new Tutor(tut_number, tut_name, tut_age, tut_gender, subjects, images);
            request.setAttribute("tutor", tutor);
            request.setAttribute("h1", "Add Tutor Output Page");
            request.setAttribute("p", "Tutor added successfully!");
            tfl.create(tutor);
            RequestDispatcher disp =request.getRequestDispatcher("tutor_output.jsp");
            disp.forward(request, response);
        
         
    }
    private byte[] getPartBlob(InputStream part_stream) {
    byte[] image_blob=null;
    byte[] buffer=new byte[1024];
    ByteArrayOutputStream baos=new ByteArrayOutputStream();
    int value;
        try {
            while((value=part_stream.read(buffer))!=-1)
            {
                baos.write(buffer, 0, value);
            }
             image_blob=baos.toByteArray();
        } catch (IOException ex) {
            Logger.getLogger(AddTutorServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return image_blob;
    }
}
