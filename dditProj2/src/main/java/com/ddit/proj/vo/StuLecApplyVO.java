package com.ddit.proj.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StuLecApplyVO {
    private String lecCode;     /* 강의 코드*/
    private String subCode;     /* 과목 코드 : 어떤 과목의 강의인가 */
    private String lecaId;      /* 강의계획서 코드 */
    private String lecHcnt;     /* 강의 수강인원 */
    private String roomNo;      /* 강의실 호수 */
    private String bldCode;     /* 건물코드 */
    private String bldNm;       /* 건물이름 */
    private String lecClsNm;    /* 강의 수업일수 */
    private String lecaCount;    /* 강의 수업일수 */
    private String lecaYr;      /* 강의계획 년도 */
    private String lecaSem;     /* 강의계획 학기 */
    private String lecaNm;      /* 강의계획 강의명 */
    private String lecaSeCode;  /* 강의계획 이수구분 */
    private String lecaTrg;     /* 강의계획 개설학년 */
    private String lecaCrd;     /* 강의계획 이수학점 */
    private String lecaCap;     /* 강의계획 학생정원 */
    private String subNm;       /* 과목의 과목이름 */
    private String depNm;       /* 학과의 학과이름 */
    private String memNo;       /* 강의계획서의 교수번호 */
    private String memNm;       /* 사용자에 교수이름 */
    private String memDepCode;  /* 사용자의 학과코드 */
    private String stuSem;       /* 학생의 재학학기  */
    private String stuYr;       /* 학생의 현재학년  */
    // 수강계획서 추가 변수
    private String lecdWeek;    /* 강의상세 요일 */
    private String lecdSt;      /* 강의상세 시작교시 */
    private String lecdEt;      /* 강의상세 종료교시 */
    private String memDepNm;    /* 교수 소속 학과 이름 */
    private String codeNm;      /* 강의 이수구분 한글*/
    private String memTel;      /* 교수 연락처 */
    private String memMl;       /* 교수 이메일 */
}
