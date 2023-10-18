package com.ddit.proj.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ddit.proj.service.AttachService;
import com.ddit.proj.service.AttenadenceService;
import com.ddit.proj.service.TaskService;
import com.ddit.proj.vo.AttachVO;
import com.ddit.proj.vo.AttenadenceVO;
import com.ddit.proj.vo.MemberVO;
import com.ddit.proj.vo.TaskSubmitVO;
import com.ddit.proj.vo.TaskVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/prof")
public class TaskListController {

	@Autowired
	private TaskService taskService;

	@Autowired
	private AttachService attachService;
	
	@Autowired
	private AttenadenceService attendence;

	@Autowired
	String uploadPath;

//	과제목록 페이지 가져오기
	@GetMapping("/task")
	public String task(@RequestParam String lecCode, Principal principal, Model model,HttpServletRequest request) {
		String memNo = principal.getName();
		
		model.addAttribute("lecCd",lecCode);
		
		//	셀렉트 강의
		List<TaskVO> taskVO = taskService.getLecCode(memNo);
		model.addAttribute("lecCode", taskVO);

		return "proflec/task/taskList";
	}

	// 첫번쨰 과제목록 가져오기
	@ResponseBody
	@GetMapping("/taskList/{lecCode}")
	public List<TaskVO> taskList(@PathVariable String lecCode) {
		log.info("이제되냐" + lecCode);
		log.info("되냐????", taskService.getTaskList(lecCode));
		return taskService.getTaskList(lecCode);
	}

	// 과제 insert
	@ResponseBody
	@PostMapping("/insertTask")
	public String insertTask(TaskVO taskVO) {
		// TaskVO(taskCode=null, lecCode=3, taskNm=d, taskCon=asfd, taskDe=null,
		// taskDead=2023-09-15
		// , taskScore=10, taskDelYn=null, taskUpdde=null, taskDeadYn=null, fileId=null,
		// lecaNm=null
		// ,
		// taskFiles=[org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@4a4ae485])

		// 데이터베이스에 과제정보 삽입
		int insertedTaskCount = taskService.insertTask(taskVO);

		log.info("항상 넘어온 값 확인:{}", taskVO);
		String fileId = taskVO.getFileId();

		MultipartFile[] files = taskVO.getTaskFiles();

		AttachVO attachVO = new AttachVO();
		attachVO.setFileId(fileId);
		UUID uuid = UUID.randomUUID();

		log.info("files!!!" + files);
		for (MultipartFile file : files) {
			String originName = file.getOriginalFilename(); // 업로드네임
			String uploadFileName = uuid.toString() + "_" + originName; // 저장네임
			long size = file.getSize(); // 사이즈
			String ContentType = file.getContentType(); // 확장자
			String savePath = uploadPath + "\\" + originName;// 저장경로

			log.info("size : " + size);
			attachVO.setFileOriNm(originName);// 업로드네임
			attachVO.setFileNm(uploadFileName);// 저장네임
			attachVO.setFileSize(size);// 사이즈
			attachVO.setFileExtsn(ContentType);// 확장자
			attachVO.setFilePath("/files/"+originName);// 저장경로
			attachVO.setFileId(fileId);

			if (!file.isEmpty()) {
				try {
					file.transferTo(new File(savePath));
					int insertedAttachedCount = taskService.insertAttach(attachVO);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}

		return "success";
	}

	@ResponseBody
	@PostMapping("/updateTask")
	public String updateTask(TaskVO taskVO) {
		log.info("updateTask->taskVO : " + taskVO);
		log.info("업데이트 나와라");
		String taskCode = taskVO.getTaskCode();
		log.info("taskCode!!!!"+ taskCode);
		String taskNm = taskVO.getTaskNm();
		log.info("taskNm!!!!"+ taskNm);
		String fileId = taskVO.getFileId();
		log.info("fileId!!!!"+ fileId);
		
		int updatedTask = taskService.updateTask(taskVO);
		AttachVO attachVO = new AttachVO();
		log.info("attachVO!!!!!"+ attachVO);
		attachVO.setFileId(fileId);
		
		MultipartFile[] files = taskVO.getTaskFiles();
		UUID uuid = UUID.randomUUID();
		
		if(files !=null) {
			int updatedtaskcount = attachService.updateAttach(attachVO);
			
			for (MultipartFile file : files) {
				String originName = file.getOriginalFilename(); // 업로드네임
				String uploadFileName = uuid.toString() + "_" + originName; // 저장네임
				long size = file.getSize(); // 사이즈
				String ContentType = file.getContentType(); // 확장자
				String savePath = uploadPath + "\\" + originName;// 저장경로

				log.info("size : " + size);
				attachVO.setFileOriNm(originName);// 업로드네임
				attachVO.setFileNm(uploadFileName);// 저장네임
				attachVO.setFileSize(size);
				;// 사이즈
				attachVO.setFileExtsn(ContentType);// 확장자
				attachVO.setFilePath("/files/" + originName);// 저장경로
				attachVO.setFileId(fileId);

				if (!file.isEmpty()) {
					try {
						file.transferTo(new File(savePath));
						int insertedAttachedCount = taskService.insertAttach(attachVO);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				
				
			}
		}
		
		return "success";
	}
	
	//과제 삭제 
	@ResponseBody
	@PostMapping("/deleteTask")
	public String deleteTask(TaskVO taskVO) {
		log.info("삭제나왔냐?");
		String taskCode = taskVO.getTaskCode();
		
		int delTask = taskService.deleteTask(taskVO);
		
		String fileId = taskVO.getFileId();

		AttachVO attachVO = new AttachVO();
		attachVO.setFileId(fileId);
		
		int delAttach = attachService.updateAttach(attachVO);
		
		return "success";
	}

	@GetMapping("/submitTaskList")
	public String submitTask(String lecCode, String taskCode, Model model, HttpServletRequest request) {	
		model.addAttribute("lecCd",lecCode);
		
		AttenadenceVO attendenceVO = attendence.lecNmByCode(lecCode);
		String lecaNm = attendenceVO.getLecaNm();
		model.addAttribute("lecaNm", lecaNm);
		
		List<TaskVO> taskVOList = this.taskService.getTask(taskCode);
		List<TaskSubmitVO> taskSubmitVOList = this.taskService.getTaskSubmit(taskCode);

		model.addAttribute("taskVOList", taskVOList);
		model.addAttribute("taskSubmitVOList", taskSubmitVOList);
		
		log.info("taskVOList"+taskVOList);
		log.info("taskSubmitVOList"+taskSubmitVOList);
		
		return "proflec/task/submitTaskList";
	}

	@GetMapping("/submitDetail")
	public String submitDetail() {
		return "proflec/task/submitDetailTask";
	}
}
