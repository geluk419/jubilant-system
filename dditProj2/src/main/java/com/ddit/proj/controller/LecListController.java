package com.ddit.proj.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mvel2.optimizers.impl.refl.collection.MDArrayCreator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddit.proj.service.LecListService;
import com.ddit.proj.service.SubjectService;
import com.ddit.proj.vo.BuildingVO;
import com.ddit.proj.vo.LecApplyVO;
import com.ddit.proj.vo.LectureDetailVO;
import com.ddit.proj.vo.LectureVO;
import com.ddit.proj.vo.MemberVO;
import com.ddit.proj.vo.SubjectVO;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/prof")
public class LecListController {
	
	@Autowired
	private LecListService lecListService;
	
	@GetMapping("/lecList")
	public String lectureMain(Model model,Principal principal) {
		String memNo = principal.getName(); 
		
//		과목 불러서 셀렉트 옵션에 넣기
		List<SubjectVO> subjectVO = lecListService.listSubj();
		model.addAttribute("subjectVO", subjectVO);
		
// 		강의실호수,건물 이름 셀렉트 옵션에 넣기
		List<BuildingVO> buildingVO = lecListService.getBuildRoom();

		LecApplyVO lecApplyVO = new LecApplyVO();
		lecApplyVO.setMemNo(memNo);
		
		List<LecApplyVO> lecApplyVOList = lecListService.listSelLecture(lecApplyVO);
		//lectureVOList!! : [LecApplyVO(lecaId=1, memNo=202008P003, subCode=01, lecaYr=2023, lecaSem=2, lecaNm=경제학개론, lecaSeCode=전필, lecaTrg=1, lecaCrd=3, lecaTime=2, lecaCap=40, lecaDt=Fri Sep 01 17:11:31 KST 2023, lecaStdCode=GRADE, lecaYn=Y, 
		//lectureVOList=[LectureVO(lecCode=01, subCode=1, lecaId=1, lecStatYn=Y, lecHcnt=30, lecYn=Y, lecDelYn=N, roomNo=402, bldCode=E405,
		
		//로그인 한 교수의 연도/학기 정보 불러오기
		List<LecApplyVO> yrsemList = this.lecListService.getYrsem(memNo);
		
		//평가기준 불러오기
		List<LecApplyVO> LeesCodeVO = this.lecListService.leesCode();
		log.info("LeesCodeVO : " + LeesCodeVO);
		
		
		model.addAttribute("leesCodeVO",LeesCodeVO);
		model.addAttribute("buildingVO", buildingVO);
		model.addAttribute("yrsemList", yrsemList);
		model.addAttribute("lecApplyVOList", lecApplyVOList);
		
		log.info("lecApplyVOList!!!!!"+lecApplyVOList);
		
		log.info("LeesCodeVO!!!!!"+LeesCodeVO);
		
		return "lec/lecList";
	}
	
	// 강의목록 리스트 불러오기
	@ResponseBody
	@GetMapping(value = "/lecListAll",produces = "application/json;charset=utf-8")
	public List<LectureVO> listLecture(Principal principal){
		
		String	memNo = principal.getName(); 
		
		return lecListService.listLecture(memNo);
	}
	
	@ResponseBody
	@GetMapping(value="/roomNo")
	public List<BuildingVO> roomNo(@RequestParam(name = "buildingCode", required = false) String bldCode){
		// 건물에따라 호수 가져오기
		List<BuildingVO> roomNo = lecListService.getRoomNo(bldCode);
		return roomNo;
	}
	
	
	// 강의목록 조건별 리스트 불러오기
	//요청파라미터 : ?lecaYr=lecaYr&lecaSem=lecaSem
	@ResponseBody
	@GetMapping(value = "/lecListSel")
	public List<LecApplyVO> listLecture(@RequestParam(name = "lecaYr", required = false, defaultValue = "0") int lecaYr,
									@RequestParam(name = "lecaSem", required=false, defaultValue = "0") int lecaSem,Principal principal){
		
		
		String	memNo = principal.getName(); 
		
		LecApplyVO lecApplyVO = new LecApplyVO();
		lecApplyVO.setMemNo(memNo);
		lecApplyVO.setLecaYr(lecaYr);
		lecApplyVO.setLecaSem(lecaSem);
		
		log.info("lecApplyVO???????"+lecApplyVO);
		//LecApplyVO(lecaId=null, memNo=202008P003, subCode=null, lecaYr=2023
		//, lecaSem=2, lecaNm=null, lecaSeCode=null, lecaTrg=0, lecaCrd=0, lecaTime=0, lecaCap=0, lecaDt=null, lecaStdCode=null, lecaYn=null, lectureVOList=null)
		log.info("lecListService.listSelLecture(lecApplyVO)"+ lecListService.listSelLecture(lecApplyVO));
		
		return lecListService.listSelLecture(lecApplyVO);
	}
	
