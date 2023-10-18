package com.ddit.proj.service;

import java.util.List;
import java.util.Map;

import com.ddit.proj.vo.StudentVO;

public interface StuListService {
	
	// 학생 리스트 조회
	List<StudentVO> listStu(Map<String, Object> map);
	
	// 학생 상세보기
	StudentVO detailStu(String memNo);
	
	// 학생 검색
	List<StudentVO> searchStu(String keyword);

	// 페이징
	int getStuTotal(Map<String, Object> map);
}
