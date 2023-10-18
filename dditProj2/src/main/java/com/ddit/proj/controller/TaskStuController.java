package com.ddit.proj.controller;

import java.io.File;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ddit.proj.service.AttenadenceService;
import com.ddit.proj.service.TaskService;
import com.ddit.proj.vo.AttachVO;
import com.ddit.proj.vo.AttenadenceVO;
import com.ddit.proj.vo.DepartmentVO;
import com.ddit.proj.vo.MemberVO;
import com.ddit.proj.vo.TaskSubmitVO;
import com.ddit.proj.vo.TaskVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stu")
public class TaskStuController {

	@Autowired
	private TaskService taskService;
	
	@Autowired
	private AttenadenceService attendence;

	@GetMapping("/task")
	public String getStuAtten(@RequestParam String lecCode,Model model) {
		
		model.addAttribute("lecCd", lecCode);
		
		return "stulec/task/stuTaskList";
	}
	
	// 학생 과제 리스트 (제출 확인)
	@GetMapping("/taskList")
	public String taskList(String lecCode, Model model, Principal principal) {
		AttenadenceVO attendenceVO = attendence.lecNmByCode(lecCode);
		String lecaNm = attendenceVO.getLecaNm();
		model.addAttribute("lecaNm", lecaNm);
		
		String memNo="202308S001";
		if(principal != null ) {
			memNo = principal.getName(); 
		}	
		
		List<TaskVO> taskVOList = this.taskService.getTaskList(lecCode);
		List<TaskSubmitVO> taskSubmitVOList = this.taskService.getTaskListByStu(memNo);

		log.info("과제 제출 확인 : " + taskSubmitVOList);

		model.addAttribute("taskVOList", taskVOList);
		model.addAttribute("lecCode", lecCode);
		model.addAttribute("lecCd", lecCode);
		model.addAttribute("taskSubmitVOList", taskSubmitVOList);
		
		log.info("taskVOList"+taskVOList);
		log.info("lecCode"+lecCode);
		log.info("taskSubmitVOList"+taskSubmitVOList);

		return "stulec/task/stuTaskList";
	}
	
	// 학생 과제 미제출 상세
	@GetMapping("/taskDetail")
	public String taskDetail(String lecCode, @RequestParam String taskCode, Model model) {
		AttenadenceVO attendenceVO = attendence.lecNmByCode(lecCode);
		String lecaNm = attendenceVO.getLecaNm();
		model.addAttribute("lecaNm", lecaNm);
		
		log.info("taskDetail 도착");
		model.addAttribute("lecCd", lecCode);

		TaskVO taskVO = this.taskService.taskDetail(taskCode);
	    model.addAttribute("taskVO", taskVO);
		
		return "stulec/task/taskDetail";
	}

	// 학생 과제 제출완료 상세
	@GetMapping("/taskDetailComplete")
	public String taskDetailComplete(String lecCode, @RequestParam String taskCode, @RequestParam String memNo, Model model) {
		model.addAttribute("lecCd", lecCode);
		
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
		
		return "stulec/task/taskDetailComplete";
	}

	// 과제상세 > 제출
	@PostMapping("/taskSubmit")
	public String submitTask(TaskSubmitVO taskSubmitVO, Principal principal) throws Exception {
		String memNo="202308S001";
		if(principal != null ) {
			memNo = principal.getName(); 
		}	 
		
		AttachVO attachVO = new AttachVO();
		
		if (taskSubmitVO.getUploadFile() != null && !taskSubmitVO.getUploadFile().isEmpty()) {
			MultipartFile File = taskSubmitVO.getUploadFile();
	
			UUID uuid = UUID.randomUUID();
			
			String originName = File.getOriginalFilename(); //업로드 네임
					
			String uploadFileName = uuid.toString() + "_" + originName; //저장네임, 현재 안 사용
			long size = File.getSize(); //사이즈
			String ContentType = File.getContentType(); //확장자
			String savePath = "D:/myTool/sts3WS/dditProj/src/main/webapp/resources/upload/" + File.getOriginalFilename();
			
			log.info("savePath:" + savePath);
			log.info("size:" + size);
			File.transferTo(new File(savePath));
	
			attachVO.setFileOriNm(originName);
			attachVO.setFileNm(uploadFileName);
			attachVO.setFileSize(size);
			attachVO.setFileExtsn(ContentType);
			attachVO.setFilePath("/files/" + originName);
	
			taskService.insertSubmitAttach(attachVO);
			
			taskSubmitVO.setFileId(attachVO.getFileId());
		}
		
		taskSubmitVO.setMemNo(memNo);
		log.debug("체크 {}",taskSubmitVO);
		
		int result = this.taskService.submitTask(taskSubmitVO);
        log.info("result : " + result);
		
		return "redirect:/stu/taskList?lecCode=" + taskSubmitVO.getLecCode();
	}
	
	// 학생 과제 제출 수정
	@PostMapping("/updateTaskDetail")
	public String updateTaskDetail(TaskSubmitVO taskSubmitVO, Principal principal) throws Exception {
		String memNo="202308S001";
		if(principal != null ) {
			memNo = principal.getName(); 
		}	 

		AttachVO attachVO = new AttachVO();

		if (taskSubmitVO.getUploadFile() != null && !taskSubmitVO.getUploadFile().isEmpty()) {
			MultipartFile File = taskSubmitVO.getUploadFile();

			UUID uuid = UUID.randomUUID();

			String originName = File.getOriginalFilename(); //업로드 네임

			String uploadFileName = uuid.toString() + "_" + originName; //저장네임, 현재 안 사용
			long size = File.getSize(); //사이즈
			String ContentType = File.getContentType(); //확장자
			String savePath = "D:/myTool/sts3WS/dditProj/src/main/webapp/resources/upload/" + File.getOriginalFilename();

			log.info("savePath:" + savePath);
			log.info("size:" + size);
			File.transferTo(new File(savePath));

			attachVO.setFileOriNm(originName);
			attachVO.setFileNm(uploadFileName);
			attachVO.setFileSize(size);
			attachVO.setFileExtsn(ContentType);
			attachVO.setFilePath("/files/" + originName);

			taskService.insertSubmitAttach(attachVO);

			taskSubmitVO.setFileId(attachVO.getFileId());
		}

		taskSubmitVO.setMemNo(memNo);
		log.debug("체크 {}",taskSubmitVO);

		int result = this.taskService.updateTaskDetail(taskSubmitVO);
		return "redirect:/stu/taskDetailComplete?lecCode="+ taskSubmitVO.getLecCode() +"&&taskCode=" + taskSubmitVO.getTaskCode() + "&&memNo=" + taskSubmitVO.getMemNo();
	}
	

	// 학생 과제 제출 삭제
	@PostMapping("/deleteTaskDetail")
	public String deleteTaskDetail(TaskSubmitVO taskSubmitVO, HttpServletRequest request, MultipartFile mpf) {
		int result = this.taskService.deleteTaskDetail(taskSubmitVO.getTsubCode());
		
		return "redirect:/stu/taskList?lecCode=" + taskSubmitVO.getLecCode();
	}

}