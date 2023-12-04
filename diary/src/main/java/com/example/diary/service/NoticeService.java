package com.example.diary.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.NoticeMapper;
import com.example.diary.vo.Member;
import com.example.diary.vo.Notice;

@Service
@Transactional
public class NoticeService {
	@Autowired
	private NoticeMapper noticeMapper;
	
	public List<Notice> selectNoticeList(Map<String, Object> paramMap){
		List<Notice> resultNotice = noticeMapper.selectNoticeList(paramMap);
		return resultNotice;
	}
	
	//공지추가
	public int insertNotice(Notice paramNotice) {
		int row = noticeMapper.insertNotice(paramNotice);
		return row;
	}
	
	
	public Notice selectNoticeOne(Notice paramNotice) {
		Notice resultNotice = noticeMapper.selectNoticeOne(paramNotice);
		return resultNotice;
	}
	
	public int noticeCount() {
		int row = noticeMapper.noticeCount();
		return row;
	}
	
	public int deleteNotice(Notice paramNotice) {
		int row = noticeMapper.deleteNotice(paramNotice);
		return row;
	}
	
	public int updateNotice(Notice paramNotice) {
		int row = noticeMapper.updateNotice(paramNotice);
		return row;
	}
}
