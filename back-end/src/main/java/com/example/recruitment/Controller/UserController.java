package com.example.recruitment.Controller;

import com.example.recruitment.Config.Link;
import com.example.recruitment.Entity.*;
import com.example.recruitment.Repository.*;
import com.example.recruitment.Service.AppService;
import com.example.recruitment.Service.EmployerService;
import com.example.recruitment.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RestController
public class UserController {
    final Link link= new Link();
    @Autowired
    private DistrictRepository districtRepository;
    @Autowired
    private DomainRepository domainRepository;
    @Autowired
    private UserService userService;
    @Autowired
    private AppService appService;
    @Autowired
    private RecruitmentRepository recruitmentRepository;
    @Autowired
    private CVRepository cvRepository;
    @Autowired
    private EmployerService employerService;
    @Autowired
    private SkillRepository skillRepository;
    @GetMapping("/get-role")
    public ResponseEntity<String> isEmployee(Authentication authentication){
        if(authentication==null) {
            return ResponseEntity.ok(null);
        }
        return ResponseEntity.ok(authentication.getAuthorities().toArray()[0].toString());
    }
    @GetMapping("/get-districts")
    public List<District> getDistricts(){
        return districtRepository.findAll();
    }
    @GetMapping("/get-domains")
    public List<Domain> getDomains(){
        return domainRepository.findAll();
    }
    @GetMapping("/get-skills")
    public List<Skill> getSkills(){
        return skillRepository.findAll();
    }
    @GetMapping("/default-success-login")
    public RedirectView loginRedirect(Authentication authentication){
        String authority = authentication.getAuthorities().toArray()[0].toString();
        if(authority.equals("ROLE_EMPLOYEE")){
            return new RedirectView(link.getEmployeeHomePage());
        }
        if(authority.equals("ROLE_EMPLOYER")){
            if(!employerService.hasCompanyByEmail(authentication.getName())){
                return new RedirectView(link.getCompanyRegisterPage());
            }
            return new RedirectView(link.getEmployerHomePage());
        }
        else
            return new RedirectView(link.getEmployeeHomePage());
    }
    @GetMapping("/get-new-recruitments")
    public List<Recruitment> getNewRecruitments(@RequestParam int page){
        return appService.findNewRecruitments(page);
    }

    @GetMapping("/get-recruitment-by-id")
    public Recruitment getRecruitmentById(@RequestParam Long id){
        Recruitment recruitment = recruitmentRepository.findById(id).get();
        try {
            recruitment.setBanner(appService.pathToBase64(recruitment.getBanner(), "image/png"));
        }
        catch (Exception e){}
        try {
            recruitment.getEmployer().getCompany().setLogo(appService.pathToBase64(recruitment.getEmployer().getCompany().getLogo(), "image/png"));
        }
        catch (Exception e){}
        return recruitment;
    }

    @GetMapping("/get-cv-by-id")
    public String getCvById(@RequestParam Long id, Authentication authentication){
        Cv cv = cvRepository.findById(id).get();
        try {
            return appService.pathToBase64(cv.getContent(), "application/pdf");
        }
        catch (Exception e){
            System.out.println(e);
            return "";
        }
    }
}