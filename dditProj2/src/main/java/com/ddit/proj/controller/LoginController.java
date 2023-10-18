package com.ddit.proj.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddit.proj.service.LoginService;
import com.ddit.proj.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/security")
@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginservice;
	
	@Autowired
    private JavaMailSender mailSender;
	
	// 로그인 페이지로 포워딩
	// 요청URI : /security/login
	// 요청방식 : get
	@GetMapping("/login")
	public String login() {
		// forwarding
		return "/security/login";
	}
	
	// ID 찾기 페이지 로드
	@GetMapping("/findId1")
	public String findId() {
	
	    return "/security/findId";
	}
	
	// ID 조회 눌렀을 때
	@ResponseBody
	@GetMapping("/findId1/{memMl}/{memNm}")
	public String findId(@PathVariable("memMl") String memMl, @PathVariable("memNm") String memNm) {
		log.info("확인" + memMl);
		log.info("확인" + memNm);
		MemberVO memberVO = new MemberVO();
		memberVO.setMemMl(memMl);
		memberVO.setMemNm(memNm);
		String memNo = loginservice.findId(memberVO);
		
		return memNo;
	}
	
	// PW 찾기 페이지 로드
	@GetMapping("/findPw1")
	public String findPw() {
		
		return "/security/findPw";
	}
	
	// PW 조회를 눌렀을 때
	@ResponseBody
	@GetMapping("/findPw1/{memMl}/{memNo}")
	public String findPw(@PathVariable("memMl") String memMl, @PathVariable("memNo") String memNo) {
	    // 이메일과 아이디를 이용하여 임시 비밀번호 생성
	    String tempPassword = generateTempPassword();
	    log.info("임시:"+tempPassword);
	    MemberVO memberVO = new MemberVO();
	    memberVO.setMemMl(memMl);
	    memberVO.setMemNo(memNo);
	    memberVO.setMemPass(tempPassword);

	    // 임시 비밀번호를 데이터베이스에 업데이트
	    loginservice.updatePassword(memberVO);

	    // 이메일 전송
	    boolean emailSent = sendEmail(memMl, "취업딱대학교 임시 비밀번호 발송", tempPassword);

	    if (emailSent) {
	        return "success";
	    } else {
	        return "fail";
	    }
	}

	// 임시 비밀번호를 생성
	private String generateTempPassword() {
		// 임시 비밀번호 8자리 생성
		int length = 8;
	    String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	    StringBuilder tempPassword = new StringBuilder();

	    for (int i = 0; i < length; i++) {
	        int randomIndex = (int) (Math.random() * characters.length());
	        char randomChar = characters.charAt(randomIndex);
	        tempPassword.append(randomChar);
	    }

	    return tempPassword.toString();
	}

	// 이메일 전송 로직
	private boolean sendEmail(String memMl, String subject, String tempPassword) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true,"UTF-8");

            helper.setFrom("kch774386@naver.com"); // 보내는 이메일 주소
            helper.setTo(memMl); // 수신자 이메일 주소
            helper.setSubject("취업딱대학교 임시 비밀번호 입니다."); // 이메일 제목
            helper.setText("임시 비밀번호는 " + tempPassword + "입니다."); // 이메일 내용

            mailSender.send(message); // 이메일 전송
            log.info("메일발송완료호");
            return true; // 전송 성공
        } catch (Exception e) {
            e.printStackTrace();
            return false; // 전송 실패
        }
    }
}