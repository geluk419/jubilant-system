package com.ddit.proj.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.ddit.proj.vo.EvaluationVO;

@Mapper
public interface EvaluationMapper {
	
	// 학생이 강의평가
	int  insertEvaluation(EvaluationVO evaluationVO);
	
	
}




