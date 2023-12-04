package com.example.diary.vo;

import lombok.Data;

@Data
public class Comment {
	private int commentNo;
	private int noticeNo;
	private boolean isSecret; // true : 비밀글(본인 및 관리자만 조회가능)
	private String memberId;
	private String commentPw;
	private String commentContent;
	private String createdate;
}
