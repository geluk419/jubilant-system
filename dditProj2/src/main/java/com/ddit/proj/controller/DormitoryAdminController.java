package com.ddit.proj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddit.proj.mapper.MemberMapper;
import com.ddit.proj.service.DormitoryAdminService;
import com.ddit.proj.vo.DormitoryApplyFormVO;
import com.ddit.proj.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class DormitoryAdminController {

	@Autowired
	private DormitoryAdminService dormitoryAdminService;
	
	@Autowired
	private MemberMapper memberMapper;
	
	// 사생 조회
	@GetMapping("/dormitoryAdminList")
	private String getDormitoryAdmin(Model model,
			@RequestParam(value="keyword", required = false, defaultValue = "") String keyword
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		List<DormitoryApplyFormVO> dormiList = dormitoryAdminService.dormitoryList(map);
		log.debug("dormiList" + dormiList);

	    model.addAttribute("dormiList", dormiList);
		
		return "dormitory/dormitoryAdminList";
	}
	
	// 사생 상세보기
	@GetMapping("/dormitoryAdminDetail")
	public String detailDormitory(String memNo, Model model) {
		log.info("체킁 memNo:" + memNo);
		
		DormitoryApplyFormVO dormi = new DormitoryApplyFormVO();
		dormi.setMemNo(memNo);
		
		DormitoryApplyFormVO dormiVO = dormitoryAdminService.detailDormi(memNo);
		log.info("체킁 dormiVO:" + dormiVO);
		
		//사용자 정보 불러오기
	    MemberVO memberVO = this.memberMapper.read(memNo);
		log.info("memberVO : " + memberVO);
		
		model.addAttribute("dormiVO", dormiVO);
		model.addAttribute("memberVO", memberVO);
		
		return "dormitory/dormitoryAdminDetail";
	}
	
	// 상/벌점 부여
	@ResponseBody
	@PutMapping("/dormitoryAdminDetail")
	public String scoreGive(@RequestBody DormitoryApplyFormVO dormitoryApplyFormVO) {
		
		log.info("DormitoryApplyFormVO:" + dormitoryApplyFormVO);
		
		dormitoryAdminService.giveScore(dormitoryApplyFormVO);
		
		return "success";
	}
	
	// 신청현황 조회
	@GetMapping("/dormitoryApplyList")
	public String selectApplyList() {
		
		return "dormitory/dormitoryApplyList";
	}
	
	// 외박 신청 현황 조회
	@GetMapping("/dormitorySleepList")
	public String selectSleepList() {
		
		return "dormitory/dormitorySleepList";
	}
}
