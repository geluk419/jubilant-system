package com.ddit.proj.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.LoginMapper;
import com.ddit.proj.service.LoginService;
import com.ddit.proj.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginMapper loginMapper;
	
	// ID 조회
	@Override
	public String findId(MemberVO memberVO) {
	    return loginMapper.findId(memberVO);
	}

	// PW 임시 비밀번호 발급
	@Override
	public String findPw(MemberVO memberVO) {
		return loginMapper.findPw(memberVO);
	}

	@Override
	public MemberVO findMemberById(String memNo) {
		return loginMapper.findMemberById(memNo);
	}

	// 비밀번호 업데이트
	@Override
	public void updatePassword(MemberVO memberVO) {
		loginMapper.updatePassword(memberVO);
	}
	
}
