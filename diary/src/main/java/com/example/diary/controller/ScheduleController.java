package com.example.diary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.diary.service.ScheduleService;
import com.example.diary.vo.Schedule;

import jakarta.servlet.http.HttpSession;

@Controller
public class ScheduleController {
	@Autowired ScheduleService scheduleService;
	
	@GetMapping("/scheduleByDay")
	public String scheduleByDay(Schedule schedule , HttpSession session , Integer targetYear, Integer targetMonth
									) {
		
		return "schedule/scheduleByDay";
	}
}
