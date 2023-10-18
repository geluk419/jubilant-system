package com.ddit.proj.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SecurityController {
	
	// 로그인 한 학생만 접근 가능 (최초 로그인만 해당)
//	@PreAuthorize("hasRole('ROLE_STUDENT')")  
//	@GetMapping("/stu/modifyInfo")
//	public String modifyInfo() {
//		// forwarding
//		return "student/modifyInfo";
//	}
	
	
	//학생(ROLE_STUDENT)
//	if(roleNames.contains("ROLE_STUDENT")) {
//		response.sendRedirect("/student/main");
//	}
	// 로그인 한 학생만 접근 가능
	@PreAuthorize("hasRole('ROLE_STUDENT')")  
	@GetMapping("/stu/main")
	public String studentMain() {
		// forwarding
		return "student/main";
	}
	
	//교수(ROLE_PROFESSOR)
//	if(roleNames.contains("ROLE_PROFESSOR")) {
//		response.sendRedirect("/professor/main");
//	}
	// 로그인 한 교수만 접근 가능
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")  
	@GetMapping("/prof/main")
	public String professorMain() {
		// forwarding
		return "professor/main";
	}
	
	//관리자(ROLE_ADMIN)
//	if(roleNames.contains("ROLE_ADMIN")) {
//		response.sendRedirect("/admin/main");
//	}
	@PreAuthorize("hasRole('ROLE_ADMIN')")  
	@GetMapping("/admin/main")
	public String adminMain() {
		// forwarding
		return "admin/main";
	}
	
}