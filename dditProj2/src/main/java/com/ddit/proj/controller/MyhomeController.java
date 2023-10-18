package com.ddit.proj.controller;

import com.ddit.proj.service.NoticeService;
import com.ddit.proj.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/home")
public class MyhomeController {

    @Autowired
    public NoticeService noticeService;

    @ResponseBody
    @GetMapping("/menu")
    public Map<String, List<String>> getMenu(){

        // 메뉴 데이터를 생성
        Map<String, List<String>> menuData = new HashMap<>();

        List<String> breakfast = Arrays.asList("쌀밥", "어묵국", "동그랑땡", "브로콜리숙회", "맛김치", "도시락김", "숭늉");
        List<String> lunch = Arrays.asList("백미밥/잡곡밥", "시원한 무채콩나물국", "등심돈까스", "쫄면무침", "목이버섯볶음", "맛김치");
        List<String> dinner = Arrays.asList("쌀밥", "사골떡만둣국", "꼬마메밀전병", "연근땅콩조림", "무말랭이무침", "맛김치", "야채샐러드&드레싱");

        menuData.put("breakfast", breakfast);
        menuData.put("lunch", lunch);
        menuData.put("dinner", dinner);

        return menuData;
    }

    // 총지표 페이지 이동
    @GetMapping("/chart")
    public String getChartpage() {
        return "chart/chartJsSample";
    }


    // 메인화면용 공지사항
    @ResponseBody
    @GetMapping("/mainNotice")
    public List<NoticeVO> getMainNotice() {
        List<NoticeVO> list = noticeService.getMainNotice();
        log.debug(  "로그 : getMainNotice " + list);

        return list;
    }

}
