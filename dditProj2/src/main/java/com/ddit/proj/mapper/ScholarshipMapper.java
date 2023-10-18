package com.ddit.proj.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ddit.proj.vo.ScholarStuVO;
import com.ddit.proj.vo.ScholarshipVO;
import com.ddit.proj.vo.ScoreVO;

@Mapper
public interface ScholarshipMapper {
	
	//장학금 대상자 조회
	//<select id="getScholarshipRec" resultType="ScholarshipVO">
	public List<ScholarshipVO> getScholarshipRec(ScholarshipVO scholarshipVO);
	
	//본인이 듣는 강의 전부 조회
	//<select id="myLec" resultType="ScholarStuVO" parameterType="ScholarStuVO">
	public List<ScholarStuVO> myLec(ScholarStuVO scholarStuVO);
	
	//장학생 등록
	//<insert id="insertScholarship" parameterType="ScholarshipVO">
	public int insertScholarship(ScholarshipVO scholarshipVO);
	
	//<!-- 장학금 지급 내역 조회 -->
	//<update id="updateScholarship" parameterType="String"> 
	public int updateScholarship(String memNo);
	
	//<!-- 장학금 지급한 학생들 조회 -->
	//<select id="selectSch" resultType="ScholarshipVO" >
	public List<ScholarshipVO> selectSch(ScholarshipVO scholarshipVO);
	
	//학생이 장학금 조회
	public ScholarshipVO getScholarship(ScholarshipVO scholarshipVO);
	
	//장학금종류 불러오는 쿼리
	//<select id="selectSclName" resultType="ScholarshipVO">
	public List<ScholarshipVO> selectSclName();
	
	//장학금 연도 조회
	//<select id="selectSclYr" resultType="ScholarshipVO">
	public List<ScholarshipVO> selectSclYr();
	
	//장학금 학기 조회
	//<select id="selectSemCode" resultType="ScholarshipVO">
	public List<ScholarshipVO> selectSemCode(); 
}
