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
public class NoticeVO {
	private String ntcCode;   //공지사항 코드
	private String memNo;     //교번
	private String memNm;     //이름
	private String ntcTtl;    //제목
	private String ntcCon;    //내용
	private String ntcSeCode; //공통코드_공지구분
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ntcDt;       //공통코드_작성일자
	private String fileDelYn; //공통코드_삭제여부
	private String ntcUpdde;    //공통코드_수정일
	private String fileId;    //공통코드_첨부파일
	private String filePath;
	private String fileOriNm;	
	private int hit;
	private String ntcDtt;
	private String ntcSeName;
	
	
	//첨부파일
	private MultipartFile[] noticeFiles;
	
	//첨부파일 여부표시
	private boolean attachOX;
}
