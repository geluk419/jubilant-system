package com.ddit.proj.mapper;

import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.RecordApplyVO;
import com.ddit.proj.vo.RecordStuVO;
import com.ddit.proj.vo.StudentVO;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RecordApplyMapper {
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

    String recEdeMax();

    // 반려 사유 보기
    RecordApplyVO getRecDetail(String recCode);


	//학적 구분 불러오기
	//<select id="selectRecMan" parameterType="String" resultType="CodeVO">
    public List<CodeVO> selectRecMan(String codeId);

	//신청된 학생 불러오기
	//<select id="selectRecStu" resultType="RecordStuVO">
    public List<RecordStuVO> selectRecStu();

	//신청한 학생 상세
	//<select id="getRecStu" resultType="RecordStuVO" parameterType="RecordStuVO">
    public RecordStuVO getRecStu(RecordStuVO RecordStuVO);

	//승인 처리
	//<update id="recOk" parameterType="RecordApplyVO">
    public int recOk(RecordStuVO recordStuVO);

	//반려 처리
	//<update id="recReject" parameterType="RecordStuVO">
    public int recReject(RecordStuVO recordStuVO);
}
