package com.ddit.proj.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LecNoticeVO {
	private String lecnCode;
	//첨부파일
	MultipartFile[] noticeFiles;
	private String lecnCataCode;
	private String lecnTtl;
	private String lecnCon;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date lecnDe;
	private String lecnUpdde;
	private String fileId;
	private String filePath;
	
	//과목
	private String subNm;
	private String lecCode;
	//강의계획서 강의명
	private String lecaNm;
	
	private String lecStatYn; //개강여부
	private String lecDelYn; //삭제여부
	private int lecaYr; //년도
	private int lecaSem; //학기
	private int lecaTrg; //개설학년
	
	private String fileOriNm;
}
