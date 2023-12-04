package com.example.diary.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.CommentMapper;
import com.example.diary.vo.Comment;

@Service
@Transactional
public class CommentService {
	@Autowired
	private CommentMapper commentMapper;
	
	public List<Comment> selectCommentList(Map<String, Object> paramMap){
		List<Comment> commentList = commentMapper.selectCommentList(paramMap);
		return commentList;
	}
	
	public int insertComment(Comment comment) {
		int row = commentMapper.insertComment(comment);
		return row;
	}
	
	public int commentCount() {
		int row = commentMapper.commentCount();
		return row;
	}
	
	
	
}
