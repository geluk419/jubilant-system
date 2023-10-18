package com.ddit.proj.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.StuMyPageMapper;
import com.ddit.proj.service.StuMyPageService;
import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.MemberVO;
import com.ddit.proj.vo.StuMyPageVO;

@Service
public class StuMyPageServiceImpl implements StuMyPageService {
	
	@Autowired
	private StuMyPageMapper stuMyPageMapper;
	
	// 학적 상태 불러오기
	@Override
	public StuMyPageVO recStatus(String groupId) {
		return stuMyPageMapper.recStatus(groupId);
	}

	// 학년 불러오기
	@Override
	public StuMyPageVO grade(String memNo) {
		return stuMyPageMapper.grade(memNo);
	}

	// 단과대 불러오기
	@Override
	public StuMyPageVO college(String memNo) {
		return stuMyPageMapper.college(memNo);
	}

	// 학과 불러오기
	@Override
	public StuMyPageVO department(String memNo) {
		return stuMyPageMapper.department(memNo);
	}

	// 은행 리스트 불러오기
	@Override
	public List<CodeVO> selectBankList(String groupId) {
		return stuMyPageMapper.selectBankList(groupId);
	}

	// 마이페이지 내 개인정보 수정
	@Override
	public int updateInfo(MemberVO memberVO) {
		return stuMyPageMapper.updateInfo(memberVO);
	}

	// 비밀번호 확인
	@Override
	public String checkPass(String memNo) {
		return stuMyPageMapper.checkPass(memNo);
	}

	// 파일 업로드
	@Override
	public String updateFile(String saveFileName) {
		return stuMyPageMapper.updateFile(saveFileName);
	}


}
