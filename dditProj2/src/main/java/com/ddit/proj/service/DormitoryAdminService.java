package com.ddit.proj.service;

import java.util.List;
import java.util.Map;

import com.ddit.proj.vo.DormitoryApplyFormVO;

public interface DormitoryAdminService {
	
	// 사생목록 조회 
	List<DormitoryApplyFormVO> dormitoryList(Map<String, Object> map);
	
	// 사생 상세보기
	DormitoryApplyFormVO detailDormi(String memNo);
	
	// 상/벌점 부여
	int giveScore(DormitoryApplyFormVO dormitoryAppliFormVO);
	
	// 사생 검색
	List<DormitoryApplyFormVO> searchDormi(String keyword);

}
