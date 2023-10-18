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

import com.ddit.proj.service.SubjectService;
import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.DepartmentVO;
import com.ddit.proj.vo.LecApplyVO;
import com.ddit.proj.vo.SubjectVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class SubjectController {
	
	@Autowired SubjectService subjectService;
	
	// 과목 등록 페이지
	@GetMapping("/subjectInsert")
	public String subjectInsert(Model model) {
		
		// 단과대 조회
		List<DepartmentVO> colList = subjectService.colList("COLL");
		log.info("colList:" + colList);
		
		// 과목 구분 번호 조회 (공통코드)
		List<CodeVO> subSeCode = subjectService.subSeCode("SUBJ");
		log.info("subSeCode:" + subSeCode);
		
		model.addAttribute("colList", colList);
		model.addAttribute("subSeCode", subSeCode);
		
		return "subject/subjectInsert";
	}
	
	// 단과대 선택 시 학과 목록 가져오기
	@ResponseBody
	@GetMapping("/getDepartmentList/{str}")
	public List<DepartmentVO> getDepartmentList(@PathVariable String str){
		DepartmentVO departmentVO = new DepartmentVO();
		departmentVO.setDepCode(str);
		// 학과 조회
		List<DepartmentVO> depList = subjectService.depList(departmentVO.getDepCode());
		log.info("depList:" + depList);
		
		return depList;
	}
	
	// 과목 등록
	@ResponseBody
	@PostMapping("/subjectInsert")
	public String insertSubject(@RequestBody SubjectVO subjectVO) {
		log.debug("subjectVO:{}", subjectVO);
		
		int result = subjectService.insertSubject(subjectVO);
		log.info("insertSubject->result : " + result);
		
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 과목 리스트 조회
	@GetMapping("/subjectList")
	public String subjectList(Model model, @RequestParam(required = false) String keyword, @RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "10") int size) {
	    // Create a HashMap and add key-value pairs
		log.info("여기확인");
	    Map<String, Object> map = new HashMap<>();
	    map.put("keyword", keyword);
	    
	    int startRow = ((currentPage-1)*size) + 1;
	    int endRow = startRow + size -1;
	    
	    map.put("startRow", startRow);
	    map.put("endRow", endRow);

	    log.info("map Test : " + map );
	    
	    List<SubjectVO> subjectList = subjectService.listSubj(map);
	    int totalSubjects = subjectService.getSubjTotal(map);
	    
	    // int로  나누면 첨부터 소숫점이 없어지는 불상사에 주의(int로 자동변환되어버림)
	    log.debug("바보같은:" + Math.ceil(((double)totalSubjects / size)) + "  " + ((double)totalSubjects / size));
	    
	    model.addAttribute("subjectList", subjectList);
	    model.addAttribute("totalSubjects", totalSubjects);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("size", size);
	    // 일단 채현이가 마니 어려워하니깡!, 산수
	    model.addAttribute("pageCnt", (int)Math.ceil(((double)totalSubjects / size)));
	    return "subject/subjectList";
	}
	
	@ResponseBody
	@GetMapping("/searchSubject/{searchValue}")
	public List<SubjectVO> searchSubject(Model model, @PathVariable String searchValue) {
	    List<SubjectVO> subjectList;
	    Map<String, Object> map = new HashMap<>();
	    
	    int currentPage = 1;   // 일단 기본값 1페이지
	    int size = 10;         // 페이지당 10개씩
	    int startRow = ((currentPage-1)*size) + 1;
	    int endRow = startRow + size -1;
	    
	    map.put("startRow", startRow);
	    map.put("endRow", endRow);
	    
	    if (searchValue != null && !searchValue.isEmpty()) {
	        map.put("keyword", searchValue); 
	        subjectList = subjectService.listSubj(map);
	    } else {
	        subjectList = subjectService.listSubj(map);
	    }

	    model.addAttribute("subjectList", subjectList);
	    return subjectList;
	}

	@GetMapping("/sList")
	@ResponseBody
	public List<SubjectVO> sList() {
	    Map<String, Object> map = new HashMap<>();
	    List<SubjectVO> subjectList = subjectService.listSubj(map);
	    return subjectList;
	}
	
	// 과목 상세 보기
	@GetMapping("/subjectDetail")
	public String detailSubject(String subCode, Model model) {
		log.info("체킁 subCode:" + subCode);
		
		SubjectVO subject = new SubjectVO();
		subject.setSubCode(subCode);
		
		SubjectVO subjectVO = subjectService.detailSubject(subCode);
		
		// 강의 리스트 불러오기
		List<LecApplyVO> lecApplyVO = subjectService.detailLec(subCode);
		
//		LecApplyVO lecApplyVO = subjectService.detailLec(subCode);
		
		// 과목 구분 번호 조회 (공통코드)
		List<CodeVO> subSeCode = subjectService.subSeCode("SUBJ");
		log.info("subSeCode:" + subSeCode);
		
		log.info("체킁 상세 : " + subjectVO);
		log.info("체킁 상세 : " + subSeCode);
		log.info("체킁 강의 : " + lecApplyVO);
		model.addAttribute("subjectVO", subjectVO);
		model.addAttribute("subSeCode", subSeCode);
		model.addAttribute("lecApplyVO", lecApplyVO);
		
		return "subject/subjectDetail";
	}
	
	// 과목 정보 수정
	@ResponseBody
	@PutMapping("/subjectDetail")
	public String updateSubject(@RequestBody SubjectVO subjectVO) {
		log.info("subjectVO:" + subjectVO);
		
		subjectService.updateSubject(subjectVO);
		return "success";
		
	}
	
	// 과목 삭제
	@ResponseBody
	@PutMapping("/subjectDetail/{subCode}")
	public String deleteSubject(@PathVariable String subCode) {
		log.info("삭제 subCode 체킁 : " + subCode);
		
		subjectService.deleteSubject(subCode);
		
		return "success";
		
	}
}








