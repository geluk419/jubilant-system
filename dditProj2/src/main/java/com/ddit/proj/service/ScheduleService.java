package com.ddit.proj.service;

import com.ddit.proj.vo.ScheduleVO;

import java.util.List;
import java.util.Map;

public interface ScheduleService {

    // Get List
    List<ScheduleVO> getAllSchedule();
    // Get One
    ScheduleVO getOneSchedule(String schCode);
    // insert
    int  insertSchedule(ScheduleVO scheduleVO);
    // update
    int  updateSchedule(ScheduleVO scheduleVO);
    // delete
    int  deleteSchedule(String schCode);

    // 공통코드 가져오기
    List<ScheduleVO> getCodeSchSeNm();

    List<ScheduleVO> getCodeSchSeMemNm();

    List<ScheduleVO> getSeletSchedule(Map<String, String> map);
}
