package com.ddit.proj.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.EvaluationMapper;
import com.ddit.proj.mapper.ScoreMapper;
import com.ddit.proj.service.EvaluationService;
import com.ddit.proj.service.ScoreService;
import com.ddit.proj.vo.EvaluationVO;
import com.ddit.proj.vo.ObjectionVO;
import com.ddit.proj.vo.ScoreVO;

@Service
public class EvaluationServiceImpl implements EvaluationService{

	@Autowired
	private EvaluationMapper evaluationMapper;

	@Override
	public int insertEvaluation(EvaluationVO evaluationVO) {
		return evaluationMapper.insertEvaluation(evaluationVO);
	}
	
	

	


}