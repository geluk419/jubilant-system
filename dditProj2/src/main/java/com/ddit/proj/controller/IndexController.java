package com.ddit.proj.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class IndexController {

//	인덱스 페이지로 이동
	@GetMapping("/index")
	public String getMyPage() {
		return "tiles/index";
	}


}
