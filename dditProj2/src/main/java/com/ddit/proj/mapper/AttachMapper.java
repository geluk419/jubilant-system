package com.ddit.proj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ddit.proj.vo.AttachVO;

@Mapper
public interface AttachMapper {
	
	//ATTACH 테이블에서 fileId를 받으면 List<fileVO>를 리턴
	//<select id="getAttachVOList" parameterType="AttachVO" resultType="AttachVO">
	public List<AttachVO> getAttachVOList(AttachVO attachVO);
	
	//첨부파일 삭제상태 y로 바꾸기
	public int updateAttach(AttachVO attachVO);
	
}




