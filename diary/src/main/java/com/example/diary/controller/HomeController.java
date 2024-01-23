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

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@Autowired private CalendarService calendarService;
	@Autowired private ScheduleService scheduleService;	
	
	@GetMapping("/home")
	public String home(HttpSession session, Model model, @RequestParam(required = false) Integer targetYear,
			@RequestParam(required = false) Integer targetMonth) {
		
		Member loginMember = (Member) session.getAttribute("loginMember");
				
		Map<String, Object> calendarMap = calendarService.getCalendar(targetYear, targetMonth, session, loginMember.getMemberId());
		model.addAttribute("calendarMap", calendarMap);
		model.addAttribute("maxMinMap", calendarMap.get("maxMinMap"));
		// 달력정보 세팅 및 전달 완

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("memberId", loginMember.getMemberId());

		paramMap.put("targetYear", session.getAttribute("targetYear"));
		paramMap.put("targetMonth", session.getAttribute("targetMonth"));

		List<Map<String, Object>> scheduleList = scheduleService.getScheduleListByMonth(paramMap);
		
		model.addAttribute("scheduleList", scheduleList); // 일자별 스케쥴 개 수 출력
		log.info(scheduleList.isEmpty() ? "출력 완" : "스케쥴 없음");
		
		
		return "home";
	}
}










