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

import com.ddit.proj.service.AttenadenceService;
import com.ddit.proj.service.SubjectService;
import com.ddit.proj.vo.AttenadenceVO;
import com.ddit.proj.vo.SubjectVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/prof")
public class AttenProfController {

	@Autowired
	private AttenadenceService attendence;

	// 출결관리페이지
	@GetMapping("/atten")
	public String getStuAtten(@RequestParam String lecCode, Model model) {
		
		model.addAttribute("lecCd", lecCode);
		
		List<AttenadenceVO> attendenceVOList = attendence.listStuByLec(lecCode);
		model.addAttribute("attendenceVOList", attendenceVOList);
		
		AttenadenceVO attendenceVO = attendence.lecNmByCode(lecCode);
		String lecaNm = attendenceVO.getLecaNm();
		model.addAttribute("lecaNm", lecaNm);
		
		return "proflec/atten/profAtten";
	}

	// 출결 증빙 관리 페이지
	@GetMapping("/attenPruf")
	public String stuListAttenPruf(@RequestParam String lecCode, Model model
			, @RequestParam(required = false) String keyword
			, @RequestParam(defaultValue = "1") int currentPage
			, @RequestParam(defaultValue = "5") int size) {
		model.addAttribute("lecCd", lecCode);
		
		AttenadenceVO attendenceVO = attendence.lecNmByCode(lecCode);
		String lecaNm = attendenceVO.getLecaNm();
		model.addAttribute("lecaNm", lecaNm);
		
		Map<String, Object> map = new HashMap<>();
		map.put("lecCode", lecCode);
	    map.put("keyword", keyword);
	    
	    int startRow = ((currentPage-1)*size) + 1;
	    int endRow = startRow + size -1;
	    map.put("startRow", startRow);
	    map.put("endRow", endRow);

	    log.info("map Test : " + map );
	    
	    List<AttenadenceVO> attendenceVOList = attendence.listpruf(map);
	    int totalPruf = attendence.countPruf(map);
	    
	    log.debug("페이징:" + Math.ceil(((double)totalPruf / size)) + "  " + ((double)totalPruf / size));
	    
	    model.addAttribute("attendenceVOList", attendenceVOList);
	    model.addAttribute("totalPruf", totalPruf);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("size", size);
	    model.addAttribute("pageCnt", (int)Math.ceil(((double)totalPruf / size)));
		
		return "proflec/atten/profAttenPruf";
	}

	// 검색
	@ResponseBody
	@GetMapping("/searchPruf")
	public List<AttenadenceVO> searchPruf(Model model, @RequestParam String lecCode, @RequestParam Map<String, Object> map) {
		model.addAttribute("lecCd", lecCode);
		
		String searchValue = (String) map.get("searchValue");
		String nm = (String) map.get("nm");
		String no = (String) map.get("no");
		
		log.info("nm"+nm);
		log.info("no"+no);
		
		List<AttenadenceVO> attendenceVOList;
		
	    int currentPage = 1;   // 일단 기본값 1페이지
	    int size = 5;         // 페이지당 5개씩
	    int startRow = ((currentPage-1)*size) + 1;
	    int endRow = startRow + size -1;
	    
	    map.put("lecCode", lecCode);
	    map.put("startRow", startRow);
	    map.put("endRow", endRow);
	    
	    if (searchValue != null && !searchValue.isEmpty()) {
	        map.put("keyword", searchValue); 
	        attendenceVOList = attendence.listpruf(map);
	    } else {
	    	attendenceVOList = attendence.listpruf(map);
	    }

	    model.addAttribute("attendenceVOList", attendenceVOList);
	    return attendenceVOList;
	}
	
	// 해당 날짜 출결 목록
	@ResponseBody
	@GetMapping("/attenListByDate")
	public List<AttenadenceVO> attenListByDate(@RequestParam String lecCode, @RequestParam String atenDe) {
		AttenadenceVO attendenceVO = new AttenadenceVO();
		attendenceVO.setLecCode(lecCode);
		attendenceVO.setAtenDe(atenDe);
		
		return attendence.attenListByDate(attendenceVO);
	}
	
	// 리스트 조회
	@ResponseBody
	@GetMapping(value = "/attens", produces = "application/json;charset=utf-8")
	public List<AttenadenceVO> getAttens() {
		return attendence.listAtten();
	}

	// 1개 조회
	@ResponseBody
	@GetMapping(value = "/atten/{atenDe}", produces = "application/json;charset=utf-8")
	public AttenadenceVO getAtten(@PathVariable String atenDe) {
		AttenadenceVO attendenceVO = new AttenadenceVO();
		attendenceVO.setAtenDe(atenDe);
		return attendence.getAtten(attendenceVO);
	}

