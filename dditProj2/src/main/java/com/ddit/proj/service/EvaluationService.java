package com.ddit.proj.service;

import java.util.List;
import java.util.Map;

import com.ddit.proj.vo.EvaluationVO;
import com.ddit.proj.vo.ObjectionVO;
import com.ddit.proj.vo.ScoreVO;


public interface EvaluationService {
	
	// 학생이 강의평가
	int  insertEvaluation(EvaluationVO evaluationVO);
	
}