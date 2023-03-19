package com.example.recruitment.Repository;

import com.example.recruitment.Entity.Recruitment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface RecruitmentRepository extends JpaRepository<Recruitment, Long> {
    public List<Recruitment> findRecruitmentsByEmployer_IdOrderByIdDesc(Long id);
}
