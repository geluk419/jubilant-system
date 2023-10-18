package com.ddit.proj.service;

import java.util.List;
import java.util.Map;

import com.ddit.proj.vo.AuthVO;
import com.ddit.proj.vo.CodeDetailVO;
import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.MemberVO;

public interface MessageService {
	public List<MemberVO> listMember(Map<String, Object> map); //
//	public List<AuthVO> listAuth();
	
	public MemberVO getMember(MemberVO memberVO); //
//	public List<AuthVO> getAuth(AuthVO authVO);
	
//	public int insertMember(MemberVO memberVO);
//	public int addAuth(AuthVO authVO);
	
//	public int updateMember(MemberVO memberVO);
	
//	public int deleteMember(String memNo);
//	public int deleteAuth(AuthVO authVO);
	
	public MemberVO read(String memNo); //
	/*
	public int pwUpdateAll(String password);
	*/
	//public List<MemberVO> listMemberPage(Map<String, Object> map);
	
	public int getMemberTotal(Map<String, Object> map); //
	
	public String chooseMemNo(String memberType); //
	
//	public List<CodeDetailVO> codeIdList(String codeId);
	
//	public List<CodeVO> codeIdList2(String groupId);
	
//	public List<CodeVO> codeIdList3(String groupId);
	
//	public List<MemberVO> codeNmList(String codeId);

	
}
