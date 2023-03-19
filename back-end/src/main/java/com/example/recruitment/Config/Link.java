package com.example.recruitment.Config;

import org.springframework.stereotype.Component;

@Component
public class Link {
    public String getWebServerIP(){
        return "http://localhost:3000";
    }
    public String getEmployeeHomePage(){
        return this.getWebServerIP()+"/";
    }
    public String getEmployerHomePage(){
        return this.getWebServerIP()+"/employer";
    }
    public String getCompanyRegisterPage(){
        return this.getWebServerIP()+"/employer/company/register";
    }
}
