package com.ddit.proj.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TestVO {
	private int testCode;
	private String lecCode;
	private String testNm;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date testDe;
	private String testSt;
	private String testEt;
	private String testStartYn;
	private String testLimit;
	private String ansYn;
	
	// TextExamVO를 List로 추가
	private List<TestExamVO> testExamList;
	
	private String memNo;
	
}
