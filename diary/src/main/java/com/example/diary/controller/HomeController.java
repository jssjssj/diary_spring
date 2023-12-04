package com.example.diary.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.CalendarService;
import com.example.diary.service.ScheduleService;
import com.example.diary.vo.Member;
import com.example.diary.vo.Schedule;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	@Autowired CalendarService calendarService;
	@Autowired ScheduleService scheduleService;
	
	
	@GetMapping("/home")
	public String home(HttpSession session , Model model ,
						@RequestParam(required = false) Integer targetYear ,
						@RequestParam(required = false) Integer targetMonth
						) {
		// 로그인 후에만		
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		Member loginMember = (Member)session.getAttribute("loginMember");		
		session.setAttribute("loginMember", loginMember);				// 로그인 정보 및 세션 세팅 완
		
		
		Map<String, Object> calendarMap = calendarService.getCalendar(targetYear, targetMonth , session);
		model.addAttribute("calendarMap", calendarMap);				
																		// 달력정보 세팅 및 전달 완
		
		
		Map<String , Object> paramMap = new HashMap<>();	
		paramMap.put("memberId", loginMember.getMemberId());
		
		paramMap.put("targetYear", session.getAttribute("targetYear"));
		paramMap.put("targetMonth", session.getAttribute("targetMonth"));	
		System.out.println(paramMap + "<-- paramMap");
		
		List<Map<String , Object>> scheduleList = scheduleService.getScheduleListByMonth(paramMap);
		System.out.println(scheduleList + "<-- scheduleList");
		model.addAttribute("scheduleList", scheduleList);								// 일자별 스케쥴 개 수 , 스케쥴메모 앞 5글자 미리보기 완
	
		
		
		return "home";
	}
}