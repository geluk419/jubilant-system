package com.ddit.proj.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.ScholarshipMapper;
import com.ddit.proj.service.ScholarshipService;
import com.ddit.proj.vo.ScholarStuVO;
import com.ddit.proj.vo.ScholarshipVO;

@Service
public class ScholarshipServiceImpl implements ScholarshipService{

	@Autowired
	private ScholarshipMapper scholarshipMapper;

	@Override
	public List<ScholarshipVO> getScholarshipRec(ScholarshipVO scholarshipVO) {
		return scholarshipMapper.getScholarshipRec(scholarshipVO);
	}

	@Override
	public List<ScholarStuVO> myLec(ScholarStuVO scholarStuVO) {
		return scholarshipMapper.myLec(scholarStuVO);
	}

	@Override
	public int insertScholarship(ScholarshipVO scholarshipVO) {
		return scholarshipMapper.insertScholarship(scholarshipVO);
	}

	@Override
	public int updateScholarship(String memNo) {
		return scholarshipMapper.updateScholarship(memNo);
	}

	@Override
	public List<ScholarshipVO> selectSch(ScholarshipVO scholarshipVO) {
		return scholarshipMapper.selectSch(scholarshipVO);
	}

	//학생이 장학금 조회
	@Override
	public ScholarshipVO getScholarship(ScholarshipVO scholarshipVO) {
		return scholarshipMapper.getScholarship(scholarshipVO);
	}

	@Override
	public List<ScholarshipVO> selectSclName() {
		return scholarshipMapper.selectSclName();
	}

	@Override
	public List<ScholarshipVO> selectSclYr() {
		return scholarshipMapper.selectSclYr();
	}

	@Override
	public List<ScholarshipVO> selectSemCode() {
		return scholarshipMapper.selectSemCode();
	}


}
