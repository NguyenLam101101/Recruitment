package com.example.recruitment.Controller;

import com.example.recruitment.Form.MailForm;
import com.example.recruitment.Service.EmployeeService;
import com.example.recruitment.Entity.*;
import com.example.recruitment.Form.CvForm;
import com.example.recruitment.Form.EmployeeSignupForm;
import com.example.recruitment.Repository.*;
import com.example.recruitment.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private EmployeeRepository employeeRepository;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private EmployerRepository employerRepository;
    @Autowired
    private RecruitmentRepository recruitmentRepository;
    @Autowired
    private UserService userService;

    @GetMapping("/get-cvs")
    public List<Cv> getCvs(Authentication authentication){
        if(authentication==null || !authentication.getAuthorities().toArray()[0].toString().equals("ROLE_EMPLOYEE")) {
            throw new RuntimeException("authentication is null");
        }
        Employee employee = employeeRepository.findEmployeeByAccount_Email(authentication.getName());
        return employeeService.findCvsByEmployeeId(employee.getId());
    }
    @PostMapping("/signup")
    public ResponseEntity<Boolean> signupEmployee(@ModelAttribute EmployeeSignupForm form){
        return ResponseEntity.ok(employeeService.saveEmployee(form));
    }
    @PostMapping("/upload-cv")
    public ResponseEntity<Boolean> uploadCv(@ModelAttribute CvForm form, Authentication authentication) throws Exception {
        if(authentication==null || !authentication.getAuthorities().toArray()[0].toString().equals("ROLE_EMPLOYEE")) {
            throw new Exception("authentication is null");
        }
        Employee employee = employeeRepository.findEmployeeByAccount_Email(authentication.getName());
        return ResponseEntity.ok(employeeService.saveCv(form, employee));
    }
    @PostMapping("/apply")
    public ResponseEntity<Integer> apply(@ModelAttribute MailForm form, Authentication authentication) throws IOException{
        if(authentication==null || !authentication.getAuthorities().toArray()[0].toString().equals("ROLE_EMPLOYEE")) {
            return ResponseEntity.ok(-1);
        }
        form.setDirection(0);
        Employee employee = employeeRepository.findEmployeeByAccount_Email(authentication.getName());
        Recruitment recruitment = recruitmentRepository.findById(form.getRecruitmentId()).get();
        return ResponseEntity.ok(userService.saveMail(form, employee, recruitment.getEmployer()));
    }
}
