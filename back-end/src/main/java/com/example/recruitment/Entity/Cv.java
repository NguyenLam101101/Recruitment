package com.example.recruitment.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

@Data
@Entity
@Table(name = "cv")
public class Cv {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @ManyToOne
    @JoinColumn(name = "employee_id")
    private Employee employee;
    private String name;
    private String content;
    private int experience;
    private String privacy;
    private Timestamp time = Timestamp.valueOf(LocalDateTime.now());
    @OneToMany(mappedBy = "cv")
    private List<CvAndDomain> cvAndDomains;
    @OneToMany(mappedBy = "cv")
    private List<CvAndSkill> cvAndSkills;
    @OneToMany(mappedBy = "cv")
    private List<CvAndDistrict> cvAndDistricts;

    private String toJson(){
        Gson gson = new GsonBuilder().setDateFormat("yy-MM-dd HH:mm:ss").create();
        return gson.toJson(this);
    }

    public Cv summary(){
        Cv summaryCv = new Cv();
        summaryCv.setId(this.id);
        summaryCv.setName(this.name);

        summaryCv.setEmployee(new Employee());
        summaryCv.getEmployee().setId(this.employee.getId());
        summaryCv.getEmployee().setFirstName(this.employee.getFirstName());
        summaryCv.getEmployee().setLastName(this.employee.getLastName());

        summaryCv.setExperience(this.experience);
        summaryCv.setCvAndDistricts(this.cvAndDistricts);
        summaryCv.setCvAndDomains(this.cvAndDomains);
        summaryCv.setCvAndSkills(this.cvAndSkills);
        return summaryCv;
    }
}
