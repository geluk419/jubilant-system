package com.ddit.proj.controller;

import com.ddit.proj.service.StuLecApplyService;
import com.ddit.proj.vo.StuLecApplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/stu")
public class StuLecListContorller {

	@Autowired
	private StuLecApplyService service;

	// 수강 취소
	@ResponseBody
	@DeleteMapping("/deleteLecList")
	public String deleteLecList(@RequestBody StuLecApplyVO VO) {
		log.debug("로그 VO : " + VO);

		int	result = service.deleteStuLecApply(VO);

		return result != 0 ? "Delete Success" : "Delete Fail";
	}

	@ResponseBody
	@GetMapping("/getStuLecList/{memNo}")
    public List<StuLecApplyVO> getStuLecList(@PathVariable String memNo) {
//		log.info("로그 학생번호 : "+memNo);
		List<StuLecApplyVO> list = service.getStuLecList(memNo);
		log.info("로그 수강 목록 : " + list);

		return list;
	}

	@GetMapping("/stuLecList")
	public String stuLecList() {
		return "lec/stuLecList";
	}

}
