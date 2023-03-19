package com.example.recruitment.Form;

import com.example.recruitment.Entity.District;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.sql.Date;

@Data
public class EmployeeSignupForm {
    @NotEmpty
    @NotNull
    @NotBlank
    private String firstName;
    @NotEmpty
    @NotNull
    private String lastName;
    @NotEmpty
    @NotNull
    private int gender;
    @NotEmpty
    @NotNull
    private Date dateOfBirth;
    @NotEmpty
    @NotNull
    private String areaCode;
    @NotEmpty
    @NotNull
    private String phoneNumber;
    @NotEmpty
    @NotNull
    private int districtId;
    @NotEmpty
    @NotNull
    private String email;
    @NotEmpty
    @NotNull
    private String password;
}
