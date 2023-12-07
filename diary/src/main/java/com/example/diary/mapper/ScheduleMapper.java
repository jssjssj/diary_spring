package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Schedule;

@Mapper
public interface ScheduleMapper {
	// insert / select / update / delete
	List<Map<String, Object>> selectScheduleListByMonth(Map<String, Object> paramMap);

	List<Schedule> selectScheduleOneByDay(Map<String, Object> paramMap);

	int insertSchedule(Schedule schedule);

	int deleteSchedule(Schedule schedule);

	int updateSchedule(Schedule schedule);
	
	
	
	
	
	// 단어검색에 따른 스케줄 목록 조회 / 페이징 기능
	List<Schedule> selectScheduleListByWord(Map<String, Object> paramMap);

	int selectCountScheduleListByWord(Map<String, Object> paramMap);
	 
	
	
	
	// 연, 월, 일 입력에 따른 스케줄 목록 조회 / 페이징 기능

	List<Schedule> selectScheduleListByDate(Map<String, Object> map);

	Integer selectScheduleDateMaxYear();

	Integer selectScheduleDateMinYear();

	int selectCountScheduleListByDate(Map<String, Object> map);
	
}
