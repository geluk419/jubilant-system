package com.ddit.proj.service.Impl;

import com.ddit.proj.mapper.ScheduleMapper;
import com.ddit.proj.service.ScheduleService;
import com.ddit.proj.vo.ScheduleVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ScheduleServiceImpl implements ScheduleService {

    @Autowired
    private ScheduleMapper mapper;


    @Override
    public List<ScheduleVO> getAllSchedule() {
        return mapper.getAllSchedule();
    }

    @Override
    public ScheduleVO getOneSchedule(String schCode) {
        return mapper.getOneSchedule(schCode);
    }

    @Override
    public int insertSchedule(ScheduleVO scheduleVO) {
        return mapper.insertSchedule(scheduleVO);
    }

    @Override
    public int updateSchedule(ScheduleVO scheduleVO) {
        return mapper.updateSchedule(scheduleVO);
    }

    @Override
    public int deleteSchedule(String schCode) {
        return mapper.deleteSchedule(schCode);
    }

    @Override
    public List<ScheduleVO> getCodeSchSeNm() {
        return mapper.getCodeSchSeNm();
    }

    @Override
    public List<ScheduleVO> getCodeSchSeMemNm() {
        return mapper.getCodeSchSeMemNm();
    }

    @Override
    public List<ScheduleVO> getSeletSchedule(Map<String, String> map) {
        return mapper.getSeletSchedule(map);
    }
}
