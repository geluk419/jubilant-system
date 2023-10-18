package com.ddit.proj.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ddit.proj.service.NoticeService;
import com.ddit.proj.util.ArticlePage;
import com.ddit.proj.vo.AttachVO;
import com.ddit.proj.vo.NoticeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class NoticeAdminController {
	
	@Autowired
	public NoticeService noticeService;
	
	//공지사항 리스트 페이지
	@GetMapping("/notice")
	public String getNoticeList(Model model,
			@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value="size", required = false, defaultValue = "10") int size,
			@RequestParam(value="keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value="ntcSeCode", required = false, defaultValue = "") String ntcSeCode
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPage", currentPage);
		map.put("size", size);
		map.put("keyword", keyword);
		map.put("ntcSeCode", ntcSeCode);
		
		log.info("체킁:" + map);
		
		List<NoticeVO> data = this.noticeService.listNotice(map);
		log.info("data : " + data);
		log.info("data갯수 : " + data.size());
		
		for(NoticeVO notice : data) {
			boolean attachOX = notice.getFileId() != null && !notice.getFileId().isEmpty();
			notice.setAttachOX(attachOX);
		
		}
		
		int total = this.noticeService.getNoticeTotal(map);
		log.info("total:" + total);
		ArticlePage<NoticeVO> n = new ArticlePage<NoticeVO>(total, currentPage, size, data);
		model.addAttribute("data", new ArticlePage<NoticeVO>(total, currentPage, size, data));
		List<NoticeVO> noticeList = n.getContent();
		model.addAttribute("noticeList", noticeList);
		log.info("체킁" + noticeList);
		model.addAttribute("notice", noticeService.noticeSelect("NOTI"));
		
		return "notice/noticeAdminList";
	}
	
	
	//공지사항 등록 페이지
	@GetMapping("/noticeRegister")
	public String getNoticeRegister(Model model) {
		
		model.addAttribute("noticeSelect", noticeService.noticeSelect("NOTI"));
		
		log.info("체킁:" , noticeService.noticeSelect("NOTI"));
		
		return "notice/noticeRegister";
	}
	
	//공지사항 insert
	//NoticeVO(ntcCode=null, memNo=201903E007, memNm=김영수, ntcTtl=학사공지, ntcCon=null, ntcSeCode=, ntcDt=Mon Sep 18 00:00:00 KST 2023, fileDelYn=null, ntcUpdde=null, fileId=null, noticeFiles=[org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@45a7bbba]
	@ResponseBody
	@PostMapping("/noticeRegister")
	public String insertAttach(NoticeVO noticeVO) {
		//NoticeVO(ntcCode=null, memNo=201903E007, memNm=김영수, ntcTtl=학사공지, ntcCon=<p>ㄴㅁㅇㄹ</p>
		//, ntcSeCode=, ntcDt=Mon Sep 18 00:00:00 KST 2023, fileDelYn=null, ntcUpdde=null, 
		//fileId=null, noticeFiles=[org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@37461296])
		log.info("insertAttach->noticeVO : " + noticeVO);
		
//		int insertedNotice = noticeService.insertNotice(noticeVO);
		noticeService.insertNotice(noticeVO);

		return "success";
		//redirect
		//return "redirect:/admin/notice";
	}
	
	//notice 상세 페이지
	@GetMapping("/noticeDetail")
	public String getNoticeDetail(String ntcCode, Model model) {
		log.info("체킁:");
		
		noticeService.hitNotice(ntcCode);
		
		NoticeVO notice = new NoticeVO();	
		notice.setNtcCode(ntcCode);
		
		NoticeVO noticeVO = noticeService.getNotice(notice);
		log.info("체킁 : "+noticeVO);
		
		model.addAttribute("noticeVO",noticeVO);
		
		return "notice/noticeDetail";
	}
		
	//notice 수정 요청 처리
	@ResponseBody
	@PostMapping("/noticeDetail")
	public String updateNotice( NoticeVO noticeVO) {
		log.info("noticeVO: " + noticeVO);
		
		noticeService.updateNotice(noticeVO);
		return "success";
	}
	
	//notice 삭제 요청 처리
	@ResponseBody
	@PutMapping("/memberDetail/notice/{fileId}")
	public String deleteNotice(@PathVariable String fileId) {
		log.info("fileId:" + fileId);
		
		noticeService.kjFileUp(fileId);
		
		return "success";
	}
	
	//notice 삭제 요청 처리
	@ResponseBody
	@PutMapping("/memberDetail/member/{ntcCode}")
	public String deleteNotice2(@PathVariable String ntcCode) {
		log.info("ntcCode:" + ntcCode);
		
		noticeService.deleteNotice2(ntcCode);
		
		return "success";
	}


}
