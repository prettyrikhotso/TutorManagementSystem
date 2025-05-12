/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.za.tut.model.bl;

import ac.za.tut.model.entities.Tutor;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Foward
 */
@Local
public interface TutorFacadeLocal {

    void create(Tutor tutor);

    void edit(Tutor tutor);

    void remove(Tutor tutor);

    Tutor find(Object id);

    List<Tutor> findAll();

    List<Tutor> findRange(int[] range);

    int count();
    
    Integer getTotalNumber(String gender);
    
    Double getAverage(String gender);
    
    Tutor getYoungestTutor();
}
