package com.example.recruitment.Entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "recruitment_domain")
public class RecruitmentAndDomain {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @ManyToOne
    @JoinColumn(name = "domain_id")
    private Domain domain;
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "recruitment_id")
    private Recruitment recruitment;
}
