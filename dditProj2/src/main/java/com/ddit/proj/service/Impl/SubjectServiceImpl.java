package com.ddit.proj.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.SubjectMapper;
import com.ddit.proj.service.SubjectService;
import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.DepartmentVO;
import com.ddit.proj.vo.LecApplyVO;
import com.ddit.proj.vo.SubjectVO;


@Service
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	private SubjectMapper subjectMapper;
	
	// 과목 리스트 조회
	@Override
	public List<SubjectVO> listSubj(Map<String, Object> map) {
		return subjectMapper.listSubj(map); 
	}

	// 과목 검색
	@Override
	public List<SubjectVO> searchSubj(String keyword) {
		return subjectMapper.searchSubj(keyword);
	}
	
	@Override
	public SubjectVO getSubj(SubjectVO subjectVO) {
		return subjectMapper.getSub(subjectVO);
	}

	// 단과대 조회
	@Override
	public List<DepartmentVO> colList(String groupId) {
		return subjectMapper.colList(groupId);
	}

	// 학과 조회
	@Override
	public List<DepartmentVO> depList(String depCode) {
		return subjectMapper.depList(depCode);
	}

	// 과목 구분 번호 조회 (공통코드)
	@Override
	public List<CodeVO> subSeCode(String groupId) {
		return subjectMapper.subSeCode(groupId);
	}

	// 과목 등록
	@Override
	public int insertSubject(SubjectVO subjectVO) {
		return subjectMapper.insertSubject(subjectVO);
	}

	// 과목 상세 보기
	@Override
	public SubjectVO detailSubject(String subCode) {
		return subjectMapper.detailSubject(subCode);
	}

	// 과목 수정
	@Override
	public int updateSubject(SubjectVO subjectVO) {
		return subjectMapper.updateSubject(subjectVO);
	}

	// 과목 삭제
	@Override
	public int deleteSubject(String subCode) {
		return subjectMapper.deleteSubject(subCode);
	}

	// 페이징 처리
	@Override
	public int getSubjTotal(Map<String, Object> map) {
		return subjectMapper.getSubjTotal(map);
	}

	// 해당하는 강의 리스트 들고오기 
	@Override
	public List<LecApplyVO> detailLec(String subCode) {
		return subjectMapper.detailLec(subCode);
	}


}
