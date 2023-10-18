package com.ddit.proj.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.DepartmentMapper;
import com.ddit.proj.service.DepartmentService;
import com.ddit.proj.vo.BuildingVO;
import com.ddit.proj.vo.CodeDetailVO;
import com.ddit.proj.vo.DepartmentVO;
import com.ddit.proj.vo.EmployeeVO;
import com.ddit.proj.vo.ProfessorVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentMapper departmentMapper;

	// 학과장 조회
	@Override
	public List<ProfessorVO> selectProvostList(String depCode) {
		return departmentMapper.selectProvostList(depCode);
	}
	
	// 조교 조회
	@Override
	public List<DepartmentVO> selectTAList(String codeId) {
		return departmentMapper.selectTAList(codeId);
	}
	
	// 단과대 조회
	@Override
	public List<DepartmentVO> selectColList(String groupId) {
		return departmentMapper.selectColList(groupId);
	}
	
	// 학과 등록
	@Override
	public int insertDepartment(DepartmentVO departmentVO) {
		ProfessorVO professorVO = new ProfessorVO();
		professorVO.setDepCode(departmentVO.getDepCode());
		professorVO.setMemNo(departmentVO.getDepDrhf());
		
		log.info("insertDepartment->professorVO : " + professorVO);
		
		EmployeeVO employeeVO = new EmployeeVO();
		employeeVO.setDepCode(departmentVO.getDepCode());
		employeeVO.setMemNo(departmentVO.getMemNo());
		log.info("insertDepartment->employeeVO : " + employeeVO);
		
		//{"colCode":"ART","depNm":"미용학과","depCode":"A2","depDc":"asdf","depCap":"2","depTel":"0421231234","provost":"201701P001","TA":"201803E008"}
		//(depCode=A2, colCode=ART, depNm=미용학과, depDc=미용학과 소개, depDrhf=null, depCap=60, depTel=0425558788, depDelYn=null, memNo=null, memNm=null
		//, codeId=null, codeNm=null, groupId=null, proPosYN=null)
		//1) 
		int result = departmentMapper.insertDepartment(departmentVO);
		
		//2) 학과의 학과장정보 초기화
		result += departmentMapper.bProvost(professorVO);
		
		//3) 학과의 학과장을 provost의 proPosYN을 Y 처리
		result += departmentMapper.aProvost(professorVO);
		
		//final) 조교 변경
		result += departmentMapper.updateTA(employeeVO);
		
		return result;
	}

	// 학과 리스트 조회
	@Override
	public List<DepartmentVO> listDepartment(Map<String, Object> map) {
		return departmentMapper.listDepartment(map);
	}
	
	// 학과 상세 조회
	@Override
	public DepartmentVO getDepartmentVO(String depCode) {
		return departmentMapper.getDepartmentVO(depCode);
	}

	// 학과 삭제
	@Override
	public int deleteDepartment(String depCode) {
		return departmentMapper.deleteDepartment(depCode);
	}
	
	//공통 학과 데이터 가져오기
	@Override
	public List<CodeDetailVO> getCodeDetail(String codeId){
		return departmentMapper.getCodeDetail(codeId);
	}
	
	//1) 학과장 변경 초기화
	@Override
	public int bProvost(ProfessorVO professorVO) {
		return departmentMapper.bProvost(professorVO);
	}
	
	//2) 학과장 변경
	@Override
	public int aProvost(ProfessorVO professorVO) {
		return departmentMapper.aProvost(professorVO);
	}

	// 학과 정보 수정
	@Override
	public int updateDepartment(DepartmentVO departmentVO) {
		return departmentMapper.updateDepartment(departmentVO);
	}

	// 단과대 선택 후 조회
	@Override
	public List<DepartmentVO> selectCodeNm(String codeId) {
		return departmentMapper.selectCodeNm(codeId);
	}

}
