package com.ddit.proj.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.TaskMapper;
import com.ddit.proj.service.TaskService;
import com.ddit.proj.vo.AttachVO;
import com.ddit.proj.vo.TaskSubmitVO;
import com.ddit.proj.vo.TaskVO;

@Service
public class TaskServiceImpl implements TaskService {

	@Autowired
	private TaskMapper taskmapper;
	
	@Override
	public List<TaskVO> getLecCode(String memNo) {
		return taskmapper.getLecCode(memNo);
		
	}

	@Override
	public List<TaskVO> getTaskList(String lecCode) {
		return taskmapper.getTaskList(lecCode);
	}
	
	//과목등록
	@Override
	public int insertTask(TaskVO taskVO) {
		return taskmapper.insertTask(taskVO);
	}
	//첨부파일등록
	@Override
	public int insertAttach(AttachVO attachVO) {
		return taskmapper.insertAttach(attachVO);
	}
	
	//첨부파일수정
	@Override
	public int updateTask(TaskVO taskVO) {
		return taskmapper.updateTask(taskVO);
	}
	
	//과제삭제
	@Override
	public int deleteTask(TaskVO taskVO) {
		return taskmapper.deleteTask(taskVO);
	}

	@Override
	public List<TaskSubmitVO> getTaskListByStu(String memNo) {
		return taskmapper.getTaskListByStu(memNo);
	}

	@Override
	public TaskVO taskDetail(String taskCode) {
		return taskmapper.taskDetail(taskCode);
	}

	@Override
	public int submitTask(TaskSubmitVO taskSubmitVO) {
		return taskmapper.submitTask(taskSubmitVO);
	}

	@Override
	public TaskSubmitVO taskDetailByStu(TaskSubmitVO taskSubmitVO) {
		return taskmapper.taskDetailByStu(taskSubmitVO);
	}

	@Override
	public int updateTaskDetail(TaskSubmitVO taskSubmitVO) {
		return taskmapper.updateTaskDetail(taskSubmitVO);
	}

	@Override
	public int deleteTaskDetail(String tsubCode) {
		return taskmapper.deleteTaskDetail(tsubCode);
	}

	@Override
	public List<TaskVO> getTask(String taskCode) {
		return taskmapper.getTask(taskCode);
	}

	@Override
	public List<TaskSubmitVO> getTaskSubmit(String taskCode) {
		return taskmapper.getTaskSubmit(taskCode);
	}

	@Override
	public int taskScoreUpdate(TaskSubmitVO taskSubmitVO) {
		return taskmapper.taskScoreUpdate(taskSubmitVO);
	}

	@Override
	public int insertSubmitAttach(AttachVO attachVO) {
		return taskmapper.insertSubmitAttach(attachVO);
	}

}
