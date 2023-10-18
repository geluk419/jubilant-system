package com.ddit.proj.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.sun.tracing.dtrace.ArgsAttributes;

import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TestSubmitVO {
	private String lecCode;
	private int steNo;
	private String memNo;
	private String ansAnswer;
	private String ansCode;
	private int ansScore;
	private String ansYn;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String ansSubmitTime;

	private String memNm;


	public TestSubmitVO() {
	}

	
	public TestSubmitVO(String lecCode, int steNo, String memNo, String ansAnswer) {
		this.lecCode = lecCode;
		this.steNo = steNo;
		this.memNo = memNo;
		this.ansAnswer = ansAnswer;
	}


	
}
