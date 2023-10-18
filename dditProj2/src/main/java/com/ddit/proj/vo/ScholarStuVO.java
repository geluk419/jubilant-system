package com.ddit.proj.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScholarStuVO {
	private String colCode; //단과대
	private String memNo; //학번
	private String depCode; //학과
	private int stuYr; //학생_학년
	private String memNm; //이름
	private int sclLpay; //장학금_지급액
	private String lecaNm; //강의명
	private String lecaSeCode; //이수구분
	private int lecaCrd; //이수학점
	private String codeScreGrade; //학점
	private String scoreAll; //성적
	
	private String lecCode;
	
}
