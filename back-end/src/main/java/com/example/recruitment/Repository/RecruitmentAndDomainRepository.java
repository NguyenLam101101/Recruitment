package com.example.recruitment.Repository;

import com.example.recruitment.Entity.RecruitmentAndDomain;
import com.example.recruitment.Entity.RecruitmentAndSkill;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RecruitmentAndDomainRepository extends JpaRepository<RecruitmentAndDomain, Long> {
}
