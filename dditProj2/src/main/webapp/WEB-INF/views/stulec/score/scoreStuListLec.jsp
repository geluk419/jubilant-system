<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>
  .row {
      align-items: flex-end;
  }
 
 
  .modal-dialog modal-dialog-centered{
  	width : 100%;
  	height : 100%;
  }
</style>



<div class="wrapper" style="width: 100%; margin: auto;">
  <main role="main" class="main-content mx-auto" >
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-12">
          <h2 class="h4 mb-1" style="text-align:center;">성적</h2>
          <p class="mb-3" style="text-align:center;">경제학개론</p>
          
          
		  <div style="text-align:right;">
          </div>
                
         

          

	
          <!-- Small table -->
          <div class="row my-3">
            <div class="col-md-12">
              <div class="card shadow" >
                <div class="card-body">
                
                  <!-- table -->
                  
<%--                    <p>나와바${getScoreStuLec}</p>  --%>
                  
                  
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memberVO" var="memberVO"/>
</sec:authorize>
                  <table class="table datatables text-center" id="dataTable-1" >
                    
                    <thead class="bg-my text-black">
                    <p></p>
                    <tr>
                      <th>시험</th>
                      <th>과제</th>
                      <th>출결</th>
                      <th>총평점</th>
                      <th>총등급</th>
                      <th>성적이의신청</th>
                      <th>성적이의신청 결과</th>
                      
                      
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                      <td>${getScoreStuLec.scoreTest}/50</td>
                      <td>${getScoreStuLec.scoreTask}/40</td>
                      <td>${getScoreStuLec.scoreAten}/10</td>
                      <td>${getScoreStuLec.scoreAll}/4.5</td>
                      <td>${getScoreStuLec.codeScreGrade}</td>
                      <td>
                      	<c:choose>
				            <c:when test="${empty getScoreStuLec.objTtl}">
				                <button class="btn btn-my" type="button" data-toggle="modal" data-target="#scoreApply">신청</button>
				            </c:when>
				            <c:otherwise>
				                <button class="btn btn-primary" type="button">신청완료</button>
				            </c:otherwise>
						</c:choose>
                      
                        
                      </td>
                      <td>
                        <button class="btn btn-my" type="button" data-toggle="modal" data-target="#scoreResult">결과</button>
                      </td>
<!--                       <td> -->
<%--                       	<input type="hidden" class="form-control" id="lecCode" value="${getScoreStuLec.lecCode}"> --%>
<!--                       </td> -->
                    </tr>

                    </tbody>
                    
                  </table>
                  
                  
                  
                  
                  
                </div>
              </div>
              
              
              
              
              
               <!-- Small table -->
	          
      </div> <!-- .row -->
    </div> <!-- .container-fluid -->

    
      
    </div>

  </main> <!-- main -->
</div>



					
            		
            		<!-- 모달 -->
		            <div class="modal fade show" id="scoreApply" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" style="padding-right: 19px;" aria-modal="true">
		              <div class="modal-dialog modal-dialog-centered" role="document">
		                <div class="modal-content">
		                  <div class="modal-header">
		                    <h4 class="modal-title" id="verticalModalTitle">성적이의 신청</h4>
		                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                      <span aria-hidden="true">×</span>
		                    </button>
		                  </div>
		                  <div class="card-body">
                      
                            <div class="modal-body">
                              <form>
                                <div class="form-group">
                                  <label for="recipient-name" class="col-form-label">제목</label>
                                  <input type="text" class="form-control" id="objTtl">
                                </div>
                                <div class="form-group">
                                  <label for="message-text" class="col-form-label">내용</label>
                                  <textarea class="form-control" id="objCon" rows="5"></textarea>
                                </div>
                              </form>
                            </div>
                            <div class="modal-footer">
                              <button type="button" id="objectBtn" class="btn btn-my">신청</button>
                              <button type="button" id="autoFill" class="btn btn-primary">자동입력</button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
            		<!-- 모달 -->
            		
            		
            		<!-- 모달 -->
		            <div class="modal fade show" id="scoreResult" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" style="padding-right: 19px;" aria-modal="true">
		              <div class="modal-dialog modal-dialog-centered" role="document">
		                <div class="modal-content">
		                  <div class="modal-header">
		                    <h4 class="modal-title" id="verticalModalTitle">성적이의신청 결과</h4>
		                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                      <span aria-hidden="true">×</span>
		                    </button>
		                  </div>
		                  <div class="card-body">
                      
                            <div class="modal-body">
                              <form>
                                <div class="form-group">
                                  <label for="recipient-name" class="col-form-label">결과</label>
                                  <input type="text" class="form-control" id="recipient-name">
									<c:choose>
									    <c:when test="${getObjection.objYn == 'Y'}">
									        <script>
									            document.getElementById("recipient-name").value = "승인";
									        </script>
									    </c:when>
									    <c:when test="${getObjection.objYn == 'N'}">
									        <script>
									            document.getElementById("recipient-name").value = "반려";
									        </script>
									    </c:when>
									</c:choose>
                                </div>
                                <div class="form-group">
                                  <label for="message-text" class="col-form-label">사유</label>
                                  <textarea class="form-control" id="message-text" rows="5">${getObjection.objReturn}</textarea>
                                </div>
                              </form>
                            </div>
                            
                          </div>
                        </div>
                      </div>
                    </div>
            		<!-- 모달 -->
            		





<!-- JavaScript 코드 추가 -->
<script>

	//서버에서 발행된 헤더네임과 토큰갑사 저장
	const header = '${_csrf.headerName}';
	const token = '${_csrf.token}';
	

	$("#objectBtn").on("click", () => {
		
		let lecCode = "${lecCode}";
		let memNo = "${memberVO.memNo}";
		let objDt = "${objDt}";
		
		let objectionVO = {
			"objTtl":$("#objTtl").val(),
			"objCon":$("#objCon").val(),
			"memNo":memNo,
			"lecCode":lecCode
		}
		//objectionVO:{"objTtl":"1","objCon":"2","memNo":"202308S001","lecCode":"001"}
		console.log("objectionVO:" + JSON.stringify(objectionVO));
		$.ajax({
			type: "post",
			url: "/stu/scoreObjection",
			data: JSON.stringify(objectionVO),
			contentType: "application/json;charset=utf-8",
			dataType: "text",
			beforeSend: function (xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function (rslt) {
				console.log(rslt);

				if (rslt == 1) {
		   			Swal.fire({
			   		      icon: 'success',
			   		      title: "이의신청이 완료되었습니다"
			   		    }).then(() => {
		   		    		window.location.href = "/stu/scoreLec/?lecCode="+lecCode;	
			   		    })
		   			 	
		   					
		   			} else {
		   				Swal.fire("이의신청신청실패");	
		   			}
			},
			error: function (xhr, status, error) {
				console.log("code: " + xhr.status)
				console.log("message: " + xhr.responseText)
				console.log("error: " + error);
			}
		})
	});

	
    //  버튼 클릭 시 모달 창 보이기
    $(document).ready(function () {
        $(".btn-primary").click(function () {
            $("#verticalModal").modal("show");
        });
    });
    
    $("#autoFill").on("click", function() {
  	  //시험 정보 입력
  	  $("#objTtl").val("경제학개론 2학기 성적문의")
  	  $("#objCon").val("과제 성적이 낮아서 성적이의신청합니다.")
  	  
    })
    
</script>