	// 1개 insert
	@ResponseBody
	@PostMapping(value = "/atten", produces = "application/json;charset=utf-8")
	public String postAtten(@RequestBody AttenadenceVO attendenceVO) {
		return Integer.toString(attendence.insertAtten(attendenceVO));
	}

	// 1개 수정
	@ResponseBody
	@PutMapping(value = "/atten", produces = "application/json;charset=utf-8")
	public String putAtten(@RequestBody AttenadenceVO attendenceVO) {
		return Integer.toString(attendence.updateAtten(attendenceVO));
	}

	// 1개 삭제
	@ResponseBody
	@DeleteMapping(value = "/atten/{atenDe}", produces = "application/json;charset=utf-8")
	public String deleteAtten(@PathVariable String atenDe) {
		AttenadenceVO attendenceVO = new AttenadenceVO();
		attendenceVO.setAtenDe(atenDe);
		return Integer.toString(attendence.deleteAtten(attendenceVO));
	}
	
	// 해당 교수 강의 목록 > 수강생 목록 > cnt 조회
	@ResponseBody
	@GetMapping(value = "/atten/attendanceCnt", produces = "application/json;charset=utf-8")
	public Map<String, Object> attendanceCnt(@RequestParam("lecCode") String lecCode, @RequestParam("memNo") String memNo){ // 거의 거짐 거짐당 AJAX사용에는 Model이 의미가 없음
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("lecCode", lecCode);
	    map.put("memNo", memNo);
	    
		AttenadenceVO attendenceVO = attendence.attendanceCnt(map);
		
		List<AttenadenceVO> attenDetail = attendence.attenDetail(map);
		
		Map<String, Object> totalMap = new HashMap<String, Object>();
		
		totalMap.put("attendenceVO", attendenceVO);
		totalMap.put("attenDetail", attenDetail);
		
		log.info("체킁:"+totalMap);
		//{attendenceVO=AttenadenceVO(atenDe=null, lecCode=null, memNo=null, codeAtenSe=null, atenYn=null, atenRsn=null
		//, atenPruf=null, lecaNm=null, stuYr=0, memColCode=null, memDepCode=null, memNm=null, memTel=null, lecaTime=2
		//, atenCome=1, atenLate=0, atenEarlyLeave=0, atenAbsent=0, atenOfiAbsent=0)
		
		//, attenDetail=[AttenadenceVO(atenDe=Fri Sep 08 12:38:57 KST 2023, lecCode=01, memNo=202308S001
		//, codeAtenSe=01, atenYn=Y, atenRsn=N, atenPruf=N, lecaNm=null, stuYr=0, memColCode=null, memDepCode=null
		//, memNm=null, memTel=null, lecaTime=0, atenCome=0, atenLate=0, atenEarlyLeave=0, atenAbsent=0
		//, atenOfiAbsent=0)]}
		return totalMap;
		
	}
	
	
	// 학생별 출결 유무 확인
	@ResponseBody
    @PostMapping(value = "/atten/cnt", produces = "application/json;charset=utf-8")
    public int attenChkCnt(@RequestBody AttenadenceVO attendenceVO
//        @RequestParam("lecCode") String lecCode,
//        @RequestParam("memNo") String memNo,
//        @RequestParam("atenDe") String atenDe
    ) { 
		String lecCode = attendenceVO.getLecCode();
		String memNo = attendenceVO.getMemNo();
		String atenDe = attendenceVO.getAtenDe();
		
		log.info("체킁"+lecCode);
		log.info("체킁"+memNo);
		log.info("체킁"+atenDe);
	    
		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("lecCode", lecCode);
	    map.put("memNo", memNo);
	    map.put("atenDe", atenDe);
	    
	    
		int result = this.attendence.attenChkCnt(map);
		
		return result;
	}
	
	// 출결 증빙 승인
	@ResponseBody
	@PutMapping(value = "/approveAtten", produces = "application/json;charset=utf-8")
	public String approveAtten(@RequestBody AttenadenceVO attendenceVO) {
		return Integer.toString(attendence.approveAtten(attendenceVO));
	}

	// 출결 증빙 반려
	@ResponseBody
	@PutMapping(value = "/rejectAtten", produces = "application/json;charset=utf-8")
	public String rejectAtten(@RequestBody AttenadenceVO attendenceVO) {
		return Integer.toString(attendence.rejectAtten(attendenceVO));
	}
	
	
	
}