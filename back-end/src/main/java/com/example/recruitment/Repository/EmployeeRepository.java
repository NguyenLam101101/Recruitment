package com.example.recruitment.Repository;

import com.example.recruitment.Entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
    public Employee findEmployeeByAccount_Email(String email);
}
