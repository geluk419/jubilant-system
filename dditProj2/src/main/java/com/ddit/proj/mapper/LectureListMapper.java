package com.ddit.proj.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ddit.proj.vo.LectureVO;

@Mapper
public interface LectureListMapper {
	
	// 과목 리스트 조회
	public List<LectureVO> listLecture(Map<String, Object> map);
	
	public int updLecStatus(LectureVO lecturVo); 

	// 페이징 처리
	int getLecTotal(Map<String, Object> map);
	
}
