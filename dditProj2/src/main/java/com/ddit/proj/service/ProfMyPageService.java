package com.ddit.proj.service;

import java.util.List;

import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.MemberVO;
import com.ddit.proj.vo.ProfMyPageVO;

public interface ProfMyPageService {
	
	// 재직 상태 불러오기
	ProfMyPageVO proStat(String memNo);
	
	// 학과명/학과장 여부 불러오기
	ProfMyPageVO checkDep(String memNo);	
	
	// 은행 리스트 불러오기
	List<CodeVO> selectBankList(String groupId);
	
	// 마이페이지 내 개인정보 수정
	int updateInfo(MemberVO memberVO);
	
	// 비밀번호 확인
	String checkPass(String memNo);
	
	// 파일 업로드
	String updateFile(String saveFileName);

}
