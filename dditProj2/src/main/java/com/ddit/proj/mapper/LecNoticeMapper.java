package com.ddit.proj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ddit.proj.vo.LecNoticeVO;

@Mapper
public interface LecNoticeMapper {
	
	//강의코드 불러오기
	public List<LecNoticeVO>  getlecCode(String memNo);
	
	//강의게시판 등록
	public int insertLecNotice(LecNoticeVO lecNoticeVO);
	
	//강의게시판 목록 불러오기
	public List<LecNoticeVO> getListLecNotice(String lecCode);
	
	//과제수정
	public int updatelecNotice(LecNoticeVO lecNoticeVO);
	
	//과제삭제
	public int deletelecNotice(LecNoticeVO lecNoticeVO);
	
}
