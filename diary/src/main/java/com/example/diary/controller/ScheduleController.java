package com.example.diary.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.ScheduleService;
import com.example.diary.vo.Member;
import com.example.diary.vo.Schedule;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	
		String url = "redirect:/scheduleOneByDay?targetYear="+targetYear+"&targetMonth="+targetMonth+"&targetDay="+targetDay;
		return url;	
	}
	
	@GetMapping("/removeSchedule")
	public String removeScheduleByDay(Schedule schedule , Integer targetYear, Integer targetMonth,
										Integer targetDay) {
		scheduleService.deleteSchedule(schedule);
		
		String url = "redirect:/scheduleOneByDay?targetYear="+targetYear+"&targetMonth="+targetMonth+"&targetDay="+targetDay;
		return url;	
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
		
		String url = "redirect:/scheduleOneByDay?targetYear="+targetYear+"&targetMonth="+targetMonth+"&targetDay="+targetDay;
		return url;		
	}
	
//	@GetMapping("/scheduleListByWord")
//	public String scheduleListByWord(@RequestParam(name="word", defaultValue="") String word , Map<String, Object> paramMap, Model model , 
//			@RequestParam(name="currentPage", defaultValue="1") int currentPage) {
//		int rowPerPage = 20;
//		int beginRow = (currentPage-1)*rowPerPage;
//		int totalRow = scheduleService.selectCountSchedule();
//		int lastPage = totalRow / rowPerPage ;
//		if(totalRow%rowPerPage != 0) {
//			lastPage += 1;
//		}
//				
//		
//		
//		paramMap = new HashMap<>();
//		paramMap.put("word", word);
//		paramMap.put("word", word);
//		paramMap.put("word", word);
//		List<Schedule> list = scheduleService.getScheduleListByWord(paramMap);
//		model.addAttribute("list" , list);
//		return "schedule/scheduleListByWord";
//	}
	
	@GetMapping("/scheduleListByDate")
	public String scheduleListByDate(
			HttpSession session,			
			@RequestParam(defaultValue = "") String year,
			@RequestParam(defaultValue = "") String month,
			@RequestParam(defaultValue = "") String day,
			@RequestParam(defaultValue = "1") int currentPage,
			Model model) {
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember==null) {
			return "member/login";
		}
		
		
		Map<String, Object> resultMap = scheduleService.getScheduleListByDate(year, month, day , currentPage, loginMember.getMemberId());
		model.addAttribute("resultMap" , resultMap);
		model.addAttribute("year" , year);
		model.addAttribute("month" , month);
		model.addAttribute("day" , day);
		model.addAttribute("loginMember" , loginMember);
		
	
		
		return "schedule/scheduleListByDate";
	}
	

}
