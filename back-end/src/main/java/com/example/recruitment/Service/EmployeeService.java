package com.example.recruitment.Service;

import com.example.recruitment.Entity.*;
import com.example.recruitment.Form.CvForm;
import com.example.recruitment.Form.EmployeeSignupForm;
import com.example.recruitment.Form.MailForm;
import com.example.recruitment.Repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class EmployeeService{
    @Value("${upload.cv.path}")
    private String uploadCvDir;
    @Autowired
    private UserService userService;
    @Autowired
    private AppService appService;
    @Autowired
    private EmployeeRepository employeeRepository;
    @Autowired
    private DistrictRepository districtRepository;
    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private CVRepository cvRepository;
    @Autowired
    private DomainRepository domainRepository;
    @Autowired
    private SkillRepository skillRepository;
    @Autowired
    private CvAndDistrictRepository cvAndDistrictRepository;
    @Autowired
    private CVAndSkillRepository cvAndSkillRepository;
    @Autowired
    private CvAndDomainRepository cvAndDomainRepository;
    @Autowired
    private RecruitmentRepository recruitmentRepository;

    @Transactional(rollbackFor={Exception.class,Throwable.class})
    public boolean saveEmployee(EmployeeSignupForm form){
        Account account=new Account();
        account.setEmail(form.getEmail());
        account.setPassword(form.getPassword());
        account.setRole("ROLE_EMPLOYEE");
        if(userService.saveAccount(account)){
            Employee employee=new Employee();
            employee.setFirstName(form.getFirstName());
            employee.setLastName(form.getLastName());
            employee.setGender(form.getGender());
            employee.setDateOfBirth(form.getDateOfBirth());
            employee.setPhoneNumber(form.getAreaCode()+form.getPhoneNumber());
            employee.setDistrict(districtRepository.findById(form.getDistrictId()).get());
            employee.setAccount(accountRepository.findAccountByEmail(form.getEmail()));
            try{
                employeeRepository.save(employee);
                return true;
            }catch(Exception e){
                throw new Error("cannot save to table employee because"+e.toString());
            }
        }
        return false;
    }

    @Transactional(rollbackFor={Exception.class,Throwable.class})
    public boolean saveCv(CvForm form,Employee employee) throws IOException{
        //create file to save cv
        String cvPath=appService.saveFile(form.getContent(),uploadCvDir);
        //Save CV
        Cv cv=new Cv();
        cv.setName(form.getName());
        cv.setContent(cvPath);
        cv.setPrivacy(form.getPrivacy());
        cv.setExperience(form.getExperience());
        cv.setEmployee(employee);
        Cv savedCv=cvRepository.save(cv);

        //Save district
        for(int id: form.getDistrictIds()){
            CvAndDistrict cvAndDistrict=new CvAndDistrict();
            cvAndDistrict.setCv(savedCv);
            cvAndDistrict.setDistrict(districtRepository.findById(id).get());
            cvAndDistrictRepository.save(cvAndDistrict);
        }

        //Save domain
        for(int id: form.getDomainIds()){
            CvAndDomain cvAndDomain=new CvAndDomain();
            cvAndDomain.setCv(savedCv);
            cvAndDomain.setDomain(domainRepository.findById(id).get());
            cvAndDomainRepository.save(cvAndDomain);
        }

        //Save skill
        for(int id: form.getSkillIds()){
            CvAndSkill cvAndSkill=new CvAndSkill();
            cvAndSkill.setCv(savedCv);
            cvAndSkill.setSkill(skillRepository.findById(id).get());
            cvAndSkillRepository.save(cvAndSkill);
        }
        return true;
    }

    @Transactional(rollbackFor={Exception.class,Throwable.class})
    public List<Cv> findCvsByEmployeeId(Long id){
        List<Cv> cvs=cvRepository.findCvsByEmployee_Id(id);
        List<Cv> summaryCvs=cvs.stream().map(cv->cv.summary()).toList();
        return cvs;
    }
}
