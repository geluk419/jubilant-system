package com.ddit.proj.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.LecNoticeMapper;
import com.ddit.proj.service.LecNoticeProService;
import com.ddit.proj.vo.LecNoticeVO;

@Service
public class LecNoticeProServiceImpl implements LecNoticeProService {

	@Autowired
	private LecNoticeMapper lecNoticeMapper;
	
	@Override
	public List<LecNoticeVO>  getlecCode(String memNo) {
		return lecNoticeMapper.getlecCode(memNo);
	}

	@Override
	public int insertLecNotice(LecNoticeVO lecNoticeVO) {
		return lecNoticeMapper.insertLecNotice(lecNoticeVO);
	}

	@Override
	public List<LecNoticeVO> getListLecNotice(String lecCode) {
		return lecNoticeMapper.getListLecNotice(lecCode);
	}

	@Override
	public int updatelecNotice(LecNoticeVO lecNoticeVO) {
		return lecNoticeMapper.updatelecNotice(lecNoticeVO);
	}

	@Override
	public int deletelecNotice(LecNoticeVO lecNoticeVO) {
		return lecNoticeMapper.deletelecNotice(lecNoticeVO);
	}
	
	
	
	

	
}
