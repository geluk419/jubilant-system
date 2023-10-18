package com.ddit.proj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ddit.proj.vo.DormitoryApplyVO;
import com.ddit.proj.vo.StudentVO;

@Mapper
public interface StudentMapper {
	
	// Get List
	List<StudentVO> listStu();
	// Get One
	StudentVO getStu(StudentVO studentVO);
	// insert
	int  insertStu(StudentVO studentVO);
	// update
	int  updateStu(StudentVO studentVO);
	// delete
	int  deleteStu(StudentVO studentVO);
	
}
