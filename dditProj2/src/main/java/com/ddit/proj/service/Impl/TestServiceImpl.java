package com.ddit.proj.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ddit.proj.mapper.TestMapper;
import com.ddit.proj.service.TestService;
import com.ddit.proj.vo.TestChoiceVO;
import com.ddit.proj.vo.TestExamVO;
import com.ddit.proj.vo.TestResultVO;
import com.ddit.proj.vo.TestStuVO;
import com.ddit.proj.vo.TestSubmitVO;
import com.ddit.proj.vo.TestVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TestServiceImpl implements TestService {
	
	@Autowired
	private TestMapper testMapper;
	
	@Override
	public List<TestVO> listTest() {
		return testMapper.listTest();
	}

	//
	@Override
	public TestVO getTest(int testCode) {
		return testMapper.getTest(testCode);
	}
	
	@Override
	public List<TestExamVO> getTestExam(int testCode) {
		return testMapper.getTestExam(testCode);
	}
	
	@Override
	public List<TestChoiceVO> getChoice(int testCode) {
		return testMapper.getChoice(testCode);
	}
	
	
	
	
	
	// 시험등록 select
	@Override
	public List<TestVO> getTestVO(TestVO testVO) {
		return testMapper.getTestVO(testVO);
	}
	
	

	@Override
	public int insertTest(TestVO testVO) {

		return testMapper.insertTest(testVO);
	}

	@Override
	@Transactional
	public int updateTest(TestVO testVO) {
		
		//test 수정
		int rs=  testMapper.updateTest(testVO);
		
		// sql(보통은 성능적으로 유리, 단 inmemory가 아닌경우)로 반복하든 자바로 반복하든 돌려야 함
		List<TestExamVO> examList = testVO.getTestExamList();
		for (TestExamVO testExamVO : examList) {
			//문제 각가 업업
			rs += testMapper.updateTestExam(testExamVO);
			List<TestChoiceVO> choiceList = testExamVO.getTestChoiceList();
			//문제마다 보기 업업
			for (TestChoiceVO testChoiceVO : choiceList) {
				rs +=testMapper.updateTestChoice(testChoiceVO);
			}
		}		 
		 return rs; 
	}

	@Override
	public int deleteTest(TestVO testVO) {
		return testMapper.deleteTest(testVO);
	}

	@Override
	public int insertTestExam(TestExamVO examVO) {
		return testMapper.insertTestExam(examVO);
	}

	@Override
	@Transactional // 세트 동작
	public String insertTestCombined(TestVO testVO) {
		//TestVO(testCode=826, lecCode=001, testNm=경제학개론 쪽지시험, testDe=2023-10-17, testSt=19:02, testEt=23:02, testStartYn=null, testLimit=30, ansYn=null, testExamList=[TestExamVO(steNo=1, testCode=999, steType=200, steQue=첫번째 문제, steRightAnswer=option1, testChoiceList=[]), TestExamVO(steNo=2, testCode=999, steType=200, steQue=두번째 문제, steRightAnswer=option2, testChoiceList=[]), TestExamVO(steNo=3, testCode=999, steType=200, steQue=세번째 문제, steRightAnswer=option3, testChoiceList=[]), TestExamVO(steNo=4, testCode=999, steType=200, steQue=네번째 문제, steRightAnswer=option4, testChoiceList=[]), TestExamVO(steNo=5, testCode=999, steType=200, steQue=다섯번째 문제, steRightAnswer=option3, testChoiceList=[]), TestExamVO(steNo=6, testCode=999, steType=200, steQue=여섯번째 문제, steRightAnswer=option1, testChoiceList=[]), TestExamVO(steNo=7, testCode=999, steType=200, steQue=일곱번째 문제, steRightAnswer=option4, testChoiceList=[]), TestExamVO(steNo=8, testCode=999, steType=200, steQue=여덟번째 문제, steRightAnswer=option2, testChoiceList=[]), TestExamVO(steNo=9, testCode=999, steType=200, steQue=아홉번째 문제, steRightAnswer=option3, testChoiceList=[]), TestExamVO(steNo=10, testCode=999, steType=200, steQue=열번째 문제, steRightAnswer=option1, testChoiceList=[])], memNo=null)
		// 테스트 insert  기대값  1
		//1) TEST 테이블에 insert
		int rslt = testMapper.insertTest(testVO);
		
		int testCode = testVO.getTestCode();
		int steCode  = 0;
		//testCode	826	

		log.debug("testCode" + testCode);
		
		int examCnt =0;
		int choiceCnt = 0;
		//TestExamVO(steNo=1, testCode=999, steType=200, steQue=첫번째 문제, steRightAnswer=option1, testChoiceList=[])
		for (TestExamVO examVO : testVO.getTestExamList()) {
			examVO.setTestCode(testCode);
			
			//2) TESTEXAM 테이블에 insert
		    examCnt += testMapper.insertTestExam(examVO);
		    steCode = examVO.getSteNo();
		    for (TestChoiceVO choiceVO : examVO.getTestChoiceList()) {
				 choiceVO.setTestCode(testCode);
				 choiceVO.setSteNo(steCode);
				 
				//3) TESTCHOICE 테이블에 insert
				choiceCnt += testMapper.insertTestChoice(choiceVO);
			}   
		}
				
		return  Integer.toString(examCnt + choiceCnt);
	}

	@Override
	public int insertTestChoice(TestChoiceVO testChoiceVO) {
		return testMapper.insertTestChoice(testChoiceVO);
	}

	// 시험응시
	@Override
	public List<TestStuVO> testStuStart(TestVO testVO) {
		return testMapper.testStuStart(testVO);
	}

	// 시험응시제출insert
	@Override
	public int insertAnswerSubmit(List<TestSubmitVO> list) {
		return testMapper.insertAnswerSubmit(list);
	}

	// 시험등록명단select
	@Override
	public List<TestSubmitVO> getSubmitVO(String testCode) {
		return testMapper.getSubmitVO(testCode);
	}

	
	//시험결과등록의 상세보기
	@Override
	public List<Map<String,Object>> testStuDetailPost(Map<String,Object> map){
		return this.testMapper.testStuDetailPost(map);
	}

	@Override
	public List<TestResultVO> testResult(TestResultVO vo) {
		return testMapper.testResult(vo);
	}
	//교수가 채점을 함
	@Override
	public int ansScoreUpdatePost(Map<String,Object> map) {
		return this.testMapper.ansScoreUpdatePost(map);
	}

	
	

	


	

	

	

}
