package com.ddit.proj.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LectureVO {

	private String lecCode;
	private String subCode;
	private String lecaId;
	private String lecStatYn;
	private int lecHcnt;
	private String lecYn;
	private String lecDelYn;
	private int roomNo;
	private String bldCode;

	// 1 : N
	private List<LectureDetailVO> lectureDetailVO;

	private int lecaYr;
	private int lecaSem;
	private int lecaTrg;
	private String lecaNm;
	private String depNm;
	private String memNm;
	private String memNo;
	private String memTel;
}
