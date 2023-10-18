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

import com.ddit.proj.service.NoticeService;
import com.ddit.proj.util.ArticlePage;
import com.ddit.proj.vo.NoticeVO;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
@RequestMapping("/common")
public class NoticeController {
	
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
		log.info("체킁:");
		
		List<NoticeVO> data = this.noticeService.listNotice(map);
		log.info("data : " + data);
		
		for(NoticeVO notice : data) {
			boolean attachOX = notice.getFileId() != null && !notice.getFileId().isEmpty();
			notice.setAttachOX(attachOX);
		
		}
		
		int total = this.noticeService.getNoticeTotal(map);
		log.info("total:" + total);
		ArticlePage<NoticeVO> article = new ArticlePage<NoticeVO>(total, currentPage, size, data);
		model.addAttribute("data", new ArticlePage<NoticeVO>(total, currentPage, size, data));
		List<NoticeVO> noticeList = article.getContent();
		model.addAttribute("noticeList", noticeList);
		log.info("체킁" + noticeList);
		model.addAttribute("notice", noticeService.noticeSelect("NOTI"));
		
		return "notice/noticeList";
	}
	
	//공지사항 상세
	@GetMapping("/noticeListDetail")
	public String getListDetail(String ntcCode, Model model) {
		log.info("체킁:");
		
		noticeService.hitNotice(ntcCode);
		
		NoticeVO notice = new NoticeVO();
		notice.setNtcCode(ntcCode);
		
		NoticeVO noticeVO = noticeService.getNotice(notice);
		log.info("체킁 : "+noticeVO);
		
		model.addAttribute("noticeVO",noticeVO);
		
		return "notice/noticeListDetail";
	}

}
