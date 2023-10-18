<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<style>
  
  .row {
      align-items: flex-end;
  }
</style>

<div class="wrapper" style="width:100%;">
  <main role="main" class="main-content mx-auto">
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-12">
          <h2 class="mb-2 page-title text-center">시험결과등록</h2>
          <!-- Small table -->
          <div class="row my-3">
            <div class="col-md-12">
              <div class="card shadow">
                <div class="card-body">
                  <!-- table -->
                  <table class="table datatables text-center" id="dataTable-1" style="font-weight:bold;">
                    <thead class="bg-my text-black">
                    <tr>
                      <th></th>
                      <th>학번</th>
                      <th>학생명</th>
                      <th>제출시간</th>
                      <th>상세보기</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${testSubmitList}" var="TestSubmitVO">
                    <tr>
                      <td></td>
                      <td>${TestSubmitVO.memNo}</td>
                      <td>${TestSubmitVO.memNm}</td>
                      <td>${TestSubmitVO.ansSubmitTime}</td>
                      <td>
                        <button class="btn btn-my" id="detailBtn" data-test-code="${testCode}" data-mem-no="${TestSubmitVO.memNo}" type="button">상세보기</button>
                      </td>
                    </tr>
                   
					</c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
 			</div>
 			</div><!-- /. col -->
			</div>
		</div><!-- .row -->
	</div>
	
	<!-- 학생이 응시한 시험 폼 가져오기 -->
	<main role="main" id="testForm" class="main-content d-none" style="width: 70%; margin: auto;">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12">
						<div class="card-deck">
							<div class="card shadow mb-4">
								<div class="card-header" style="text-align: center;">총 점수 : &nbsp;  
									<strong class="card-title" id="totalScore"></strong>
								</div>
								<div class="card-body" id="problems">
								</div> <!-- .card-body -->
							</div> <!-- card show -->
						</div> <!-- card-deck -->
					</div> <!-- col-12 -->
				</div> <!-- row -->
			</div> <!-- container-fluid -->
		</main>
		
		<div class="dataTables_info" id="dataTable-1_btn" style="text-align: center;">
			<button type="button" class="btn btn-my" id="register">점수 등록</button>
		</div>
		<form id="frm0" name="frm" action="/prof/ansScoreUpdatePost" method="post">
			<input type="hidden" id="testCode0" name="testCode" value="" />
			<input type="hidden" id="memNo0" name="memNo" value="" />
			<sec:csrfInput />
		</form>
	</main>
	
	
	
	
	
	</main>
		</div>
			<!-- /. col -->


	 
<!-- simple table -->

