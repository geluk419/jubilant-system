package com.ddit.proj.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.CounselMapper;
import com.ddit.proj.service.CounselService;
import com.ddit.proj.vo.CounselVO;

@Service
public class CounselServiceImpl implements CounselService{

	@Autowired
	private CounselMapper counselMapper;
	
	@Override
	public List<CounselVO> listCounselByPro(String memNo) {
		return counselMapper.listCounselByPro(memNo);
	}

	@Override
	public List<CounselVO> listCounselByStu(String stuNo) {
		return counselMapper.listCounselByStu(stuNo);
	}

	//  해당 상담 상세 보기
	@Override
	public CounselVO getOneStuCounsel(String stuCounCode) {
		return counselMapper.getOneStuCounsel(stuCounCode);
	}

	//  학생이 상담 신청
	@Override
	public int insertStuCounsel(CounselVO counselVO) {
		return counselMapper.insertStuCounsel(counselVO);
	}

	// 상담 취소 처리
	@Override
	public int deleteStuCounsel(String stuCounCode) {
		return counselMapper.deleteStuCounsel(stuCounCode);
	}

	@Override
	public int approveCnsl(CounselVO counselVO) {
		return counselMapper.approveCnsl(counselVO);
	}

	@Override
	public int rejectCnsl(CounselVO counselVO) {
		return counselMapper.rejectCnsl(counselVO);
	}

	@Override
	public int countCounsel(Map<String, Object> map) {
		return counselMapper.countCounsel(map);
	}

	@Override
	public List<CounselVO> listCounsel(Map<String, Object> map) {
		return counselMapper.listCounsel(map);
	}


}