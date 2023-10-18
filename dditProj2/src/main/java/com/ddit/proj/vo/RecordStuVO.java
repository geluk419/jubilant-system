package com.ddit.proj.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RecordStuVO {
	private String memNo; //학번 //
	private String memNm; //이름
	private String depCode; //학과
	private int stuYr; //학생_학년
	private int stuSem; //학생_재학학기
	private String recSeCode; //공통코드_학적신청_구분 //
    private int recYr; //학적신청_연도 //
    private int recSem; //학적신청_학기 //
    private String recDt; //학적신청_일시 //
    private String recRsn; //학적신청_사유 //
    private String recReturn; //학적신청_반려사유
    private String empMemNo; //교번
}
