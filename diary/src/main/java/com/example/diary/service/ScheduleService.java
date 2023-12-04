package com.example.diary.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.ScheduleMapper;

@Service
@Transactional
public class ScheduleService {
	@Autowired private ScheduleMapper scheduleMapper;
	
	public List<Map<String,Object>> getScheduleListByMonth(Map<String, Object> paramMap) {		
		List<Map<String,Object>> scheduleList = new ArrayList<>();
		
		scheduleList = scheduleMapper.selectScheduleListByMonth(paramMap);
		return scheduleList;
	}
}
