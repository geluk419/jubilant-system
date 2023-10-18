package com.ddit.proj.service;

import java.util.List;

import com.ddit.proj.vo.DormitoryApplyFormVO;
import com.ddit.proj.vo.DormitoryApplyVO;
import com.ddit.proj.vo.DormitorySleepOverVO;

public interface DormitoryService {
	List<DormitoryApplyVO> listDormi();
	
	DormitoryApplyVO getDormi(DormitoryApplyVO dormitoryApplyVO);

	int insertDormi(DormitoryApplyVO dormitoryApplyVO);

	int updateDormi(DormitoryApplyVO dormitoryApplyVO);

	int deleteDormi(DormitoryApplyVO dormitoryApplyVO);
	
	DormitoryApplyFormVO getDormiFormVO(String memNo);
	
	DormitoryApplyFormVO dormitoryDetail(String memNo);
	
	// 상/벌점 조회
	DormitoryApplyFormVO detailScore(String memNo);
	
	//외박신청
	int insertSleepOver(DormitorySleepOverVO dormitorySleepOverVO);
}
