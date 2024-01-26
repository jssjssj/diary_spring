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
import jakarta.servlet.http.HttpSession;

public class MemberLoginFilter implements Filter {
       
	@Override
	public void init(FilterConfig fConfig) throws ServletException {

	}
	
	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) 
			throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        boolean isLogin = session.getAttribute("loginMember") != null;
        boolean isLoginPath1 = request.getServletPath().equals("/member/login");
        @SuppressWarnings("unlikely-arg-type")
		boolean isLoginPath2= request.getServletContext().equals("/member/addMember");
        if(!isLogin && !(isLoginPath1 || isLoginPath2)) {
            response.sendRedirect(request.getContextPath() + "/member/login"); // 로그인 페이지로 리다이렉트하는 예시
            return;
        }
        
        filterChain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		
	}

}



