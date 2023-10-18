<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" ></script>

<style>
.table-content {
    max-height: 400px;
    overflow-y: auto;
    margin-bottom: 100px;
}
.alert-danger {
    color: #000000;
    background-color: #f1e4e5;
    border-color: #f1e4e5;
}
.bg-danger-light {
    background: rgb(182, 26, 63);
}
</style>

	<div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-12">
        	<h3 style="margin-top:20px;">학생 재적관리</h3>
        	<hr style="margin-bottom: 40px;"/>
        	<h4 class="mt-4 page-title text-my">신청기간 설정</h4>
        	
        	<div class="form-row" style="margin-left:2px; margin-top: 20px;">
	        	<div class="form-group" style="margin-right:30px;">
	                <label for="rec">학적</label>
	                <select class="form-control" id="rec" name="rec" style="width: 250px;">
                          <option value="-1">학적 구분을 선택해주세요</option>
                          <c:forEach items="${recManList}" var="sel">
                          	  <option value="${sel.codeId}">${sel.codeNm}</option>
                          </c:forEach>
	                </select>
	            </div>
	            
	            <div>
	                <label for="date-input1">시작일 - 종료일</label>
	        		<div class="form-group" style="display: flex; align-items: center;">
		                <input type="text" id ="recSde" name="recSde" class="form-control datetimes" style="width: 250px;">
	           		</div>
	           	</div>

<!--                 <div class="form-row"> -->
<!-- 	                 <div class="form-group col-md-6"> -->
<!-- 	                   <label for="recSde">시작일</label> -->
<!-- 	                   <input type="date" class="form-control" id="recSde" name="recSde" placeholder=""> -->
<!-- 	                 </div> -->
<!-- 	                 <div class="form-group col-md-6"> -->
<!-- 	                   <label for="recEde">종료일</label> -->
<!-- 	                   <input type="date" class="form-control" id="recEde" name="recEde" placeholder=""> -->
<!-- 	                 </div> -->
<!--                 </div> -->
			         
			    <div class="form-group">
			         <button class="btn btn-my detail-btn" style="width:80px; height:35px; margin-left: 40px; margin-top:28px;" onclick="timeSetting()">설정</button>
                </div>
            </div>
            
        	
        	<hr style="margin-bottom: 40px; margin-top: 40px;"/>
					<div class="row align-items-center my-4">
						    <div class="col">
						        <h2 class="h3 mb-0 page-title">변동 신청 현황</h2>
						    </div>
						    <div class="col-auto">
						        <div class="input-group">
						            <form action="/admin/recMan" method="get" style="display: flex; align-items: center;">
						                <select id="userId" class="form-control" style="margin-right: 10px; height:40px; width:150px;">
						                    <option value="학적 구분">학적 구분</option>
								            <option value="휴학">휴학</option>
								            <option value="복학">복학</option>
								            <option value="자퇴">자퇴</option>
						                </select>
						                <button type="submit" id="ho" class="btn btn-my" style="color:white; border-color: transparent; height:40px;">검색</button>
						            </form>
						        </div>
						    </div>
						</div>
