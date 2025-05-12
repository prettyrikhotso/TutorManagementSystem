/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.za.tut.model.bl;

import ac.za.tut.model.entities.Image;
import ac.za.tut.model.entities.Tutor;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Foward
 */
@Local
public interface ImageFacadeLocal {

    void create(Image image);

    void edit(Image image);

    void remove(Image image);

    Image find(Object id);

    List<Image> findAll();

    List<Image> findRange(int[] range);

    int count();
    

}
