package com.ddit.proj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddit.proj.service.DormitoryService;
import com.ddit.proj.service.ScoreService;
import com.ddit.proj.vo.DormitoryApplyFormVO;
import com.ddit.proj.vo.DormitorySleepOverVO;
import com.ddit.proj.vo.ObjectionVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stu")
public class StuObjectionController {
	
	@Autowired
	private ScoreService scoreService;

	/*
	@GetMapping("/scoreObjection")
	public String insertObjection(@RequestParam String lecCode, Model model, Authentication auth) {
	    log.debug("체크{}",auth.getName());
	    String memNo = auth.getName();
	    ObjectionVO objectionVO = new ObjectionVO(); 
	    
	    objectionVO.setMemNo(memNo);
	    objectionVO.setLecCode(lecCode);
	    
	    log.debug("objectionVO!!!!!" + objectionVO);
	    
	    int result = scoreService.insertObjection(objectionVO);
	    log.debug("objectionVO" + result);
	    model.addAttribute("lecCode", lecCode);
		model.addAttribute("lecCd", lecCode);
	    model.addAttribute("objectionVO", result);
	    return "stulec/score/scoreStuListLec";
	}

	
	
	@ResponseBody
	@PostMapping("/scoreObjection")
	public String insertObjection(@RequestBody ObjectionVO objectionVO) {
		
		log.debug("objectionVO{}",objectionVO);
		
		
		return Integer.toString(scoreService.insertObjection(objectionVO));
	}
	*/
	
}
