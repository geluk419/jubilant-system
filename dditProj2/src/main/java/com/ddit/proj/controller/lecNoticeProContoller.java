package com.ddit.proj.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ddit.proj.service.AttachService;
import com.ddit.proj.service.LecNoticeProService;
import com.ddit.proj.service.TaskService;
import com.ddit.proj.vo.AttachVO;
import com.ddit.proj.vo.LecNoticeVO;
import com.ddit.proj.vo.TaskVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/prof")
public class lecNoticeProContoller {

	
	@Autowired
	String uploadPath;
	@Autowired
	private LecNoticeProService lecNoticeProService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private AttachService attachService;
	
	@GetMapping("/lecNotice")
	public String lecNotic(@RequestParam String lecCode,Principal principal,Model model) {
		String memNo = principal.getName();
		
		log.info("lecCodekkkkkkkk"+lecCode);
		
		model.addAttribute("lecCd",lecCode);
		//	셀렉트 강의
		List<LecNoticeVO> lecNoticeVO = lecNoticeProService.getlecCode(memNo);
		
		model.addAttribute("lecCode",lecNoticeVO);
		
		return "proflec/notice/lecNoticePro";
	}
	
	//강의게시판 목록 불러오기
	@ResponseBody
	@GetMapping("/lecNotice/{lecCode}")
	public List<LecNoticeVO> getListLecNotice(@PathVariable String lecCode){
		log.info("lecCode체크"+lecCode);
		//LecNoticeVO(lecnCode=13, noticeFiles=null, lecnCataCode=null, lecnTtl=혼자 공부하는 강의자료, lecnCon=혼자 공부하는 자바 강의자료입니다, lecnDe=Mon Sep 25 00:00:00 KST 2023
		//, lecnUpdde=null, fileId=lecnotice3, filePath=null, subNm=null, lecCode=004, lecaNm=null, lecStatYn=null, lecDelYn=null, lecaYr=0, lecaSem=0, lecaTrg=0)]
		log.info("getListLecNotice->체크 : "+lecNoticeProService.getListLecNotice(lecCode));
		return lecNoticeProService.getListLecNotice(lecCode);
	}
	
	@ResponseBody
	@PostMapping("/insertNotice")
	public String insertNotice(Principal principal,LecNoticeVO lecNoticeVO) {
		String memNo = principal.getName();
		
		log.info("넘어왔다");
		log.info("lecNoticeVO!!!!" + lecNoticeVO);
		
		lecNoticeProService.insertLecNotice(lecNoticeVO);
		
		String fileId = lecNoticeVO.getFileId();
		MultipartFile[] files = lecNoticeVO.getNoticeFiles();
		UUID uuid = UUID.randomUUID();
		AttachVO attachVO = new AttachVO();
		attachVO.setFileId(fileId);
		
		log.info("fileId!!!!!!!!!"+ fileId);
		
		if(files !=null) {
//			int updatedtaskcount = attachService.updateAttach(attachVO);
			
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
		return "OK";
	}
	
	@ResponseBody
	@PostMapping("/updateLecnotice")
	public String updateLecnotice(LecNoticeVO lecNoticeVO) {
		log.info("업데이트 나와라");
		String lecnCode = lecNoticeVO.getLecnCode();
		log.info("taskCode!!!!"+ lecnCode);
		String lecnTtl = lecNoticeVO.getLecnTtl();
		log.info("taskNm!!!!"+ lecnTtl);
		String fileId = lecNoticeVO.getFileId();
		log.info("fileId!!!!"+ fileId);
		
		int updatedLecNotice = lecNoticeProService.updatelecNotice(lecNoticeVO);
		AttachVO attachVO = new AttachVO();
		log.info("attachVO!!!!!"+ attachVO);
		attachVO.setFileId(fileId);
		
		MultipartFile[] files = lecNoticeVO.getNoticeFiles();
		UUID uuid = UUID.randomUUID();
		
		log.info("files체카"+ files);
		
		if (files != null) {
			int updatedcount = attachService.updateAttach(attachVO);

	        for (MultipartFile file : files) {
	            if (!file.isEmpty()) {
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
	
	

	//강의게시판 삭제 
	@ResponseBody
	@PostMapping("/deleteLecNotice")
	public String deleteLecNotice(LecNoticeVO lecNoticeVO) {
		log.info("삭제나왔냐?");
		String lecnCode = lecNoticeVO.getLecCode();

		int delNotice  = lecNoticeProService.deletelecNotice(lecNoticeVO);
		
		String fileId = lecNoticeVO.getFileId();
		
		AttachVO attachVO = new AttachVO();
		attachVO.setFileId(fileId);
		
		int delAttach = attachService.updateAttach(attachVO);
		
		return "success";
	}

	
	
	
	
	
	
}
