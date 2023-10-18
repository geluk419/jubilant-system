package com.ddit.proj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddit.proj.service.DormitoryService;
import com.ddit.proj.vo.DormitoryApplyFormVO;
import com.ddit.proj.vo.DormitoryApplyVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stu")
public class DormitoryApplyController {
	
	@Autowired
	private DormitoryService dormitoryService;
	
	@GetMapping("/dormitoryApplyForm")
	public String applyForm(Model model,Authentication auth){
		
		String memNo = auth.getName();
		DormitoryApplyFormVO dormitoryApplyFormVO = dormitoryService.getDormiFormVO(memNo);
		log.debug("dormitoryApplyFormVO" + dormitoryApplyFormVO);

	    model.addAttribute("dormitoryApplyFormVO", dormitoryApplyFormVO);
	    
		
		return "dormitory/dormitoryApply";  // 신청 폼 화면
	}
	
	
	@GetMapping("/dormitoryApplyList")
	public List<DormitoryApplyVO> getList(){
		return dormitoryService.listDormi();
	}
	
	
	@GetMapping("/dormitoryApply/{stuMemNo}")
	public DormitoryApplyVO getDormi(@PathVariable String stuMemNo) {
		DormitoryApplyVO dormitoryApplyVO = new DormitoryApplyVO();
		dormitoryApplyVO.setStuMemNo(stuMemNo);
		return dormitoryService.getDormi(dormitoryApplyVO);
	}
	
	@ResponseBody
	@PostMapping("/dormitoryApply")
	public String insertDormi(@RequestBody DormitoryApplyVO dormitoryApplyVO) {
		return Integer.toString(dormitoryService.insertDormi(dormitoryApplyVO));
	}
	
	
	@PutMapping("/dormitoryApply")
	public String updateDormi(@RequestBody DormitoryApplyVO dormitoryApplyVO) {
		return Integer.toString(dormitoryService.updateDormi(dormitoryApplyVO));
	}
	
	
	@DeleteMapping("/dormitoryApply/{stuMemNo}")
	public String deleteDormi(@PathVariable String stuMemNo) {
		DormitoryApplyVO dormitoryApplyVO = new DormitoryApplyVO();
		dormitoryApplyVO.setStuMemNo(stuMemNo);;
		return Integer.toString(dormitoryService.deleteDormi(dormitoryApplyVO));
	}
	
}
