<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
 .bg-123 {
 background-color: var(--my-color);
 }
</style>

<!-- 모달창 시작 -->   
<div class="modal fade" id="varyModal" tabindex="-1" role="dialog" aria-labelledby="varyModalLabel" style="display: none;" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header bg-my">
        <h5 class="modal-title" id="varyModalLabel">상담 상세</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="alert alert-light bg-light border-0" role="alert"
			style="font-size: 0.9em; padding: 15px 30px 15px; 20 px; border: 1px solid #eee;">
			<p style="display: block; text-align: center; font-size: 1.1em;">&#8251;
				상담 답변 작성 안내</p>
			<hr>
			<p>
				(1) <strong>반려</strong> 시에는 반려사유를 반드시 작성해주세요.
			<p>
			<p>
				(2) <strong>승인/반려</strong>처리를 반드시 선택해주세요.
			<p>
		</div>

				<form id="counForm" method="post" action="/prof/counReply"
					enctype="multipart/form-data">
					<input id="csrf" type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <input type="hidden"
						class="form-control" id="cnslCode" hidden="true">
				<div>
					<div class="form-group row">
						<div class="form-group col-4">
						<label for="cnslDt" class="col-form-label">작성일:</label>
							<input type="text" class="form-control" id="cnslDt" disabled>
						</div>
						<div class="form-group col-4">
							<label for="memNm" class="col-form-label">학생명:</label>
							<input type="text" class="form-control" id="memNm" disabled>
						</div>
						<div class="form-group col-4">
							<label for="stuMemNo" class="col-form-label">학번:</label>
							<input type="text" class="form-control" id="stuMemNo" disabled>
						</div>
					</div>
						<div class="form-group mb-3">
							<label for="cnslTtl" class="col-form-label">제목:</label>
							<input type="text" class="form-control" id="cnslTtl" disabled>
							<label for="cnslCon" class="col-form-label">신청 내용:</label>
							<textarea class="form-control" id="cnslCon" rows="5" disabled></textarea>
							<hr>
						</div>
						<div class="form-group mb-3" id="rpl" style="display: block;">
							<label for="cnslRpl" class="col-form-label">답변 :</label>
							<textarea class="form-control" id="cnslRpl"
									name="cnslRpl" rows="5" placeholder="답변을 작성하여 주세요."></textarea>
						</div>
						<div class="form-group mb-3" id="returnReason" style="display: block;">
							<label for="cnslReturn">반려 사유 :</label>
							<textarea class="form-control" name="cnslReturn"
									id="cnslReturn" rows="5" style="height: 130px;"
									placeholder="반려사유를 입력하여 주세요."></textarea>
						</div>
					</div>
				</form>
			</div>
      	<div class="modal-footer">
			<button type="button" id="autoBtn" class="btn btn-primary" onclick="autoInput()">자동입력</button>
			<button type="button" id="approveBtn" class="btn btn-info" onclick="approve()">승인</button>
			<button type="button" id="rejectBtn" class="btn mb-2 btn-danger" onclick="reject()" style="margin-top: 7px;">반려</button>
			<button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">닫기</button>
		</div>
    </div>
  </div>
</div>
<!-- 모달창 끝 -->

