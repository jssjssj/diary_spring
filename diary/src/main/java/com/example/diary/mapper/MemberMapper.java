package com.example.diary.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Member;

@Mapper
public interface MemberMapper {
	// insert / select / update / delete
	Member login(Member member);

	int insertMember(Member member);

	int deleteMember(Member member);

	int updateMember(Member member);
}

