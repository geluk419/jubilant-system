package com.ddit.proj.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DormitoryApplyFormVO {
	private int rnum;
	private String memNm;
	private String memNme;
	private String memBir;
	private String memNo;
	private String depNm;
	private String memTel;
	private String memTel2;
	private String codNm;
	private String doraGender;
	private String lifePeriod;
	private String dorNmCode;
	private String dorNo;
	private int    memZip; //우편번호
	private String memAddr1; //기본주소
	private String memAddr2; //상세주소
	private String memDepo; //예금주
	private String memBankCode; //공통코드_은행코드
	private String memAccount;	//계좌번호
	private String dormRewards;	// 상점
	private String dormPenalties;	// 벌점
	private Date dormSleDe;			// 발생일자
	private String dormPotReason;	// 상/벌점 사유
}
