package com.ddit.proj.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DepartmentVO {
	private String depCode;
	private String colCode;
	private String depNm;
	private String depDc;
	private String depDrhf;		//교수번호
	private String profNm;		//교수명
	private int depCap;
	private String depTel;
	private String depDelYn;
	private String memNo;		//조교번호
	private String empNm;		//조교명	
	private String memNm;
	private String codeId;		// 부서 코드
	private String codeNm;		// 단과대 이름
	private String groupId;
	private String proPosYN;
	private String codeDetailId;
	private String codeDetailNm;
}
