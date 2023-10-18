package com.ddit.proj.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.DepartmentVO;
import com.ddit.proj.vo.LecApplyVO;
import com.ddit.proj.vo.SubjectVO;

@Mapper
public interface SubjectMapper {
	
	// 과목 리스트 조회
	public List<SubjectVO> listSubj(Map<String, Object> map);
	
	// 과목 검색
	List<SubjectVO> searchSubj(String keyword);
	
	// Get One
	SubjectVO getSub(SubjectVO subjectVO);
	
	// 과목 등록
	int insertSubject(SubjectVO subjectVO);
	
	// 단과대 조회
	List<DepartmentVO> colList(String groupId);
	
	// 학과 조회
	List<DepartmentVO> depList(String depCode);
	
	// 과목 구분 번호 조회 (공통코드)
	List<CodeVO> subSeCode(String groupId);
	
	// 과목 상세 보기
	SubjectVO detailSubject(String subCode);
	
	// 과목 수정
	int updateSubject(SubjectVO subjectVO);
	
	// 과목 삭제
	int deleteSubject(String subCode);
	
	// 페이징 처리
	int getSubjTotal(Map<String, Object> map);
	
	// 해당하는 강의 리스트 들고오기 
	List<LecApplyVO> detailLec(String subCode);
	
}
