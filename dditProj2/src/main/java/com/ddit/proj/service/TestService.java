package com.ddit.proj.service;

import java.util.List;
import java.util.Map;

import com.ddit.proj.vo.TestChoiceVO;
import com.ddit.proj.vo.TestExamVO;
import com.ddit.proj.vo.TestResultVO;
import com.ddit.proj.vo.TestStuVO;
import com.ddit.proj.vo.TestSubmitVO;
import com.ddit.proj.vo.TestVO;

public interface TestService {
	List<TestVO> listTest();
	
	// 시험등록select
	List<TestVO> getTestVO(TestVO testVO);

	//
	TestVO getTest(int testCode);
	
	List<TestExamVO> getTestExam(int testCode);

	List<TestChoiceVO> getChoice(int testCode);
	
	
	int insertTest(TestVO testVO);

	int  updateTest(TestVO testVO);

	int  deleteTest(TestVO testVO);

	// TestExamVO
	int insertTestExam(TestExamVO examVO);
	
	// TestChoiceVO
	int insertTestChoice(TestChoiceVO testChoiceVO);
	
	// TestVO + TestExamVO
	String insertTestCombined(TestVO testVO);
	
	
	// 시험응시
	List<TestStuVO> testStuStart(TestVO testVO);
	
	// 시험응시제출insert
	int insertAnswerSubmit(List<TestSubmitVO> list);
	
	// 시험등록명단select
	List<TestSubmitVO> getSubmitVO(String testCode);

	//시험결과등록의 상세보기
	List<Map<String,Object>> testStuDetailPost(Map<String, Object> map);
	
	List<TestResultVO> testResult(TestResultVO vo);

	//교수가 채점을 함
	int ansScoreUpdatePost(Map<String, Object> map);
}
