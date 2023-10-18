package com.ddit.proj.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TaskSubmitVO {
	
	private String tsubCode;
	private String taskCode;
	private String memNo;
	private String tsubDt;
	private String tsubCon;
	private int codeTsubScore;
	private String tsubUpdde;
	private String fileId;
		
		private String lecCode;
		private String memNm;
		
		private MultipartFile uploadFile;
		private String filePath;
		private String fileOriNm;
		private String fileExtsn;
		private String fileSize;
}
