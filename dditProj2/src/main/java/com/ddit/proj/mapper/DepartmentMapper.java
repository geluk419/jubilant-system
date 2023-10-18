package com.ddit.proj.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ddit.proj.vo.BuildingVO;
import com.ddit.proj.vo.CodeDetailVO;
import com.ddit.proj.vo.DepartmentVO;
import com.ddit.proj.vo.EmployeeVO;
import com.ddit.proj.vo.ProfessorVO;

@Mapper
public interface DepartmentMapper {
	
	// 학과장 조회
	List<ProfessorVO> selectProvostList(String depCode);
	
	// 조교 조회
	List<DepartmentVO> selectTAList(String codeId);
	
	// 단과대 조회
	List<DepartmentVO> selectColList(String groupId);
	
	// 학과 등록
	int insertDepartment(DepartmentVO departmentVO);
	
	// 학과 리스트 조회
	List<DepartmentVO> listDepartment(Map<String, Object> map);
	
	// 학과 상세 조회
	DepartmentVO getDepartmentVO(String depCode);
	
	// 학과 삭제
	int deleteDepartment(String depCode);
	
	//공통 학과 데이터 가져오기
	//<select id="getCodeDetail" parameterType="String" resultType="CodeDetailVO">
	List<CodeDetailVO> getCodeDetail(String codeId);
	
	//1) 학과장 변경 초기화
	//<update id="bProvost" parameterType="ProfessorVO">
	int bProvost(ProfessorVO professorVO);
	
	//2) 학과장 변경
	//<update id="aProvost" parameterType="ProfessorVO">
	int aProvost(ProfessorVO professorVO);
	
	//조교 상태 변경 (depCode에 데이터 넣기)
	//<update id="updateTA" parameterType="EmployeeVO">
	int updateTA(EmployeeVO employeeVO);
	
	// 학과 정보 수정
	int updateDepartment(DepartmentVO departmentVO);
	
	// 단과대 선택 후 조회
	List<DepartmentVO> selectCodeNm(String codeId);
}




