package com.ddit.proj.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.LectureListMapper;
import com.ddit.proj.service.LectureService;
import com.ddit.proj.vo.LectureVO;


@Service
public class LectureServiceImpl implements LectureService {

	@Autowired
	private LectureListMapper lectureListMapper;
	
	// 과목 리스트 조회
	@Override
	public List<LectureVO> listLecture(Map<String, Object> map) {
		return lectureListMapper.listLecture(map); 
	}

	// 페이징 처리
	@Override
	public int getLecTotal(Map<String, Object> map) {
		return lectureListMapper.getLecTotal(map);
	}

	@Override
	public int updLecStatus(LectureVO lecturVo) {
		return lectureListMapper.updLecStatus(lecturVo);
	}


}
