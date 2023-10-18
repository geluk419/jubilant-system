package com.ddit.proj.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScoreVO {
	private String lecCode;			//강의코드
	private String memNo;			//학번
	private String codeScreGrade;	//공통코드 성적등급
	private int scoreTest;			//시험점수
	private int scoreTask;			//과제점수
	private int scoreAten;			//출결점수
	private int scoreScore;			//총점수
		private String colNm;		//단과대학
		private int stuYr;			//학년
		private String depNm;		//학과
		private String memNm; 		//이름
		
		private String div;			//평가구분
		private String evelNm;		//평가명
		private String score;		//점수/총점
		private int stuCurScore;	//총 점수
		private int lecScore;		//총 총점
		
		private String scoreAll;	//최종성적(총평점ex)4.5)
		
		
		private List<LecApplyVO> lecApplyVOList;
		
		/*
		private String lecaId;
		private int lecaYr;
		private int lecaSem;
		private String lecaNm;
		private String lecaSeCode;
		private int lecaCrd;
		*/
		
		private String objTtl;
		private String objCon;
		
		private int searchYear;
		private int searchSem;
						
}
