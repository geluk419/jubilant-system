package com.ddit.proj.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TestExamVO {
	private int steNo;
	private int testCode;
	private String steType;
	private String steQue;	
	private String steRightAnswer;
	
	private List<TestChoiceVO> testChoiceList;
	
}
