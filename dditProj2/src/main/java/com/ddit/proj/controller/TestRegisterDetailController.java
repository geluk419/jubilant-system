package com.ddit.proj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddit.proj.service.TestService;
import com.ddit.proj.vo.TestChoiceVO;
import com.ddit.proj.vo.TestExamVO;
import com.ddit.proj.vo.TestVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/prof")
public class TestRegisterDetailController {
	
	
	@Autowired
	private TestService testService;
	
	
	@GetMapping("/testDetail")
	public String getTestNotice(@RequestParam(required = false,defaultValue = "001") String lecCode, Model model) {
		log.info("체킁:" + lecCode);
		
		model.addAttribute("lecCode", lecCode);
		model.addAttribute("lecCd", lecCode);
		return "proflec/test/testRegisterDetail";
	}
	
	/*
	@GetMapping("/testRegisterDetail")
	public List<TestVO> getList(){
		return testService.listTest();
	}
	
	
	@GetMapping("/testRegisterDetail/{testCode}")
	public TestVO getTest(@PathVariable String testCode) {
		TestVO testVO = new TestVO();
		testVO.setTestCode(testCode);
		return testService.getTest(testVO);
	}
	*/
	
	@PostMapping("/testRegisterDetail")
	@ResponseBody
	public String insertTest(@RequestBody TestVO testVO) {
	    log.debug("testVO개똥이 {}", testVO);
	    
	    List<TestExamVO> exList = testVO.getTestExamList();
	    
	    for (TestExamVO testExamVO : exList) {
			log.debug("체크 exam:" + testExamVO.getSteQue());
			
			List<TestChoiceVO> choiceList = testExamVO.getTestChoiceList();
			for (TestChoiceVO choiceVO : choiceList) {
				log.debug("choice1" + choiceVO.getSteSelect());
			}
			
			log.debug("===========================================================");
		}
	    	    
	   //return Integer.toString(testService.insertTest(testVO));
		return testService.insertTestCombined(testVO);
	}
	
	
	
	
}