<!-- 			<ul class="nav nav-tabs mb-4" id="myTab" role="tablist"> -->
<!--                   <li class="nav-item"> -->
<!--                     <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">휴학</a> -->
<!--                   </li> -->
<!--                   <li class="nav-item"> -->
<!--                     <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">복학</a> -->
<!--                   </li> -->
<!--                   <li class="nav-item"> -->
<!--                     <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">자퇴</a> -->
<!--                   </li> -->
<!--             </ul> -->
            
            <!-- //////////////// 휴학 시작 ////////////////////////////// -->
			<div id="home" class="table-content">
              <table class="table datatables text-center" id="dataTable-1">
                  <thead class="bg-secondary-light">
                      <tr>
                          <th>연도</th>
                          <th>학기</th>
                          <th>학과</th>
                          <th>학년</th>
                          <th>학번</th>
                          <th>이름</th>
                          <th>상세보기</th>
                      </tr>
                  </thead>
                    <tbody>
                    	<c:forEach items="${studentVOList}" var="recordStuVO" varStatus="stat">
          				<tr>
          					<td class="schCode">${recordStuVO.recYr }</td>
          					<td>${recordStuVO.recSem}</td>
          					<td>${recordStuVO.depCode }</td>
          					<td>${recordStuVO.stuYr}</td>
          					<td>${recordStuVO.memNo}</td>
          					<td>${recordStuVO.memNm}</td>
          					<td><button class="btn btn-my" type="button" data-toggle="modal" data-target="#stuRecMan" recSeCode="${recordStuVO.recSeCode}" onclick="getStuDetail(this)">상세</button></td>
          				</tr>
          				</c:forEach>
          				
          		      <!-- 모달 -->
					  <div class="modal fade show" id="stuRecMan" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" style="padding-right: 19px;" aria-modal="true">
					     <div class="modal-dialog modal-dialog-centered" role="document">
					       <div class="modal-content">
					
					         <form id="myForm" >
					
					           <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					           <div class="modal-header bg-danger-light">
					             <h4 class="modal-title text-white" id="verticalModalTitle ">학생 신청 정보</h4>
					             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					               <span aria-hidden="true">×</span>
					             </button>
					           </div>
<%-- 					           <c:forEach items="${recordStuVOList}" var="recordStuVO" varStatus="stat"> --%>
					           <div class="modal-body">
					             <div class="form-row">
		                          <div class="form-group col-md-6">
		                            <label for="memNo">학번</label>
		                            <input type="text" class="form-control" id="memNo" name="memNo" value="${recordStuVO.memNo }" disabled>
		                          </div>
		                          <div class="form-group col-md-6">
		                            <label for="recSeCode">학적신청 구분</label>
		                            <input type="text" class="form-control" id="recSeName" name="recSeName" disabled>
		                            <input type="hidden" class="form-control" id="recSeCode" name="recSeCode" value="${recordStuVO.recSeCode }" disabled>
		                          </div>
		                        </div>
					             
					             <div class="form-row">
		                          <div class="form-group col-md-6">
		                            <label for="recYr">연도</label>
		                            <input type="text" class="form-control" id="recYr" name="recYr" value="${recordStuVO.recYr }" disabled>
		                          </div>
		                          <div class="form-group col-md-6">
		                            <label for="recSem">학기</label>
		                            <input type="text" class="form-control" id="recSem" name="recSem" value="${recordStuVO.recSem }" disabled>
		                          </div>
		                        </div>
					             
					            <div class="form-group">
		                            <label for="recDt">학적신청 일시</label>
		                            <input type="text" class="form-control" id="recDt" name="recDt" value="${recordStuVO.recDt }" disabled>
		                        </div>
		                        
					             <div class="form-group mb-3">
					               <label for="recRsn">신청 사유</label>
					               <textarea class="form-control" name="textarea" id="recRsn" rows="4" style="height: 130px; " disabled>${recordStuVO.recRsn }</textarea>
					             </div>
					             
					             <div class="form-group mb-3" id="reasonDiv" style="display: none;">
					               <label for="recReturn">반려 사유</label>
					               <textarea class="form-control" name="recReturn" id="recReturn" rows="4" style="height: 130px; " placeholder="반려사유를 입력하여 주세요." required></textarea>
					             </div>
					            </div>
