package com.ddit.proj.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddit.proj.service.EvaluationService;
import com.ddit.proj.vo.EvaluationVO;
import com.ddit.proj.vo.ObjectionVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stu")
public class StuLecEvaluationController {
	
	@Autowired
	private EvaluationService evaluationService;
	
	@GetMapping("/stuLecEvaluation")
	public String ProfStuManage(@RequestParam(required = false) String lecCode, Model model, Principal principal) {
		
		String memNo = principal.getName();
		log.debug("체킁" + memNo);
		
		EvaluationVO evaluationVO = new EvaluationVO();
		
		evaluationVO.setLecCode(lecCode);
		evaluationVO.setMemNo(memNo);
		
		model.addAttribute("lecCd", lecCode);
		model.addAttribute("lecCode", lecCode);
		
		return "stulec/lec/lecEvaluation";
	}
	
	@ResponseBody
	@PostMapping("/lecEvaluation")
	public int insertEvaluation(@RequestBody EvaluationVO evaluationVO, Model model) {
		log.info("오니?");
		log.debug("evaluationVO :" + evaluationVO);
		int cnt = evaluationService.insertEvaluation(evaluationVO);
		
		return 1;
	}
	
	
	
	
}

