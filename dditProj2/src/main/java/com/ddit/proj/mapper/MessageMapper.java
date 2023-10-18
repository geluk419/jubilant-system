package com.ddit.proj.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ddit.proj.vo.AttachVO;
import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.MemberVO;
import com.ddit.proj.vo.NoticeVO;

@Mapper
public interface MessageMapper {
	
	//라디오버튼 체크시 해당하는 학번/교번 자동 생성
	//<select id="chooseMemNo" resultType="MemberVO" parameterType="String">
	public String chooseMemNo(String memberType);
	
	//<select id="getMember" parameterType="MemberVO" resultType="MemberVO">
	public MemberVO getMember(MemberVO memberVO);
	
	//<select id="listMember" resultType="memberVO">
	public List<MemberVO> listMember(Map<String, Object> map);
	
	//<select id="read" resultMap="memberMap" parameterType="String">
	public MemberVO read(String memNo);
	
	public int getMemberTotal(Map<String, Object> map);
}
