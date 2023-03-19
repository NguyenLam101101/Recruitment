package com.example.recruitment.Entity;

import com.example.recruitment.Form.RecruitmentForm;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import lombok.Data;

import javax.persistence.*;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

@Data
@Entity
@Table(name = "recruitment")
public class Recruitment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @ManyToOne
    @JoinColumn(name = "employer_id")
    private Employer employer;
    private Timestamp time = Timestamp.valueOf(LocalDateTime.now());
    private String name;
    private String banner;
    private String type;
    private Date startDate;
    private Date endDate;
    private String position;
    @ManyToOne
    @JoinColumn(name = "district_id")
    private District district;
    private int experience;
    private int employeeNumber;
    private float minWage;
    private float maxWage;
    private String currency;
    private String description;
    private String requirement;
    private String interest;
    private String privacy;
    @OneToMany(mappedBy = "recruitment")
    private List<RecruitmentAndDomain> recruitmentAndDomains;
    @OneToMany(mappedBy = "recruitment")
    private List<RecruitmentAndSkill> recruitmentAndSkills;
    public String toJson(){
        Gson gson = new GsonBuilder().setDateFormat("yy-MM-dd HH:mm:ss").create();
        return gson.toJson(this);
    }
}
