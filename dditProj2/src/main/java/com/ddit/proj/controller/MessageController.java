package com.ddit.proj.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddit.proj.service.DepartmentService;
import com.ddit.proj.service.MemberService;
import com.ddit.proj.service.MessageService;
import com.ddit.proj.util.ArticlePage;
import com.ddit.proj.vo.MemberVO;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Slf4j
@Controller
@RequestMapping("/admin")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	//사용자 리스트 페이지
	@GetMapping("/message")
	public String getMemberList(Model model,
			@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value="size", required = false, defaultValue = "10") int size,
			@RequestParam(value="keyword", required = false, defaultValue = "") String keyword
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPage", currentPage);
		map.put("size", size);
		map.put("keyword", keyword);
		
		log.info("체킁:");
		
		List<MemberVO> data = this.messageService.listMember(map);
		log.info("data : " + data);
		
//			model.addAttribute("memberList", data);
		
		int total = this.messageService.getMemberTotal(map);
		log.info("total:" + total);
		ArticlePage<MemberVO> article = new ArticlePage<MemberVO>(total, currentPage, size, data);
		model.addAttribute("data", new ArticlePage<MemberVO>(total, currentPage, size, data));
		List<MemberVO> memberList = article.getContent();
		model.addAttribute("memberList", memberList);
		log.info("킁킁"+memberList);
//			mav.setViewName("member/memberList");
		
		//forwarding
		return "member/message";
	}
	
	//라디오버튼 체크시 해당하는 학번/교번 자동 생성
//	@ResponseBody
//	@GetMapping("/messageChoose")
//	public String memberChoose(String memberType) {
//		log.info("memberType : " + memberType);
//		
//		String memNo = messageService.chooseMemNo(memberType);
//		log.info("memNo: " + memNo);
//		
//		return memNo; 
//	}
	@ResponseBody
	@PostMapping("/sendMessage")
	public String sendMessage(@RequestBody Map<String, Object> requestData){
	    Message coolsms = new Message("NCSX3JIYQRRQVH5Z", "XORRVDIQ7DERRDOINGFW6TQFYNQAEPFM");
	    
	    String sendTel = (String) requestData.get("sendTel");
	    String cont = (String) requestData.get("cont");
	    List<Map<String, String>> selectedRecipients = (List<Map<String, String>>) requestData.get("selectedRecipients");

	    log.info("sendTel체크"+ sendTel);
	    log.info("cont체크"+ cont);
		log.info("selectedRecipients체크"+ selectedRecipients);
		String value = selectedRecipients.get(0).get("number");
		log.info("value체크"+ value);
		
        HashMap<String, String> params = new HashMap<String, String>();
        
        for(int i =0; i <selectedRecipients.size();i++) {
	        params.put("to", selectedRecipients.get(i).get("number"));
	        params.put("from", sendTel);
	        params.put("type", "SMS");
	        params.put("text", cont);
	        params.put("app_version", "test app 1.2"); // application name and version
			
	        try {
	            JSONObject obj = (JSONObject) coolsms.send(params);
	            System.out.println(obj.toString());
	
	        } catch (CoolsmsException e) {
	            System.out.println(e.getMessage());
	            System.out.println(e.getCode());
	        }
        
        }
        
		return "succes";
	}
	
}
