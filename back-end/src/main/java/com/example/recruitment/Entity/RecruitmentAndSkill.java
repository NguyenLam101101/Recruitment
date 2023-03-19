package com.example.recruitment.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "recruitment_skill")
public class RecruitmentAndSkill {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "recruitment_id")
    private Recruitment recruitment;
    @ManyToOne
    @JoinColumn(name = "skill_id")
    private Skill skill;

    private String toJson(){
        Gson gson = new GsonBuilder().setDateFormat("yy-MM-dd HH:mm:ss").create();
        return gson.toJson(this);
    }
}
