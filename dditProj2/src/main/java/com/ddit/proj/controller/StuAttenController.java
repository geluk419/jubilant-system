package com.ddit.proj.controller;

import java.io.File;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ddit.proj.service.AttenadenceService;
import com.ddit.proj.vo.AttachVO;
import com.ddit.proj.vo.AttenadenceVO;
import com.ddit.proj.vo.PaginationInfo;
import com.ddit.proj.vo.SearchVO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/stu")
public class StuAttenController {
	
	@Autowired
	private AttenadenceService attendanceService;
	
	@GetMapping(value="/atten")
	public String stuAttenCnt(@RequestParam String lecCode, Principal cusUser, Model model, SearchVO searchVO) {
		
	    log.debug("체킁:{} " + cusUser.getName());

	    PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(searchVO.getRequestPageNo());
	    paginationInfo.setRecordCountPerPage(searchVO.getRecordCountPerPage());
	    paginationInfo.setPageSize(searchVO.getPageSize());
	    
	    searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	    searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
	    searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	    searchVO.setMemNo(cusUser.getName());

	    List<AttenadenceVO> attendanceList = attendanceService.stuAtten(searchVO);

	    int totalCnt = attendanceService.stuAttenCnt(searchVO);
	    paginationInfo.setTotalRecordCount(totalCnt);
	   
	    List<AttenadenceVO> attenStuDetail = attendanceService.attenStuDetail(cusUser.getName());
	    

	    model.addAttribute("attendanceList", attendanceList);
	    model.addAttribute("attenStuDetail", attenStuDetail);
	    model.addAttribute("lecCode", lecCode);
	    model.addAttribute("lecCd", lecCode);
	    model.addAttribute("paginationInfo", paginationInfo);
	    
	    log.info("lecCode체킁:"+ lecCode);
		log.info("체킁:"+ model);
		
		return "stulec/atten/stuAtten";
	}
	
	
	
	@PostMapping("/fileUp")
	@ResponseBody
	public String fileUp(AttenadenceVO attenVO, Principal principal) throws Exception {
		
		MultipartFile yerinFile = attenVO.getAtenFile();

		AttachVO attachVO = new AttachVO();
		UUID uuid = UUID.randomUUID();
		
		String originName = yerinFile.getOriginalFilename(); //업로드 네임
				
		String uploadFileName = uuid.toString() + "_" + originName; //저장네임, 현재 안 사용
		long size = yerinFile.getSize(); //사이즈
		String ContentType = yerinFile.getContentType(); //확장자
		String savePath = "d:/attenUploads/" + yerinFile.getOriginalFilename();
		
		log.info("savePath:" + savePath);
		log.info("size:" + size);
		yerinFile.transferTo(new File(savePath));

				
		attachVO.setFileDelYn("N");
	//	attachVO.setFileNo(fileNo);
		attachVO.setFileOriNm(originName);
		attachVO.setFileNm(uploadFileName);
		attachVO.setFileSize(size);
		attachVO.setFileExtsn(ContentType);
		attachVO.setFilePath("/files/" + originName);
		
		// 맵퍼 insert
		attendanceService.insertAttach(attachVO);
		
		attenVO.setFileId(attachVO.getFileId());
		attenVO.setMemNo(principal.getName());
	
		
		log.debug("체크 {}",attenVO);
		
		
	
		
		// 업데이트
		attendanceService.updateAtt(attenVO);
		
		return "ok";
	}
}


	
		
