package com.ddit.proj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/session")
public class SessionController {

    @PostMapping("/extend")
    @ResponseBody
    public String extendSession(HttpSession session) {
        try {
            // 세션의 유효 시간을 연장 (예: 30분 연장)
            session.setMaxInactiveInterval(30 * 60); // 세션 유효 시간을 초 단위로 설정

            return "세션 연장 완료";
        } catch (Exception e) {
            e.printStackTrace();
            return "세션 연장 실패";
        }
    }
}

