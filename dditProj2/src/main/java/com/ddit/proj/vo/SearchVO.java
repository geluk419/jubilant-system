package com.ddit.proj.vo;

import lombok.Data;

@Data
public class SearchVO {
	private String searchCondition;
	private String searchWord;
	private String lecCode;
	private String memNo;
	
	private int searchMonth;
	private int searchDate;
	
	private int requestPageNo = 1;
	private int pageSize = 3;
	private int firstIndex = 1;
	private int lastIndex;
	private int recordCountPerPage = 5;
}
