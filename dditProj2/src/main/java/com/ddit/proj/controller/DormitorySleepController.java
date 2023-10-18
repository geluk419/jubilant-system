package com.ddit.proj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddit.proj.service.DormitoryService;
import com.ddit.proj.vo.DormitoryApplyFormVO;
import com.ddit.proj.vo.DormitorySleepOverVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stu")
public class DormitorySleepController {
	
	@Autowired
	private DormitoryService dormitoryService;

	
	@GetMapping("/dormitorySleep")
	public String insertSleepOverView(Model model, Authentication auth) {
		
		log.debug("체크{}",auth.getName());
		
		
		String memNo = auth.getName();
		DormitoryApplyFormVO dormitoryFormVO = dormitoryService.dormitoryDetail(memNo);
		log.debug("dormitoryFormVO" + dormitoryFormVO);
		
		// 상/벌점 조회
		DormitoryApplyFormVO score = dormitoryService.detailScore(memNo);
		log.info("체크 score{}", score);

	    model.addAttribute("dormitoryFormVO", dormitoryFormVO);
	    model.addAttribute("score", score);
		
		return "dormitory/dormitorySleep";
	}
	
	@ResponseBody
	@PostMapping("/dormitorySleep")
	public String insertSleepOver(@RequestBody DormitorySleepOverVO dormitorySleepOverVO) {
		
		log.debug("체크 dormitorySleepOverVO{}",dormitorySleepOverVO);
		
		
		return Integer.toString(dormitoryService.insertSleepOver(dormitorySleepOverVO));
	}
	
	
}
