package com.ddit.proj.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.ScoreMapper;
import com.ddit.proj.service.ScoreService;
import com.ddit.proj.vo.ObjectionVO;
import com.ddit.proj.vo.ScoreVO;

@Service
public class ScoreServiceImpl implements ScoreService{

	@Autowired
	private ScoreMapper scoreMapper;
	
	@Override
	public List<ScoreVO> listStuByLec(String lecCode) {
		return scoreMapper.listStuByLec(lecCode);
	}

	@Override
	public List<ScoreVO> getTotalScoreDetail(Map<String, Object> map) {
		return scoreMapper.getTotalScoreDetail(map);
	}

	@Override
	public List<ScoreVO> getScoreAndMaxScore(Map<String, Object> map) {
		return scoreMapper.getScoreAndMaxScore(map);
	}

	@Override
	public int gradeCheck(ScoreVO scoreVO) {
		return scoreMapper.gradeCheck(scoreVO);
	}
	
	@Override
	public int gradeInsert(ScoreVO scoreVO) {
		return scoreMapper.gradeInsert(scoreVO);
	}
	
	@Override
	public int gradeUpdate(ScoreVO scoreVO) {
		return scoreMapper.gradeUpdate(scoreVO);
	}
	
	// 학생이 성적리스트 확인
	@Override
	public List<ScoreVO> listStuScore(Map<String, Object> map) {
		return scoreMapper.listStuScore(map);
	}
	
	// 학생이 성적리스트 확인(현재학기)
	@Override
	public List<ScoreVO> listStuScoreCurrent(Map<String, Object> map) {
		return scoreMapper.listStuScoreCurrent(map);
	}

	// 학생이 강의 성적보기
	@Override
	public ScoreVO getScoreLec(ScoreVO scoreVO) {
		return scoreMapper.getScoreLec(scoreVO);
	}

	// 학생이 성적 이의신청
	@Override
	public int insertObjection(ObjectionVO objectionVO) {
		return scoreMapper.insertObjection(objectionVO);
	}

	// 학생이 성적 이의신청 결과 보기
	@Override
	public ObjectionVO getObjection(ObjectionVO objectionVO) {
		return scoreMapper.getObjection(objectionVO);
	}

	@Override
	public List<ObjectionVO> listScoreObj(String lecCode) {
		return scoreMapper.listScoreObj(lecCode);
	}

	@Override
	public ObjectionVO ScoreObjByStu(ObjectionVO objectionVO) {
		return scoreMapper.ScoreObjByStu(objectionVO);
	}

	@Override
	public int approveObj(ObjectionVO objectionVO) {
		return scoreMapper.approveObj(objectionVO);
	}

	@Override
	public int rejectObj(ObjectionVO objectionVO) {
		return scoreMapper.rejectObj(objectionVO);
	}

	@Override
	public int countObj(Map<String, Object> map) {
		return scoreMapper.countObj(map);
	}

	@Override
	public List<ObjectionVO> listObj(Map<String, Object> map) {
		return scoreMapper.listObj(map);
	}

	


}