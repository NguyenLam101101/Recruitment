package com.example.recruitment.Repository;

import com.example.recruitment.Entity.Domain;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DomainRepository extends JpaRepository<Domain, Integer> {
}
