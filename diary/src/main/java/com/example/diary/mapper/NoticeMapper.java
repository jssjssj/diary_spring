package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Notice;

@Mapper
public interface NoticeMapper {
	// insert / select / update / delete

	List<Notice> selectNoticeList(Map<String, Object> paramMap);

	Notice selectNoticeOne(Notice notice);

	int insertNotice(Notice notice);

	int deleteNotice(Notice notice);

	int updateNotice(Notice notice);

	// 페이징 위한 전체 수량
	int noticeCount();
}
