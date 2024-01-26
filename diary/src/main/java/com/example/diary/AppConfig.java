package com.example.diary;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.example.diary.filter.EncodingFilter;
import com.example.diary.filter.MemberLoginFilter;

@Configuration
public class AppConfig {

    @Bean
    public FilterRegistrationBean<MemberLoginFilter> sessionEmployeeLoginFilter() {
        FilterRegistrationBean<MemberLoginFilter> registrationBean = new FilterRegistrationBean<>();
        registrationBean.setFilter(new MemberLoginFilter());
        registrationBean.addUrlPatterns("/*"); // 모든 URL 패턴에 필터 적용
        return registrationBean;
    }

    @Bean
    public FilterRegistrationBean<EncodingFilter> encodingFilter() {
        FilterRegistrationBean<EncodingFilter> registrationBean = new FilterRegistrationBean<>();
        registrationBean.setFilter(new EncodingFilter());
        registrationBean.addUrlPatterns("/*"); // 모든 URL 패턴에 필터 적용
        return registrationBean;
    }
}
