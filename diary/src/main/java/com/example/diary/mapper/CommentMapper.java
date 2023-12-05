package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Comment;

@Mapper
public interface CommentMapper {
	// 댓글 목록(페이징)
	List<Comment> selectCommentList(Map<String, Object> paramMap);
	
	// 페이징 위한 전체 댓글 수 
	int commentCount();

	int insertComment(Comment comment);
	
	
	// 관리자 전용 즉시삭제와 comment_pw 입력 후 삭제 구분
	int deleteComment_manager(Comment comment);
	
	int deleteComment(Comment comment);
	
}
