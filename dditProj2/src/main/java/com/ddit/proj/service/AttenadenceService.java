package com.ddit.proj.service;

import java.util.List;
import java.util.Map;

import com.ddit.proj.vo.AttachVO;
import com.ddit.proj.vo.AttenadenceVO;
import com.ddit.proj.vo.SearchVO;


public interface AttenadenceService {
	
		
	// Get List
	public List<AttenadenceVO> listAtten();
	// Get One
	public AttenadenceVO getAtten(AttenadenceVO attendanceVO);
	// insert
	public int  insertAtten(AttenadenceVO attendanceVO);
	// 출결 저장
	public int saveAtten(Map<String, Object> map);
	// update
	public int  updateAtten(AttenadenceVO attendanceVO);
	// delete
	public int  deleteAtten(AttenadenceVO attendanceVO);
	
	// 강의코드로 강의명 찾기
	public AttenadenceVO lecNmByCode(String lecCode);
	
	// 해당 교수 강의 목록 > 수강생 목록
	public List<AttenadenceVO> listStuByLec(String lecCode);
	
	// 해당 교수 강의 목록 > 수강생 목록 > cnt 조회
	public AttenadenceVO attendanceCnt(Map<String, Object> map);
	
	// 출결표
	public List<AttenadenceVO> attenDetail(Map<String, Object> map);
	
	// 학생별 출결 여부 확인 CNT
	public int attenChkCnt(Map<String, Object> map);
	
	
	
	// 출결 select(학생)
	public List<AttenadenceVO> attenStuDetail(String memNo);
	
	// 출결 조회(학생)
	public List<AttenadenceVO> stuAtten(SearchVO searchVO);
	
	// 출결 조회 전체 개수(학생)
	public int stuAttenCnt(SearchVO searchVO);
	
	// 파일
	public int insertAttach(AttachVO attachVO);
	
	// 파일 업데이트
	public int updateAtt(AttenadenceVO attendanceVO);
	
	// 출결 증빙자료 제출한 수강생 목록
	public List<AttenadenceVO> stuListAttenPruf(String lecCode);
	
	// 해당 날짜 출결 목록
	public List<AttenadenceVO> attenListByDate(AttenadenceVO attendanceVO);
	
	// 해당 강의 출결 증빙 수
	public int countPruf(Map<String, Object> map);
	
	// 출결 증빙자료 제출한 수강생 목록 (페이징)
	public List<AttenadenceVO> listpruf(Map<String, Object> map);
	
	// 출결 증빙 승인
	public int approveAtten(AttenadenceVO attendanceVO); 
	
	// 출결 증빙 반려
	public int rejectAtten(AttenadenceVO attendanceVO);
}