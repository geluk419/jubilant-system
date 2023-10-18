package com.ddit.proj.controller;

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
import com.ddit.proj.service.ScholarshipService;
import com.ddit.proj.service.SubjectService;
import com.ddit.proj.vo.CodeDetailVO;
import com.ddit.proj.vo.DepartmentVO;
import com.ddit.proj.vo.ScholarStuVO;
import com.ddit.proj.vo.ScholarshipVO;
import com.ddit.proj.vo.StudentVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class scholarshipController {

	@Autowired
	private ScholarshipService scholarshipService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@Autowired
	private MemberService memberSerivce;
	
	//장학대상자 페이지
	@GetMapping("/scholarshipRecipients")
	public String getScholarshipRecipients(Model model, ScholarshipVO schVO) {
		log.info("체킁:{}",schVO);
		
//		String inputSclName = (String) map.get("inputSclName");
//		String inputColl = (String) map.get("inputColl");
//		String inputDepCode = (String) map.get("inputDepCode");
		
		List<ScholarshipVO> scholarStuVOList = scholarshipService.getScholarshipRec(schVO);
		log.info("체킁scholarStuVOList:" + scholarStuVOList);
		
		model.addAttribute("scholarStuVOList", scholarStuVOList);
		model.addAttribute("collList",departmentService.selectColList("COLL"));
//		model.addAttribute("schName", scholarshipService.selectSclName());
		log.info("체킁:{}",departmentService.selectColList("COLL"));
		
		return "scholarship/scholarshipRecipients";
	}
	
	//장학대상자 페이지
	@ResponseBody
	@GetMapping("/depCodeIdList/{codeId}")
	public List<CodeDetailVO> getCodeIdList(@PathVariable String codeId) {
		log.info("체킁:{}", codeId);
		return memberSerivce.codeIdList(codeId);
	}
	
	//상세보기(본인 강의 조회)
	@ResponseBody
	@GetMapping("/scholarshipRecipientsDetail")
	public List<ScholarStuVO> scholarDetail(ScholarStuVO scholarStuVO) {
		log.info("체킁scholarStuVO{}:", scholarStuVO);
		
		return scholarshipService.myLec(scholarStuVO);
		
	}
	
	//장학생 등록
	@ResponseBody
	@PostMapping("/scholarshipInsert")
	public String insertScholarship(@RequestBody ScholarshipVO scholarshipVO) {
		log.info("체킁insert:" + scholarshipVO);
		
		scholarshipService.insertScholarship(scholarshipVO);
		
		return "success";
	}
	
	
	//장학금 지급내역 조회 페이지
	@GetMapping("/scholarship")
	public String ScholarshipList(Model model, ScholarshipVO scholarshipVO) {
		log.info("체킁:");
		
		List<ScholarshipVO> scholarList = scholarshipService.selectSch(scholarshipVO);
		log.info("체킁scholarList:" + scholarList);
		
		model.addAttribute("scholarList", scholarList);
//		model.addAttribute("sclYr", scholarshipService.selectSclYr());
//		model.addAttribute("sclSemCode", scholarshipService.selectSemCode());
		
		return "scholarship/scholarshipList";
	}
	
	//장학금 수여
	@ResponseBody
	@PutMapping("/scholarship/{memNo}")
	public String updateScholarship(@PathVariable String memNo) {
		log.info("memNo:" + memNo);
		
		scholarshipService.updateScholarship(memNo);
		return "success";
	}
	
}
