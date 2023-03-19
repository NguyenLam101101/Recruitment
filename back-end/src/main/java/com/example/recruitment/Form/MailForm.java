package com.example.recruitment.Form;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Data
public class MailForm {
    private Long recruitmentId;
    private String header;
    private String body;
    private int direction;
    private Long cvId;
    private List<MultipartFile> attachedFiles = new ArrayList<>();
}
