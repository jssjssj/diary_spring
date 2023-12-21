package com.example.diary.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.tags.shaded.org.apache.xpath.functions.FuncSubstring;
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
	@Autowired private ScheduleService scheduleService;
	
	@GetMapping("/scheduleOneByDay")
	public String scheduleByDay(Schedule schedule, HttpSession session, String scheduleDate, Integer targetYear,
			Integer targetMonth, Integer targetDay, Model model) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "redirect:/login";
		}
		if (scheduleDate != null) {
			targetYear = Integer.parseInt(scheduleDate.substring(0, 4));
			targetMonth = Integer.parseInt(scheduleDate.substring(5, 7)) - 2;
			targetDay = Integer.parseInt(scheduleDate.substring(8, 10));
		}
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("memberId", loginMember.getMemberId());
		paramMap.put("targetYear", targetYear);
		paramMap.put("targetMonth", targetMonth);
		paramMap.put("targetDay", targetDay);

		List<Schedule> scheduleList = scheduleService.selectScheduleOneByDay(paramMap);

		model.addAttribute("loginMember", loginMember);
		model.addAttribute("targetYear", targetYear);
		model.addAttribute("targetMonth", targetMonth);
		model.addAttribute("targetDay", targetDay);
		model.addAttribute("scheduleList", scheduleList);

		return "schedule/scheduleOneByDay";
	}
	
	@PostMapping("/addSchedule")
	public String addScheduleByDay(Schedule schedule, HttpSession session, Integer targetYear, Integer targetMonth,
			Integer targetDay, Model model) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		System.out.println(schedule.getScheduleDate()); // 날짜값 확인 - 디버깅

		schedule.setMemberId(loginMember.getMemberId());
		scheduleService.insertSchedule(schedule);

		String url = "redirect:/scheduleOneByDay?targetYear=" + targetYear + "&targetMonth=" + targetMonth
				+ "&targetDay=" + targetDay;
		return url;
	}
	
	@GetMapping("/removeSchedule")
	public String removeScheduleByDay(Schedule schedule, Integer targetYear, Integer targetMonth, Integer targetDay) {
		scheduleService.deleteSchedule(schedule);

		String url = "redirect:/scheduleOneByDay?targetYear=" + targetYear + "&targetMonth=" + targetMonth
				+ "&targetDay=" + targetDay;
		return url;
	}
	
	
	@GetMapping("/modifySchedule")
	public String modifyScheduleByDay(Schedule schedule, HttpSession session, Integer targetYear, Integer targetMonth,
			Integer targetDay, Model model) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "login";
		}
		model.addAttribute("targetYear", targetYear);
		model.addAttribute("targetMonth", targetMonth);
		model.addAttribute("targetDay", targetDay);
		model.addAttribute("schedule", schedule);

		return "schedule/modifySchedule";
	}
	
	@PostMapping("/modifySchedule")
	public String modifyScheduleByDay(Schedule schedule, Integer targetYear, Integer targetMonth, Integer targetDay) {
		System.out.println(schedule + " <-- 스케쥴 메모 toString()");
		scheduleService.updateSchedule(schedule);

		String url = "redirect:/scheduleOneByDay?targetYear=" + targetYear + "&targetMonth=" + targetMonth
				+ "&targetDay=" + targetDay;
		return url;
	}
	
	// 스케쥴 crud 완
	
	
	// 아래부터 날짜별 , 단어별 메모조회
	
	@GetMapping("/scheduleListByWord")
	public String scheduleListByWord(@RequestParam(name = "word", defaultValue = "") String word, HttpSession session,
			String scheduleDate, Model model, @RequestParam(name = "currentPage", defaultValue = "1") int currentPage) {

		Member loginMember = (Member) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "member/login";
		}

		Map<String, Object> resultMap = scheduleService.getScheduleListByWord(word, currentPage,
				loginMember.getMemberId());
		model.addAttribute("resultMap", resultMap);
		model.addAttribute("loginMember", loginMember);

		return "schedule/scheduleListByWord";
	}
	
	
	
	@GetMapping("/scheduleListByDate")
	public String scheduleListByDate(HttpSession session, @RequestParam(defaultValue = "") String year,
			@RequestParam(defaultValue = "") String month, @RequestParam(defaultValue = "") String day,
			@RequestParam(defaultValue = "1") int currentPage, Model model) {

		Member loginMember = (Member) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "member/login";
		}

		Map<String, Object> resultMap = scheduleService.getScheduleListByDate(year, month, day, currentPage,
				loginMember.getMemberId());
		model.addAttribute("resultMap", resultMap);
		System.out.println(resultMap.get("list.size()") + "<-- resultMap.get(\"list\").size()");
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		model.addAttribute("loginMember", loginMember);

		return "schedule/scheduleListByDate";
	}
	
}
