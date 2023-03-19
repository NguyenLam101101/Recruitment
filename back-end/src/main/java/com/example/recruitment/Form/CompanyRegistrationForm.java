package com.example.recruitment.Form;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;

@Data
public class CompanyRegistrationForm {
    private String name;
    private MultipartFile logo;
    private String field;
    private int districtId;
    private String taxCode;
    private String size;
    private String description;
    private String email;
    private String website;
}