	//교수 개인정보 가져오기
	@ResponseBody
	@GetMapping("/getProf")
	public List<MemberVO> getInfo(HttpServletRequest request,Principal principal){
		String memNo = principal.getName();
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");
			
		List<MemberVO> getProf=  this.lecListService.getProf(memNo);
		
		return getProf;
	}
	
	
	//강의계획서 등록
		@ResponseBody
		@PostMapping("/insertLecApply")
		public String insertLecApply(@RequestBody Map<String, Object> data) {
			log.info("data!!!!"+data);
			log.info("values!!!!"+data.values());
			log.info("subCode!!!!"+data.get("subCode"));
			log.info("lecaYr!!!!"+data.get("lecaYr"));
//			log.info("timeTableData!!!!"+data.get("timeTableData"));
//			log.info("timeTableData!!!!"+data.get("timeTableData"));
			LecApplyVO lecApplyVO = new LecApplyVO();
			LectureVO lectureVO = new LectureVO();
			
			String memNo = (String) data.get("memNo");
			String subCode = (String) data.get("subCode");
			int lecaYr = Integer.parseInt((String) data.get("lecaYr"));
			int lecaSem = Integer.parseInt((String) data.get("lecaSem"));
			String lecaNm = (String) data.get("lecaNm");
			String lecaSeCode = (String) data.get("lecaSeCode");
			int lecaTrg = Integer.parseInt((String) data.get("lecaTrg"));
			int lecaCrd = Integer.parseInt((String) data.get("lecaCrd"));
			int lecaCount = Integer.parseInt((String) data.get("lecaCount"));
			int lecaCap = Integer.parseInt((String) data.get("lecaCap"));
			String lecaStdCode = (String) data.get("lecaStdCode");
			lecApplyVO.setMemNo(memNo);
			lecApplyVO.setSubCode(subCode);
			lecApplyVO.setLecaYr(lecaYr);
			lecApplyVO.setLecaSem(lecaSem);
			lecApplyVO.setLecaNm(lecaNm);
			lecApplyVO.setLecaSeCode(lecaSeCode);
			lecApplyVO.setLecaTrg(lecaTrg);
			lecApplyVO.setLecaCrd(lecaCrd);
			lecApplyVO.setLecaCount(lecaCount);
			lecApplyVO.setLecaCap(lecaCap);
			lecApplyVO.setLecaStdCode(lecaStdCode);
			
			lecListService.insertApply(lecApplyVO);
			String lecaId =  lecApplyVO.getLecaId();
			log.info("lecaId!!!!!!"+lecaId);
			
			int roomNo = Integer.parseInt((String) data.get("roomNo"));
			String bldCode = (String) data.get("bldCode");
			lectureVO.setLecaId(lecaId);
			lectureVO.setSubCode(subCode);
			lectureVO.setRoomNo(roomNo);
			lectureVO.setBldCode(bldCode);
			lecListService.insertLecture(lectureVO);
			
			String lecCode = lectureVO.getLecCode();
			
			//@SuppressWarnings("unchecked")
			//List<LectureDetailVO> lectureDetailVOlist = (List<LectureDetailVO>) data.get("timeTableData");
			
			ObjectMapper sukilMapper = new ObjectMapper();
			List<LectureDetailVO> lectureDetailVOlist = new ArrayList<LectureDetailVO>();
			
			List<Object> sukList = (List<Object>)data.get("timeTableData");
			for (Object object : sukList) {
				LectureDetailVO lectureDetailVO = sukilMapper.convertValue(object, LectureDetailVO.class);
				lectureDetailVO.setLecCode(lecCode);
				lectureDetailVOlist.add(lectureDetailVO);
			}
			for(int i=0 ; i < lectureDetailVOlist.size(); i++) {
				lecListService.insertLectureDetail(lectureDetailVOlist.get(i));
			}
			//log.info("lectureDetailVOlist!!!!!!" +lectureDetailVOlist);
//			log.info("lecDetailVO!!!!" +lectureDetailVO.size());
			// lectureDetailVOlist!!!!!![{lecCode = lectureVO.getLecCode(),lecdWeek=월요일, lecdSt=1교시, lecdEt=2교시}, {lecCode = lectureVO.getLecCode(),lecdWeek=수요일, lecdSt=1교시, lecdEt=2교시}]
			//for (LectureDetailVO lectureDetailVO : lectureDetailVOlist) {
			//	lectureDetailVO.setLecCode(lecCode); // 각 객체에 lecCode 설정
			//}
			log.info("lectureDetailVOlist!!!!!!" +lectureDetailVOlist);
			
//			
//			log.info("timeTableData.size()!!!!" + timeTableData.size());
			
			return "success";
		}
		
