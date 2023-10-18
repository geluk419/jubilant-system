package com.ddit.proj.service;

import java.util.List;
import java.util.Map;

import com.ddit.proj.vo.ObjectionVO;
import com.ddit.proj.vo.ScoreVO;


public interface ScoreService {
	
	// 해당 교수 강의 목록 > 수강생 목록
	public List<ScoreVO> listStuByLec(String lecCode);
	
	// 해당 교수 강의 목록 > 수강생 목록 > 학생별 성적 상세 내역
	public List<ScoreVO> getTotalScoreDetail(Map<String, Object> map);
	
	// 해당 교수 강의 목록 > 수강생 목록 > 학생별 성적 상세 내역 - 세부 점수
	public List<ScoreVO> getScoreAndMaxScore(Map<String, Object> map);
	
	// 최종등급 유무확인
	public int gradeCheck(ScoreVO scoreVO);
	
	// 성적 등록
	public int gradeInsert(ScoreVO scoreVO);
	
	// 성적 수정
	public int gradeUpdate(ScoreVO scoreVO);
	
	// 학생이 성적리스트 확인
	public List<ScoreVO> listStuScore(Map<String, Object> map);
	
	// 학생이 성적리스트 확인(현재학기)
	public List<ScoreVO> listStuScoreCurrent(Map<String, Object> map);
	
	// 학생이 강의 성적보기
	public ScoreVO getScoreLec(ScoreVO scoreVO);
	
	// 학생이 성적 이의신청
	int  insertObjection(ObjectionVO objectionVO);
	
	// 학생이 성적 이의신청 결과 보기
	public ObjectionVO getObjection(ObjectionVO objectionVO);
	
	// 성적 이의 신청 목록
	public List<ObjectionVO> listScoreObj(String lecCode);
	
	// 해당 학생의 이의 신청
	public ObjectionVO ScoreObjByStu(ObjectionVO objectionVO);
	
	// 성적이의신청 > 승인
	public int approveObj(ObjectionVO objectionVO);
	
	// 성적이의신청 > 반려
	public int rejectObj(ObjectionVO objectionVO);
	
	// 성적 이의 총 개수
	public int countObj(Map<String, Object> map);
	
	// 성적 이의 신청 목록 (페이징)
	public List<ObjectionVO> listObj(Map<String, Object> map);
	
}