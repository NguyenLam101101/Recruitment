package com.example.recruitment.Repository;

import com.example.recruitment.Entity.Cv;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CVRepository extends JpaRepository<Cv, Long> {
    public List<Cv> findCvsByEmployee_Id(Long id);
}
