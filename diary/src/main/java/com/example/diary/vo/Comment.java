package com.example.diary.vo;

import lombok.Data;

@Data
public class Comment {
	private int commentNo;
	private int noticeNo;
	private String isSecret; 
	private String memberId;
	private String commentPw;
	private String commentContent;
	private String createdate;
}
