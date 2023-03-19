package com.example.recruitment.Entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "administrator")
public class Administrator {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @OneToOne
    @JoinColumn(name = "account_id")
    private Account account;
    private String firstName;
    private String lastName;

    private String toJson(){
        Gson gson = new GsonBuilder().setDateFormat("yy-MM-dd HH:mm:ss").create();
        return gson.toJson(this);
    }
}