<%-- 					            </c:forEach>		 --%>
					           <div class="modal-footer justify-content-center">
					             <button type="button" class="btn btn-my" data-dismiss="modal" onclick="applyR()">승인</button>
					             <button type="button" class="btn mb-2 btn-secondary" onclick="returnR()" style="margin-top:7px;">반려</button>
					           </div>
					         </form>
				           </div>
						</div>
					  </div><!-- 모달 -->
          			</tbody>
          		</table>
          	</div>
        	<!-- //////////////// 휴학 끝 ////////////////////////////// -->
        	
            <!-- //////////////// 복학 시작 ////////////////////////////// -->
			<div id="profile" style="display:none;">
              <table class="table datatables text-center" id="dataTable-2">
                  <thead class="bg-secondary-light">
                      <tr>
                          <th>연도</th>
                          <th>학기</th>
                          <th>학과</th>
                          <th>학년</th>
                          <th>학번</th>
                          <th>이름</th>
                          <th>상세보기</th>
                      </tr>
                  </thead>
                    <tbody>
                    	<c:forEach items="${studentVOList2}" var="recordStuVO" varStatus="stat">
          				<tr>
          					<td class="schCode">${recordStuVO.recYr }</td>
          					<td>${recordStuVO.recSem}</td>
          					<td>${recordStuVO.depCode }</td>
          					<td>${recordStuVO.stuYr}</td>
          					<td>${recordStuVO.memNo}</td>
          					<td>${recordStuVO.memNm}</td>
          					<td><button class="btn btn-my" type="button" data-toggle="modal" data-target="#stuRecMan" recSeCode="${recordStuVO.recSeCode}" onclick="getStuDetail(this)">상세</button></td>
          				</tr>
          				</c:forEach>
          			</tbody>
          		</table>
          	</div>
        	<!-- //////////////// 복학 끝 ////////////////////////////// -->
            <!-- //////////////// 자퇴 시작 ////////////////////////////// -->
			<div id="contact" style="display:none;">
              <table class="table datatables text-center" id="dataTable-3">
                  <thead class="bg-secondary-light">
                      <tr>
                          <th>연도</th>
                          <th>학기</th>
                          <th>학과</th>
                          <th>학년</th>
                          <th>학번</th>
                          <th>이름</th>
                          <th>상세보기</th>
                      </tr>
                  </thead>
                    <tbody>
                    	<c:forEach items="${studentVOList3}" var="recordStuVO" varStatus="stat">
          				<tr>
          					<td class="schCode">${recordStuVO.recYr }</td>
          					<td>${recordStuVO.recSem}</td>
          					<td>${recordStuVO.depCode }</td>
          					<td>${recordStuVO.stuYr}</td>
          					<td>${recordStuVO.memNo}</td>
          					<td>${recordStuVO.memNm}</td>
          					<td><button class="btn btn-my" type="button" data-toggle="modal" data-target="#stuRecMan" recSeCode="${recordStuVO.recSeCode}" onclick="getStuDetail(this)">상세</button></td>
          				</tr>
          				</c:forEach>
          			</tbody>
          		</table>
          	</div>
        	<!-- //////////////// 자퇴 끝 ////////////////////////////// -->
        </div> <!-- .col-12 -->
      </div> <!-- .row -->
    </div> <!-- .container-fluid -->
 
<script>


function getStuDetail(pThis) {
	console.log("매개변수 체킁:",pThis);

	let $tds = $(pThis).closest("tr").find("td");
	console.log("체킁3",$tds);
	
	let recordStuVO = {
		memNo: $tds.eq(4).html(),
		recSem:$tds.eq(1).html(), 
		recSeCode:$(pThis).attr("recSeCode"), 
		recYr:$tds.eq(0).html()
	}

	console.log("넘길데이터:",recordStuVO);
	
	$.ajax({
		type : "GET",
		url : `/admin/recManDetail`,
		data: recordStuVO,
		dataType:"json",
		success:function(retVal){
			console.log("체킁retVal:",retVal); // 서버가 돌려준 값을 꼭 확인!
			$("#memNo").val(recordStuVO.memNo);
			$("#recSeCode").val(retVal.recSeCode);
			$("#recYr").val(retVal.recYr);
			$("#recSem").val(retVal.recSem);			
			$("#recDt").val(retVal.recDt);
			$("#recRsn").val(retVal.recRsn);
			
			// 학적구분코드 한글이름으로
			let $recSeCode = retVal.recSeCode;
			console.log("로그1 : " + $recSeCode);
			if ($recSeCode == "02") {
				$("#recSeName").val("휴학");
			} else if ($recSeCode == "04") {
				$("#recSeName").val("복학");
			} else if ($recSeCode == "05") {
				$("#recSeName").val("자퇴");
			} else {
				$("#recSeName").val("기타");
			}
		},
        error: function (xhr, status, error) {
            console.log("code: " + xhr.status);
            console.log("message: " + xhr.responseText);
            console.log("error: " + error);
        }
	});
	

}