		@GetMapping("/lecListView")
		public String getlecApply(@RequestParam String lecCode, Model model,Principal principal) {
			
			String memNo = principal.getName(); 
			
			model.addAttribute("lecCd",lecCode);
			
			return "proflec/lec/lecApply";		
		}
		
		//강의계획서 등록
		@ResponseBody
		@PostMapping("/updateLecApply")
		public String updateLecApply(@RequestBody Map<String, Object> data) {
			log.info("data!!!!"+data);
			log.info("values!!!!"+data.values());
//					log.info("timeTableData!!!!"+data.get("timeTableData"));
//					log.info("timeTableData!!!!"+data.get("timeTableData"));
			
			LecApplyVO lecApplyVO = new LecApplyVO();
			LectureVO lectureVO = new LectureVO();
			String lecaId = (String) data.get("lecaId");
			String lecCode = (String) data.get("lecCode");
			String subCode = (String) data.get("subCode");
			int lecaYr = Integer.parseInt((String) data.get("lecaYr"));
			int lecaSem = Integer.parseInt((String) data.get("lecaSem"));
			String lecaNm = (String) data.get("lecaNm");
			String lecaSeCode = (String) data.get("lecaSeCode");
			int lecaTrg = Integer.parseInt((String) data.get("lecaTrg"));
			int lecaCrd = Integer.parseInt((String) data.get("lecaCrd"));
			int lecaCount = Integer.parseInt((String) data.get("lecaCount"));
			int lecaCap = Integer.parseInt((String) data.get("lecaCap"));
			String lecaStdCode = (String) data.get("lecaStdCode");
			lecApplyVO.setSubCode(subCode);
			lecApplyVO.setLecaYr(lecaYr);
			lecApplyVO.setLecaSem(lecaSem);
			lecApplyVO.setLecaNm(lecaNm);
			lecApplyVO.setLecaSeCode(lecaSeCode);
			lecApplyVO.setLecaTrg(lecaTrg);
			lecApplyVO.setLecaCrd(lecaCrd);
			lecApplyVO.setLecaCount(lecaCount);
			lecApplyVO.setLecaCap(lecaCap);
			lecApplyVO.setLecaStdCode(lecaStdCode);
			lecApplyVO.setLecaId(lecaId);
			
			lecListService.updateApply(lecApplyVO);
			
			int roomNo = Integer.parseInt((String) data.get("roomNo"));
			String bldCode = (String) data.get("bldCode");
			lectureVO.setLecCode(lecCode);
			lectureVO.setSubCode(subCode);
			lectureVO.setRoomNo(roomNo);
			lectureVO.setBldCode(bldCode);
			lecListService.updateLecture(lectureVO);
			
			LectureDetailVO lectureDetailVO = new LectureDetailVO();
			lectureDetailVO.setLecCode(lecCode);
			
			lecListService.deleteLectureDetail(lectureDetailVO);
			
			ObjectMapper sukilMapper = new ObjectMapper();
			List<LectureDetailVO> lectureDetailVOlist = new ArrayList<LectureDetailVO>();
			
			List<Object> sukList = (List<Object>)data.get("timeTableData");
			for (Object object : sukList) {
				lectureDetailVO = sukilMapper.convertValue(object, LectureDetailVO.class);
				lectureDetailVO.setLecCode(lecCode);
				lectureDetailVOlist.add(lectureDetailVO);
			}
			for(int i=0 ; i < lectureDetailVOlist.size(); i++) {
				lecListService.insertLectureDetail(lectureDetailVOlist.get(i));
			}
			log.info("lectureDetailVOlist!!!!!!" +lectureDetailVOlist);
			
			return "success";
		}
		
		@ResponseBody
		@PostMapping("/delLec")
		public int deleteLec(@RequestParam String lecaId) {
			log.info("왔어");
			log.info("lecaId="+lecaId);
			int result = lecListService.deleteLec(lecaId);
			
			return result;
		}
		
//		중복 시간표
		@ResponseBody
		@GetMapping("/getTime")
		public List<LectureDetailVO> getTime(LectureVO lectureVO) {
			log.info("체크넘어왔나");
			log.info("lectureVO체크체크"+lectureVO);
			log.info("췌크췌크"+lecListService.getTime(lectureVO));
			
			return lecListService.getTime(lectureVO); 
		}
		
}














