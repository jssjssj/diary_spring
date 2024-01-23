package com.example.diary.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MemberLoginFilter implements Filter {
       
	@Override
	public void init(FilterConfig fConfig) throws ServletException {

	}
	
	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) 
			throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        
        boolean isLogin = request.getSession().getAttribute("loginMember") != null;
        boolean isLoginPath = request.getServletPath().equals("/member/login");
        filterChain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		
	}

}

