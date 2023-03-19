package com.example.recruitment.Repository;

import com.example.recruitment.Entity.SavedCv;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SavedCVRepository extends JpaRepository<SavedCv, Long> {
}
