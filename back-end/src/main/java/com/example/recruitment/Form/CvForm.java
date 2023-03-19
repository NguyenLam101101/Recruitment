package com.example.recruitment.Form;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;

@Data
public class CvForm {
    private Long employeeId;
    private String name;
    private MultipartFile content;
    private List<Integer> districtIds;
    private List<Integer> domainIds;
    private List<Integer> skillIds;
    private int experience;
    private String privacy;
}
