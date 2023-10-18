package com.ddit.proj.service.Impl;

import com.ddit.proj.mapper.RecordApplyMapper;
import com.ddit.proj.service.RecordApplyService;
import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.RecordApplyVO;
import com.ddit.proj.vo.RecordStuVO;
import com.ddit.proj.vo.StudentVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecordApplyServiceImpl implements RecordApplyService{


    @Autowired
    private RecordApplyMapper mapper;

    @Override
    public RecordApplyVO getRecordApply(RecordApplyVO recordApplyVO) {
        return mapper.getRecordApply(recordApplyVO);
    }

    @Override
    public List<RecordApplyVO> getAllRecordApply(String memNo) {
        return mapper.getAllRecordApply(memNo);
    }

    @Override
    public int insertRecordApply(RecordApplyVO recordApply) {
        return mapper.insertRecordApply(recordApply);
    }

    @Override
    public int updateRecordApply(RecordApplyVO recordApply) {
        return mapper.updateRecordApply(recordApply);
    }

    @Override
    public int deleteRecordApply(RecordApplyVO recordApply) {
        return mapper.deleteRecordApply(recordApply);
    }

    @Override
    public String recEdeMax() {
        return mapper.recEdeMax();
    }

    @Override
    public RecordApplyVO getRecDetail(String recCode) {
        return mapper.getRecDetail(recCode);
    };
    
    
	@Override
	public List<CodeVO> selectRecMan(String codeId) {
		return mapper.selectRecMan(codeId);
	}

	@Override
	public List<RecordStuVO> selectRecStu() {
		return mapper.selectRecStu();
	}

	@Override
	public RecordStuVO getRecStu(RecordStuVO RecordStuVO) {
		return mapper.getRecStu(RecordStuVO);
	}

	@Override
	public int recOk(RecordStuVO recordStuVO) {
		return mapper.recOk(recordStuVO);
	}

	@Override
	public int recReject(RecordStuVO recordStuVO) {
		return mapper.recReject(recordStuVO);
	}

}
