package com.ddit.proj.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StudentVO {
	private int rnum;
	private String memNo; //학번
	private String depCode; //학과
	private int stuYr; //학생_학년
	private int stuSem; //학생_재학학기
	private String stuAct; //학생_등록/장학금계좌
	private String codeStuSe; //공통코드_학생_재학
	private String memNm; //이름
	private String memNme; //영어명
	private String colCode; //단과대
	private int    memZip; //우편번호
	private String memAddr1; //기본주소
	private String memAddr2; //상세주소
	private String memTel; //전화번호
	private String memMl; //이메일
	private String memBir; //생년월일
	private String memPic; //증명사진_경로
	private String memDepo; //예금주
}
