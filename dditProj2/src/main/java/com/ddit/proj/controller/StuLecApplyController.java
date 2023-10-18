package com.ddit.proj.controller;

import com.ddit.proj.service.StuLecApplyService;
import com.ddit.proj.util.ArticlePage;
import com.ddit.proj.vo.DepartmentVO;
import com.ddit.proj.vo.StuLecApplyVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map; 

@Slf4j
@Controller
@RequestMapping("/stu")
public class StuLecApplyController {

    @Autowired
    private StuLecApplyService service;

    @ResponseBody
    @GetMapping("/recApply/{lecaId}")
    public List<StuLecApplyVO> selectStuLecApply(@PathVariable String lecaId){
//        log.info("로그 : 강의계획서 "+lecaId);
        List<StuLecApplyVO> list = service.selectStuLecApply(lecaId);
        log.info("로그 : 강의계획서 "+list);
        return list;
    }

    // 수강 신청
    @ResponseBody
    @PostMapping("/lecApply")
    public String insertLecApply(@RequestBody StuLecApplyVO VO) {
        Map<String, String> map = new HashMap<>();
        map.put("memNo", VO.getMemNo());
        map.put("lecCode", VO.getLecCode());

        int selectCount = service.countStuLecApply(map);
//        log.info("로그 selectCount: " + selectCount);
        if (selectCount != 0) {
            return "Fail";
        }

        log.info("로그 수강" + VO);
        int result = service.insertStuLecApply(VO);

        return result != 0 ? "Insert Success" : "Insert Fail";
    }

    // 수강신청 시 학생의 정보
    @ResponseBody
    @GetMapping("/lecStuInfo")
    public StuLecApplyVO selectStudent(@RequestParam Map<String, String> map) {
        String memNo = (String) map.get("memNo");

//        log.info("로그 학생  : " + memNo);
        StuLecApplyVO vo = service.selectStudent(memNo);
        log.info("로그 학생 반환  : " + vo);

        return vo;
    }

    // 검색 옵션 : 학과
    @ResponseBody
    @GetMapping("/departmentList")
    public List<DepartmentVO> getDepartmentList() {
        List<DepartmentVO> list = service.getLecApplySelect();
        log.info("로그 학과리스트 : " + list);
        return list;
    }

    // List select
    @ResponseBody
    @GetMapping("/lecApplyList")
    public List<StuLecApplyVO> getLecApplySelect(@RequestParam Map<String, Object> map) {
        String inputClass = (String) map.get("inputClass");
        String inputYear = (String) map.get("inputYear");
        String inputSe = (String) map.get("inputSe");
        String inputPro = (String) map.get("inputPro");
        String inputWord = (String) map.get("inputWord");
        String size = (String) map.get("size");
        String currentPage = (String) map.get("currentPage");
        map.put("currentPage", currentPage);
        map.put("size", size);

//        log.info("로그3 : " + inputClass + inputYear + inputSe + inputPro + inputWord);
        log.info("로그 페이지 : " + currentPage + " 크기 :" + size);

        List<StuLecApplyVO> VOs = service.selectStuLecApplyList(map);


//        return tempData;
        return VOs;
    }


    @ResponseBody
    @GetMapping("/totalStuLecApplyList")
    public Map<String, Object> totalStuLecApplyList(@RequestParam Map<String, Object> map) {
        List<StuLecApplyVO> list = service.totalStuLecApplyList(map);
//        log.info("로그 페이지 전체 개수 " + list.size());
        log.info("로그 페이지 보여줄 map " + (String) map.get("size"));

        int size = Integer.parseInt((String) map.get("size"));

        // 페이징 처리
        int total = list.size(); // 전체 데이터 수
        int totalPages = (int) Math.ceil((double) total / size); // 전체 페이지 수

        log.info("로그 총 페이지: " + totalPages);

        Map<String, Object> result = new HashMap<>();
        result.put("totalPages", totalPages); // 전체 페이지 수	를 결과에 추가

        return result;
    }

    //	수강신청 페이지 이동
    @GetMapping("/lecApply")
    public String getLecApply() {
//    	log.info("로그 : 수강신청 페이지로 이동합니다");
        return "lec/lecApply";
    }

}
