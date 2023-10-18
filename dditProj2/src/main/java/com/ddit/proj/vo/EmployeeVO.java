package com.ddit.proj.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmployeeVO {
	private String memNo;
	private String depCode;
	private String codeEmpSe;
	private Date empJoinDt;
	private Date empRetDt;
	private String codeEmpDv;
	private String empAct;
	private String memNm;

}
