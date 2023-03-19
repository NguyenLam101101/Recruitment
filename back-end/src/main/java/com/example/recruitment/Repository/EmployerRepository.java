package com.example.recruitment.Repository;

import com.example.recruitment.Entity.Employer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployerRepository extends JpaRepository<Employer, Long> {
    public Employer findEmployerByAccount_Email(String email);
}
