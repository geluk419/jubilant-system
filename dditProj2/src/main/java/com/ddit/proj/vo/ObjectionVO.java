package com.ddit.proj.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ObjectionVO {
	private String objCode;
	private String memNo;
	private String lecCode;
	private String objTtl;
	private String objCon;
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String objDt;
	private String objYn;
	private String objReturn;
	
	private String memNm;
	private String colNm;
	private String depNm;
	private String codeScreGrade;
	private String scoreAll;
	
}
