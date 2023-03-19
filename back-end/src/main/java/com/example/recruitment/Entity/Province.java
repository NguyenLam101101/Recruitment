package com.example.recruitment.Entity;

import com.fasterxml.jackson.annotation.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import lombok.Data;

import javax.persistence.*;
import java.util.Set;

@Data
@Entity
@Table(name = "province")
public class Province {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    private String name;
    @ManyToOne
    @JoinColumn(name = "country_id")
    private Country country;

    private String toJson(){
        Gson gson = new GsonBuilder().setDateFormat("yy-MM-dd HH:mm:ss").create();
        return gson.toJson(this);
    }
}
