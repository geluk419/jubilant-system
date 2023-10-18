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

import com.ddit.proj.service.ScoreService;
import com.ddit.proj.vo.ObjectionVO;
import com.ddit.proj.vo.ScoreVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stu")
public class ScoreStuListLecContoller {
	
	@Autowired
	private ScoreService scoreService;
	
	@GetMapping("/scoreLec")
	public String getScoreLec(@RequestParam(required = false) String lecCode, Model model, Principal principal) {
		
		String memNo = principal.getName();
		log.debug("체킁" + memNo);
		
		ScoreVO scoreVO = new ScoreVO();
		ObjectionVO objectionVO = new ObjectionVO();
		
		scoreVO.setLecCode(lecCode);
		scoreVO.setMemNo(memNo);
		
		objectionVO.setLecCode(lecCode);
		objectionVO.setMemNo(memNo);
		
		ScoreVO getScoreStuLec = scoreService.getScoreLec(scoreVO);
		ObjectionVO getObjection = scoreService.getObjection(objectionVO);
		
		model.addAttribute("lecCd", lecCode);
		model.addAttribute("lecCode", lecCode);
		model.addAttribute("getScoreStuLec", getScoreStuLec);
		model.addAttribute("getObjection", getObjection);
		
		// 로그에 lecCode를 출력
		log.debug("lecCode:", lecCode);
		
		return "stulec/score/scoreStuListLec";
	}
	
	@ResponseBody
	@PostMapping("/scoreObjection")
	public int insertObjection(@RequestBody ObjectionVO objectionVO, Model model) {
		log.info("오니?");
		//objectionVO :ObjectionVO(objCode=null, memNo=202308S001, lecCode=001, objTtl=1, objCon=2, objDt=null, objYn=null, objReturn=null)
		log.debug("objectionVO :" + objectionVO);
		int cnt = scoreService.insertObjection(objectionVO);
		
		return 1;
	}
	
	/*
	@GetMapping("/scoreLec")
	public String getObjection(@RequestParam(required = false) String lecCode, Model model, Principal principal) {
		
		String memNo = principal.getName();
		log.debug("체킁" + memNo);
		
		ScoreVO scoreVO = new ScoreVO();
		
		scoreVO.setLecCode(lecCode);
		scoreVO.setMemNo(memNo);
		
		ScoreVO getObjection = scoreService.getObjection(scoreVO);
		
		model.addAttribute("lecCd", lecCode);
		model.addAttribute("lecCode", lecCode);
		model.addAttribute("getObjection", getObjection);
		
		// 로그에 lecCode를 출력
		log.debug("lecCode123:", lecCode);
		
		return "stulec/score/scoreStuListLec";
	}
	*/
}

