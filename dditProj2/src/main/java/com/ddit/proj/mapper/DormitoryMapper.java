package com.ddit.proj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ddit.proj.vo.DormitoryApplyFormVO;
import com.ddit.proj.vo.DormitoryApplyVO;
import com.ddit.proj.vo.DormitorySleepOverVO;

@Mapper
public interface DormitoryMapper {
	
	// Get List
	List<DormitoryApplyVO> listDormi();
	// Get One
	DormitoryApplyVO getDormi(DormitoryApplyVO dormitoryApplyVO);
	// insert
	int  insertDormi(DormitoryApplyVO dormitoryApplyVO);
	// update
	int  updateDormi(DormitoryApplyVO dormitoryApplyVO);
	// delete
	int  deleteDormi(DormitoryApplyVO dormitoryApplyVO);
	
	//
	DormitoryApplyFormVO getDormiFormVO(String memNo);
	
	DormitoryApplyFormVO dormitoryDetail(String memNo);
	
	// 상/벌점 조회
	DormitoryApplyFormVO detailScore(String memNo);
	
	// 외박 insert
	int  insertDormiSleep(DormitorySleepOverVO dormitorySleepOverVO);
	
}
