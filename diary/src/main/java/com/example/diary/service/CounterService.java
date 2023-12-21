package com.example.diary.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.CounterMapper;
import com.example.diary.vo.Counter;

@Service
@Transactional
public class CounterService {
	@Autowired private CounterMapper counterMapper;
	public Counter selectCountByToday() {		
		Counter counter = counterMapper.selectCountByToday();
		return counter;
	}
	
	
	public void insertCountByToday() {
		counterMapper.insertCountByToday();		
	}
	
	public void updateCountByToday() {	
		counterMapper.updateCountByToday();		
	}
}
