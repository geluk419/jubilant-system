package com.ddit.proj.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ddit.proj.service.AttenadenceService;
import com.ddit.proj.service.TaskService;
import com.ddit.proj.vo.AttenadenceVO;
import com.ddit.proj.vo.TaskSubmitVO;
import com.ddit.proj.vo.TaskVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/prof")
public class TaskProfController {

	@Autowired
	private TaskService taskService;
	
	@Autowired
	private AttenadenceService attendence;

	// 제출완료 상세
	@GetMapping("/taskDetailScore")
	public String taskDetailScore(String lecCode, @RequestParam String taskCode, @RequestParam String memNo, Model model) {
		model.addAttribute("lecCd",lecCode);
		
		AttenadenceVO attendenceVO = attendence.lecNmByCode(lecCode);
		String lecaNm = attendenceVO.getLecaNm();
		model.addAttribute("lecaNm", lecaNm);
		
		TaskVO taskVO = this.taskService.taskDetail(taskCode);
		
		TaskSubmitVO taskSubmitVO = new TaskSubmitVO();
		taskSubmitVO.setTaskCode(taskCode);
		taskSubmitVO.setMemNo(memNo);
		taskSubmitVO = taskService.taskDetailByStu(taskSubmitVO);
		
		model.addAttribute("taskVO", taskVO);
		model.addAttribute("taskSubmitVO", taskSubmitVO);
		
		return "proflec/task/taskDetailScore";
	}

	// 제출완료 상세 > 점수 등록
	@PostMapping("/taskScoreUpdate")
	public String taskScoreUpdate(TaskSubmitVO taskSubmitVO, RedirectAttributes redirectAttributes) {
		
		int result = this.taskService.taskScoreUpdate(taskSubmitVO);
        log.info("result : " + result);
        
        redirectAttributes.addFlashAttribute("successMessage", "점수가 성공적으로 등록되었습니다!");
        
		return "redirect:/prof/taskDetailScore?lecCode=" +taskSubmitVO.getLecCode()+"&&taskCode=" + taskSubmitVO.getTaskCode() + "&&memNo=" + taskSubmitVO.getMemNo();
	} 

}