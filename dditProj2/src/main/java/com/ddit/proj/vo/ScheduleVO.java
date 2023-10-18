package com.ddit.proj.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScheduleVO {
    private String schCode;
    private String memNo;
    private String schTtl;
    private String schDt;
    private String schSt;
    private String schEt;
    private String codeSchSe;
    private String codeSchMem;
    private String schDelYn;
    private String uMemNo;
    private String uSchUpdde;
    private String memNm;
    private String codeSchSeNm; // 학사분류 이름
    private String codeSchSeMemNm; // 학사 ㅣ일정 대상 이름


    public ScheduleVO(){}

    public ScheduleVO(String memNo, String schTtl, String schSt, String schEt, String codeSchSe, String codeSchMem) {
        this.memNo = memNo;
        this.schTtl = schTtl;
        this.schSt = schSt;
        this.schEt = schEt;
        this.codeSchSe = codeSchSe;
        this.codeSchMem = codeSchMem;
    }
}
