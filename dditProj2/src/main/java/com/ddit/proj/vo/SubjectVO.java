package com.ddit.proj.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SubjectVO {
	private String subCode;			// 과목 코드
	private String depCode;			// 학과 코드
	private String subNm;			// 과목 이름
	private int subYr;				// 과목 신설연도
	private String subSeCode;		// 공통코드_과목 구분   /1 SUBJ 전공필수/2 SUBJ 전공선택/3 SUBJ 교양필수/4 SUBJ 교양선택
	private String subDelYn;		// 과목 삭제 여부
	private String codeId;			// 단과대 ID, 과목구분ID
	private String codeNm;			// 단과대 이름, 과목구분 이름
	private String codeDetailId;	// 학과 ID
	private String codeDetailNm;	// 학과 이름
	private String groupId;
	private String colCode;
	private String depNm;
	private int rownum;

}
