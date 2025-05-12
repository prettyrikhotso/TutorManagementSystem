/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.za.tut.model.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;

/**
 *
 * @author Foward
 */
@Entity
public class Tutor implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    private Long id;
    private String name;
    private Integer age;
    private String gender;
    @ElementCollection
    private List<String> subjects;
    @OneToMany(cascade = CascadeType.ALL)
    private List<Image> images;
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date date;

    public Tutor() {
    }
    public Tutor(Long id, String name, Integer age, String gender, List<String> subjects, List<Image> images) throws StuffNumberInvalid {
        setId(id);
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.subjects = subjects;
        this.images = images;
        this.date=new Date();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public List<String> getSubjects() {
        return subjects;
    }

    public void setSubjects(List<String> subjects) {
        this.subjects = subjects;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) throws StuffNumberInvalid {
        if(id<100000 || id>999999)
        {
            throw new StuffNumberInvalid("The Stuff number must be 6 in length");
        }
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tutor)) {
            return false;
        }
        Tutor other = (Tutor) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ac.za.tut.model.entities.Tutor[ id=" + id + " ]";
    }
    
}
