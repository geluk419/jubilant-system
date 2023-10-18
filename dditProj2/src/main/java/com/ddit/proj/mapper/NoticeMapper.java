package com.ddit.proj.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ddit.proj.vo.AttachVO;
import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.NoticeVO;

@Mapper
public interface NoticeMapper {
	
	//공지구분 불러오기
	//<select id="noticeSelect" parameterType="String" resultType="CodeVO">
	public List<CodeVO> noticeSelect(String groupId);
	
	//새 공지 insert
	//<insert id="insertNotice" parameterType="NoticeVO">
	public int insertNotice(NoticeVO noticeVO);
	
	//첨부파일 insert
	//<insert id="insertAttach" parameterType="AttachVO">
	public int insertAttach(AttachVO attachVO);
	
	//공지사항 리스트
	//<select id="listNotice" resultMap="noticeMap" parameterType="hashMap">
	public List<NoticeVO> listNotice(Map<String, Object> map);
	
	//<select id="getNotice" resultType="NoticeVO" parameterType="NoticeVO">
	public NoticeVO getNotice(NoticeVO noticeVO);
	
	//공지사항 수정
	//<update id="updateNotice" parameterType="NoticeVO">
	public int updateNotice(NoticeVO noticeVO);

	public int updateAttach(AttachVO attachVO);
	
	//<select id="isFileIdinAttach" parameterType="AttachVO" resultType="int">
	public String genFileId(NoticeVO noticeVO);
	
	public int deleteAttach(AttachVO attachVO);
	
	//공지사항 삭제(1-1)
	//<update id="deleteNotice1" parameterType="string">
	public int deleteNotice1(String fileId);
	
	//공지사항 삭제(1-2)
	//<update id="deleteNotice12" parameterType="string">
	public int deleteNotice12(String fileId);
	
	//공지사항 삭제(2)
	//<update id="deleteNotice2" parameterType="string">
	public int deleteNotice2(String ntcCode);
	
	//공지사항 조회수
	//<update id="hitNotice" parameterType="string">
	public int hitNotice(String ntcCode);
	
	//페이징
	//<select id="getNoticeTotal" parameterType="hashMap" resultType="int">
	public int getNoticeTotal(Map<String, Object> map);
	
	//공지구분 검색
	//<select id="search" resultType="NoticeVO" parameterType="Map">
	public List<NoticeVO> search(Map<String, Object> map);

	// 메인 페이지 공지사항 불러오기
	public List<NoticeVO> getMainNotice();
}
