package com.ddit.proj.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProfMyPageVO {
	
	private String memNo;
	private String memBankCode; //공통코드_은행코드
	private String memAccount;	//계좌번호
	private String memDepo; //예금주
	private int    memZip;   //우편번호 (memberVO)
	private String memAddr1; //기본주소 (memberVO)
	private String memAddr2; //상세주소 (memberVO)
	private String memNm;  	 // 한글명 (memberVO)
	private String memNme; 	 // 영어명 (memberVO)
	private String groupId;
	private String codeNm;
	private String codeId;	
	private String codeProStat;		// 재직상태
	private String proPosYn;		// 학과장 여부
	private String depCode;
	private String depNm;

}
