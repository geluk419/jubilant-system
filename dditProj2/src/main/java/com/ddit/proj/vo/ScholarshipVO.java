package com.ddit.proj.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScholarshipVO {
	private String sclCode; //장학금_코드
	private String empMemNo; //교직원_번호
	private String memNo; //학생_번호
	private int sclYr; //장학금_연도
	private int sclSemCode; //공통코드_장학금_학기
	private String sclStat; //장학금_지급상태
	private int sclLpay; //장학금_지급액
	private String sclName; //장학금_이름
	private String memNm; //학생_이름
	private String colCode; //단과대학
	private String codeNm; //단과대학명
	private String depCode; //학과
	private String depNm; //학과명
	private int stuYr; //학년
	
	//
	private String lecCode;
}
