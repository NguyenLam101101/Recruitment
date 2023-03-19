package com.example.recruitment.Form;

import com.example.recruitment.Entity.Recruitment;
import com.example.recruitment.Repository.DistrictRepository;
import com.example.recruitment.Service.AppService;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@Data
public class RecruitmentForm {
    @NotBlank
    private String name;
    private MultipartFile banner;
    @NotBlank
    private String position;
    @NotBlank
    private String type;
    @NotBlank
    private int districtId;
    @NotBlank
    private int experience;
    @NotBlank
    private int employeeNumber;
    @NotBlank
    private List<Integer> domainIds;
    private List<Integer> skillIds;
    @NotBlank
    private Date startDate;
    @NotBlank
    private Date endDate;
    private float minWage;
    private float maxWage;
    @NotBlank
    private String description;
    @NotBlank
    private String requirement;
    @NotBlank
    private String interest;
    @NotBlank
    private String privacy;
}
