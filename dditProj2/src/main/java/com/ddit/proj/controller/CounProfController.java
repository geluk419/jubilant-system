package com.ddit.proj.controller;

import java.security.Principal;
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

import com.ddit.proj.service.CounselService;
import com.ddit.proj.vo.CounselVO;
import com.ddit.proj.vo.ObjectionVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/prof")
public class CounProfController {
	
	@Autowired
	private CounselService counsel;

	@GetMapping("/coun")
	public String getStuAtten(Principal principal,Model model, @RequestParam(required = false) String keyword, @RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "5") int size) {
		String proMemNo = "202008P003";
		if (principal != null) {
			proMemNo = principal.getName();
		}
		log.info("체킁",proMemNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("proMemNo", proMemNo);
	    map.put("keyword", keyword);
		
	    int startRow = ((currentPage-1)*size) + 1;
	    int endRow = startRow + size -1;
	    map.put("startRow", startRow);
	    map.put("endRow", endRow);
	    
	    log.info("map Test : " + map );
		
		List<CounselVO> counselVOList = counsel.listCounsel(map);
		int totalCounsel = counsel.countCounsel(map);
		
		log.debug("페이징:" + Math.ceil(((double)totalCounsel / size)) + "  " + ((double)totalCounsel / size));
	    
	    model.addAttribute("counselVOList", counselVOList);
	    model.addAttribute("totalCounsel", totalCounsel);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("size", size);
	    model.addAttribute("pageCnt", (int)Math.ceil(((double)totalCounsel / size)));
		
		return "coun/profCoun";
	}

	//상담 승인
	@ResponseBody
	@PutMapping(value = "/approveCnsl", produces = "application/json;charset=utf-8")
	public int approveCnsl(@RequestBody CounselVO counselVO) {
		int result = this.counsel.approveCnsl(counselVO);
		return result;
	}

	//상담 반려
	@ResponseBody
	@PutMapping(value = "/rejectCnsl", produces = "application/json;charset=utf-8")
	public int rejectCnsl(@RequestBody CounselVO counselVO) {
		int result = this.counsel.rejectCnsl(counselVO);
		return result;
	}
	
	// 검색
	@ResponseBody
	@GetMapping("/searchCnsl")
	public List<CounselVO> searchCnsl(Principal principal, Model model, @RequestParam Map<String, Object> map) {
		String proMemNo = "202008P003";
		if (principal != null) {
			proMemNo = principal.getName();
		}
		map.put("proMemNo", proMemNo);
		
		String searchValue = (String) map.get("searchValue");
		String nm = (String) map.get("nm");
		String no = (String) map.get("no");
		
		log.info("nm"+nm);
		log.info("no"+no);
		
		List<CounselVO> counselVOList;
		
	    int currentPage = 1;   // 일단 기본값 1페이지
	    int size = 5;         // 페이지당 5개씩
	    int startRow = ((currentPage-1)*size) + 1;
	    int endRow = startRow + size -1;
	    
	    map.put("startRow", startRow);
	    map.put("endRow", endRow);
	    
	    if (searchValue != null && !searchValue.isEmpty()) {
	        map.put("keyword", searchValue); 
	        counselVOList = counsel.listCounsel(map);
	    } else {
	    	counselVOList = counsel.listCounsel(map);
	    }

	    model.addAttribute("counselVOList", counselVOList);
	    return counselVOList;
	}
}
