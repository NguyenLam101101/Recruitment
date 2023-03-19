package com.example.recruitment.Service;

import com.example.recruitment.Entity.Recruitment;
import com.example.recruitment.Repository.RecruitmentRepository;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@Service
public class AppService {
    @Autowired
    private RecruitmentRepository recruitmentRepository;
    public String saveFile(MultipartFile multipartFile, String dir) throws IOException {
        String extension = multipartFile.getContentType().split("/")[1];
        String path = dir + LocalDateTime.now().toString().replace(":",".");
        if(!extension.equals(""))
            path = path + "."+extension;
        File file = new File(path);
        FileCopyUtils.copy(multipartFile.getBytes(), file);
        return path;
    }

    public String pathToBase64(String path, String type) throws IOException {
        File file = new File(path);
        if(path.endsWith("png")){
            type = "image/png";
        }
        if(path.endsWith("pdf")){
            type = "application/pdf";
        }
        byte[] bytes = FileUtil.readAsByteArray(file);
        String base64File = Base64.getEncoder().encodeToString(bytes);
        return "data:"+type+";base64,"+base64File;
    }

    public List<Recruitment> findNewRecruitments(int page) {
        Sort sort = Sort.by("id").descending();
        List<Recruitment> recruitments = recruitmentRepository.findAll(PageRequest.of(page, 10, sort)).getContent();
        for (Recruitment recruitment: recruitments){
            try {
                recruitment.getEmployer().getCompany().setLogo(this.pathToBase64(recruitment.getEmployer().getCompany().getLogo(),"image/png"));
            }
            catch (Exception e){}
        }
        return recruitments;
    }
}
