package com.example.recruitment.Form;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class EmployerSignupForm {
    @NotBlank
    private String firstName;
    @NotBlank
    private String lastName;
    @NotBlank
    private String areaCode;
    @NotBlank
    private String phoneNumber;
    @NotBlank
    private String email;
    @NotBlank
    private String password;
}
