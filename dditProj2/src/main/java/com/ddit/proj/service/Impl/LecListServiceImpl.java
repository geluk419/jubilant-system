package com.ddit.proj.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ddit.proj.mapper.LectureMapper;
import com.ddit.proj.service.LecListService;
import com.ddit.proj.vo.BuildingVO;
import com.ddit.proj.vo.LecApplyVO;
import com.ddit.proj.vo.LectureDetailVO;
import com.ddit.proj.vo.LectureVO;
import com.ddit.proj.vo.MemberVO;
import com.ddit.proj.vo.SubjectVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LecListServiceImpl implements LecListService {

	@Autowired
	private LectureMapper lectureMapper;
	
	@Override
	public List<LectureVO> listLecture(String memNo) {
		return lectureMapper.listLecture(memNo);
	}

	@Override
	public List<MemberVO> getProf(String memNo) {
		return lectureMapper.getProf(memNo);
	}
	
	@Override
	public List<BuildingVO> getBuildRoom(){
		return lectureMapper.getBuildRoom();
	}
	
	//강의실호수 가져오기
	@Override
	public List<BuildingVO> getRoomNo(String bldCode) {
		return lectureMapper.getRoomNo(bldCode);
	}
	
	@Override
	public List<LecApplyVO> listSelLecture(LecApplyVO lecApplyVO){
		return lectureMapper.listSelLecture(lecApplyVO);
	}
	
	//로그인 한 교수의 연도/학기 정보 불러오기
	@Override
	public List<LecApplyVO> getYrsem(String memNo){
		return this.lectureMapper.getYrsem(memNo);
	}
	
	//강의계획서 평가 기준
	@Override
	public List<LecApplyVO> leesCode() {
		return this.lectureMapper.leesCode();
	}

	@Override
	public int insertApply(LecApplyVO lecApplyVO) {
		return lectureMapper.insertApply(lecApplyVO);
	}

	@Override
	public int insertLecture(LectureVO lectureVO) {
		return lectureMapper.insertLecture(lectureVO);
	}

	@Override
	public int insertLectureDetail(LectureDetailVO lectureDetailVOlist) {
		return lectureMapper.insertLectureDetail(lectureDetailVOlist);
	}

	@Override
	public List<SubjectVO> listSubj() {
		return lectureMapper.listSubj();
	}

	@Override
	public int updateApply(LecApplyVO lecApplyVO) {
		return lectureMapper.updateApply(lecApplyVO);
	}

	@Override
	public int updateLecture(LectureVO lectureVO) {
		return lectureMapper.updateLecture(lectureVO);
	}

	@Override
	public int deleteLectureDetail(LectureDetailVO lectureDetailVO) {
		return lectureMapper.deleteLectureDetail(lectureDetailVO);
	}

	@Override
	public int deleteLec(String lecaId) {
		return lectureMapper.deleteLec(lecaId);
	}

	@Override
	public List<LectureDetailVO> getTime(LectureVO lectureVO) {
		return lectureMapper.getTime(lectureVO);
	}


	

	
}
