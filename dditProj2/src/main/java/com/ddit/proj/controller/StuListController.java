package com.ddit.proj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ddit.proj.mapper.MemberMapper;
import com.ddit.proj.service.StuListService;
import com.ddit.proj.service.StuMyPageService;
import com.ddit.proj.util.ArticlePage;
import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.MemberVO;
import com.ddit.proj.vo.StuMyPageVO;
import com.ddit.proj.vo.StudentVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class StuListController {
	
	@Autowired
	private StuListService stuListService;
	
	@Autowired
	private StuMyPageService stuMyPageService;
	
	@Autowired
	private MemberMapper memberMapper;
	
	// 학생 리스트 조회
	@GetMapping("/stuList")
	public String getStuList(Model model,
			@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value="size", required = false, defaultValue = "10") int size,
			@RequestParam(value="keyword", required = false, defaultValue = "") String keyword
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPage", currentPage);
		map.put("size", size);
		map.put("keyword", keyword);
		
		List<StudentVO> hsList = this.stuListService.listStu(map);  // 학생 리스트
		log.info("sList {}", hsList);                               // 확인!
		
		int total = this.stuListService.getStuTotal(map);           // 갯수 학생숫자 토탈
		log.info("total:" + total);                                 // 확인

		ArticlePage<StudentVO> s = new ArticlePage<StudentVO>(total, currentPage, size, hsList);
		model.addAttribute("sList", s);
		log.info("체크체크 {}" , s);
				
		return "student/stuList";
	}
	
	// 학생 상세보기
	@GetMapping("/stuDetail")
	public String detailStu(String memNo, Model model) {
		log.info("체킁 memNo:" + memNo);
		
		StudentVO student = new StudentVO();
		student.setMemNo(memNo);
		
		StudentVO studentVO = stuListService.detailStu(memNo);
		
	    //사용자 정보 불러오기
	    MemberVO memberVO = this.memberMapper.read(memNo);
		log.info("memberVO : " + memberVO);
		
		// 학과 정보 가져오기
	    StuMyPageVO department = stuMyPageService.department(memNo);
	    log.info("학과 : {}", department);
	    
	    // 단과대학 정보 가져오기
	    StuMyPageVO college = stuMyPageService.college(memNo);
	    log.info("단과대: {}", college);
	    
		
		model.addAttribute("studentVO", studentVO);
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("department", department); 
		model.addAttribute("college", college); 
		
		return "student/stuDetail";
	}

}
