package com.ddit.proj.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ddit.proj.service.TestService;
import com.ddit.proj.vo.TestStuVO;
import com.ddit.proj.vo.TestSubmitVO;
import com.ddit.proj.vo.TestVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stu")
public class TestStuStartContoller {
	
	@Autowired
	private TestService testService;
	
	//List<TestStuVO> testStuStart(int testCode);

	@GetMapping("/testStuStart/{testCode}")
	public String testStu(@RequestParam(required = false) String lecCode, @PathVariable int testCode, Model model) {
		log.info("체크:" + testCode);

		TestVO test = new TestVO();
		test.setTestCode(testCode);
		test.setLecCode(lecCode);

		List<TestStuVO> testStuVO = testService.testStuStart(test);
		model.addAttribute("testStuVO", testStuVO);
		
		model.addAttribute("lecCode", lecCode);
		model.addAttribute("lecCd", lecCode);
		log.info("testStuVO:" + testStuVO);
		
		return "test/testStuStart";
	}
	
	
	@PostMapping("/testStuStart")
	public String answerTest(@RequestParam Map<String, String> map, Authentication auth) {
		log.debug("TestStuVO {} ", map);
		List<TestSubmitVO> list = new ArrayList<>();
		String lecCode = map.get("lecCode");
		String memNo = auth.getName();
		for (String key : map.keySet()) {
			if (key.matches("[0-9]+")) {
				list.add(new TestSubmitVO(lecCode, Integer.parseInt(key), memNo, map.get(key)));
			}
		}
		log.debug("list: {}", list);
		testService.insertAnswerSubmit(list);
		return "redirect:/stu/testNotice?lecCode="+lecCode;
	}
	
	
	/*
	//임시
	@GetMapping("/test")
	public String getStuStart() {
		log.info("체킁");
		return "test/testStuStart";
	}
	*/
}