<div class="col-lg-12 my-4">
	<div class="card shadow">
		<div class="card-body">
			<h3 class="card-title">
				<font style="vertical-align: inherit;">상담 내역</font>
			</h3>
			<div class="alert alert-light bg-light border-0" role="alert"
				style="font-size: 0.9em; padding: 15px 30px 15px; 20 px; border: 1px solid #eee;">
				<p style="display: block; text-align: center; font-size: 1.1em;">&#8251;
					안내사항</p>
				<hr>
				<p>(1) 상담에 직접 답변 할 수 있습니다.
				<p>
				<p>
					(2) <strong>답변은 수정할 수 있습니다.</strong>
				<p>
			</div>
			<div>
				<form action="/prof/coun" method="get"	style="display: flex; align-items: center;">
					<div class="col-sm-2 my-4">
						<select id="key" class="form-control">
							<option value="nm">이름</option>
							<option value="no">학번</option>
						</select>
					</div>
					<input type="text" class="form-control" id="search1" name="keyword" value="" placeholder="검색어를 입력해주세요." style="margin-right: 10px; height: 40px; width: 300px;">
					<button type="button" id="ho" class="btn btn-my" style="color: white; border-color: transparent; height: 40px;"	onclick="searchCnsl()">검색</button>
				</form>
			</div>
			<div id="counList">
				<table class="table table-hover">
					<thead class="bg-my">
						<tr>
							<th>No.</th>
							<th>학생명</th>
							<th>학번</th>
							<th>제목</th>
							<th>작성일</th>
							<th>상담상태</th>
						</tr>
					</thead>
					<tbody id="result">
						<c:forEach var="counselVO" items="${counselVOList}"	varStatus="stat">
							<tr onclick=stuclick(this)>
								<td>${stat.count}</td>
								<td style="display: none;">${counselVO.cnslCode}</td>
								<td style="display: none;">${counselVO.cnslCon}</td>
								<td style="display: none;">${counselVO.cnslDe}</td>
								<td style="display: none;">${counselVO.cnslRpl}</td>
								<td style="display: none;">${counselVO.cnslReturn}</td>
								<td>${counselVO.memNm}</td>
								<td>${counselVO.stuMemNo}</td>
								<td>${counselVO.cnslTtl}</td>
								<td>${counselVO.cnslDt}</td>
								<td>
									<c:if test="${counselVO.cnslYn == 'Y'}">
										승인
									</c:if> 
									<c:if test="${counselVO.cnslYn == 'N' && counselVO.cnslReturn != null}">
										반려
									</c:if>
									<c:if test="${counselVO.cnslYn == 'N' && counselVO.cnslReturn == null}">
										<strong>승인대기</strong>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="d-flex justify-content-center mt-3"	style="display: inline-block;">
			<nav aria-label="Table Paging" class="my-3">
				<ul class="pagination justify-content-end mb-0">
					<li	class="paginate_button page-item previous <c:if test='${currentPage == 1}'>disabled</c:if>" id="dataTable_previous">
						<a class="page-link" href="/prof/coun?currentPage=${currentPage-1}&&size=${size}" aria-controls="dataTable" data-dt-idx="0" tabindex="0">Previous</a>
					</li>
					<c:forEach var="pNo" begin="1" end="${pageCnt}">
						<c:if test="${currentPage == pNo}">
							<li class='paginate_button page-item active'>
								<a class="page-link" href="/prof/coun?currentPage=${pNo}&&size=${size}" aria-controls="dataTable" data-dt-idx="1" tabindex="0">${pNo}</a>
							</li>
						</c:if>
						<c:if test="${currentPage != pNo}">
							<li class='paginate_button page-item'>
								<a class="page-link" href="/prof/coun?currentPage=${pNo}&&size=${size}"	aria-controls="dataTable" data-dt-idx="1" tabindex="0">${pNo}</a>
							</li>
						</c:if>
					</c:forEach>
					<li	class="paginate_button page-item next <c:if test='${currentPage >= pageCnt}'>disabled</c:if>" id="dataTables_next">
						<a class="page-link" href="/prof/coun?currentPage=${currentPage+1}&&size=${size}" aria-controls="dataTable" data-dt-index="7" tabindex="0">Next</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>

<script>
const header = '${_csrf.headerName}';
const token =  '${_csrf.token}';
const cnslCode = document.querySelector("#cnslCode");
const cnslCon = document.querySelector("#cnslCon");
const cnslRpl = document.querySelector("#cnslRpl");
const cnslReturn = document.querySelector("#cnslReturn");
const memNm = document.querySelector("#memNm");
const stuMemNo = document.querySelector("#stuMemNo");
const cnslTtl = document.querySelector("#cnslTtl");
const cnslDt = document.querySelector("#cnslDt");

