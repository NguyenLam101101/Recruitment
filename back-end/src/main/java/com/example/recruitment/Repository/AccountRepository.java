package com.example.recruitment.Repository;

import com.example.recruitment.Entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface AccountRepository extends JpaRepository<Account, Long> {
    public Account findAccountByEmail(String email);
//    @Transactional
//    @Modifying
//    @Query(
//            value = "insert into recruitment.account (email, password, role) values (?1, ?2, ?3)",
//            nativeQuery = true)
//    public void save(String email, String password, String role);
}
