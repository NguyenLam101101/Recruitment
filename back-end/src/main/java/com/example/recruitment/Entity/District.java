package com.example.recruitment.Entity;

import com.fasterxml.jackson.annotation.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "district")
public class District {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    private String name;
    @ManyToOne
    @JoinColumn(name = "province_id")
    private Province province;

    private String toJson(){
        Gson gson = new GsonBuilder().setDateFormat("yy-MM-dd HH:mm:ss").create();
        return gson.toJson(this);
    }
}
