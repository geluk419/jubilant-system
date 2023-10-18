package com.ddit.proj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddit.proj.service.LectureService;
import com.ddit.proj.service.StuLecApplyService;
import com.ddit.proj.service.SubjectService;
import com.ddit.proj.util.ArticlePage;
import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.DepartmentVO;
import com.ddit.proj.vo.LecApplyVO;
import com.ddit.proj.vo.LectureVO;
import com.ddit.proj.vo.StuLecApplyVO;
import com.ddit.proj.vo.StudentVO;
import com.ddit.proj.vo.SubjectVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class LectureAdminController {
	
	@Autowired LectureService lectureService;
	
	@Autowired
    private StuLecApplyService service;
	
	// 과목 리스트 조회
	@GetMapping("/lectureList")
	public String lectureList(Model model, 
			@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value="size", required = false, defaultValue = "10") int size,
			@RequestParam(value="keyword", required = false, defaultValue = "") String keyword
			) {
	    // Create a HashMap and add key-value pairs
		log.info("여기확인");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPage", currentPage);
		map.put("size", size);
		map.put("keyword", keyword);
	    
	    List<LectureVO> lectureList = lectureService.listLecture(map);
	    int total = lectureService.getLecTotal(map);
	    
	    ArticlePage<LectureVO> l = new ArticlePage<LectureVO>(total, currentPage, size, lectureList);
	    
	    model.addAttribute("lList", l);
	    
	    return "lec/lectureList";
	}
	
	
	@ResponseBody
	@GetMapping("/lectureDetail/{lecaId}")
	public List<StuLecApplyVO> selectStuLecApply(@PathVariable String lecaId){
		//	        log.info("로그 : 강의계획서 "+lecaId);
		List<StuLecApplyVO> list = service.selectStuLecApply(lecaId);
		log.info("로그 : 강의계획서 "+list);
		return list;
}
	
	@ResponseBody
	@PostMapping("/lecStatus")
	public int lecStatus(LectureVO lecturVo) {
		log.info("lecturVo="+lecturVo);
		
		int lecStatus = lectureService.updLecStatus(lecturVo);
		
		
		return lecStatus;
	}
}








