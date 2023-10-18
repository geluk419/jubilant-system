package com.ddit.proj.service;

import java.util.List;

import com.ddit.proj.vo.AttachVO;

public interface AttachService {

	//ATTACH 테이블에서 fileId를 받으면 List<fileVO>를 리턴
	public List<AttachVO> getAttachVOList(AttachVO attachVO);

	//첨부파일 삭제상태 y로 바꾸기
	public int updateAttach(AttachVO attachVO);
	
	
}
