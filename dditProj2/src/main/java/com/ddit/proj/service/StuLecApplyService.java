package com.ddit.proj.service;

import com.ddit.proj.vo.DepartmentVO;
import com.ddit.proj.vo.StuLecApplyVO;

import java.util.List;
import java.util.Map;

public interface StuLecApplyService {

    public int insertStuLecApply(StuLecApplyVO stuLecApplyVO);

    public int updateStuLecApply(StuLecApplyVO stuLecApplyVO);

    public int deleteStuLecApply(StuLecApplyVO stuLecApplyVO);
    
    public int countStuLecApply(Map<String, String> map);

    public List<StuLecApplyVO> selectStuLecApplyList(Map<String, Object> map);

    public List<StuLecApplyVO> totalStuLecApplyList(Map<String, Object> map);

    public List<DepartmentVO> getLecApplySelect();

    public StuLecApplyVO selectStudent(String stuId);

    public List<StuLecApplyVO> selectStuLecApply(String stuId);

    // 수강한 강의 목록
    List<StuLecApplyVO> getStuLecList(String memNo);
}
