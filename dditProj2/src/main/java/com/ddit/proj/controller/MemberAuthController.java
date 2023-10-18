package com.ddit.proj.controller;

import org.springframework.stereotype.Controller;

@Controller
public class MemberAuthController {
	/*
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/members")
	public List<MemberVO> getMemberList() {
		return memberService.listMember();
	}
	
	@GetMapping("/auth")
	public List<AuthVO> getAuthList() {
		return memberService.listAuth();
	}
	
	@GetMapping("/members/{memNo}")
	public MemberVO getMember(@PathVariable String memNo) {
		MemberVO memberVO = new MemberVO();
		memberVO.setMemNo(memNo);
		return memberService.getMember(memberVO);
	}
	
	@GetMapping("/auth/{memNo}")
	public List<AuthVO> getAuth(@PathVariable String memNo) {
		AuthVO authVO = new AuthVO();
		authVO.setMemNo(memNo);
		return memberService.getAuth(authVO);
	}
	
	@PostMapping("/members")
	public String insertMember(@RequestBody MemberVO memberVO) {
		return Integer.toString(memberService.insertMember(memberVO));
	}
	
	@PostMapping("/auth")
	public String addAuth(@RequestBody AuthVO authVO) {
		return Integer.toString(memberService.addAuth(authVO));
	}
	
	@PutMapping("/members")
	public String updateMember(@RequestBody MemberVO memberVO) {
		return Integer.toString(memberService.updateMember(memberVO));
	}
	
	@PostMapping("/members/{memNo}")
	public String deleteMember(@PathVariable String memNo) {
		MemberVO memberVO = new MemberVO();
		memberVO.setMemNo(memNo);
		return Integer.toString(memberService.deleteMember(memberVO));
	}
	
	@PostMapping("/auth/{memNo}")
	public String deleteAuth(@PathVariable String memNo) {
		AuthVO authVO = new AuthVO();
		authVO.setMemNo(memNo);
		return Integer.toString(memberService.deleteAuth(authVO));
	}
	
*/
}
