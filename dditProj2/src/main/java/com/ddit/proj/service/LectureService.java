package com.ddit.proj.service;

import java.util.List;
import java.util.Map;

import com.ddit.proj.vo.LectureVO;

public interface LectureService {
	
	// 과목 리스트 조회
	List<LectureVO> listLecture(Map<String, Object> map);
	
	// 페이징 처리
	int getLecTotal(Map<String, Object> map);
	
	public int updLecStatus(LectureVO lecturVo); 
	

}
