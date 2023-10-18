package com.ddit.proj.controller;

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
public class ProfStuManageController {
	
	/*
	@Autowired
	private LecNoticeMapper lecNoticeMapper;
	
	@GetMapping("/profLecList")
	public String getStuLecList(Model model, HttpServletRequest request) {
		log.info("체킁:");
		
		// 세션 불러 오고 나서
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");

		String memNo = "";

		if(memberVO == null) {
			memNo = "202008P003";
		} else {
			memNo = memberVO.getMemNo();
		}
		
		List<LecNoticeVO> lecNoticeVOList = this.lecNoticeMapper.getlecCode(memNo);
		
		model.addAttribute("lecNoticeVOList", lecNoticeVOList);
		
		log.info("lecNoticeVOList"+lecNoticeVOList);
		
		return "lec/profLecList";
	}
	*/
	
	@GetMapping("/stuManage")
	public String ProfStuManage() {
		log.info("체킁:");
		return "student/profStuManage";
	}
	
}
