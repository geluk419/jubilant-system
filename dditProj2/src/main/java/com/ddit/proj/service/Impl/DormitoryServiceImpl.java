package com.ddit.proj.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.DormitoryMapper;
import com.ddit.proj.service.DormitoryService;
import com.ddit.proj.vo.DormitoryApplyFormVO;
import com.ddit.proj.vo.DormitoryApplyVO;
import com.ddit.proj.vo.DormitorySleepOverVO;

@Service
public class DormitoryServiceImpl implements DormitoryService {

	@Autowired
	private DormitoryMapper domitoryMapper;
	
	@Override
	public List<DormitoryApplyVO> listDormi() {
		return domitoryMapper.listDormi();
	}

	@Override
	public DormitoryApplyVO getDormi(DormitoryApplyVO dormitoryApplyVO) {
		return domitoryMapper.getDormi(dormitoryApplyVO);
	}

	@Override
	public int insertDormi(DormitoryApplyVO dormitoryApplyVO) {
		return domitoryMapper.insertDormi(dormitoryApplyVO);
	}

	@Override
	public int updateDormi(DormitoryApplyVO dormitoryApplyVO) {
		return domitoryMapper.updateDormi(dormitoryApplyVO);
	}

	@Override
	public int deleteDormi(DormitoryApplyVO dormitoryApplyVO) {
		return domitoryMapper.deleteDormi(dormitoryApplyVO);
	}

	// 
	@Override
	public DormitoryApplyFormVO getDormiFormVO(String memNo) {
		return domitoryMapper.getDormiFormVO(memNo);
	}

	@Override
	public DormitoryApplyFormVO dormitoryDetail(String memNo) {
		return domitoryMapper.dormitoryDetail(memNo);
	}

	@Override
	public int insertSleepOver(DormitorySleepOverVO dormitorySleepOverVO) {
		return domitoryMapper.insertDormiSleep(dormitorySleepOverVO);
	}

	@Override
	public DormitoryApplyFormVO detailScore(String memNo) {
		return domitoryMapper.detailScore(memNo);
	}
	

}
