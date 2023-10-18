package com.ddit.proj.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttachVO {
	private String fileId; //전사적 코드
	private int fileNo;    //파일_순번
	private String filePath; //파일_저장경로
	private String fileNm;   //파일_저장명
	private String fileOriNm; //파일_원본명
	private String fileExtsn; //파일_확장자
	private long fileSize;     //파일_크기
	private Date fileDt;    //파일_생성일시
	private String fileDelYn; //파일_삭제여부
	private String fileThumbImg; //파일_썸네일_경로
}
