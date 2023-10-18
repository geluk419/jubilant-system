package com.ddit.proj.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ddit.proj.service.ScoreService;
import com.ddit.proj.vo.ScoreVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stu")
public class ScoreStuListContoller {
	
	@Autowired
	private ScoreService scoreService;
	
	@GetMapping("/score")
	public String getStuTestStart(Authentication auth, Model model,
			@RequestParam(value="searchYear",required=false,defaultValue="0") int searchYear,
			@RequestParam(value="searchSem",required=false,defaultValue="0") int searchSem) {
		
		log.debug("체크{}", auth.getName());
		
		String memNo = auth.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("memNo", memNo);
		map.put("searchYear", searchYear);
		map.put("searchSem", searchSem);
		
		log.info("getStuTestStart->map : " + map);
		
		List<ScoreVO> scoreList = this.scoreService.listStuScore(map);
		List<ScoreVO> scoreListCurrent = this.scoreService.listStuScoreCurrent(map);
		
		log.info("scoreList: " + scoreList);
		log.info("scoreListCurrent: " + scoreListCurrent);
		
		model.addAttribute("scoreList", scoreList);
		model.addAttribute("scoreListCurrent", scoreListCurrent);
		
		return "score/scoreStuList";
	}
}
