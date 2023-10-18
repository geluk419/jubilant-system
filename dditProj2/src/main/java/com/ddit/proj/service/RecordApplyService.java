package com.ddit.proj.service;

import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.RecordApplyVO;
import com.ddit.proj.vo.RecordStuVO;
import com.ddit.proj.vo.StudentVO;

import java.util.List;

public interface RecordApplyService {
    // RecordApply CRUD

    // one select
    RecordApplyVO getRecordApply(RecordApplyVO recordApplyVO);

    // all select
    List<RecordApplyVO> getAllRecordApply(String memNo);

    // insert
    int insertRecordApply(RecordApplyVO recordApply);

    // update
    int updateRecordApply(RecordApplyVO recordApply);

    // delete
    int deleteRecordApply(RecordApplyVO recordApply);

    // 신청 시 승인된 마지막 날짜 SELECT
    String recEdeMax();

    // 반려사유보기
    RecordApplyVO getRecDetail(String recCode);
    
    
    public List<CodeVO> selectRecMan(String codeId);
    
    public List<RecordStuVO> selectRecStu();
    
    public RecordStuVO getRecStu(RecordStuVO RecordStuVO);
    
    public int recOk(RecordStuVO recordStuVO);

    public int recReject(RecordStuVO recordStuVO);
}
