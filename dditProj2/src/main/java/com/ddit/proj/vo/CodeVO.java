package com.ddit.proj.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CodeVO {
	private String codeId;
	private String groupId;
	private String codeNm;
	private String codeYn;
	private Date codeDt;
	private int codeOrd;
	private Date codeUpdde;
}
