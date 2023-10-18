<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 

<style>
	/* 모달 css */
	
	.close {
		position: absolute;
		top: 10px;
		right: 10px;
		font-size: 20px;
		cursor: pointer;
	}
	
	#nav-link {
		rgb (182, 26, 63)
	}
	
	/* 모달 css */
	
     .row {
       align-items: flex-end;
     }
</style>


		
		
		
		
		
		
		<main role="main" class="main-content" style="width: 100%; margin: auto;">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12">
						<div class="row">
							<!-- Small table -->
							<div class="col-md-12 my-4">
								<h2 class="h4 mb-1" style="text-align:center;">시험</h2>
								<p class="mb-3" style="text-align:center;">경제학개론</p>
								<div class="card shadow">
									<div class="card-body" >
										<div class="toolbar">
											<form class="form">
												<div class="form-row">
													<div class="form-group col-auto mr-auto">
														<label class="my-1 mr-2 sr-only"
															for="inlineFormCustomSelectPref1">Show</label>

													</div>

												</div>
											</form>
										</div>
										
										<!-- table -->
										<table class="table datatables text-center" id="dataTable-1">
										<tbody>
											<thead class="bg-my text-black">
												<tr>
													<th></th>
													<th>시험</th>
													<th>시험일자</th>
													<th>시작시간</th>
													<th>종료시간</th>
													<th>제한시간</th>
													<th></th>
												</tr>
											</thead>
											
											

											<tbody>
												<c:forEach items="${testNoticeList}" var="TestVO">
													<tr>

														<td></td>
														<td>
															<p class="mb-0 text-muted" >
																<strong>${TestVO.testNm}</strong>
															</p>
															<!--                               <small class="mb-0 text-muted">2474</small> -->
														</td>
														<td>
															<p class="mb-0 text-muted">
																<strong>
							                                    	<fmt:formatDate value="${TestVO.testDe}" pattern="yyyy-MM-dd" />
							                                    </strong>
															</p>
														</td>
														<td>
															<p class="mb-0 text-muted">
																<strong>${TestVO.testSt}</strong>
															</p>
														</td>
														<td>
															<p class="mb-0 text-muted">
																<strong>${TestVO.testEt}</strong>
															</p>
														</td>
														<td>
															<p class="mb-0 text-muted">
																<strong>${TestVO.testLimit}분</strong>
															</p>
														</td>
														<td>
<!-- 															<a href="#" class="btn btn-my">응시하기</a><br/><br/> -->
														<c:choose>
														<c:when test="${TestVO.ansYn eq 'Y' }">
															<a class="btn btn-primary" style="color: white;">제출완료</a>
														</c:when>
														<c:otherwise>
 															<a href="/stu/testStuStart/${TestVO.testCode}?lecCode=${TestVO.lecCode}" class="btn btn-my">응시하기</a>
														</c:otherwise>
														</c:choose>
															<button class="btn btn-my" id="resultBtn" data-test-code="${TestVO.testCode}" type="button">결과보기</button>
														</td>
													</tr>
									</c:forEach>
									</tbody>
									</table>
									<!-- table -->

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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


</main>
									
									
									

									

<script type="text/javascript">
$(function(){
	const header = '${_csrf.headerName}';
    const token = '${_csrf.token}';
    
	$("#resultBtn").on("click", function(){
		let testCode = $(this).data("testCode")
		//alert("testCode" +testCode)
		$.ajax({
			type: "get",
			url: "/stu/testResult",
			data: {"testCode":testCode},
			beforeSend: function (xhr) {
 	          xhr.setRequestHeader(header, token);
 	        },
 	       	success: function (rslt) {
 	        	console.log("result : " + typeof(rslt));
 	        	qc_html = ''
 	        	let steNO = 1
 	        	totalScore = 0
 				rslt.forEach((data, index) => {
 					if (index % 4 == 0) {
	 					qc_html += '<div class="card my-3">'
	 					qc_html += '<div class="fs-5 text-end alert-secondary">'+ '배점 : ' + data.ansScore + '/10</div>'
	 					qc_html += '<div class="card-body">'
	 					qc_html += '<div class="form-group m-0" id="problem">'
						qc_html += '<h5 class="card-title h6">' + steNO++ + '. ' + data.steQue + '</h5>'
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
	   
// 		$.ajax({
// 	        type: "post",
// 	        url: "/prof/testStuDetail",
// 	        data: JSON.stringify(data),
// 	        contentType: "application/json;charset=utf-8",
// 	        dataType: "json",
// 	        beforeSend: function (xhr) {
// 	          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
// 	        },
// 	        success: function (rslt) {
// 	          console.log("rslt : " + JSON.stringify(rslt));
	
// 	          if (rslt) {
// 		   			Swal.fire
// 						({
// 			   		      icon: 'success',
// 			   		      title: ""
// 			   		    }).then((result) => {
// // 		   		    		window.location.href = "/prof/test";	

							
// 			   		    });
// 	   			} else {
// 	   				Swal.fire("");	
// 	   			}
// 	        },
// 	        error: function (xhr, status, error) {
// 	          console.log("code: " + xhr.status)
// 	          console.log("message: " + xhr.responseText)
// 	          console.log("error: " + error);
// 	        }
// 	      });
	});
	
	//교수가 채점(register)
	$("#register").on("click",function(){
		
		let testCode = "${testCode}";
		
		console.log("testCode : " + testCode);
		
		let memNo = sessionStorage.getItem("memNo");
		
		console.log("memNo : " + memNo);
		
		$("#testCode0").val(testCode);
		$("#memNo0").val(memNo);
		
		$("#frm0").submit();
	});
});
</script>
									
