package com.ddit.proj.controller;

import com.ddit.proj.service.RecordApplyService;
import com.ddit.proj.vo.RecordApplyVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/stu")
public class RecordApplyController {

	@Autowired
	private RecordApplyService service;

	// 학적신청 상세보기
	@ResponseBody
	@GetMapping("/recDetail/{recCode}")
	public RecordApplyVO getRecDetail(@PathVariable String recCode) {
//		log.debug("recCode: " + recCode);

		RecordApplyVO result = service.getRecDetail(recCode);
		log.debug("recDetail: " + result);

		return result;
	}

//	학적신청 페이지 이동
	@GetMapping("/recApply")
	public String getAllRecordApply() {

		return "record/recApply";
	}

	@ResponseBody
	@GetMapping("/recApplyList")
	public List<RecordApplyVO> getAllRecordApplyList(@RequestParam String memNo, @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "10") int size) {
//		log.debug("로그 학적리스트 : "+memNo);
		List<RecordApplyVO> list = service.getAllRecordApply(memNo);
//		log.debug("로그 학적리스트 : "+list);

		return list;
	}

	//	학적신청 페이지에서 데이터 Insert
	@ResponseBody
	@PostMapping("/recApply")
	public String insertRecordApply(@RequestParam Map<String, Object> map) throws ParseException {

		// 받아온 데이터 확인
		String recSeCode = (String) map.get("recSeCode");
		String stuMemNo = (String) map.get("stuMemNo");
		String recSde = (String) map.get("recSde");
		String recEde = (String) map.get("recEde");
		String recRsn = (String) map.get("recRsn");

	// 학적 신청 시 승인된 날짜 이후에 신청할 수 있게 하기
		// 승인된 날짜의 가장 최근 값
		String recEdeMax = service.recEdeMax();
		log.debug("로그 : recEdeMax : " + recEdeMax);

		// 비교
		// 문자열로 된 날짜 형식을 지정합니다. (YYYY-MM-DD)
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		// 문자열을 Date 객체로 변환합니다.
		Date dateRecSde = dateFormat.parse(recSde);
		Date dateRecEdeMax = dateFormat.parse(recEdeMax);

		// Date 객체를 비교합니다.
		if (dateRecSde.before(dateRecEdeMax) && dateRecEdeMax.after(dateRecSde)) {
			log.debug("recSde가 recEdeMax보다 이전 날짜입니다. ");
			return "fail";
		}

	// 추가 데이터 처리
		// 종료일이 없다면
		if (recEde == null) {
			recEde = recSde;
		}
		// 현재 날짜 가져오기
		LocalDate currentDate = LocalDate.now();

		// 현재 연도와 월 가져오기
		int recYr = currentDate.getYear();
		int monthValue = currentDate.getMonthValue();
		int recSem;

		if (monthValue >= 7) {
			recSem = 2;
		} else {
			recSem = 1;
		}

		RecordApplyVO recordApplyVO = new RecordApplyVO();
		recordApplyVO.setRecSeCode(recSeCode);
		recordApplyVO.setStuMemNo(stuMemNo);
		recordApplyVO.setRecYr(recYr);
		recordApplyVO.setRecSem(recSem);
		recordApplyVO.setRecRsn(recRsn);
		recordApplyVO.setRecSde(recSde);
		recordApplyVO.setRecEde(recEde);


		int result = 0;
		try {
		    result = service.insertRecordApply(recordApplyVO);
		    log.debug("로그 : Insert 결과 : " + result);
		} catch (Exception e) {
		    log.error("Insert 작업 중 오류 발생: " + e.getMessage(), e);
		}

		return String.valueOf(result);
	}

	//	학적신청 페이지에서 데이터 Delete 처리 (Update)
	@ResponseBody
	@DeleteMapping("/recApply/{recCode}")
	public String deleteRecordApply(@PathVariable String recCode) {

		// 받아온 데이터 확인
		log.debug("로그 : 매개값 " + recCode);
		int result = 0;

		RecordApplyVO recordApplyVO = new RecordApplyVO();
		recordApplyVO.setRecCode(recCode);

		try {
			result = service.deleteRecordApply(recordApplyVO);
			log.debug("로그 : Delete 처리 결과 : " + result);
		} catch (Exception e) {
			log.error("Delete 작업 중 오류 발생: " + e.getMessage(), e);
		}

		return String.valueOf(result);
	}




}
