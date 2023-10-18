package com.ddit.proj.service;

import java.util.List;

import com.ddit.proj.vo.DormitoryApplyVO;
import com.ddit.proj.vo.StudentVO;

public interface StudentService {
		List<StudentVO> listStu();
		
		StudentVO getStu(StudentVO studentVO);
		
		int  insertStu(StudentVO studentVO);
		
		int  updateStu(StudentVO studentVO);
		
		int  deleteStu(StudentVO studentVO);
}
