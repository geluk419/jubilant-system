package com.ddit.proj.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LectureDetailVO {
	private int lecdNo;
	private String lecCode;
	private String lecdWeek;
	private String lecdSt;
	private String lecdEt;
}
