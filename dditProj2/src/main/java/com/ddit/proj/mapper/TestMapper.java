package com.ddit.proj.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ddit.proj.vo.TestChoiceVO;
import com.ddit.proj.vo.TestExamVO;
import com.ddit.proj.vo.TestResultVO;
import com.ddit.proj.vo.TestStuVO;
import com.ddit.proj.vo.TestSubmitVO;
import com.ddit.proj.vo.TestVO;

@Mapper
public interface TestMapper {
	
	// Get List
	List<TestVO> listTest();

	//
	TestVO getTest(int testCode);
	
	List<TestExamVO> getTestExam(int testCode);
	
	List<TestChoiceVO> getChoice(int testCode);
	
	
	// 시험등록 select
	List<TestVO> getTestVO(TestVO testVO);
	
	
	// insert
	int  insertTest(TestVO testVO);
	// update
	int  updateTest(TestVO testVO);
	int  updateTestExam(TestExamVO testExamVO);
	int  updateTestChoice(TestChoiceVO testChoiceVO);
	
	// delete
	int  deleteTest(TestVO testVO);
	
	//
	int insertTestExam(TestExamVO examVO);
	//
	int insertTestChoice(TestChoiceVO testChoiceVO);
	
	// 시험응시select
	List<TestStuVO> testStuStart(TestVO testVO);
	
	// 시험응시제출insert
	int insertAnswerSubmit(List<TestSubmitVO> list);
	
	// 시험등록명단select
	List<TestSubmitVO> getSubmitVO(String testCode);
	
	//시험결과등록의 상세보기
	List<Map<String,Object>> testStuDetailPost(Map<String,Object> map);
	
	List<TestResultVO> testResult(TestResultVO vo);
	
	//교수가 채점을 함
	//<update id="ansScoreUpdatePost" parameterType="hashMap">
	int ansScoreUpdatePost(Map<String,Object> map);
}





