package com.example.recruitment.Repository;

import com.example.recruitment.Entity.Province;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProvinceRepository extends JpaRepository<Province, Integer> {
    public List<Province> findProvincesByCountry_Id(Long countryId);
}
