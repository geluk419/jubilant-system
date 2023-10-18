package com.ddit.proj.service;

import java.util.List;

import com.ddit.proj.vo.DormitoryApplyFormVO;
import com.ddit.proj.vo.DormitoryApplyVO;
import com.ddit.proj.vo.LecNoticeVO;
import com.ddit.proj.vo.SearchVO;

public interface LecNoticeService {
	
	List<LecNoticeVO> listLecNotice();
	
	List<LecNoticeVO> getLecNoticeVO(SearchVO searchVO);
}
