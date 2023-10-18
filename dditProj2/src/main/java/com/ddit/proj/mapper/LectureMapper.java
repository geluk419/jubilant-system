package com.ddit.proj.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ddit.proj.vo.BuildingVO;
import com.ddit.proj.vo.LecApplyVO;
import com.ddit.proj.vo.LecNoticeVO;
import com.ddit.proj.vo.LectureDetailVO;
import com.ddit.proj.vo.LectureVO;
import com.ddit.proj.vo.MemberVO;
import com.ddit.proj.vo.SearchVO;
import com.ddit.proj.vo.SubjectVO;

@Mapper
public interface LectureMapper {
	
	// 강의 계획서 목록 불러오기
	public List<LectureVO> listLecture(String memNo);
	
	//교수 정보 불러오기
	public List<MemberVO> getProf(String memNo);
	
	//강의자료(강의게시판)
	List<LecNoticeVO> listLecNotice();
	
	List<LecNoticeVO> getLecNoticeVO(SearchVO searchVO);
	
	//건물,강의실 불러오기
	List<BuildingVO> getBuildRoom();
	
	//강의실 호수 가져오기
	List<BuildingVO> getRoomNo(String bldCode);
	
	//셀렉별 리스트 불러오기
	public List<LecApplyVO> listSelLecture(LecApplyVO lecApplyVO);
	
	//로그인 한 교수의 연도/학기 정보 불러오기
	//<select id="getYrsem" parameterType="String" resultType="LecApplyVO">
	public List<LecApplyVO> getYrsem(String memNo);
	
	//강의계획서 평가 기준
	public List<LecApplyVO> leesCode();
	
	//강의계획서 등록
	public int insertApply(LecApplyVO lecApplyVO);
	
	//강의 등록
	public int insertLecture(LectureVO lectureVO);
	
	//강의 상세등록
	public int insertLectureDetail(LectureDetailVO lectureDetailVOlist);

	//과목가져오기
	public List<SubjectVO> listSubj();
	
	//강의계획서 수정
	public int updateApply(LecApplyVO lecApplyVO);
	
	//강의 수정
	public int updateLecture(LectureVO lectureVO);
	
	//강의상세 삭제
	public int deleteLectureDetail(LectureDetailVO lectureDetailVO);
	
	//강의 삭제
	public int deleteLec(String lecaId);

	//중복시간표 
	public List<LectureDetailVO> getTime(LectureVO lectureVO);
}




