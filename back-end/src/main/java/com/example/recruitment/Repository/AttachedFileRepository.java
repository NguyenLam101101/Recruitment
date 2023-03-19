package com.example.recruitment.Repository;

import com.example.recruitment.Entity.Administrator;
import com.example.recruitment.Entity.AttachedFile;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AttachedFileRepository extends JpaRepository<AttachedFile, Long> {
}
