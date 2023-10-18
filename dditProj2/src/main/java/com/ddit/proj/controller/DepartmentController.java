package com.ddit.proj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddit.proj.service.DepartmentService;
import com.ddit.proj.service.MemberService;
import com.ddit.proj.vo.CodeDetailVO;
import com.ddit.proj.vo.DepartmentVO;
import com.ddit.proj.vo.ProfessorVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class DepartmentController {
	
	@Autowired
	private DepartmentService departmentService;
	
	@Autowired
	private MemberService memberService;

	// 학과 등록 페이지
	@GetMapping("/department")
	public String department(Model model) {
	    
	    // 조교 조회
	    List<DepartmentVO> TAList = departmentService.selectTAList("조교");
	    log.info("TAList: " + TAList);
	    
	    // 단과대 조회
	    List<DepartmentVO> colList = departmentService.selectColList("COLL");
	    log.info("colList:" + colList);
	    
	    model.addAttribute("TAList", TAList);
	    model.addAttribute("colList", colList);
	    
	    return "department/departmentInsert";
	}
	
	//학과명 선택 시 학과장 목록 가져오기
	@ResponseBody
	@PostMapping("/getProvostList")
	public List<ProfessorVO> getProvostList(@RequestBody ProfessorVO professorVO){
		// 학과장 조회
	    List<ProfessorVO> provostList = departmentService.selectProvostList(professorVO.getDepCode());
	    log.info("provostList: " + provostList);
	    
	    return provostList;
	}
	
	// 학과 등록
	@ResponseBody
	@PostMapping("/department")
	public String insertDepartment(@RequestBody DepartmentVO departmentVO) {
		//{"colCode":"ART","depNm":"미용학과","depCode":"A2","depDc":"asdf","depCap":"2","depTel":"0421231234","provost":"201701P001","TA":"201803E008"}
		//(depCode=A2, colCode=ART, depNm=미용학과, depDc=미용학과 소개, depDrhf=null, depCap=60, depTel=0425558788, depDelYn=null, memNo=null, memNm=null
		//, codeId=null, codeNm=null, groupId=null, proPosYN=null)
		log.debug("채현만만세:{}",departmentVO);
		
		int result = departmentService.insertDepartment(departmentVO);
		log.info("insertDepartment->result : " + result);
		
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 학과 리스트 조회
	@GetMapping("/departmentList")
	public String departmentList(Model model) {
		
		// 단과대 조회
	    List<DepartmentVO> colList = departmentService.selectColList("COLL");
	    log.info("colList:" + colList);
		
	    model.addAttribute("colList", colList);
	    
		return "department/departmentList";
	}
	
	// 단과대 선택 후 조회
	@ResponseBody
	@GetMapping("/selectCodeNm")
	public List<DepartmentVO> codeList(Model model, String selectedValue) {
		log.info("selectedValue:" + selectedValue);
		
		// 단과대 조회
	    List<DepartmentVO> colList = departmentService.selectColList("COLL");
	    log.info("colList:" + colList);
		
	    // 단과대 선택 후 조회
	    List<DepartmentVO> selectCodeNm = departmentService.selectCodeNm(selectedValue);
	    log.info("selectCodeNm:" + selectCodeNm);
		
	    return selectCodeNm;
		
	}
	
	@GetMapping("/getList")
	@ResponseBody
	public List<DepartmentVO> getList(Model model,
			@RequestParam(value="keyword", required = false, defaultValue = "") String keyword
			){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		log.info("체킁:",keyword);
	    
		List<DepartmentVO> dList = departmentService.listDepartment(map);
		log.info("dList:" + dList);
		return dList;
	}
	
	// 학과 상세보기
	@GetMapping("/departmentDetail")
	public String departmentDetail(String depCode, Model model) {
		log.info("체킁 depCode:" + depCode);
		
		DepartmentVO department = new DepartmentVO();
		department.setDepCode(depCode);
		
		DepartmentVO departmentVO = departmentService.getDepartmentVO(depCode);
		
		// 조교 조회
	    List<DepartmentVO> TAList = departmentService.selectTAList("05");
	    log.info("TAList: " + TAList);

		log.info("체킁  상세:" + departmentVO);
		model.addAttribute("departmentVO", departmentVO);
		model.addAttribute("TAList", TAList);
		
		return "department/departmentDetail";
	}
	
	//학과명 불러오기
	@ResponseBody
	@PostMapping("/getCodeDetail")
	public List<CodeDetailVO> getCodeDetail(@RequestBody CodeDetailVO codeDetailVO){
		log.info("codeDetailVO : " + codeDetailVO);
		
	    List<CodeDetailVO> codeDetailVOList = departmentService.getCodeDetail(codeDetailVO.getCodeId());
	    log.info("department->codeDetailVOList: " + codeDetailVOList);
	    
	    return codeDetailVOList;
	}
	
	// 학과 삭제
	@ResponseBody
	@PutMapping("/departmentDetail/{depCode}")
	public String departmentDelete(@PathVariable String depCode) {
		log.info("삭제 depCode 체킁:" + depCode);
		
		departmentService.deleteDepartment(depCode);
		
		return "success";
	}
	
	// 학과 정보 수정
	@ResponseBody
	@PutMapping("/departmentDetail")
	public String updateDepartment(@RequestBody DepartmentVO departmentVO) {
		log.info("departmentVO:" + departmentVO);
		
		departmentService.updateDepartment(departmentVO);
		return "success";
	}
	
}