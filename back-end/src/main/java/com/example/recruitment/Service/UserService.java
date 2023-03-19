package com.example.recruitment.Service;

import com.example.recruitment.Entity.*;
import com.example.recruitment.Form.EmployeeSignupForm;
import com.example.recruitment.Form.MailForm;
import com.example.recruitment.Repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class UserService implements UserDetailsService {
    @Value("${upload.attached.file.path}")
    private String attachedFileDir;
    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private RecruitmentRepository recruitmentRepository;
    @Autowired
    private EmployeeRepository employeeRepository;
    @Autowired
    private EmployerRepository employerRepository;
    @Autowired
    private CVRepository cvRepository;
    @Autowired
    private AppService appService;
    @Autowired
    private MailRepository mailRepository;
    @Autowired
    private AttachedFileRepository attachedFileRepository;
    final BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Account account = accountRepository.findAccountByEmail(email);
        if(account == null){
            throw new UsernameNotFoundException("not found email");
        }
        List<SimpleGrantedAuthority> grantedAuthorities = new ArrayList<>();
        grantedAuthorities.add(new SimpleGrantedAuthority(account.getRole()));
        return new User(account.getEmail(), account.getPassword(), grantedAuthorities);
    }
    @Transactional(rollbackFor = {Exception.class, Throwable.class})
    public boolean saveAccount(Account account){
        if(accountRepository.findAccountByEmail(account.getEmail()) == null) {
            account.setPassword(bCryptPasswordEncoder.encode(account.getPassword()));
            accountRepository.save(account);
                return true;
        }
        return false;
    }

    @Transactional(rollbackFor = {Exception.class, Throwable.class})
    public int saveMail(MailForm form,Employee employee, Employer employer) throws IOException {
        //save mail
        Mail mail = new Mail();
        mail.setEmployee(employee);
        mail.setEmployer(employer);
        mail.setHeader(form.getHeader());
        mail.setBody(form.getBody());
        mail.setDirection(form.getDirection());
        if(form.getRecruitmentId() != null) {
            mail.setRecruitment(recruitmentRepository.findById(form.getRecruitmentId()).get());
        }
        Mail savedMail = mailRepository.save(mail);
        //save attached file
        for (MultipartFile file: form.getAttachedFiles()){
            String path = appService.saveFile(file, attachedFileDir);
            AttachedFile attachedFile = new AttachedFile();
            attachedFile.setMail(savedMail);
            attachedFile.setFile(path);
            attachedFile.setOriginalName(file.getOriginalFilename());
            attachedFileRepository.save(attachedFile);
        }
        if(form.getCvId()!=null){
            Cv cv = cvRepository.findById(form.getCvId()).get();
            AttachedFile attachedFile = new AttachedFile();
            attachedFile.setMail(savedMail);
            attachedFile.setFile(cv.getContent());
            String[] splitCvContent = cv.getContent().split("\\.");
            String cvType = splitCvContent[splitCvContent.length-1];
            attachedFile.setOriginalName(cv.getName()+'.'+cvType);
            attachedFileRepository.save(attachedFile);
        }
        return 1;
    }

    public List<Mail> findMailsByHostId(Long id, int host){
        List<Mail> mails;
        if(host == 0){
            mails = mailRepository.findByEmployee_IdOrderByIdDesc(id);
        }
        else{
            mails = mailRepository.findByEmployer_IdOrderByIdDesc(id);
        }
        for (Mail mail:mails){
            for (AttachedFile attachedFile:mail.getAttachedFiles()){
                try{
                    attachedFile.setFile(appService.pathToBase64(attachedFile.getFile(),""));
                }
                catch(Exception e){}
            }
        }
        return mails;
    }
}
