package com.ddit.proj.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ddit.proj.vo.CounselVO;
import com.ddit.proj.vo.ObjectionVO;

@Mapper
public interface CounselMapper {
	
	//해당 교수 상담 목록
	public List<CounselVO> listCounselByPro(String memNo);

	//상담 승인
	public int approveCnsl(CounselVO counselVO);

	//상담 반려
	public int rejectCnsl(CounselVO counselVO);

	// 전체 리스트 Select 학생
	public List<CounselVO> listCounselByStu(String stuNo);

	// 1개 상세보기 Select
	CounselVO getOneStuCounsel(String stuCounCode);

	// 상담 신청 Insert
	int insertStuCounsel(CounselVO counselVO);

	// 상담 신청 취소 Delect 처리(Update)
	int deleteStuCounsel(String stuCounCode);
	
	// 상담 총 개수
	public int countCounsel(Map<String, Object> map);
	
	// 해당 교수 상담 목록 (페이징)
	public List<CounselVO> listCounsel(Map<String, Object> map);
}
