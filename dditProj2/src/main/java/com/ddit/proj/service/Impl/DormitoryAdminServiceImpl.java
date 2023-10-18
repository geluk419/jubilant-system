package com.ddit.proj.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.DormitoryAdminMapper;
import com.ddit.proj.service.DormitoryAdminService;
import com.ddit.proj.vo.DormitoryApplyFormVO;

@Service
public class DormitoryAdminServiceImpl implements DormitoryAdminService {

	@Autowired
	private DormitoryAdminMapper dormitoryAdminMapper;

	// 사생목록 조회 
	@Override
	public List<DormitoryApplyFormVO> dormitoryList(Map<String, Object> map) {
		return dormitoryAdminMapper.dormitoryList(map);
	}

	// 사생 상세보기
	@Override
	public DormitoryApplyFormVO detailDormi(String memNo) {
		return dormitoryAdminMapper.detailDormi(memNo);
	}

	// 상/벌점 부여
	@Override
	public int giveScore(DormitoryApplyFormVO dormitoryAppliFormVO) {
		return dormitoryAdminMapper.giveScore(dormitoryAppliFormVO);
	}

	// 사생 검색
	@Override
	public List<DormitoryApplyFormVO> searchDormi(String keyword) {
		return dormitoryAdminMapper.searchDormi(keyword);
	}

}
