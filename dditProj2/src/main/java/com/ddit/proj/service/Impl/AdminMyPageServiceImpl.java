package com.ddit.proj.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.AdminMyPageMapper;
import com.ddit.proj.service.AdminMyPageService;
import com.ddit.proj.vo.AdminMyPageVO;
import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.MemberVO;

@Service
public class AdminMyPageServiceImpl implements AdminMyPageService {
	
	@Autowired
	private AdminMyPageMapper adminMyPageMapper;

	// 재직 상태 불러오기
	@Override
	public AdminMyPageVO seStatus(String memNo) {
		return adminMyPageMapper.seStatus(memNo);
	}

	// 부서 불러오기
	@Override
	public AdminMyPageVO empDv(String memNo) {
		return adminMyPageMapper.empDv(memNo);
	}

	// 은행 리스트 불러오기
	@Override
	public List<CodeVO> selectBankList(String groupId) {
		return adminMyPageMapper.selectBankList(groupId);
	}

	// 마이페이지 내 개인정보 수정
	@Override
	public int updateInfo(MemberVO memberVO) {
		return adminMyPageMapper.updateInfo(memberVO);
	}

	// 비밀번호 확인
	@Override
	public String checkPass(String memNo) {
		return adminMyPageMapper.checkPass(memNo);
	}

	// 파일 업로드
	@Override
	public String updateFile(String saveFileName) {
		return adminMyPageMapper.updateFile(saveFileName);
	}

}
