package com.ddit.proj.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.ProfMyPageMapper;
import com.ddit.proj.service.ProfMyPageService;
import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.MemberVO;
import com.ddit.proj.vo.ProfMyPageVO;

@Service
public class ProfMyPageServiceImpl implements ProfMyPageService {
	
	@Autowired
	private ProfMyPageMapper profMyPageMapper;

	// 재직 상태 불러오기
	@Override
	public ProfMyPageVO proStat(String memNo) {
		return profMyPageMapper.proStat(memNo);
	}

	// 학과명/학과장 여부 불러오기
	@Override
	public ProfMyPageVO checkDep(String memNo) {
		return profMyPageMapper.checkDep(memNo);
	}

	// 은행 리스트 불러오기
	@Override
	public List<CodeVO> selectBankList(String groupId) {
		return profMyPageMapper.selectBankList(groupId);
	}

	// 마이페이지 내 개인정보 수정
	@Override
	public int updateInfo(MemberVO memberVO) {
		return profMyPageMapper.updateInfo(memberVO);
	}

	// 비밀번호 확인
	@Override
	public String checkPass(String memNo) {
		return profMyPageMapper.checkPass(memNo);
	}

	// 파일 업로드
	@Override
	public String updateFile(String saveFileName) {
		return profMyPageMapper.updateFile(saveFileName);
	}
	
}
