package com.ddit.proj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddit.proj.service.TestService;
import com.ddit.proj.vo.TestExamVO;
import com.ddit.proj.vo.TestVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/prof")
public class TestRegisterController {
	
	
	@Autowired
	private TestService testService;
	
	/*
	@GetMapping("/testRegisterDetail")
	public List<TestVO> getList(){
		return testService.listTest();
	}
	*/
	
	// 시험등록한거 select
	@GetMapping("/test")
	public String getTestRegister(@RequestParam String lecCode, Model model,Authentication auth) {

		String memNo = "202008P003";
		
		if(auth != null) {
			memNo = auth.getName();				
		}
				
		TestVO testVO = new TestVO();
		testVO.setLecCode(lecCode);
		testVO.setMemNo(memNo);
		
		List<TestVO> testRegiNoticeList = testService.getTestVO(testVO);
		log.debug("testVO" + testRegiNoticeList);
		
		model.addAttribute("testRegiNoticeList", testRegiNoticeList);
		model.addAttribute("lecCode", lecCode);
		model.addAttribute("lecCd", lecCode);
		
		return "proflec/test/testRegister";
	}
	
	// 시험 수정 select
   @GetMapping("/testRegisterModify")
   public String testRegisterModify(int testCode, Model model) {
      log.info("체킁 testCode:" + testCode);
      
      TestVO test = new TestVO();
      test.setTestCode(testCode);
      
      TestVO testVO = testService.getTest(testCode);
      model.addAttribute("testVO", testVO);
      
      List<TestExamVO> testExamVOlist = testVO.getTestExamList();
      
      testExamVOlist = testService.getTestExam(testCode);
      
      //[TestVO(testCode=344, lecCode=0, testNm=null, testDe=null, testSt=null, testEt=null, testStartYn=null, testLimit=null, 
      //	testExamList=[TestExamVO(steNo=409, testCode=344, steType=200, steQue=ex, steRightAnswer=option1, 
      //			testChoiceList=[
      //						TestChoiceVO(testCode=344, steNo=409, steSelectNo=1, steSelect=ex1), 
      //						TestChoiceVO(testCode=344, steNo=409, steSelectNo=2, steSelect=ex1), 
      //						TestChoiceVO(testCode=344, steNo=409, steSelectNo=3, steSelect=ex1), 
      //						TestChoiceVO(testCode=344, steNo=409, steSelectNo=4, steSelect=ex1)])])]
      log.info("testVO : " + testVO);
      
      model.addAttribute("testVO", testVO);
      
      
      return "proflec/test/testRegisterModify";
   }
	
   
   @ResponseBody
   @PutMapping("/testRegisterModify")
	public String updateTest(@RequestBody TestVO testVO) {
	    log.info("예린 testVO {}",testVO);
	   	testService.updateTest(testVO);
		return "success";
	}
	
   
   @ResponseBody
   @PutMapping("/testRegister/{testCode}")
	public int deleteTest(@PathVariable int testCode) {
	   	log.info("삭제체크:"+testCode);
	   	TestVO testVo = new TestVO();
	   	testVo.setTestCode(testCode);
	   	int cnt = testService.deleteTest(testVo);
		return cnt;
	}
	
}
