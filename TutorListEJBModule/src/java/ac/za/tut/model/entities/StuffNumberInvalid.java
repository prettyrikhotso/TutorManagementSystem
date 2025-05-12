/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.za.tut.model.entities;

import javax.ejb.EJBException;

/**
 *
 * @author Foward
 */
public class StuffNumberInvalid extends EJBException{

    public StuffNumberInvalid(String message) {
        super(message);
    }
    
}
