package com.ddit.proj.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ddit.proj.vo.MemberVO;

@Mapper
public interface LoginMapper {
	
	// ID 조회
	String findId(MemberVO memberVO);
	
	// PW 임시 비밀번호 발급
	String findPw(MemberVO memberVO);
	
	// ID로 멤버 정보 조회
	MemberVO findMemberById(String memNo);

	// 비밀번호 업데이트
	void updatePassword(MemberVO memberVO);

}
