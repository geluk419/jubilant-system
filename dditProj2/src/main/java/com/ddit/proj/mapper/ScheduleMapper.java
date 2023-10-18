package com.ddit.proj.mapper;

import java.util.List;
import java.util.Map;

import com.ddit.proj.vo.ScheduleVO;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ScheduleMapper {
	
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

	// select
	List<ScheduleVO> getSeletSchedule(Map<String, String> map);


}
