package com.ddit.proj.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.AttachMapper;
import com.ddit.proj.service.AttachService;
import com.ddit.proj.vo.AttachVO;

@Service
public class AttachServiceImpl implements AttachService {
	
	@Autowired
	AttachMapper attachMapper;
	
	//ATTACH 테이블에서 fileId를 받으면 List<fileVO>를 리턴
	@Override
	public List<AttachVO> getAttachVOList(AttachVO attachVO){
		return this.attachMapper.getAttachVOList(attachVO);
	}
	
	@Override
	//첨부파일 삭제상태 y로 바꾸기
	public int updateAttach(AttachVO attachVO){
		return this.attachMapper.updateAttach(attachVO);
	}
	
}
