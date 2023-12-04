package com.example.diary.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.diary.service.ScheduleService;
import com.example.diary.vo.Member;
import com.example.diary.vo.Schedule;

import jakarta.servlet.http.HttpSession;

@Controller
public class ScheduleController {
	@Autowired ScheduleService scheduleService;
	
	@GetMapping("/scheduleOneByDay")
	public String scheduleByDay(Schedule schedule , HttpSession session , Integer targetYear, Integer targetMonth,
									Integer targetDay , Model model) {
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			return "redirect:/login";
		}
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("memberId", loginMember.getMemberId());
		paramMap.put("targetYear", targetYear);
		paramMap.put("targetMonth", targetMonth);
		paramMap.put("targetDay", targetDay);
		
		List<Schedule> scheduleList = scheduleService.scheduleList(paramMap);
		
		model.addAttribute("loginMember" , loginMember);
		model.addAttribute("targetYear" , targetYear);
		model.addAttribute("targetMonth" , targetMonth);
		model.addAttribute("targetDay" , targetDay);
		model.addAttribute("scheduleList" , scheduleList);

		
		return "schedule/scheduleOneByDay";
	}
	
	@PostMapping
	public String addScheduleByDay() {
		
		return "schedule/scheduleOneByDay";
	}
}
