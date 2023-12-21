package com.example.diary.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Counter;

@Mapper
public interface CounterMapper {
	Counter selectCountByToday();
	
	int insertCountByToday();
	
	int updateCountByToday();
}
