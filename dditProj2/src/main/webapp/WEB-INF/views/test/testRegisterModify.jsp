<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>

    </script>


    <!doctype html>
    <html lang="en">
    <main role="main" class="main-content" style="width: 70%; margin: auto;">
      <div class="container-fluid">
        <div class="row justify-content-center">
          <div class="col-12">
            <h2 class="h4 mb-1" style="text-align:center;">시험 수정</h2><br/>
            <p class="text-muted"></p>
            <div class="card-deck">
              <div class="card shadow mb-4">
                <div class="card-body">
                  <form id="yerinForm">
                    <sec:csrfInput />
                    <div class="form-row">
                      <div class="form-group col-md-6">
                        <input type="hidden" id="testCode" name="testCode" value="${testVO.testCode}">
                        <label for="inputEmail4"><strong>시험일자</strong></label>
                        <input type="date" class="form-control" id="testDe" name="testDe" value="${testVO.testDe}">
                      </div>
                      <div class="form-group col-md-6">
                        <label for="inputPassword4"><strong>제한시간</strong></label>
                        <input type="text" class="form-control" id="testLimit" name="testLimit" value="${testVO.testLimit}">
                      </div>
                      <div class="form-group col-md-6">
                        <label for="inputEmail4"><strong>시작시간</strong></label>
                        <input type="time" class="form-control" id="testSt" name="testSt" value="${testVO.testSt}">
                      </div>
                      <div class="form-group col-md-6">
                        <label for="inputPassword4"><strong>종료시간</strong></label>
                        <input type="time" class="form-control" id="testEt" name="testEt" value="${testVO.testEt}">
                      </div>
                    </div>

                    <div class="form-group" >
                      <label for="testNm"><strong>시험이름</strong></label>
                      <input type="text" class="form-control" id="testNm" name="testNm" value="${testVO.testNm}">
                    </div><br />
<%-- 					<p>개똥이 : ${testVO}</p> --%>
                    <button type="button" class="btn btn-my" id="plus" style="float: right;">+</button>
                    <br />
					  <!--[TestVO(testCode=344, lecCode=0, testNm=null, testDe=null, testSt=null, testEt=null, testStartYn=null, testLimit=null, 
				      	   testExamList=[TestExamVO(steNo=409, testCode=344, steType=200, steQue=ex, steRightAnswer=option1, 
				      			   testChoiceList=[
				      						TestChoiceVO(testCode=344, steNo=409, steSelectNo=1, steSelect=ex1), 
				      						TestChoiceVO(testCode=344, steNo=409, steSelectNo=2, steSelect=ex1), 
				      						TestChoiceVO(testCode=344, steNo=409, steSelectNo=3, steSelect=ex1), 
				      						TestChoiceVO(testCode=344, steNo=409, steSelectNo=4, steSelect=ex1)])])]
				      -->
				    <!-- testVO.testExamList : List<TestExamVO> testExamList -->				    
					<c:forEach var="testExamVO" items="${testVO.testExamList}" varStatus="stat">
	                    <div id="problems" style="border: 1px solid #ccc; border-radius: 10px; padding: 10px;">
	                      <div class="form-group" id="problem">
	                        <label for="steQue" id="testCnt" ><strong>시험문제 ${stat.count}</strong></label>