//승인처리
function applyR() {
	let recordStuVO = {
		empMemNo : '${empMemNo}',	
		memNo : $("#memNo").val(),
		recSeCode : $("#recSeCode").val(),
		recSem : $("#recSem").val(),
		recDt : $("#recDt").val(),
		recRsn : $("#recRsn").val(),
		recYr : $("#recYr").val()
	}
	console.log("체킁recordStuVO:", recordStuVO);
	$.ajax({
		type : "PUT",
		url : "/admin/recManDetail",
		data : JSON.stringify(recordStuVO),
		contentType : "application/json; charset=utf-8",
		dataType : "text",
		beforeSend:function(xhr){
   			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
   		},
		success : function(rslt) {
			console.log("rslt:" + rslt);
			if (rslt == "success") {
            	Swal.fire({
  					icon: "success",
  					title: "승인처리가 정상적으로 완료되었습니다."
            	}).then((rslt) => {
            		location.href = "/admin/recMan";
            	})
            } else {
           		Swal.fire({
    				icon : "error",
    				title : "승인처리를 하는 중 문제가 생겼습니다."
    			});
            }
		},
		error : function(xhr, status, error) {
            console.log("code :" + xhr.status);
            console.log("message :" + xhr.responseText);
            console.log("error :" + xhr.error);
   		}
	});
}

//반려처리
function returnR() {
	//반려 버튼 클릭 시 반려사유 짜잔
	var reasonDiv = document.getElementById("reasonDiv");
    if (reasonDiv.style.display === "none" || reasonDiv.style.display === "") {
        reasonDiv.style.display = "block";
    } else {
        reasonDiv.style.display = "none";
    }
    
    const recReturn = $("#recReturn").val();
    
    if(!recReturn) {
    	alert("반려사유를 입력하세요!");
    	return;
    }

    let recordStuVO = {
   		empMemNo : '${empMemNo}',	
   		memNo : $("#memNo").val(),
   		recSeCode : $("#recSeCode").val(),
   		recSem : $("#recSem").val(),
   		recDt : $("#recDt").val(),
   		recRsn : $("#recRsn").val(),
   		recYr : $("#recYr").val(),
   		recReturn : recReturn
    }
    
    console.log("체킁recordStuVO:", recordStuVO);
    
    $.ajax({
    	type : "PUT",
    	url : "/admin/recManDetail/reject",
    	data : JSON.stringify(recordStuVO),
    	contentType : "application/json; charset=utf-8",
    	dataType : "text",
		beforeSend:function(xhr){
   			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
   		},
   		success : function(rslt) {
			console.log("rslt:" + rslt);
			if (rslt == "success") {
            	Swal.fire({
  					icon: "success",
  					title: "반려처리가 정상적으로 완료되었습니다."
            	}).then((rslt) => {
            		location.href = "/admin/recMan";
            	})
            } else {
           		Swal.fire({
    				icon : "error",
    				title : "반려처리를 하는 중 문제가 생겼습니다."
    			});
            }
		},
   		error : function(xhr, status, error) {
            console.log("code :" + xhr.status);
            console.log("message :" + xhr.responseText);
            console.log("error :" + xhr.error);
   		}
    });
    
}

//신청기간 설정
function timeSetting() {
	Swal.fire({
		icon: "success",
		title: "신청기간이 정상적으로 설정되었습니다."
	})
}

$(".nav-link").on("click",function(){
	let mode = $(this).text();
	
	console.log("mode : " + mode);
	
	if(mode=="휴학"){
		$("#home").css("display","block");
		$("#profile").css("display","none");
		$("#contact").css("display","none");
	}else if(mode=="복학"){
		$("#profile").css("display","block");
		$("#home").css("display","none");
		$("#contact").css("display","none");
	}else if(mode=="자퇴"){
		$("#contact").css("display","block");
		$("#home").css("display","none");
		$("#profile").css("display","none");
	}else{
		$("#home").css("display","block");
		$("#profile").css("display","none");
		$("#contact").css("display","none");
	}
});
</script>