package com.example.diary.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.mapper.ScheduleMapper;
import com.example.diary.vo.Schedule;

import jakarta.servlet.http.HttpSession;

@Service
@Transactional
public class ScheduleService {
	@Autowired 
	private ScheduleMapper scheduleMapper;
	
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
	
	
	// 작성한 스케쥴 메모 검색기능 / 페이징 위한 전체 카운트 수 조회 메소드 
	public Map<String,Object> getScheduleListByWord( 
											@RequestParam(name="word", defaultValue = "") String word ,
											@RequestParam(name="currentPage" ,defaultValue = "1") int currentPage,
											String memberId) {		
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("word", word);
			paramMap.put("memberId", memberId);
			int totalRow = scheduleMapper.selectCountScheduleListByWord(paramMap); // 멤버별 전체 스케줄 수 도출
			
			int rowPerPage = 10;
			int beginRow = (currentPage-1)*rowPerPage;
			int lastPage = totalRow/rowPerPage;
			
			if(totalRow==0) {
				lastPage = currentPage;
			} else {
				if(totalRow%rowPerPage != 0) {
					lastPage += 1;
				}
			}
			
			paramMap.put("rowPerPage", rowPerPage);
			paramMap.put("beginRow", beginRow);	
			
			List<Schedule> list = new ArrayList<>();
			list = scheduleMapper.selectScheduleListByWord(paramMap); //멤버별 스케줄 등 도출			
		
			Map<String, Object> resultMap = new HashMap<>();
			resultMap.put("lastPage", lastPage);
			resultMap.put("currentPage", currentPage);
			resultMap.put("list", list);
			resultMap.put("word", word);
		return resultMap;
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 날짜 검색에 따른 작성메모 출력기능
	public Map<String, Object> getScheduleListByDate(String year, String month, String day,
			@RequestParam(defaultValue = "1") int currentPage , String memberId) {
		//월 범위
		Integer minYear = scheduleMapper.selectScheduleDateMinYear(memberId);
		Integer maxYear = scheduleMapper.selectScheduleDateMaxYear(memberId);
		Map<String, Integer> maxMinMap = new HashMap<>();
		maxMinMap.put("minYear", minYear);
		maxMinMap.put("maxYear", maxYear);
		
		//스케줄 리스트
		Map<String, Object> paramMap = new HashMap<>();
		System.out.println(memberId + "<-- memberId");
		paramMap.put("memberId", memberId);
		
		if(year.equals("")) {
			paramMap.put("year", null);
		} else {
			paramMap.put("year", Integer.parseInt(year));
		}
		
		if(month.equals("")) {
			paramMap.put("month",null);
		} else {
			paramMap.put("month", Integer.parseInt(month));
		}
		
		if(day.equals("")) {
			paramMap.put("day", null);
		} else {
			paramMap.put("day", Integer.parseInt(day));
		}
		
		
		
		// 페이징 구현
		int rowPerPage = 10;
		int beginRow = (currentPage-1)*rowPerPage;

		System.out.println(paramMap + "<-- totalRow 도출 전 paramMap");
		int totalRow = scheduleMapper.selectCountScheduleListByDate(paramMap);
		System.out.println(totalRow + "<---- totalRow");
		int lastPage = totalRow/rowPerPage;
		
		if(totalRow==0) {
			lastPage = currentPage;
		} else {
			if(totalRow % rowPerPage != 0) {
				lastPage += 1;
			}
		}
		
		
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("beginRow", beginRow);
		System.out.println(paramMap + "<-- final paramMap");
		List<Schedule> list = scheduleMapper.selectScheduleListByDate(paramMap);
		
		//반환 맵
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("maxMinMap", maxMinMap);
		resultMap.put("list", list);
		resultMap.put("list.size()", list.size());
		resultMap.put("lastPage", lastPage);
		resultMap.put("currentPage", currentPage);
		
		return resultMap;
	}
	
	
	
}
