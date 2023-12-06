package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Schedule;
@Mapper
public interface ScheduleMapper {
	// insert / select / update / delete
	List<Map<String,Object>> selectScheduleListByMonth(Map<String, Object> paramMap);	
	List<Schedule> selectScheduleOneByDay(Map<String, Object> paramMap);	
	int insertSchedule(Schedule schedule);	
	int deleteSchedule(Schedule schedule);
	int updateSchedule(Schedule schedule);
	
	
	
	
	
	  // 사용자에 따른 전체 리스트 출력기능 - 검색창 / 페이징 기능 구현 
	List<Schedule> selectScheduleListByWord(Map<String, Object> paramMap);	 
	int selectCountSchedule(Schedule schedule);
	 
	
	
	
	// 연, 월, 일 입력에 따른 스케줄 목록 조히 / 페이징 기능
	

	List<Schedule> selectScheduleListByDate(Map<String,Object> map);	
	Integer selectScheduleDateMaxYear();	
	Integer selectScheduleDateMinYear();	
	int selectCountScheduleListByDate(Map<String,Object> map);
	
	
}
