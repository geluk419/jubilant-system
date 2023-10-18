package com.ddit.proj.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CounselVO {
	private String cnslCode;
	private String stuMemNo;
	private String proMemNo;
	private String cnslTtl;
	private String cnslCon;
	private String cnslDe;
	private String cnslDt;
	private String cnslRpl;
	private String cnslYn;
	private String cnslReturn;
	private String memNm;
}
