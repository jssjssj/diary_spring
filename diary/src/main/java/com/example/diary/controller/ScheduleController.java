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

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
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
		
		List<Schedule> scheduleList = scheduleService.selectScheduleOneByDay(paramMap);
		
		model.addAttribute("loginMember" , loginMember);
		model.addAttribute("targetYear" , targetYear);
		model.addAttribute("targetMonth" , targetMonth);
		model.addAttribute("targetDay" , targetDay);
		model.addAttribute("scheduleList" , scheduleList);

		
		return "schedule/scheduleOneByDay";
	}
	
	@PostMapping("/addSchedule")
	public String addScheduleByDay(Schedule schedule , HttpSession session , Integer targetYear, Integer targetMonth,
									Integer targetDay , Model model) {
		Member loginMember = (Member)session.getAttribute("loginMember");
		System.out.println(schedule.getScheduleDate());					// 날짜값 확인 - 디버깅
		
		
		schedule.setMemberId(loginMember.getMemberId());
		scheduleService.insertSchedule(schedule);		
	
		String link = "redirect:/scheduleOneByDay?targetYear="+targetYear+"&targetMonth="+targetMonth+"&targetDay="+targetDay;
		return link;	
	}
	
	@GetMapping("/removeSchedule")
	public String removeScheduleByDay(Schedule schedule , Integer targetYear, Integer targetMonth,
										Integer targetDay) {
		scheduleService.deleteSchedule(schedule);
		
		String link = "redirect:/scheduleOneByDay?targetYear="+targetYear+"&targetMonth="+targetMonth+"&targetDay="+targetDay;
		return link;	
	}
	
	
	@GetMapping("/modifySchedule")
	public String modifyScheduleByDay(Schedule schedule , HttpSession session , Integer targetYear, Integer targetMonth,
										Integer targetDay , Model model) {
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember==null) {
			return "login";
		}
		model.addAttribute("targetYear", targetYear);
		model.addAttribute("targetMonth", targetMonth);
		model.addAttribute("targetDay" ,targetDay);
		model.addAttribute("schedule", schedule);
		
		return "schedule/modifySchedule";
	}
	
	@PostMapping("/modifySchedule")
	public String modifyScheduleByDay(Schedule schedule, Integer targetYear, Integer targetMonth,
										Integer targetDay) {
		System.out.println(schedule + " <-- 스케쥴 메모 toString()");
		scheduleService.updateSchedule(schedule);
		
		String link = "redirect:/scheduleOneByDay?targetYear="+targetYear+"&targetMonth="+targetMonth+"&targetDay="+targetDay;
		return link;
		
	}
	
	
}
