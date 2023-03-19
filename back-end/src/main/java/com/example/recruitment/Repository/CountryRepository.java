package com.example.recruitment.Repository;

import com.example.recruitment.Entity.Country;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CountryRepository extends JpaRepository<Country, Integer>{
}
