package com.ddit.proj.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddit.proj.mapper.StudentMapper;
import com.ddit.proj.service.StudentService;
import com.ddit.proj.vo.StudentVO;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentMapper studentMapper;
	
	@Override
	public List<StudentVO> listStu() {
		return studentMapper.listStu();
	}

	@Override
	public StudentVO getStu(StudentVO studentVO) {
		return studentMapper.getStu(studentVO);
	}

	@Override
	public int insertStu(StudentVO studentVO) {
		return studentMapper.insertStu(studentVO);
	}

	@Override
	public int updateStu(StudentVO studentVO) {
		return studentMapper.updateStu(studentVO);
	}

	@Override
	public int deleteStu(StudentVO studentVO) {
		return studentMapper.deleteStu(studentVO);
	}

}
