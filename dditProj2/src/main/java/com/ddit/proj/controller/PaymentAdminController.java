package com.ddit.proj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class PaymentAdminController {
	
	// 등록금 관리 화면
    @GetMapping("/paymentAdmin")
    public String adminPayment() {
    	
        return "payment/paymentAdmin";
    }

}
