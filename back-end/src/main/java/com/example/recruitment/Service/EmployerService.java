package com.example.recruitment.Service;

import com.example.recruitment.Entity.*;
import com.example.recruitment.Form.CompanyRegistrationForm;
import com.example.recruitment.Form.EmployerSignupForm;
import com.example.recruitment.Form.RecruitmentForm;
import com.example.recruitment.Repository.*;
import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@Service
public class EmployerService {
    @Value("${upload.image.path}")
    private String uploadImageDir;
    @Autowired
    private UserService userService;
    @Autowired
    private AppService appService;
    @Autowired
    private EmployerRepository employerRepository;
    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private DistrictRepository districtRepository;
    @Autowired
    private CompanyRepository companyRepository;
    @Autowired
    private RecruitmentRepository recruitmentRepository;
    @Autowired
    private DomainRepository domainRepository;
    @Autowired
    private RecruitmentAndDomainRepository recruitmentAndDomainRepository;
    @Autowired
    private SkillRepository skillRepository;
    @Autowired
    private RecruitmentAndSkillRepository recruitmentAndSkillRepository;
    @Autowired
    private MailRepository mailRepository;

    public boolean hasCompanyByEmail(String email){
        Employer employer = employerRepository.findEmployerByAccount_Email(email);
        if(employer.getCompany() == null){
            return false;
        }
        return true;
    }

    @Transactional(rollbackFor={Exception.class, Throwable.class})
    public boolean saveEmployer(EmployerSignupForm form){
        Account account = new Account();
        account.setEmail(form.getEmail());
        account.setPassword(form.getPassword());
        account.setRole("ROLE_EMPLOYER");
        if(userService.saveAccount(account)){
                Employer employer = new Employer();
                employer.setFirstName(form.getFirstName());
                employer.setLastName(form.getLastName());
                employer.setPhoneNumber(form.getAreaCode()+form.getPhoneNumber());
                employer.setAccount(accountRepository.findAccountByEmail(form.getEmail()));
                employerRepository.save(employer);
                return true;
        }
        return false;
    }

    @Transactional(rollbackFor={Exception.class, Throwable.class})
    public int saveRecruitment(RecruitmentForm form, Employer employer) throws IOException{
        //save recruitment
        Recruitment recruitment = new Recruitment();
        recruitment.setEmployer(employer);
        recruitment.setName(form.getName());
        recruitment.setPosition(form.getPosition());
        recruitment.setType(form.getType());
        recruitment.setDistrict(districtRepository.findById(form.getDistrictId()).get());
        recruitment.setExperience(form.getExperience());
        recruitment.setEmployeeNumber(form.getEmployeeNumber());
        recruitment.setStartDate(form.getStartDate());
        recruitment.setEndDate(form.getEndDate());
        recruitment.setMinWage(form.getMinWage());
        recruitment.setMaxWage(form.getMaxWage());
        recruitment.setDescription(form.getDescription());
        recruitment.setRequirement(form.getRequirement());
        recruitment.setInterest(form.getInterest());
        recruitment.setPrivacy(form.getPrivacy());
        String bannerPath = appService.saveFile(form.getBanner(), uploadImageDir);
        recruitment.setBanner(bannerPath);
        Recruitment savedRecruitment;
        try{
            savedRecruitment = recruitmentRepository.save(recruitment);
        }
        catch (Exception e){
            throw new RuntimeException(e);
        }
        for (int id : form.getDomainIds()){
            RecruitmentAndDomain recruitmentAndDomain = new RecruitmentAndDomain();
            recruitmentAndDomain.setRecruitment(savedRecruitment);
            recruitmentAndDomain.setDomain(domainRepository.findById(id).get());
            try {
                recruitmentAndDomainRepository.save(recruitmentAndDomain);
            }
            catch (Exception e){
                throw new RuntimeException(e);
            }
        }
        for (int id : form.getSkillIds()){
            RecruitmentAndSkill recruitmentAndSkill = new RecruitmentAndSkill();
            recruitmentAndSkill.setRecruitment(savedRecruitment);
            recruitmentAndSkill.setSkill(skillRepository.findById(id).get());
            try {
                recruitmentAndSkillRepository.save(recruitmentAndSkill);
            }
            catch (Exception e){
                throw new RuntimeException(e);
            }
        }
        return 1;
    }
    @Transactional(rollbackFor={Exception.class, Throwable.class})
    public int saveCompany(CompanyRegistrationForm form, Employer employer) throws IOException {
        //process logo file
        String logoPath = appService.saveFile(form.getLogo(), uploadImageDir);
        //save company
        Company company = new Company();
        company.setName(form.getName());
        company.setLogo(logoPath);
        company.setField(form.getField());
        company.setDistrict(districtRepository.findById(form.getDistrictId()).get());
        company.setTaxCode(form.getTaxCode());
        company.setSize(form.getSize());
        company.setDescription(form.getDescription());
        company.setEmail(form.getEmail());
        company.setWebsite(form.getWebsite());
        Company savedCompany = companyRepository.save(company);
        //update employer
        employer.setCompany(savedCompany);
        return 1;
    }

    public List<Recruitment> findRecruitmentsByEmployerId(Long id){
        List<Recruitment> recruitments = recruitmentRepository.findRecruitmentsByEmployer_IdOrderByIdDesc(id);
        List<Recruitment> transformedRecruitments = new ArrayList<>();
        recruitments.forEach(recruitment -> {
            try {
                recruitment.setBanner(appService.pathToBase64(recruitment.getBanner(), "image/png"));
            } catch (IOException e){
                System.out.println(e);
            }
            try {
                recruitment.getEmployer().getCompany().setLogo(appService.pathToBase64(recruitment.getEmployer().getCompany().getLogo(), "image/png"));
            } catch (IOException e) {
                System.out.println(e);
            }
        });
        return recruitments;
    }
}
