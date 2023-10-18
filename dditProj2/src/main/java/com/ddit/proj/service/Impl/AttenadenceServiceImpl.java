package com.ddit.proj.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.AttenadenceMapper;
import com.ddit.proj.service.AttenadenceService;
import com.ddit.proj.vo.AttachVO;
import com.ddit.proj.vo.AttenadenceVO;
import com.ddit.proj.vo.SearchVO;

@Service
public class AttenadenceServiceImpl implements AttenadenceService {


	// 서비스impl에서 맵퍼 연결
	@Autowired
	private AttenadenceMapper attenadenceMapper;
	
	@Override
	public List<AttenadenceVO> listAtten() {
		return attenadenceMapper.listAtten();
	}
	
	@Override
	public AttenadenceVO getAtten(AttenadenceVO attendanceVO) {
		return attenadenceMapper.getAtten(attendanceVO);
	}
	
	@Override
	public int insertAtten(AttenadenceVO attendanceVO) {
		return attenadenceMapper.insertAtten(attendanceVO);
	}
	
	@Override
	public int updateAtten(AttenadenceVO attendanceVO) {
		return attenadenceMapper.updateAtten(attendanceVO);
	}
	
	@Override
	public int deleteAtten(AttenadenceVO attendanceVO) {
		return attenadenceMapper.deleteAtten(attendanceVO);
	}

	@Override
	public List<AttenadenceVO> listStuByLec(String lecCode) {
		return attenadenceMapper.listStuByLec(lecCode);
	}

	@Override
	public AttenadenceVO attendanceCnt(Map<String, Object> map) {
		return attenadenceMapper.attendanceCnt(map);
	}

	@Override
	public List<AttenadenceVO> attenDetail(Map<String, Object> map) {
		return attenadenceMapper.attenDetail(map);
	}

	@Override
	public int attenChkCnt(Map<String, Object> map) {
		return attenadenceMapper.attenChkCnt(map);
	}


	
	
	// 출결 select(학생)
	@Override
	public List<AttenadenceVO> attenStuDetail(String memNo) {
		return attenadenceMapper.attenStuDetail(memNo);
	}
	
	
	// 출결 조회(학생)
	@Override
	public List<AttenadenceVO> stuAtten(SearchVO searchVO) {
		return attenadenceMapper.stuAtten(searchVO);
	}
	
	// 출결 조회(학생)
	@Override
	public int stuAttenCnt(SearchVO searchVO) {
		return attenadenceMapper.stuAttenCnt(searchVO);
	}

	// 파일
	@Override
	public int insertAttach(AttachVO attachVO) {
		return attenadenceMapper.insertAttach(attachVO);
	}

	// 파일 업데이트
	@Override
	public int updateAtt(AttenadenceVO attendanceVO) {
		return attenadenceMapper.updateAtt(attendanceVO);
	}

	@Override
	public List<AttenadenceVO> stuListAttenPruf(String lecCode) {
		return attenadenceMapper.stuListAttenPruf(lecCode);
	}

	@Override
	public List<AttenadenceVO> attenListByDate(AttenadenceVO attendanceVO) {
		return attenadenceMapper.attenListByDate(attendanceVO);
	}

	@Override
	public int countPruf(Map<String, Object> map) {
		return attenadenceMapper.countPruf(map);
	}

	@Override
	public List<AttenadenceVO> listpruf(Map<String, Object> map) {
		return attenadenceMapper.listpruf(map);
	}

	@Override
	public int approveAtten(AttenadenceVO attendanceVO) {
		return attenadenceMapper.approveAtten(attendanceVO);
	}

	@Override
	public int rejectAtten(AttenadenceVO attendanceVO) {
		return attenadenceMapper.rejectAtten(attendanceVO);
	}

	@Override
	public AttenadenceVO lecNmByCode(String lecCode) {
		return attenadenceMapper.lecNmByCode(lecCode);
	}

	@Override
	public int saveAtten(Map<String, Object> map) {
		return attenadenceMapper.saveAtten(map);
	}

	



}