package com.ddit.proj.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ddit.proj.vo.AttachVO;
import com.ddit.proj.vo.TaskSubmitVO;
import com.ddit.proj.vo.TaskVO;

@Mapper
public interface TaskMapper {

	// 강의 목록 가져오기
	public List<TaskVO> getLecCode(String memNo);
		
	//과제목록가져오기
	public List<TaskVO> getTaskList(String lecCode);
	
	//과목등록
	public int insertTask(TaskVO taskVO);
	
	//첨부파일등록
	public int insertAttach(AttachVO attachVO);
	
	//과제수정
	public int updateTask(TaskVO taskVO);
	
	//과제삭제
	public int deleteTask(TaskVO taskVO);
	
	// 해당 학생이 제출한 과제목록 가져오기
	public List<TaskSubmitVO> getTaskListByStu(String memNo);

	// 해당 과제 상세보기
	public TaskVO taskDetail(String taskCode);

	// 해당 학생이 제출한 과제상세보기
	public TaskSubmitVO taskDetailByStu(TaskSubmitVO taskSubmitVO);

	// 과제상세 > 제출
	public int submitTask(TaskSubmitVO taskSubmitVO);

	// 과제상세 > 수정
	public int updateTaskDetail(TaskSubmitVO taskSubmitVO);
	
	// 과제상세 > 삭제
	public int deleteTaskDetail(String tsubCode);

	// 해당 과제 TASK테이블 조회
	public List<TaskVO> getTask(String taskCode);

	// 해당 과제 TASK_SUBMIT테이블 조회
	public List<TaskSubmitVO> getTaskSubmit(String taskCode);
	
	// 과제상세 > 점수등록
	public int taskScoreUpdate(TaskSubmitVO taskSubmitVO);

	// 제출 첨부파일 등록
	public int insertSubmitAttach(AttachVO attachVO);
	
	
	
}