function stuclick(pthis) {
	var selCnslCode = pthis.querySelector("td:nth-child(2)").textContent;
	var selCnslCon = pthis.querySelector("td:nth-child(3)").textContent;
	var selCnslRpl = pthis.querySelector("td:nth-child(5)").textContent;
	var selCnslReturn = pthis.querySelector("td:nth-child(6)").textContent;
	var selMemNm = pthis.querySelector("td:nth-child(7)").textContent;
	var selStuMemNo = pthis.querySelector("td:nth-child(8)").textContent;
	var selCnslTtl = pthis.querySelector("td:nth-child(9)").textContent;
	var selCnslDt = pthis.querySelector("td:nth-child(10)").textContent;
	var selCnslYn = pthis.querySelector("td:nth-child(11)").textContent.trim();
	
	console.log("selCnslYn",selCnslYn);
	$("#returnReason").css("display", "none");
	$("#rpl").css("display", "none");
	$("#approveBtn").show();
   	$("#rejectBtn").show();
   	$("#autoBtn").show();
	
	if(selCnslYn=="승인"){
		$("#returnReason").css("display", "none");
		$("#rpl").css("display", "block");
		$("#approveBtn").hide();
	   	$("#rejectBtn").hide();
	   	$("#autoBtn").hide();
	}else if(selCnslYn=="반려"){
		$("#rpl").css("display", "none");
		$("#returnReason").css("display", "block");
		$("#approveBtn").hide();
	   	$("#rejectBtn").hide();
	   	$("#autoBtn").hide();
	}
	
	cnslCode.value="";
	cnslCon.value ="";
	cnslRpl.value="";
	cnslReturn.value="";
	memNm.value="";
	stuMemNo.value="";
	cnslTtl.value="";
	cnslDt.value="";
	
	cnslCode.value=selCnslCode;
	cnslCon.value =selCnslCon;
	cnslRpl.value=selCnslRpl;
	cnslReturn.value=selCnslReturn;
	memNm.value=selMemNm;
	stuMemNo.value=selStuMemNo;
	cnslTtl.value=selCnslTtl;
	cnslDt.value=selCnslDt;
	
    
    $("#varyModal").modal();
}

function autoInput(){
	cnslRpl.value="학업에만 열중하다보면 피로가 쌓여 학습 효율적인 측면에서도 현저히 떨어집니다. 학교 수업시간도 50분 수업에 10분 휴식 하듯이 신체리듬, 심리적인 리듬 까지도 휴식을 취해주는 것이 꼭 필요합니다.";
}


