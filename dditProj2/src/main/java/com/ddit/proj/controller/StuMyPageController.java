package com.ddit.proj.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.mail.Multipart;

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
import com.ddit.proj.service.DormitoryService;
import com.ddit.proj.service.MemberService;
import com.ddit.proj.service.StuMyPageService;
import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.DormitoryApplyFormVO;
import com.ddit.proj.vo.MemberVO;
import com.ddit.proj.vo.StuMyPageVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stu")
public class StuMyPageController {
	@Autowired
	private DormitoryService dormitoryService;
	
	@Autowired
    private StuMyPageService stuMyPageService;
	
	//DI(Dependency Injection) 의존성 주입
	@Autowired
	private MemberMapper memberMapper;
	
	@GetMapping("/mypage")
	public String getMyPage(Model model, Authentication auth) {
	    
	    // 학적 상태 불러오기
//	    StuMyPageVO stuMyPageVO = stuMyPageService.recStatus("STUD");
	    
	    // 학년 불러오기
	    String memNo = auth.getName();
	    StuMyPageVO gradeInfo = stuMyPageService.grade(memNo);
	    
	    // 단과대학 정보 가져오기
	    StuMyPageVO college = stuMyPageService.college(memNo);
	    log.info("단과대: {}", college);
	    
	    // 학과 정보 가져오기
	    StuMyPageVO department = stuMyPageService.department(memNo);
	    log.info("학과 : {}", department);
	    
	    // 은행 리스트 불러오기
	    List<CodeVO> bankList = stuMyPageService.selectBankList("BANK");
	    log.info("은행 : {}", bankList);
	    
	    //사용자 정보 불러오기
	    MemberVO memberVO = this.memberMapper.read(memNo);
		log.info("memberVO : " + memberVO);
	    
//	    model.addAttribute("stuMyPageVO", stuMyPageVO);
	    model.addAttribute("gradeInfo", gradeInfo); 
	    model.addAttribute("college", college); 
	    model.addAttribute("department", department); 
	    model.addAttribute("bankList", bankList); 
	    model.addAttribute("memberVO", memberVO); 
	    
	    
	    return "mypage/stuMyPage";
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

		stuMyPageService.updateInfo(memberVO);
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
		
		String dbPassword = stuMyPageService.checkPass(memNo);
		
		if(chPassEncoder.matches(password, encodedPass)) {
			return "OK";
		}

		return "NG";
				
	}
	
	
	// 최초 로그인 시 개인정보수정 페이지 로드
	@GetMapping("/modifyInfo")
	public String getModifyInfo(Model model, Authentication auth) {
		
		String memNo = auth.getName();
		
		//사용자 정보 불러오기
	    MemberVO memberVO = this.memberMapper.read(memNo);
		log.info("memberVO : " + memberVO);
		
		model.addAttribute("memberVO", memberVO);
		
		return "student/modifyInfo";
	}

	// 기숙사 정보 불러오기
	@ResponseBody
	@PostMapping("/dormitory")
	public DormitoryApplyFormVO applyForm( Authentication auth){
		
		log.debug("체크{}",auth.getName());
		
		
		String memNo = auth.getName();
		DormitoryApplyFormVO dormitoryFormVO = dormitoryService.dormitoryDetail(memNo);
		log.debug("dormitoryFormVO" + dormitoryFormVO);
// 일반적으로 Model은 JSP로 데이터를 보낼 때 사용하기 때문에 아작스 사용시에는 특별한 경우가 아니면 아예 의미가 없음!		
//		model.addAttribute("dormitoryFormVO", dormitoryFormVO);

	    return dormitoryFormVO;  // 신청 폼 화면
	}
	
	/*파일업로드
	@ResponseBody
	@PostMapping(value="/tempUpload", produces = "application/json; charset=utf-8")
	public String tempUpload(MultipartFile file, Principal principal) throws Exception {
		String memNo = principal.getName();
		
		
		log.info("파일"+file);
		log.info("memNo"+memNo);
		
		String originFileName = file.getOriginalFilename();
		
		file.transferTo(new File("D:/myTool/sts3WS/dditProj/src/main/webapp/resources/upload/"+originFileName));
		
		
		String saveFileName = "/resources/upload/"+originFileName;
		
		return "";
	}
	*/
	
}
