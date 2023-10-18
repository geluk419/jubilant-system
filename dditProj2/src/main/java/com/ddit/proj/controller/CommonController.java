package com.ddit.proj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common")
public class CommonController {
	
	@GetMapping("/map")
	public String campus() {
		return "common/campus";		// 캠퍼스맵 조회
	}
	
	@GetMapping("/road")
	public String road() {
		return "common/road";		// 오시는 길 조회
	}

}
