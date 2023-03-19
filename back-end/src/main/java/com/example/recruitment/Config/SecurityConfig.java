package com.example.recruitment.Config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@EnableWebSecurity
@Configuration
public class SecurityConfig {
    final String webServer = new Link().getWebServerIP();
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .authorizeRequests()
                    .antMatchers("/**").permitAll()
                    .and()
                .formLogin()
                    .loginPage(webServer+"/login")
                    .loginProcessingUrl("/login")
                    .defaultSuccessUrl("/default-success-login")
                    .failureUrl(webServer+"/login?error=true")
                    .usernameParameter("email")
                    .passwordParameter("password")
                    .permitAll()
                    .and()
                .logout()
                    .logoutUrl("/logout")
                    .logoutSuccessUrl(webServer+"/login")
                    .invalidateHttpSession(true)
                    .deleteCookies("JSESSIONID");
        return http.build();
    }
//    @Bean
//    public UserDetailsService userDetailsService(){
//        return new UserService();
//    }
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
