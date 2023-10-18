package com.ddit.proj.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ddit.proj.vo.DormitoryApplyFormVO;

@Mapper
public interface DormitoryAdminMapper {
	
	// 사생목록 조회 
	List<DormitoryApplyFormVO> dormitoryList(Map<String, Object> map);
	
	// 사생 상세보기
	DormitoryApplyFormVO detailDormi(String memNo);
	
	// 상/벌점 부여
	int giveScore(DormitoryApplyFormVO dormitoryAppliFormVO);
	
	// 사생 검색
	List<DormitoryApplyFormVO> searchDormi(String keyword);

}
