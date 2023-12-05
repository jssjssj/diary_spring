package com.example.diary.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.ScheduleMapper;
import com.example.diary.vo.Schedule;

@Service
@Transactional
public class ScheduleService {
	@Autowired 
	 ScheduleMapper scheduleMapper;
	
	public List<Map<String,Object>> getScheduleListByMonth(Map<String, Object> paramMap) {		
		List<Map<String,Object>> scheduleList = new ArrayList<>();
		
		scheduleList = scheduleMapper.selectScheduleListByMonth(paramMap);
		return scheduleList;
	}
	
	public List<Schedule> selectScheduleOneByDay (Map<String, Object> paramMap) {		
		List<Schedule> selectScheduleOneByDay = new ArrayList<>();
		selectScheduleOneByDay = scheduleMapper.selectScheduleOneByDay(paramMap);
		return selectScheduleOneByDay;
	}
	
	public int insertSchedule(Schedule schedule) {
		int row = scheduleMapper.insertSchedule(schedule);
		return row;
	}
	
	public int deleteSchedule(Schedule schedule) {
		int row = scheduleMapper.deleteSchedule(schedule);
		return row;
	}
	
	public int updateSchedule(Schedule schedule) {
		int row = scheduleMapper.updateSchedule(schedule);
		return row;
	}
	
}
