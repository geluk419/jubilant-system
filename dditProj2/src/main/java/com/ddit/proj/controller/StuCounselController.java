package com.ddit.proj.controller;

import com.ddit.proj.service.CounselService;
import com.ddit.proj.vo.CounselVO;
import com.ddit.proj.vo.ScheduleVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/stu")
public class StuCounselController {
	
	@Autowired
	private CounselService service;

	// 학생 상담 신청 답변 및 반려 사유 보기 = 1개 찾아오기
	@ResponseBody
	@GetMapping("/counselSelect/{cnslCode}")
    public CounselVO selectCounsel(@PathVariable String cnslCode) {
//		log.info("로그 : 세부사항 " + cnslCode);
		CounselVO result = service.getOneStuCounsel(cnslCode);
		log.info("로그 : 받아온 결과값 : " + result);
		return result;
	}


	// 학생 상담 신청 Insert
	@ResponseBody
	@PostMapping("/counselInsert")
	public String insertCounsel(@RequestBody CounselVO VO) {

//		log.debug("로그 : " + VO);
		int result = 0;	
		try {
			result = service.insertStuCounsel(VO);
			log.debug("로그 : Insert 결과 : " + result);
		} catch (Exception e) {
			log.error("로그 : Insert 작업 중 오류 발생: " + e.getMessage(), e);
		}

		return result != 0 ? "Insert Success" : "Insert Fail";
	}


	// 상담 신청 삭제 처리
	@ResponseBody
	@DeleteMapping("/counselDelete")
    public String deleteCounsel(@RequestBody  Map<String, String> map) {

		String cnslCode = (String) map.get("cnslCode");
		log.info("로그 : " + cnslCode);
		int result = service.deleteStuCounsel(cnslCode) ;

		return result != 0 ? "Delete Success" : "Delete Fail";
	}

	// 현재 학생의 상담 신청 리스트
	@ResponseBody
	@GetMapping("/counselList")
    public List<CounselVO> listCounselByStu(@RequestParam Map<String, String> map) {
		String memNo = (String) map.get("memNo");
//        log.info("로그 회원번호 : "+memNo);
		List<CounselVO> list = service.listCounselByStu(memNo);
//		log.info(list.toString());

        return list;
	}

	// 페이지 이동
	@GetMapping("/coun")
	public String getStuAtten() {
		return "coun/stuCoun";
	}

}
