package com.ddit.proj.controller;

import com.ddit.proj.service.ScheduleService;
import com.ddit.proj.vo.ScheduleVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/admin")
public class ScheduleController {

    @Autowired
    private ScheduleService service;

//   학사 일정 검색
    @ResponseBody
    @GetMapping("/scheduleSelect")
    public List<ScheduleVO> getSeletSchedule(@RequestParam Map<String, String> map) {
        String str = (String) map.get("str");
        String selectedValue = (String) map.get("selectedValue");
        String selectedYear = (String) map.get("selectedYear");
        String selectedMonth = (String) map.get("selectedMonth");

//        log.info("로그 : "+str+", "+selectedValue);

        return service.getSeletSchedule(map);
    }

//   학사 일정 공통코드 : 학사분류
    @ResponseBody
    @GetMapping("/scheduleCodeSchSeMemNm")
    public List<ScheduleVO> codeSchSeMemNm() {
        return service.getCodeSchSeMemNm();
    }

//   학사 일정 공통코드 : 학사분류
    @ResponseBody
    @GetMapping("/scheduleCodeSchSe")
    public List<ScheduleVO> getCodeSchSeNm() {
        return service.getCodeSchSeNm();
    }

//  학사 일정 Update
    @ResponseBody
    @PutMapping("/schedule")
    public String updateSchedule(@RequestBody  Map<String, Object> map) {
        // 받아온 데이터 확인
        String schCode = (String) map.get("schCode");
        String memNo = (String) map.get("memNo");
        String schTtl = (String) map.get("schTtl");
        String schSt = (String) map.get("schSt");
        String schEt = (String) map.get("schEt");
        String codeSchSe = (String) map.get("codeSchSe");
        List selectedValues = (ArrayList) map.get("selectedValues");
        String arrayAsString = String.join(",", selectedValues);

//        log.info("로그 : "+schCode+", "+memNo+", "+schTtl+", "+schSt+", "+schEt+", "+codeSchSe+", "+codeSchMem);

        ScheduleVO VO = new ScheduleVO(memNo, schTtl, schSt, schEt, codeSchSe, arrayAsString);
        VO.setSchCode(schCode);	

        int result = 0;
        try {
            result = service.updateSchedule(VO);
            log.info("로그 : Update 결과 : " + result);
        } catch (Exception e) {
            log.error("로그 : Update 작업 중 오류 발생: " + e.getMessage(), e);
        }

        return result != 0 ? "Update Success" : "Update Fail";
    }

//  학사 일정 Delete
    @ResponseBody
    @DeleteMapping("/schedule/{schCode}")
    public String deleteSchedule(@PathVariable String schCode) {
        log.info("로그 : 삭제할 코드 " + schCode);

        int result = 0;
        try {
            result = service.deleteSchedule(schCode);
            log.info("로그 : Insert 결과 : " + result);
        } catch (Exception e) {
            log.error("로그 : Insert 작업 중 오류 발생: " + e.getMessage(), e);
        }

        return result != 0 ? "Delete Success" : "Delete Fail";
    }

// 학사 일정 Insert
    @ResponseBody
    @PostMapping("/schedule")
    public String insertSchedule(@RequestBody  Map<String, Object> map) {
        // 받아온 데이터 확인
        String memNo = (String) map.get("memNo");
        String schTtl = (String) map.get("schTtl");
        String schSt = (String) map.get("schSt");
        String schEt = (String) map.get("schEt");
        String codeSchSe = (String) map.get("codeSchSe");
        String codeSchMem = (String) map.get("codeSchMem");
        List selectedValues = (ArrayList) map.get("selectedValues");
        String arrayAsString = String.join(",", selectedValues);

        log.info("로그 Insert : "+memNo+", "+schTtl+", "+schSt+", "+schEt+", "+codeSchSe+", "+codeSchMem+", "+selectedValues+", "+arrayAsString);

        ScheduleVO VO = new ScheduleVO(memNo, schTtl, schSt, schEt, codeSchSe, arrayAsString);

        int result = 0;
        try {
            result = service.insertSchedule(VO);
            log.info("로그 : Insert 결과 : " + result);
        } catch (Exception e) {
            log.error("로그 : Insert 작업 중 오류 발생: " + e.getMessage(), e);
        }

        return result != 0 ? "Insert Success" : "Insert Fail";
    }

// 학사 일정 1개 가져오기
    @ResponseBody
    @GetMapping("/schedule/{schCode}")
    public ScheduleVO getOneSchedule(@PathVariable String schCode) {
        // 받아온 데이터 확인
//        log.info("로그 : 매개값 " + schCode);
        ScheduleVO result = service.getOneSchedule(schCode);
        // 받아온 데이터 확인
//        log.info("로그 : Mapper값 " + result);
        return result;
    }


// 학사 일정 리스트
    @ResponseBody
    @GetMapping("/scheduleList")
    public List<ScheduleVO> getScheduleList() {
//        log.info("로그 : 리스트 : " + service.getAllSchedule());
        return service.getAllSchedule();
    }

//   학사 일정 페이지 이동
    @GetMapping("/schedule")
    public String getSchedule() {
        return "department/SchedulePage";
    }

}
