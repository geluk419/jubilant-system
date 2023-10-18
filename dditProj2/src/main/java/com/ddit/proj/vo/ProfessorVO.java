package com.ddit.proj.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProfessorVO {
	
	private String memNo;
	private String depCode;
	private String proPosNm;
	private String proPosYN;
	private String codeProStat;
//	private String proPosYn;
	private String memNm;
	
	private List<MemberVO> memberVO;
}
