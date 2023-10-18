package com.ddit.proj.service;

import java.util.List;
import java.util.Map;

import com.ddit.proj.vo.ScholarStuVO;
import com.ddit.proj.vo.ScholarshipVO;

public interface ScholarshipService {
	
	//장학금 대상자 조회
	public List<ScholarshipVO> getScholarshipRec(ScholarshipVO scholarshipVO);
	
	public List<ScholarStuVO> myLec(ScholarStuVO scholarStuVO);
	
	public int insertScholarship(ScholarshipVO scholarshipVO);
	
	public int updateScholarship(String memNo);
	
	public List<ScholarshipVO> selectSch(ScholarshipVO scholarshipVO);
	
	//학생이 장학금 조회
	public ScholarshipVO getScholarship(ScholarshipVO scholarshipVO);
	
	public List<ScholarshipVO> selectSclName();
	
	public List<ScholarshipVO> selectSclYr();
	
	public List<ScholarshipVO> selectSemCode(); 
	
}
