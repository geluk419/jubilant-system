package com.ddit.proj.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ddit.proj.service.DepartmentService;
import com.ddit.proj.service.MemberService;
import com.ddit.proj.util.ArticlePage;
import com.ddit.proj.vo.CodeDetailVO;
import com.ddit.proj.vo.MemberVO;
import com.sun.org.apache.bcel.internal.generic.NEW;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class MemberController {
	
	@Autowired
	private MemberService memberSerivce;
	
	@Autowired
	private DepartmentService departmentService;
	
	//사용자 리스트 페이지
	@GetMapping("/member")
	public String getMemberList(Model model,
			@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value="size", required = false, defaultValue = "10") int size,
			@RequestParam(value="keyword", required = false, defaultValue = "") String keyword
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPage", currentPage);
		map.put("size", size);
		map.put("keyword", keyword);
		
		log.info("체킁:");
		
		List<MemberVO> data = this.memberSerivce.listMember(map);
		log.info("data : " + data);
		
//		model.addAttribute("memberList", data);
		
		int total = this.memberSerivce.getMemberTotal(map);
		log.info("total:" + total);
		ArticlePage<MemberVO> article = new ArticlePage<MemberVO>(total, currentPage, size, data);
		model.addAttribute("data", new ArticlePage<MemberVO>(total, currentPage, size, data));
		List<MemberVO> memberList = article.getContent();
		model.addAttribute("memberList", memberList);
		log.info("킁킁"+memberList);
//		mav.setViewName("member/memberList");
		
		//forwarding
		return "member/memberList";
	}
	
	
	//사용자 등록 페이지
	@GetMapping("/memberRegister")
	public String getMemberRegister(Model model) {
		model.addAttribute("collList",departmentService.selectColList("COLL"));
		model.addAttribute("codeList2", memberSerivce.codeIdList2("EMPD"));
		model.addAttribute("codeList3", memberSerivce.codeIdList3("EMPL"));
		log.info("체킁:{}",departmentService.selectColList("COLL"));
		log.info("체킁:", memberSerivce.codeIdList2("EMPD"));
		log.info("체킁:", memberSerivce.codeIdList3("EMPL"));

		return "member/memberRegister";
	}

	//사용자 등록 페이지
	@ResponseBody
	@GetMapping("/codeIdList/{codeId}")
	public List<CodeDetailVO> getCodeIdList(@PathVariable String codeId) {
		log.info("체킁:{}", codeId);
		return memberSerivce.codeIdList(codeId);
	}

	
	//사용자 등록 요청 처리
	//memberVO: {memNo: '1', memNm: '2', memBir: '3', memTel: '4', memType : '학생'}
	@ResponseBody
	@PostMapping("/memberRegister")
	public String register(@RequestBody MemberVO memberVO) {
		//memberVO : MemberVO(rnum=0, memNo=1, memType=학생, memPass=null, memDelYn=null, memNm=2, memNme=null, memTel=4, 
		//memTel2=null, memZip=0, memAddr1=null, memAddr2=null, memPic=null, memDepo=null, memBankCode=null, 
		//memMl=null, memBir=2023-09-11, authVOList=null, professorVO=null, departmentVO=null
		log.info("memberVO : " + memberVO);
		
		memberSerivce.insertMember(memberVO);
		
		return "success";
	}
	
	//상세 페이지(수정,삭제)
	@GetMapping("/memberDetail")
	public String getMemberDetail(String memNo,Model model) {
		log.info("체킁 memNo:" + memNo);
		
		MemberVO member = new MemberVO();
		member.setMemNo(memNo);
		
		MemberVO memberVO = memberSerivce.getMember(member);
		model.addAttribute("memberVO", memberVO);
		
		return "member/memberDetail";
	}
	
	//사용자 수정 요청 처리
	//{memNo: '1', memNm: '위하준', memBir: '196802299', memTel: '010-4767-8637'}
	@ResponseBody
	@PutMapping("/memberDetail")
	public String updateRegister(@RequestBody MemberVO memberVO) {
		log.info("memberVO:" + memberVO);
		
		memberSerivce.updateMember(memberVO);
		return "success";
	}
	
	
	//사용자 삭제 요청 처리
	@ResponseBody
	@PutMapping("/memberDetail/{memNo}")
	public String deleteRegister(@PathVariable String memNo) {
		log.info("memNo:" + memNo);
		
		memberSerivce.deleteMember(memNo);
		
		return "success";
	}
	
	//라디오버튼 체크시 해당하는 학번/교번 자동 생성
	@ResponseBody
	@GetMapping("/memberChoose")
	public String memberChoose(String memberType) {
		log.info("memberType : " + memberType);
		
		String memNo = memberSerivce.chooseMemNo(memberType);
		log.info("memNo: " + memNo);
		
		return memNo; 
	}
}

