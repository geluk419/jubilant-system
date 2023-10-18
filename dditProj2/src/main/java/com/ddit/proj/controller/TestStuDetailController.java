package com.ddit.proj.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddit.proj.service.TestService;
import com.ddit.proj.vo.TestResultVO;
import com.ddit.proj.vo.TestStuVO;
import com.ddit.proj.vo.TestSubmitVO;
import com.ddit.proj.vo.TestVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/prof")
public class TestStuDetailController {
	
	
	@Autowired
	private TestService testService;
	

	
	@GetMapping("/testStuDetail/{testCode}")
	public String getTestNotice(@PathVariable String testCode, @RequestParam(required = false,defaultValue = "001") String lecCode,  Model model,Authentication auth) {
		
		log.debug("시이작");
		//String memNo = auth.getName();
		
		List<TestSubmitVO> testSubmitList = testService.getSubmitVO(testCode);
		log.debug("TestSubmitVO" + testSubmitList);
		log.debug("testCode" + testCode);
		
		TestVO test = new TestVO();
		test.setTestCode(Integer.parseInt(testCode));

		List<TestStuVO> testStuVO = testService.testStuStart(test);
		log.info("testStuVO:" + testStuVO);

		model.addAttribute("testStuVO", testStuVO);
	    model.addAttribute("testSubmitList", testSubmitList);
	    model.addAttribute("testCode", testCode);
	    model.addAttribute("lecCode", lecCode);
		model.addAttribute("lecCd", lecCode);
		
	    
		return "proflec/test/testStuDetail";
	}
	
	@GetMapping("/testResult")
	@ResponseBody
	public List<TestResultVO> testResult(int testCode, String memNo, Model model, Authentication auth) {
		log.debug("testCode: {}", testCode);
		log.debug("memNo: {}", memNo);
		TestResultVO vo = new TestResultVO();
		vo.setTestCode(testCode);
		vo.setMemNo(memNo);
		return testService.testResult(vo);
	}
	
	
	
	
	
	/*
	 * @ResponseBody
	 * 
	 * @PostMapping("/testStuDetail") public List<Map<String,Object>>
	 * getTestNotice(@RequestBody Map<String,Object> map) { //getTestNotice->map :
	 * {testCode=322, memNo=202308S001} log.info("getTestNotice->map : " + map);
	 * 
	 * List<Map<String,Object>> testSubmitList = testService.testStuDetailPost(map);
	 * log.info("getTestNotice->testSubmitList : " + testSubmitList);
	 * 
	 * return testSubmitList; }
	 */
	
	
	//교수 채점
	//요청파라미터 : {testCode=322,memNo=202308S001}
    @ResponseBody
	@PostMapping("/ansScoreUpdatePost")
	public String ansScoreUpdatePost(@RequestBody Map<String,Object> map) {
		//map : {testCode=322, memNo=202308S001, _csrf=550e3900-6919-45b3-85d5-75cd7a24ec25}
		log.info("ansScoreUpdatePost->map : " + map);
		
		int result = this.testService.ansScoreUpdatePost(map);
		log.info("ansScoreUpdatePost->result : " + result);
		
//		List<Map<String,Object>> testSubmitList = testService.testStuDetailPost(map);
//		log.info("getTestNotice->testSubmitList : " + testSubmitList);
		
		// /prof/testStuDetail/322
		//return "redirect:/prof/testStuDetail/"+map.get("testCode");
		return "success";
	}
}




