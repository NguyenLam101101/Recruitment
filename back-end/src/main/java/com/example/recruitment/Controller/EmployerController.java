package com.example.recruitment.Controller;

import com.example.recruitment.Entity.Employer;
import com.example.recruitment.Entity.Mail;
import com.example.recruitment.Entity.Recruitment;
import com.example.recruitment.Form.CompanyRegistrationForm;
import com.example.recruitment.Form.EmployerSignupForm;
import com.example.recruitment.Form.RecruitmentForm;
import com.example.recruitment.Repository.EmployerRepository;
import com.example.recruitment.Repository.MailRepository;
import com.example.recruitment.Service.EmployerService;
import com.example.recruitment.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/employer")
public class EmployerController {
    @Autowired
    private EmployerService employerService;
    @Autowired
    private EmployerRepository employerRepository;
    @Autowired
    private UserService userService;
    @Autowired
    private MailRepository mailRepository;

    @GetMapping("/get-recruitments")
    public List<Recruitment> getRecruitments(Authentication authentication){
        if(authentication==null || !authentication.getAuthorities().toArray()[0].toString().equals("ROLE_EMPLOYER")) {
            throw new RuntimeException("authentication is null");
        }
        Employer employer = employerRepository.findEmployerByAccount_Email(authentication.getName());
        List<Recruitment> recruitments = employerService.findRecruitmentsByEmployerId(employer.getId());
        return recruitments;
    }
    @GetMapping("/get-unread-mail-num")
    public int getUnReadMailNum(Authentication authentication){
        if(authentication==null || !authentication.getAuthorities().toArray()[0].toString().equals("ROLE_EMPLOYER")) {
            throw new RuntimeException("authentication is null");
        }
        Employer employer = employerRepository.findEmployerByAccount_Email(authentication.getName());
        return mailRepository.countByEmployer_IdAndIsRead(employer.getId(),0);
    }
    @GetMapping("/get-mails")
    public List<Mail> getMails(Authentication authentication){
        if(authentication==null || !authentication.getAuthorities().toArray()[0].toString().equals("ROLE_EMPLOYER")) {
            throw new RuntimeException("authentication is null");
        }
        Employer employer = employerRepository.findEmployerByAccount_Email(authentication.getName());
        return userService.findMailsByHostId(employer.getId(), 1);
    }
    @PostMapping("/post-recruitment")
    public ResponseEntity<Integer> postRecruitment(@ModelAttribute RecruitmentForm form, Authentication authentication) throws IOException{
        if(authentication==null || !authentication.getAuthorities().toArray()[0].toString().equals("ROLE_EMPLOYER")) {
            System.out.println("notAuthenticated");
            return ResponseEntity.ok(-1);
        }
        Employer employer = employerRepository.findEmployerByAccount_Email(authentication.getName());
        return ResponseEntity.ok(employerService.saveRecruitment(form, employer));
    }
    @PostMapping("/signup")
    public ResponseEntity<Boolean> signupEmployer(@ModelAttribute EmployerSignupForm form){
        return ResponseEntity.ok(employerService.saveEmployer(form));
    }
    @PostMapping("/register-company")
    public ResponseEntity<Integer> registerCompany(@ModelAttribute CompanyRegistrationForm form, Authentication authentication) throws IOException {
        if(authentication==null || !authentication.getAuthorities().toArray()[0].toString().equals("ROLE_EMPLOYER")) {
            return ResponseEntity.ok(-1);
        }
        Employer employer = employerRepository.findEmployerByAccount_Email(authentication.getName());
        return ResponseEntity.ok(employerService.saveCompany(form, employer));
    }
}
