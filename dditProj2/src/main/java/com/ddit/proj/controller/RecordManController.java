package com.ddit.proj.controller;

import java.security.Principal;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddit.proj.mapper.MemberMapper;
import com.ddit.proj.service.RecordApplyService;
import com.ddit.proj.vo.MemberVO;
import com.ddit.proj.vo.RecordApplyVO;
import com.ddit.proj.vo.RecordStuVO;
import com.ddit.proj.vo.StudentVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class RecordManController {
	
	@Autowired
	private RecordApplyService recordApplyService;
	
	//학적관리 리스트
	@GetMapping("/recMan")
	public String recManList(Model model,Principal principal) {
		log.info("체킁:");
		
		model.addAttribute("recManList", recordApplyService.selectRecMan("STUD"));
		log.info("체킁:", recordApplyService.selectRecMan("STUD"));
		
		List<RecordStuVO> studentVOList = recordApplyService.selectRecStu();
		log.info("휴학 체킁:" + studentVOList);
		
		List<RecordStuVO> studentVOList2 = recordApplyService.selectRecStu();
		log.info("복학 체킁:" + studentVOList2);
		
		List<RecordStuVO> studentVOList3 = recordApplyService.selectRecStu();
		log.info("자퇴 체킁:" + studentVOList3);
		
		//휴학
		model.addAttribute("studentVOList", studentVOList);
		//복학
		model.addAttribute("studentVOList2", studentVOList2);
		//자퇴
		model.addAttribute("studentVOList3", studentVOList3);
		
		model.addAttribute("empMemNo",principal.getName());
		
		return "record/recMan";
	}
	
	//상세보기
	@ResponseBody
	@GetMapping("/recManDetail")
	public RecordStuVO recManDetail(RecordStuVO recordStuVO) {
		log.info("체킁:{}",recordStuVO);
		
		/*
		RecordStuVO recordVO = new RecordStuVO();
		recordVO.setMemNo(memNo);
		*/
		return recordApplyService.getRecStu(recordStuVO);
		
	}
	
	//승인 처리
	@ResponseBody
	@PutMapping("/recManDetail")
	public String recOk(@RequestBody RecordStuVO recordStuVO) {
		log.info("체킁recordStuVO:" + recordStuVO);
		
		recordApplyService.recOk(recordStuVO);
		return "success";
	}

	//반려 처리
	@ResponseBody
	@PutMapping("/recManDetail/reject")
	public String recReject(@RequestBody RecordStuVO recordStuVO) {
		log.info("체킁recordStuVO:" + recordStuVO);
		
		recordApplyService.recReject(recordStuVO);
		return "success";
	}
}
