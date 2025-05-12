/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.za.tut.model.bl;

import ac.za.tut.model.entities.Tutor;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Foward
 */
@Stateless
public class TutorFacade extends AbstractFacade<Tutor> implements TutorFacadeLocal {

    @PersistenceContext(unitName = "TutorListEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TutorFacade() {
        super(Tutor.class);
    }

    @Override
public Integer getTotalNumber(String gender) {
    Query q = em.createQuery("SELECT COUNT(t) FROM Tutor t WHERE t.gender = :gender");
    q.setParameter("gender", gender);
    Long count = (Long) q.getSingleResult();
    System.out.println("Count: "+count);
    return count.intValue();
}


    @Override
    public Double getAverage(String gender) {
    Query q = em.createQuery("SELECT AVG(t.age) FROM Tutor t WHERE t.gender = :gender");
    q.setParameter("gender", gender);
    Double average = (Double) q.getSingleResult();
        System.out.println("Avarage: "+average);
    return (average != null) ? average : 0.0;
}

    @Override
public Tutor getYoungestTutor() {
    Query q = em.createQuery("SELECT t FROM Tutor t WHERE t.age = (SELECT MIN(t2.age) FROM Tutor t2)");
    List<Tutor> results = q.getResultList();
    
    return results.isEmpty() ? null : results.get(0);
}

    
}
