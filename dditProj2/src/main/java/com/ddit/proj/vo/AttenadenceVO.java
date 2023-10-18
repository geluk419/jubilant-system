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
public class AttenadenceVO {
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String atenDe;
	private String lecCode;
	private String memNo;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String codeAtenSe;
	private String atenYn;
	private String atenRsn;
	private String atenPruf;
	private String lecaNm;
	private int stuYr;
	private String memColCode;
	private String memDepCode;
	private String colNm;
	private String depNm;
	private String memNm;
	private String memTel;
	private int lecaTime;
	private int lecaCount;
		
		// cnt
		private int atenCome;		//출석
		private int atenLate;		//지각
		private int atenEarlyLeave;	//조퇴
		private int atenAbsent;		//결석
		private int atenOfiAbsent;	//공결
		
	
	//
	private String codeNm;
	
	private String fileId;
	private MultipartFile atenFile;  // 임시
	private String filePath;
	
}
