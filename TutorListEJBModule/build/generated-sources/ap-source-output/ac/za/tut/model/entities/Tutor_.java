package ac.za.tut.model.entities;

import ac.za.tut.model.entities.Image;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2025-05-12T11:44:07")
@StaticMetamodel(Tutor.class)
public class Tutor_ { 

    public static volatile SingularAttribute<Tutor, Date> date;
    public static volatile ListAttribute<Tutor, Image> images;
    public static volatile SingularAttribute<Tutor, String> gender;
    public static volatile ListAttribute<Tutor, String> subjects;
    public static volatile SingularAttribute<Tutor, String> name;
    public static volatile SingularAttribute<Tutor, Long> id;
    public static volatile SingularAttribute<Tutor, Integer> age;

}