<!-- JavaScript 코드 추가 -->
<script type="text/javascript">
let memNo; 
$(function(){
	const header = '${_csrf.headerName}';
    const token = '${_csrf.token}';
    
	$("#detailBtn").on("click", function(){
		let testCode = $(this).data("testCode")
		
		memNo = $(this).data("memNo")
		//alert("memNo" +memNo)
		$.ajax({
			type: "get",
			url: "/prof/testResult",
			data: {"testCode":testCode, "memNo":memNo},
			beforeSend: function (xhr) {
 	          xhr.setRequestHeader(header, token);
 	        },
 	       	success: function (rslt) {
 	        	console.log("result : " + typeof(rslt));
 	        	qc_html = ''
 	        	let steNo = 1
 	        	totalScore = 0
 				rslt.forEach((data, index) => {
 					console.log("result : " + data)
 					if (index % 4 == 0) {
	 					qc_html += '<div class="card my-3">'
	 					qc_html += '<div class="fs-5 alert-secondary">'+ '배점 : ' + data.ansScore + '</div>'
	 					qc_html += '<div class="card-body">'
	 					qc_html += '<div class="form-group m-0" id="problem">'
						qc_html += '<h5 class="card-title h6">' + steNo++ + '. ' + data.steQue + '</h5>'
						totalScore += data.ansScore
 					}
 					qc_html += '<div class="form-check py-2 card-text">'
					+'	<input class="form-check-input" type="radio" name="' + data.steNo + '" ' + (data.steSelectNo == data.ansAnswer ? "checked" : "") + '>'
					+'	<label class="form-check-label ' + (data.steRightAnswer == data.ansAnswer && data.steSelectNo == data.ansAnswer ? "alert-primary" : (data.steRightAnswer != data.ansAnswer && data.steSelectNo == data.ansAnswer ? "alert-danger" : "")) + '">' + data.steSelect + '</label>'
					+'</div>'
					if (index % 4 == 3) {
						qc_html += '</div>'
						qc_html += '</div>'
						qc_html += '</div>'
					}
					
 				})
 				
 				$("#problems").html(qc_html)
 	
				$("#testForm").removeClass("d-none")
				$("#totalScore").html(totalScore)
//  	          if (rslt) {
//  		   			Swal.fire
//  						({
//  			   		      icon: 'success',
//  			   		      title: ""
//  			   		    }).then((result) => {
//  			   		    });
//  	   			} else {
//  	   				Swal.fire("");	
//  	   			}
 	        },
 	        error: function (xhr, status, error) {
 	          console.log("code: " + xhr.status)
 	          console.log("message: " + xhr.responseText)
 	          console.log("error: " + error);
 	        }
		})
		
// 		let testCode = "${testCode}";
// 		console.log("testCode : " + testCode);
		
// 		//data-mem-no="달러중괄호TestSubmitVO.memNo중괄호"
// 		let memNo = $(this).data("memNo");
// 		console.log("memNo : " + memNo);
		
// 		sessionStorage.setItem("memNo",memNo);
		
// 		let data = {"testCode":testCode,"memNo":memNo};
		
// 		console.log("data : " + JSON.stringify(data));
// 		/*
// 		WHERE B.TEST_CODE = 샵{testCode}
// 		AND   A.MEM_NO = 샵{memNo}
// 		*/
	   
 		
	});
	
	//교수가 채점(register)
	$("#register").on("click",function(){
		
		let testCode = "${testCode}";
		console.log("testCode : " + testCode);
		
		console.log("체킁:",$(this)[0]);
		
		//let memNo = $(this).data("memNo");
 		console.log("memNo : " + memNo);
		
		
		//let memNo = sessionStorage.getItem("memNo");
		//alert("memNo" +memNo)
		
		$("#testCode0").val(testCode);
		$("#memNo0").val(memNo);
		
		sessionStorage.setItem("memNo",memNo);
		
		let data = {"testCode":testCode,"memNo":memNo};
		
		console.log("data : " + JSON.stringify(data));
		
		
		$.ajax({
 	        type: "post",
 	        url: "/prof/ansScoreUpdatePost",
 	        data: JSON.stringify(data),
 	        contentType: "application/json;charset=utf-8",
 	        dataType: "text",
 	        beforeSend: function (xhr) {
 	          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
 	        },
 	        success: function (rslt) {
 	          console.log("rslt : " + rslt);
	
 	          if (rslt=="success") {
 		   			Swal.fire
 						({
 			   		      icon: 'success',
 			   		      title: "등록되었습니다"
 			   		    }).then((result) => {
 			   		    	
 			   		    	// 자바변수 안붙여 , 자바스크립트 변수 붙여, 못 외운다면 붙였다 안붙였당
 			   		    	// 서버에서 자바가 먼저 해석하고, 해석된 내용이 브라우져로 와, html,css,javascript 
  		   		    		window.location.href = `/prof/testStuDetail/\${testCode}`;	

							
 			   		    });
 	   			} else {
 	   				Swal.fire("등록 실패");	
 	   			}
 	        },
 	        error: function (xhr, status, error) {
 	          console.log("code: " + xhr.status)
 	          console.log("message: " + xhr.responseText)
 	          console.log("error: " + error);
 	        }
 	      });
	});
});
</script>