<%-- 	                        <label for="steQue" id="testCnt" >시험문제 ${stat.count} / ${testExamVO.steRightAnswer}</label> --%>
	                        <input type="text" class="form-control" id="steQue" name="steQue" value="${testExamVO.steQue}"><br />
							
							<!-- 보기 시작 
							testExamVO.testChoiceList : List<TestChoiceVO> testChoiceList
							-->
							<c:forEach var="testChoiceVO" items="${testExamVO.testChoiceList}" varStatus="stat2">
		                        <div class="form-check">
		                          <input class="form-check-input" type="radio" name="option${stat.count}" id="steType" value="option${stat2.count}"
		                          	<c:if test="${testExamVO.steRightAnswer == 'option'+=stat2.count}">checked</c:if>
		                          >
		                          <label class="form-check-label" for="gridRadios1"><strong>${stat2.count}</strong></label>
		                          <input type="text" class="form-control" id="steSelect" name="steSelect"
		                            value="${testChoiceVO.steSelect}">
		                        </div>
	                        </c:forEach>
	                        <!-- 보기 끝 -->
	                      </div>
	                      </div>
	                      <br/>
                      </c:forEach>
                    </div>
                  </form>
                    <button type="submit" class="btn btn-my" id="save">저장</button>
                </div>
              </div>


    </main> <!-- main -->
    </div> <!-- .wrapper -->


    <script>
	   
    
    
      const header = '${_csrf.headerName}';
      const token = '${_csrf.token}';

      // 문제추가 
      const testExamDivPar = document.querySelector("#problems");
      const testExamDiv = document.querySelector("#problem");

      
      let problemCount = 1; // 초기 문제 개수
      $("#plus").click(function () {
        // 새로운 문제 추가
        problemCount++; // 문제 개수 증가
        let newTestExamDiv = testExamDiv.cloneNode(true);  // 부모만 복사

        let ckBoxes =newTestExamDiv.querySelectorAll("[type=radio]");
        let labels = newTestExamDiv.querySelectorAll(".form-check-label");
        for(let i=0; i<ckBoxes.length; i++){
          console.log("메롱!",ckBoxes[i]);
          ckBoxes[i].setAttribute("name",`option\${problemCount}`);
          labels[i].setAttribute("for",`option\${problemCount}`);
        }

        newTestExamDiv.querySelector("#testCnt").innerHTML = `시험 문제  \${problemCount}`;

        testExamDivPar.appendChild(newTestExamDiv);
      });



      $("#yerinForm").on("submit", () => {
        event.preventDefault();  // built-in event 막기

        let testExamList = [];

        let yerinProDivs = document.querySelectorAll("#problem");

        for(let i=0; i<yerinProDivs.length; i++){
            console.log(yerinProDivs[i].querySelectorAll("[type=radio]:checked")[0].value);
            let testExamVO = {
              steNo: (i+1), 
              testCode: 999,
              steType: 200,
              steQue: yerinProDivs[i].querySelector("#steQue").value,	
              steRightAnswer: yerinProDivs[i].querySelectorAll("[type=radio]:checked")[0].value,
              testChoiceList: []
            }

            let options = yerinProDivs[i].querySelectorAll("#steSelect");
            for(let i=0; i<options.length; i++){
              let testChoiceVO = {
                testCode: 999,
	              steNo: testExamVO.steNo,
	              steSelectNo: (i+1),
	              steSelect: options[i].value
              }
              testExamVO.testChoiceList.push(testChoiceVO);
            }
            testExamList.push(testExamVO);  
        }
          
        let testVO = {
          testCode: $("#testCode").val(),
          testDe: $("#testDe").val(),
          testLimit: $("#testLimit").val(),
          testSt: $("#testSt").val(),
          testEt: $("#testEt").val(),
          testNm: $("#testNm").val(),
          testExamList: testExamList
        }

        console.log("testVO : ", testVO);
        // console.log("testExamVO : ", testExamVO);

      });
      
      ////////////////////////////////////////////////////////////////////
      
       
      
      //수정
	   $("#save").on("click", ()=>{
		   
	   	let testVO = {
	   			testCode: $("#testCode").val(),
	            testDe: $("#testDe").val(),
	            testLimit: $("#testLimit").val(),
	            testSt: $("#testSt").val(),
	            testEt: $("#testEt").val(),
	            testNm: $("#testNm").val()
	   	}
		console.log("testVO:", testVO);
	   	
	   	$.ajax({
	   		type : "PUT",
	   		url : "/prof/testRegisterModify",
	   		data : JSON.stringify(testVO),
	   		contentType : "application/json; charset=utf-8",
	   		dataType : "text",
	   		beforeSend:function(xhr){
	   			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
	   		},
	   		success: function (rslt) {
	            console.log(rslt);

	            if (rslt) {
		   			Swal.fire({
			   		      icon: 'success',
			   		      title: "시험 수정이 완료되었습니다"
			   		    }).then((result) => {
		   		    		window.location.href = "/prof/test";	
			   		    })
		   			 	
		   					
	   			} else {
	   				Swal.fire("시험수정 실패");	
	   			}
	          },
	   		error : function(xhr, status, error) {
	            console.log("code :" + xhr.status);
	            console.log("message :" + xhr.responseText);
	            console.log("error :" + xhr.error);
	   		}
	   	});
	   });
      
      
      
    </script>
    </body>

    </html>