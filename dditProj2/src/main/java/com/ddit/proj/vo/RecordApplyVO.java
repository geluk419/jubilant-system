package com.ddit.proj.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class RecordApplyVO {
    private String recCode; //학적신청_코드
    private String stuMemNo; //학번
    private String memNm;   // 이름
    private String empMemNo; //교직원_번호
    private String recSeCode; //공통코드_학적신청_구분
    private int recYr; //학적신청_연도
    private int recSem; //학적신청_학기
    private String recRsn; //학적신청_사유
    private String recDt; //학적신청_일시
    private String recYn; //학적신청_승인여부
    private String recReturn; //학적신청_반려사유
    private String recSde; //학적신청_시작일자
    private String recEde; //학적신청_종료일자
    private String recDelYn; //학적신청_삭제여부
}
