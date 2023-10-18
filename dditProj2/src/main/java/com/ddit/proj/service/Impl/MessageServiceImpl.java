package com.ddit.proj.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.MemberMapper;
import com.ddit.proj.mapper.MessageMapper;
import com.ddit.proj.service.MemberService;
import com.ddit.proj.service.MessageService;
import com.ddit.proj.vo.AuthVO;
import com.ddit.proj.vo.CodeDetailVO;
import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MessageServiceImpl implements MessageService {

//	@Autowired
//	private MemberMapper memberMapper;
	
	@Autowired
	private MessageMapper messageMapper;

//	@Override
//	public List<MemberVO> listMember() {
//		return memberMapper.listMember();
//	}
	
	@Override
	public List<MemberVO> listMember(Map<String, Object> map) {
		return messageMapper.listMember(map);
	}

//	@Override
//	public List<AuthVO> listAuth() {
//		return memberMapper.listAuth();
//	}

	@Override
	public MemberVO getMember(MemberVO memberVO) {
		return messageMapper.getMember(memberVO);
	}

//	@Override
//	public List<AuthVO> getAuth(AuthVO authVO) {
//		return memberMapper.getAuth(authVO);
//	}

	@Override
	public MemberVO read(String memNo) {
		return messageMapper.read(memNo);
	}
/*
	@Override
	public int pwUpdateAll(String password) {
		return memberMapper.pwUpdateAll(password);
	}
*/



//	@Override
//	public List<MemberVO> listMemberPage(java.util.Map<String, Object> map) {
//		return memberMapper.listMemberPage(map);
//	}


	@Override
	public int getMemberTotal(Map<String, Object> map) {
		return messageMapper.getMemberTotal(map);
	}

	@Override
	public String chooseMemNo(String memberType) {
		return messageMapper.chooseMemNo(memberType);
	}

//	public List<CodeDetailVO> codeIdList(String codeId){
//		return memberMapper.codeIdList(codeId);
//	}
//
//	@Override
//	public List<CodeVO> codeIdList2(String groupId) {
//		return memberMapper.codeIdList2(groupId);
//	}
//
//	@Override
//	public List<CodeVO> codeIdList3(String groupId) {
//		return memberMapper.codeIdList3(groupId);
//	}

//	@Override
//	public List<MemberVO> codeNmList(String codeId) {
//		return memberMapper.codeNmList(codeId);
//	}

}
