package com.ddit.proj.service.Impl;

import com.ddit.proj.mapper.StuLecApplyMapper;
import com.ddit.proj.service.StuLecApplyService;
import com.ddit.proj.vo.DepartmentVO;
import com.ddit.proj.vo.StuLecApplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class StuLecApplyServiceImpl implements StuLecApplyService {

    @Autowired
    private StuLecApplyMapper mapper;

    @Override
    public int insertStuLecApply(StuLecApplyVO stuLecApplyVO) {
        return mapper.insertStuLecApply(stuLecApplyVO);
    }

    @Override
    public int updateStuLecApply(StuLecApplyVO stuLecApplyVO) {
        return mapper.updateStuLecApply(stuLecApplyVO);
    }

    @Override
    public int deleteStuLecApply(StuLecApplyVO stuLecApplyVO) {
        return mapper.deleteStuLecApply(stuLecApplyVO);
    }

    @Override
    public int countStuLecApply(Map<String, String> map) {
        return mapper.countStuLecApply(map);
    }

    @Override
    public List<StuLecApplyVO> selectStuLecApplyList(Map<String, Object> map) {
        return mapper.selectStuLecApplyList(map);
    }

    @Override
    public List<StuLecApplyVO> totalStuLecApplyList(Map<String, Object> map) {
        return mapper.totalStuLecApplyList(map);
    }

    // 학과 가져오기
    @Override
    public List<DepartmentVO> getLecApplySelect(){
        return mapper.getLecApplySelect();
    }

    @Override
    public StuLecApplyVO selectStudent(String stuId) {
        return mapper.selectStudent(stuId);
    }

    @Override
    public List<StuLecApplyVO> selectStuLecApply(String stuId) {
        return mapper.selectStuLecApply(stuId);
    }

    @Override
    public List<StuLecApplyVO> getStuLecList(String memNo) {
        return mapper.getStuLecList(memNo);
    }
}
