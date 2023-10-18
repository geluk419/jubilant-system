package com.ddit.proj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddit.proj.service.AttenadenceService;
import com.ddit.proj.service.ScoreService;
import com.ddit.proj.vo.AttenadenceVO;
import com.ddit.proj.vo.ObjectionVO;
import com.ddit.proj.vo.ScoreVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/prof")
public class ScoreProfController {

	@Autowired
	private ScoreService score;
	
	@Autowired
	private AttenadenceService attendence;

	// 성적 페이지
	@GetMapping("/score")
	public String getScore(@RequestParam String lecCode, Model model) {
		AttenadenceVO attendenceVO = attendence.lecNmByCode(lecCode);
		String lecaNm = attendenceVO.getLecaNm();
		model.addAttribute("lecaNm", lecaNm);
		
		model.addAttribute("lecCd", lecCode);
		
		List<ScoreVO> scoreVOList = score.listStuByLec(lecCode);
		model.addAttribute("scoreVOList", scoreVOList);
		
		log.info("scoreVOList"+scoreVOList);
		return "proflec/score/profScore";
	}

	// 이의 신청 페이지
	@GetMapping("/scoreObj")
	public String getScoreObj(@RequestParam String lecCode, Model model
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
	    
	    List<ObjectionVO> objectionVOList = score.listObj(map);
	    int totalObj = score.countObj(map);
	    
	    log.debug("페이징:" + Math.ceil(((double)totalObj / size)) + "  " + ((double)totalObj / size));
	    
	    model.addAttribute("objectionVOList", objectionVOList);
	    model.addAttribute("totalObj", totalObj);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("size", size);
	    model.addAttribute("pageCnt", (int)Math.ceil(((double)totalObj / size)));
		
		return "proflec/score/profScoreObj";
	}

	// 이의 신청 목록 > 상세
	@ResponseBody
	@GetMapping("/ScoreObjByStu")
	public ObjectionVO ScoreObjByStu(String lecCode, String memNo) {
		
		ObjectionVO objectionVO = new ObjectionVO();
		objectionVO.setLecCode(lecCode);
		objectionVO.setMemNo(memNo);
		
		return score.ScoreObjByStu(objectionVO);
	}
	

	// 해당 교수 강의 목록 > 수강생 목록 > 학생별 성적 상세 내역 - 평가
	@ResponseBody
	@GetMapping(value = "/score/list/detail", produces = "application/json;charset=utf-8")
	public List<ScoreVO> getTotalScoreDetail(@RequestParam("lecCode") String lecCode, @RequestParam("memNo") String memNo){ 
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("lecCode", lecCode);
	    map.put("memNo", memNo);
	    
		return score.getTotalScoreDetail(map);
	}
	
	// 해당 교수 강의 목록 > 수강생 목록 > 학생별 성적 상세 내역 - 세부 점수
	@ResponseBody
	@GetMapping(value = "/score/list/max", produces = "application/json;charset=utf-8")
	public List<ScoreVO> getScoreAndMaxScore(@RequestParam("lecCode") String lecCode, @RequestParam("memNo") String memNo){ 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lecCode", lecCode);
		map.put("memNo", memNo);
		
		return score.getScoreAndMaxScore(map);
	}
	
	// 최종등급 유무확인
	@ResponseBody
    @PostMapping(value = "/gradeCheck", produces = "application/json;charset=utf-8")
    public int gradeCheck(@RequestBody ScoreVO scoreVO) { 
		int result = this.score.gradeCheck(scoreVO);
		return result;
	}

	// 성적 등록
	@ResponseBody
	@PostMapping(value = "/gradeInsert", produces = "application/json;charset=utf-8")
	public int gradeInsert(@RequestBody ScoreVO scoreVO) { 
		int result = this.score.gradeInsert(scoreVO);
		return result;
	}

	// 성적 수정
	@ResponseBody
	@PutMapping(value = "/gradeUpdate", produces = "application/json;charset=utf-8")
	public int gradeUpdate(@RequestBody ScoreVO scoreVO) { 
		int result = this.score.gradeUpdate(scoreVO);
		return result;
	}
	
	// 성적이의신청 > 승인
	@ResponseBody
	@PutMapping(value = "/approveObj", produces = "application/json;charset=utf-8")
	public int approveObj(@RequestBody ObjectionVO objectionVO) { 
		int result = this.score.approveObj(objectionVO);
		return result;
	}

	// 성적이의신청 > 반려
	@ResponseBody
	@PutMapping(value = "/rejectObj", produces = "application/json;charset=utf-8")
	public int rejectObj(@RequestBody ObjectionVO objectionVO) { 
		int result = this.score.rejectObj(objectionVO);
		return result;
	}

	
	// 검색
	@ResponseBody
	@GetMapping("/searchObj")
	public List<ObjectionVO> searchObj(Model model, @RequestParam String lecCode, @RequestParam Map<String, Object> map) {
		model.addAttribute("lecCd", lecCode);
		
		String searchValue = (String) map.get("searchValue");
		String mm = (String) map.get("mm");
		String mo = (String) map.get("mo");
		
		log.info("mm"+mm);
		log.info("mo"+mo);
		
		List<ObjectionVO> objectionVOList;
		
	    int currentPage = 1;   // 일단 기본값 1페이지
	    int size = 5;         // 페이지당 5개씩
	    int startRow = ((currentPage-1)*size) + 1;
	    int endRow = startRow + size -1;
	    
	    map.put("lecCode", lecCode);
	    map.put("startRow", startRow);
	    map.put("endRow", endRow);
	    
	    if (searchValue != null && !searchValue.isEmpty()) {
	        map.put("keyword", searchValue); 
	        objectionVOList = score.listObj(map);
	    } else {
	    	objectionVOList = score.listObj(map);
	    }

	    model.addAttribute("objectionVOList", objectionVOList);
	    return objectionVOList;
	}
	
	
	
}