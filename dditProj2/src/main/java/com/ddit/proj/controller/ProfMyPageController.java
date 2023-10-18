package com.ddit.proj.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ddit.proj.mapper.MemberMapper;
import com.ddit.proj.service.ProfMyPageService;
import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.MemberVO;
import com.ddit.proj.vo.ProfMyPageVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/prof")
public class ProfMyPageController {
	
	@Autowired ProfMyPageService profMyPageService;
	
	//DI(Dependency Injection) 의존성 주입
	@Autowired
	private MemberMapper memberMapper;
	
		
	@GetMapping("/mypage")
	private String getMyPage(Model model, Authentication auth) {
		
		String memNo = auth.getName();
		
		// 사용자 정보 불러오기
	    MemberVO memberVO = this.memberMapper.read(memNo);
		log.info("memberVO : " + memberVO);
				
		// 재직 상태 불러오기
		ProfMyPageVO profMyPageVO = profMyPageService.proStat(memNo);
		log.info("재직상태: {}", profMyPageVO);
		
		// 학과명/학과장 여부 불러오기
		ProfMyPageVO checkDep = profMyPageService.checkDep(memNo);
		log.info("학과명/학과장 여부: {}", checkDep);
		
		// 은행 리스트 불러오기
		List<CodeVO> bankList = profMyPageService.selectBankList("BANK");
		log.info("은행 : {}", bankList);
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("profMyPageVO", profMyPageVO);
		model.addAttribute("checkDep", checkDep);
		model.addAttribute("bankList", bankList);
		
		return "mypage/profMyPage";
	}
	
	// 마이페이지 내 개인정보 수정
	@ResponseBody
	@PutMapping("/mypage")
	public String updateInfo(MemberVO memberVO, Principal principal) throws Exception {
		String memNo = principal.getName();
		memberVO.setMemNo(memNo);
		log.info("e7e memberVO : " + memberVO);
		
		MultipartFile chFile = memberVO.getUploadFile();
		
		// 먼저 파일을 저장!
		String originFileName = chFile.getOriginalFilename();
		
		chFile.transferTo(new File("D:/myTool/sts3WS/dditProj/src/main/webapp/resources/upload/"+originFileName));
		
		memberVO.setMemPic("/files/"+originFileName);

		profMyPageService.updateInfo(memberVO);
		
		return "success";
		
	}

	
	// 마이페이지 암호 체킁
	@ResponseBody
	@PostMapping("/mypass")
	public String chPass(@RequestBody String password, Principal principal) {
		String memNo = principal.getName();

		log.debug("너머왔낭? {}", password);
		
		BCryptPasswordEncoder chPassEncoder = new BCryptPasswordEncoder();
		
		String encodedPass =chPassEncoder.encode("java");
		
		boolean check = chPassEncoder.matches("java", encodedPass);
		
		if(check == true) {
			log.debug("같앙");
		}else {
			log.debug("안 같앙!");
		}
		
		log.debug("암호화된 java{}",encodedPass);
		
		String dbPassword = profMyPageService.checkPass(memNo);
		
		if(chPassEncoder.matches(password, encodedPass)) {
			return "OK";
		}

		return "NG";
				
	}
	
}