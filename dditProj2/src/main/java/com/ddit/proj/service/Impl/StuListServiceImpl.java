package com.ddit.proj.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.StuListMapper;
import com.ddit.proj.service.StuListService;
import com.ddit.proj.vo.StudentVO;

@Service
public class StuListServiceImpl implements StuListService {

	@Autowired
	private StuListMapper stuListMapper;
	
	// 학생 리스트 조회
	@Override
	public List<StudentVO> listStu(Map<String, Object> map) {
		return stuListMapper.listStu(map);
	}

	// 학생 상세보기
	@Override
	public StudentVO detailStu(String memNo) {
		return stuListMapper.detailStu(memNo);
	}

	// 학생 검색
	@Override
	public List<StudentVO> searchStu(String keyword) {
		return stuListMapper.searchStu(keyword);
	}

	// 페이징
	@Override
	public int getStuTotal(Map<String, Object> map) {
		return stuListMapper.getStuTotal(map);
	}

}
