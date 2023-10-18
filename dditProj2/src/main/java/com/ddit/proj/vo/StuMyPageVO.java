package com.ddit.proj.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StuMyPageVO {
	private String memNm;  	 // 한글명 (memberVO)
	private String memNme; 	 // 영어명 (memberVO)
	private int stuYr;	   	 // 학년 (studentVO)
	private String codeNm; 	 // 단과대 (codeVO - GROUP_ID가 'COLL'인 것), 학적상태 (GROUP_ID가 'STUD'인 것)
	private String memNo; 	 // 학번	(memberVO)
	private String depNm;	 // 학과명	(departmentVO)
	private int stuSem;		 // 재학 학기 (studentVO)
	private String memPass;  // 비밀번호 (memberVO)
	private String memMl;    // 이메일 (memberVO)
	private String memTel;   // 전화번호 (memberVO)
	private int    memZip;   //우편번호 (memberVO)
	private String memAddr1; //기본주소 (memberVO)
	private String memAddr2; //상세주소 (memberVO)
	private String codeId;
	private String memBankCode; //공통코드_은행코드
	private String memAccount;	//계좌번호
	private String memDepo; //예금주
	// 기숙사명 나타낼 값
	// 생활학기 나타낼 값
	// 호수
	// 긴급 연락처
	
	
	
	
	
	
	
	
	
	
	
	
	
}