//승인처리
function approve() {
	var rpl = document.getElementById("rpl");
	var returnReason = document.getElementById("returnReason");
    	rpl.style.display = "block";
    	returnReason.style.display = "none";
    
    const cnslRpl = $("#cnslRpl").val();
    
    if (!cnslRpl) {
			Swal.fire({
				icon : "warning",
				title : "답변을 입력해주세요."
			});
			return;
     }
	
	let counselVO = {
			cnslCode : $("#cnslCode").val(),
			cnslRpl : cnslRpl	
	}
	console.log("체킁counselVO:", counselVO);
	
	$.ajax({
		type : "PUT",
		url : "/prof/approveCnsl",
		data : JSON.stringify(counselVO),
		contentType : "application/json; charset=utf-8",
		dataType : "text",
		beforeSend:function(xhr){
   			xhr.setRequestHeader(header,token);
   		},
		success : function(rslt) {
			console.log("rslt:" + rslt);
			
			if(rslt) {
 				Swal.fire({
 					icon: "success",
 					title: "승인처리가 정상적으로 완료되었습니다."
					}).then((rslt) => {
						location.href = "/prof/coun";
					})
 			} else {
       		Swal.fire({
  					icon : "error",
  					title : "승인처리를 하는 중 문제가 생겼습니다."
  				})
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
function reject() {
	var rpl = document.getElementById("rpl");
	var returnReason = document.getElementById("returnReason");
   	 returnReason.style.display = "block";
   	rpl.style.display = "none";
    
    const cnslReturn = $("#cnslReturn").val();
    
    if (!cnslReturn) {
			Swal.fire({
				icon : "warning",
				title : "반려사유를 입력해주세요."
			});
			return;
     }

    let counselVO = {
    		cnslCode : $("#cnslCode").val(),	
   		cnslReturn : cnslReturn
    }
    
    console.log("체킁counselVO:", counselVO);
    
    $.ajax({
    	type : "PUT",
    	url : "/prof/rejectCnsl",
    	data : JSON.stringify(counselVO),
    	contentType : "application/json; charset=utf-8",
    	dataType : "text",
		beforeSend:function(xhr){
   			xhr.setRequestHeader(header,token);
   		},
   		success : function(rslt) {
			console.log("rslt:" + rslt);
			
			if(rslt) {
 				Swal.fire({
 					icon: "success",
 					title: "반려처리가 정상적으로 완료되었습니다."
					}).then((rslt) => {
						location.href = "/prof/coun";
					})
 			} else {
       		Swal.fire({
  					icon : "error",
  					title : "반려처리를 하는 중 문제가 생겼습니다."
  				})
 			}
			
			
		},
   		error : function(xhr, status, error) {
            console.log("code :" + xhr.status);
            console.log("message :" + xhr.responseText);
            console.log("error :" + xhr.error);
   		}
    });
    
}

	//검색
	function searchCnsl() {
	    let keyValue = $("#key").val();
	    let nm ="";
	    let no ="";
	    
	    console.log("keyValue",keyValue);
	    
	    switch (keyValue) {
	    case "nm":
	        nm = keyValue;
	        break;
	    case "no":
	    	no = keyValue;
	        break;
	}
	    console.log("nm",nm,"no",no)
	
	    let searchValue = $("#search1").val().trim();
	    console.log(searchValue);
	    
	    let searchOptions = {
	    		nm : nm,
	    		no : no,
	    		searchValue: searchValue
	          };
	    
	    console.log("searchOptions",searchOptions);
	  
	    $.ajax({
	        url: "/prof/searchCnsl",
	        type: "GET",
	        data: searchOptions,
	        dataType : "json",
	        contentType: 'application/x-www-form-urlencoded; charset=utf-8',
	        success: function (result) {
	            console.log("검색 결과:", result);
	            let txt = "";
	            for(let i=0; i<result.length; i++){
	            	let Yn = "";
	            	if(result[i].cnslYn == 'Y'){
	            		Yn = "승인";
	            	}else if(result[i].cnslYn == 'N' && result[i].cnslReturn !=null){
	            		Yn = "반려";
	            	}else{
	            		Yn = "<strong>승인대기중</strong>";
	            	}
	     
	            	txt += `
	            		<tr onclick='stuclick(this)'>
	            		<td>${i+1}</td>
						<td style="display: none;">\${result[i].cnslCode}</td>
						<td style="display: none;">\${result[i].cnslCon}</td>
						<td style="display: none;">\${result[i].cnslDe}</td>
						<td style="display: none;">\${result[i].cnslRpl}</td>
						<td style="display: none;">\${result[i].cnslReturn}</td>
						<td>\${result[i].memNm}${counselVO.memNm}</td>
						<td>\${result[i].memNm}${counselVO.stuMemNo}</td>
						<td>\${result[i].memNm}${counselVO.cnslTtl}</td>
						<td>\${result[i].memNm}${counselVO.cnslDt}</td>
						<td>\${Yn}</td>
						</tr>
	            		`;
	            }
	            console.log("txt:", txt);
	            $('#result').html(txt);
	        },
	        error: function (error) {
	            console.error("검색 실패:", error);
	        }
	    });
	};

</script>