package com.ddit.proj.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ddit.proj.service.ScholarshipService;
import com.ddit.proj.service.StuMyPageService;
import com.ddit.proj.vo.ScholarshipVO;
import com.ddit.proj.vo.StuMyPageVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stu")
public class StuScholarshipContoller {
	
	
	@Autowired
	private ScholarshipService scholarshipService;
	
	@Autowired
	private StuMyPageService stuMyPageService;
	
	@GetMapping("/scholarship")
	public String getScoreLec(@RequestParam(required = false) String lecCode, Model model, Principal principal) {
		
		String memNo = principal.getName();
		log.debug("체킁" + memNo);
		
		ScholarshipVO scholarshipVO = new ScholarshipVO();
		
		scholarshipVO.setLecCode(lecCode);
		scholarshipVO.setMemNo(memNo);
		
		
		ScholarshipVO getScholarStu = scholarshipService.getScholarship(scholarshipVO);
		
		model.addAttribute("lecCd", lecCode);
		model.addAttribute("lecCode", lecCode);
		model.addAttribute("getScholarStu", getScholarStu);
		
		// 로그에 lecCode를 출력
		log.debug("lecCode:", lecCode);
		
		return "scholarship/stuScholarship";
	}
	
	// 장학금 출력
	@GetMapping("/printScholarship")
    public String print(Model model, Authentication auth) {
    	
		
    	// 학년 불러오기
	    String memNo = auth.getName();
		StuMyPageVO gradeInfo = stuMyPageService.grade(memNo);
		log.info("학년 : {}", gradeInfo);

		// 학과 정보 가져오기
		StuMyPageVO department = stuMyPageService.department(memNo);
		log.info("학과 : {}", department);
		
		// 단과대학 정보 가져오기
	    StuMyPageVO college = stuMyPageService.college(memNo);
	    log.info("단과대: {}", college);
	    
	    //
	    ScholarshipVO scholarshipVO = new ScholarshipVO();
	    ScholarshipVO getScholarStu = scholarshipService.getScholarship(scholarshipVO);
	    
		model.addAttribute("gradeInfo", gradeInfo);
		model.addAttribute("department", department);
		model.addAttribute("college", college);
		model.addAttribute("getScholarStu", getScholarStu);
	    
    	return "payment/printScholarship";
    }
	
	
}

