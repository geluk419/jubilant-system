package com.ddit.proj.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddit.proj.mapper.LecNoticeMapper;
import com.ddit.proj.vo.LecNoticeVO;
import com.ddit.proj.vo.MemberVO;
import com.ddit.proj.vo.TaskSubmitVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/prof")
public class ProfLecListController {
	
	@Autowired
	private LecNoticeMapper lecNoticeMapper;
	
	@GetMapping("/profLecList")
	public String getStuLecList(Model model, Principal principal) {
		log.info("체킁:");
		
		String memNo = principal.getName();
		
		List<LecNoticeVO> lecNoticeVOList = this.lecNoticeMapper.getlecCode(memNo);
		
		model.addAttribute("lecNoticeVOList", lecNoticeVOList);
		
		log.info("lecNoticeVOList"+lecNoticeVOList);
		
		return "lec/profLecList";
	}

	
}
