package com.example.diary.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Member;

@Mapper
public interface MemberMapper {
	Member login(Member member);
	
	// 회원가입
	int insertMember(Member member);
	
	// 회원탈퇴
	int deleteMember(Member member);
	
	// PW수정
	int updateMember(Member member);
}

