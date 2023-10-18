package com.ddit.proj.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ddit.proj.service.LecNoticeService;
import com.ddit.proj.vo.AttachVO;
import com.ddit.proj.vo.LecNoticeVO;
import com.ddit.proj.vo.SearchVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stu")
public class LecNoticeController {

	@Autowired
	private LecNoticeService lecNoticeService;


	@GetMapping("/lecNotice")
	public String applyForm(@RequestParam String lecCode, SearchVO searchVO, Model model, Authentication auth) {

		log.debug("체크{}", auth.getName());

		List<LecNoticeVO> lecNoticeList = lecNoticeService.getLecNoticeVO(searchVO);
		log.debug("lecNoticeVO" + lecNoticeList);

		model.addAttribute("lecCode", searchVO.getLecCode());
		model.addAttribute("lecCd", searchVO.getLecCode());
		model.addAttribute("lecNoticeList", lecNoticeList);

		return "stulec/lec/lecNotice";
	}

	

	@GetMapping("/lecList")
	public List<LecNoticeVO> getlistLecNotice() {
		return lecNoticeService.listLecNotice();
	}

}
