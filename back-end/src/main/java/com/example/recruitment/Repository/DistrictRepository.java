package com.example.recruitment.Repository;

import com.example.recruitment.Entity.District;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DistrictRepository extends JpaRepository<District, Integer> {
    public List<District> findDistrictsByProvince_Id(Long provinceId);
}
