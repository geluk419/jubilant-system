package com.ddit.proj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddit.proj.service.StuMyPageService;
import com.ddit.proj.vo.StuMyPageVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stu")
public class PaymentController {
	
	@Autowired
	private StuMyPageService stuMyPageService;
    
	// 등록내역 조회 화면
    @GetMapping("/payment")
    public String payment() {
        log.info("체크:");
        return "payment/paymentTable";
    }
    
    // 납부 확인서
    @GetMapping("/print")
    public String print(Model model, Authentication auth) {
    	
    	// 학년 불러오기
	    String memNo = auth.getName();
	    StuMyPageVO gradeInfo = stuMyPageService.grade(memNo);
	    
	    // 학과 정보 가져오기
	    StuMyPageVO department = stuMyPageService.department(memNo);
	    log.info("학과 : {}", department);
    	
	    // 단과대학 정보 가져오기
	    StuMyPageVO college = stuMyPageService.college(memNo);
	    log.info("단과대: {}", college);
	    
	    model.addAttribute("gradeInfo", gradeInfo); 
	    model.addAttribute("department", department);
	    model.addAttribute("college", college);
	    
    	return "payment/printPayment";
    }
    
    // 등록금 고지서
    @GetMapping("/printBill")
    public String printBill(Model model, Authentication auth) {
    	
    	// 학년 불러오기
	    String memNo = auth.getName();
	    StuMyPageVO gradeInfo = stuMyPageService.grade(memNo);
	    
	    // 학과 정보 가져오기
	    StuMyPageVO department = stuMyPageService.department(memNo);
	    log.info("학과 : {}", department);
    	
	    model.addAttribute("gradeInfo", gradeInfo); 
	    model.addAttribute("department", department); 
    	
    	return "payment/printBill";
    }

}
