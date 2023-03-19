package com.example.recruitment.Repository;

import com.example.recruitment.Entity.SavedRecruitment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SavedRecruitmentRepository extends JpaRepository<SavedRecruitment, Long> {
}
