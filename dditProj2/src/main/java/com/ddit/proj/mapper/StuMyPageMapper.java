package com.ddit.proj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.MemberVO;
import com.ddit.proj.vo.StuMyPageVO;

@Mapper
public interface StuMyPageMapper {
	
	// 학적 상태 불러오기
	StuMyPageVO recStatus(String groupId);
	
	// 학년 불러오기
	StuMyPageVO grade(String memNo);
	
	// 단과대 불러오기
	StuMyPageVO college(String memNo);
	
	// 학과 불러오기
	StuMyPageVO department(String memNo);
	
	// 은행 리스트 불러오기
	List<CodeVO> selectBankList(String groupId);
	
	// 마이페이지 내 개인정보 수정
	int updateInfo(MemberVO memberVO);
	
	// 비밀번호 확인
	String checkPass(String memNo);
	
	// 파일 업로드
	String updateFile(String saveFileName);
}
