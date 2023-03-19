package com.example.recruitment.Repository;

import com.example.recruitment.Entity.Mail;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MailRepository extends JpaRepository<Mail, Long> {
    public List<Mail> findByEmployer_IdOrderByIdDesc(Long id);
    public int countByEmployer_IdAndIsRead(Long id, int isRead);
    public List<Mail> findByEmployee_IdOrderByIdDesc(Long id);
    public int countByEmployee_IdAndIsRead(Long id, int isRead);
}
