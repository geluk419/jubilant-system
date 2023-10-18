package com.ddit.proj.service;

import java.util.List;
import java.util.Map;

import com.ddit.proj.vo.AttachVO;
import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.NoticeVO;

public interface NoticeService {
	
	public List<CodeVO> noticeSelect(String groupId);
	
	public int insertNotice(NoticeVO noticeVO);
	
	public int insertAttach(AttachVO attachVO);
	
	public List<NoticeVO> listNotice(Map<String, Object> map);
	
	public NoticeVO getNotice(NoticeVO noticeVO);

	public int updateNotice(NoticeVO noticeVO);
	
	public int updateAttach(AttachVO attachVO);
	
	public String genFileId(NoticeVO noticeVO);
	
	public int deleteAttach(AttachVO attachVO);
	
	public int deleteNotice1(String fileId);
	
	public int deleteNotice12(String fileId);
	
	public int deleteNotice2(String ntcCode);
	
	public int hitNotice(String ntcCode);
	
	public int getNoticeTotal(Map<String, Object> map);
	
	public int kjFileUp(String fileId);
	
	public List<NoticeVO> search(Map<String, Object> map);

	public List<NoticeVO> getMainNotice();
}
