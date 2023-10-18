package com.ddit.proj.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddit.proj.service.TestService;
import com.ddit.proj.vo.TestResultVO;
import com.ddit.proj.vo.TestVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stu")
public class TestNoticeController {
	
	@Autowired
	private TestService testService;
	
	
	@GetMapping("/testNotice")
	public String getTestNotice(@RequestParam String lecCode, Model model,Authentication auth) {
		//log.info("체킁:");
		
		String memNo = auth.getName();
//		String memNo = "202308S001";
		
		TestVO testVO = new TestVO();
		testVO.setLecCode(lecCode);
		testVO.setMemNo(memNo);
		
		List<TestVO> testNoticeList = testService.getTestVO(testVO);
		log.debug("testVO" + testNoticeList);
		
		model.addAttribute("lecCode", lecCode);
		model.addAttribute("lecCd", lecCode);
		model.addAttribute("testNoticeList", testNoticeList);
		
		return "stulec/test/testNotice";
	}
	
	@GetMapping("/testResult")
	@ResponseBody
	public List<TestResultVO> testResult(int testCode, Model model, Authentication auth) {
		log.debug("testCode: {}", testCode);
		String memNo = auth.getName();
		TestResultVO vo = new TestResultVO();
		vo.setTestCode(testCode);
		vo.setMemNo(memNo);
		return testService.testResult(vo);
	}
	
	/*
	@GetMapping("/testNotice")
	public List<TestVO> getList(){
		return testService.listTest();
	}
	*/
	
	
}
