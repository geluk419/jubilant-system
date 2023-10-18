package com.ddit.proj.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DormitorySleepOverVO {
	private int sleepCode;
	private String stuMemNo;
	private Date sleepStart;
	private Date sleepEnd;
	private String sleepRsn;
	private String sleepYn;
}
