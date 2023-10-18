<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
 .bg-123 {
 background-color: var(--my-color);
 }
 
</style>


<!-- 모달창 -->
<div class="modal fade" id="varyModal" tabindex="-1" role="dialog" aria-labelledby="varyModalLabel" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<form id="objForm">
				<div class="modal-header">
					<h5 class="modal-title" id="varyModalLabel">성적 이의 신청 상세</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="attenBotWrap mt-5">
						<div class="informDetailTop mt-5">
							<table class="table datatables dataTable">
								<tr>
									<th class="bg-my" style="color: #FFFFFF;">신청일시</th>
									<td><input type="text" id="objDt" class="form-control f9" value="" disabled /></td>
									<th class="bg-my" style="color: #FFFFFF;">승인여부</th>
									<td><input type="text" id="objYn" class="form-control f9" value="" disabled /></td>
								</tr>
								<tr>
									<th class="bg-my" style="color: #FFFFFF;">대학</th>
									<td><input type="text" id="colNm" class="form-control f9" value="" disabled /></td>
									<th class="bg-my" style="color: #FFFFFF;">학과</th>
									<td><input type="text" id="depNm" class="form-control f9" value="" disabled /></td>
								</tr>
								<tr>
									<th class="bg-my" style="color: #FFFFFF;">학번</th>
									<td><input type="text" id="memNo" class="form-control f9" value="" disabled /></td>
									<th class="bg-my" style="color: #FFFFFF;">이름</th>
									<td><input type="text" id="memNm" class="form-control f9" value="" disabled /></td>
								</tr>
								<tr>
									<th class="bg-my" style="color: #FFFFFF;">강의명</th>
									<td><input type="text" id="lecNm" class="form-control f9" value="" disabled /></td>
									<th class="bg-my" style="color: #FFFFFF;">등급(평점)</th>
									<td><input type="text" id="score" class="form-control f9" value="" disabled /></td>
								</tr>
								<tr>
									<th class="bg-my" style="color: #FFFFFF;">신청 제목</th>
									<td colspan="3"><input type="text" id="objTtl" class="form-control f9" value="" disabled /></td>
								</tr>
								<tr>
									<th class="bg-my" style="color: #FFFFFF;">신청 내용</th>
									<td colspan="3"><textarea id="objCon" class="form-control f9" rows="5" disabled>
									</textarea></td>
								</tr>
							</table>
							<div class="form-group mb-3" id="returnReason"	style="display: none;">
								<label for="returnReason">반려 사유</label>
								<textarea class="form-control" name="objReturn" id="objReturn" rows="4" style="height: 130px;" 
								placeholder="반려사유를 입력하여 주세요." required></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="approveBtn" class="btn btn-info" data-dismiss="modal" onclick="approve()">승인</button>
					<button type="button" id="rejectBtn" class="btn mb-2 btn-danger" onclick="reject()" style="margin-top: 7px;">반려</button>
					<button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 모달 끝 -->

<div class="col-lg-12 my-4">
	<div class="card shadow">
		<div class="card-body">
			<h5>강의관리 > 성적 이의 신청 관리</h5>

			<div class="alert alert-light bg-light border-0" role="alert"
				style="font-size: 0.9em; padding: 15px 30px 15px; 20 px; border: 1px solid #eee;">
				<p style="display: block; text-align: center; font-size: 1.1em;">&#8251;
					성적 이의 신청 안내</p>
				<hr>
				<p>
					(1) 수강생을 클릭하여 승인 또는 반려하실 수 있습니다.<br>
					- 성적관리 메뉴에서 점수를 변경한 후에 승인하시는 것을 권장합니다.
				</p>
			</div>
			<h5 class="card-title mt-5">
				<i class="mdi mdi-record-circle"></i>&ensp;${lecaNm} - 수강생 목록
			</h5>
			<div>
				<form action="/prof/scoreObj" method="get"	style="display: flex; align-items: center;">
					<div class="col-sm-2 my-4">
						<select id="key" class="form-control">
							<option value="nm">이름</option>
							<option value="no">학번</option>
						</select>
					</div>
					<input type="text" class="form-control" id="search1" name="keyword" value="" placeholder="검색어를 입력해주세요." style="margin-right: 10px; height: 40px; width: 300px;">
					<button type="button" id="ho" class="btn btn-my" style="color: white; border-color: transparent; height: 40px;"	onclick="searchObj()">검색</button>
				</form>
			</div>
			<div id="listStu">
				<table class="table table-hover">
					<thead class="bg-my">
						<tr>
							<th>No.</th>
							<th>이름</th>
							<th>학번</th>
							<th>제목</th>
							<th>일시</th>
							<th>승인여부</th>
						</tr>
					</thead>
					<tbody id="result">
						<c:forEach var="objectionVO" items="${objectionVOList}"	varStatus="stat">
							<tr onclick="stuclick(this)">
								<td>${stat.count}</td>
								<td>${objectionVO.memNm}</td>
								<td>${objectionVO.memNo}</td>
								<td>${objectionVO.objTtl}</td>
								<td>${objectionVO.objDt}</td>
								<td>
									<c:if test="${objectionVO.objYn == 'Y'}">
										승인
									</c:if>
									<c:if test="${objectionVO.objYn == 'N'}">
										반려
									</c:if>
									<c:if test="${objectionVO.objYn != 'Y' && objectionVO.objYn != 'N'}">
										<strong>승인대기중</strong>
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
						<a class="page-link" href="/prof/scoreObj?lecCode=${lecCd}&&currentPage=${currentPage-1}&&size=${size}" aria-controls="dataTable" data-dt-idx="0" tabindex="0">Previous</a>
					</li>
					<c:forEach var="pNo" begin="1" end="${pageCnt}">
						<c:if test="${currentPage == pNo}">
							<li class='paginate_button page-item active'>
								<a class="page-link" href="/prof/scoreObj?lecCode=${lecCd}&&currentPage=${pNo}&&size=${size}" aria-controls="dataTable" data-dt-idx="1" tabindex="0">${pNo}</a>
							</li>
						</c:if>
						<c:if test="${currentPage != pNo}">
							<li class='paginate_button page-item'>
								<a class="page-link" href="/prof/scoreObj?lecCode=${lecCd}&&currentPage=${pNo}&&size=${size}"	aria-controls="dataTable" data-dt-idx="1" tabindex="0">${pNo}</a>
							</li>
						</c:if>
					</c:forEach>
					<li	class="paginate_button page-item next <c:if test='${currentPage >= pageCnt}'>disabled</c:if>" id="dataTables_next">
						<a class="page-link" href="/prof/scoreObj?lecCode=${lecCd}&&currentPage=${currentPage+1}&&size=${size}" aria-controls="dataTable" data-dt-index="7" tabindex="0">Next</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>






<script>
const header = '${_csrf.headerName}';
const token =  '${_csrf.token}';
const lecCode = "${lecCd}";
const objDtInput = document.querySelector("#objDt");
const objYnInput = document.querySelector("#objYn");
const colNmInput = document.querySelector("#colNm");
const depNmInput = document.querySelector("#depNm");
const memNoInput = document.querySelector("#memNo");
const memNmInput = document.querySelector("#memNm");
const lecNmInput = document.querySelector("#lecNm");
const scoreInput = document.querySelector("#score");
const objTtlInput = document.querySelector("#objTtl");
const objConTextarea = document.querySelector("#objCon");
const objReturnTextarea = document.querySelector("#objReturn");


	//학생 클릭하면
	function stuclick(pthis) {
	    
	    let memNo = pthis.children[2].innerText;
	
	    $.ajax({
	        url: "/prof/ScoreObjByStu",
	        type: 'get',
	        data: {
	            lecCode: lecCode,
	            memNo: memNo
	        },
	        dataType: 'JSON',
	        success: function (result) {
	        	console.log("result",result);
	        	
	        	memNoInput.value = "";
	            objDtInput.value = "";
	            objYnInput.value = "";
	            colNmInput.value = "";
	            depNmInput.value = "";
	            memNmInput.value = "";
	            lecNmInput.value = "";
	            scoreInput.value = "";
	            objTtlInput.value = "";
	            objConTextarea.value = "";
	            
	        	memNoInput.value = memNo;
	            objDtInput.value = result.objDt;
	            if(result.objYn =='Y'){
	            	objYnInput.value = "승인";
	            }else if(result.objYn =='N'){
	            	objYnInput.value = "반려";
	            }else{
	            	objYnInput.value = "승인대기중";
	            }
	            colNmInput.value = result.colNm;
	            depNmInput.value = result.depNm;
	            memNmInput.value = result.memNm;
	            lecNmInput.value = "${lecaNm}";
	            scoreInput.value = result.codeScreGrade + "("+ result.scoreAll + ")";
	            objTtlInput.value = result.objTtl;
	            objConTextarea.value = result.objCon;
	            if(result.objReturn != null){
		            let returnReason = document.getElementById("returnReason");
		            returnReason.style.display = "block";
		           	objReturnTextarea.value = result.objReturn;
		           	
		           	$("#approveBtn").hide();
		           	$("#rejectBtn").hide();
	            }else{
	            	if(result.objYn=='Y'){
	            		$("#approveBtn").hide();
			           	$("#rejectBtn").hide();
	            	}else{
	            		$("#approveBtn").show();
			           	$("#rejectBtn").show();
	            	}
	            	returnReason.style.display = "none";
	            }
	            
			}
		});
	
		$("#varyModal").modal();
	}
	

   //승인처리
     function approve() {
     	let objectionVO = {
     		lecCode : lecCode,	
     		memNo : $("#memNo").val(),
     	}
     	
     	console.log("체킁objectionVO:", objectionVO);
     	
     	$.ajax({
     		type : "PUT",
     		url : "/prof/approveObj",
     		data : JSON.stringify(objectionVO),
     		contentType : "application/json; charset=utf-8",
     		dataType : "text",
     		beforeSend:function(xhr){
        			xhr.setRequestHeader(header,token);
        		},
     		success : function(rslt) {
     			console.log("rslt:" + rslt);
     			
     			if(result) {
	  				Swal.fire({
	  					icon: "success",
	  					title: "승인처리가 정상적으로 완료되었습니다."
						}).then((rslt) => {
							location.href = "/prof/scoreObj?lecCode="+lecCode;
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
     	var returnReason = document.getElementById("returnReason");
         if (returnReason.style.display === "none" || returnReason.style.display === "") {
        	 returnReason.style.display = "block";
         } else {
        	 returnReason.style.display = "none";
         }
         
         const objReturn = $("#objReturn").val();
         
         if (!objReturn) {
				Swal.fire({
  				icon : "warning",
  				title : "반려사유를 입력하세요!"
  			});
				return;
          }

         let objectionVO = {
        		lecCode : lecCode,	
        		memNo : $("#memNo").val(),
        		objReturn : $("#objReturn").val(),
         }
         
         console.log("체킁objectionVO:", objectionVO);
         
         $.ajax({
         	type : "PUT",
         	url : "/prof/rejectObj",
         	data : JSON.stringify(objectionVO),
         	contentType : "application/json; charset=utf-8",
         	dataType : "text",
     		beforeSend:function(xhr){
        			xhr.setRequestHeader(header,token);
        		},
        		success : function(rslt) {
     			console.log("rslt:" + rslt);
     			
     			if(result) {
	  				Swal.fire({
	  					icon: "success",
	  					title: "반려처리가 정상적으로 완료되었습니다."
						}).then((rslt) => {
							location.href = "/prof/scoreObj?lecCode="+lecCode;
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
   
  // 검색
     function searchObj() {
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
 	        url: "/prof/searchObj?lecCode="+lecCode,
 	        type: "GET",
 	        data: searchOptions,
 	        dataType : "json",
 	        contentType: 'application/x-www-form-urlencoded; charset=utf-8',
 	        success: function (result) {
 	            console.log("검색 결과:", result);
 	            let txt = "";
 	            for(let i=0; i<result.length; i++){
 	            	let Yn = "";
 	            	if(result[i].objYn == 'Y'){
 	            		Yn = "승인";
 	            	}else if(result[i].objYn == 'N' && result[i].objYn !=null){
 	            		Yn = "반려";
 	            	}else{
 	            		Yn = "<strong>승인대기중</strong>";
 	            	}
 	     
 	     
 	            	txt += `
 	            		<tr onclick='stuclick(this)'>
 	            		<td>${i+1}</td>
 						<td>\${result[i].memNm}</td>
 						<td>\${result[i].memNo}</td>
 						<td>\${result[i].objTtl}</td>
 						<td>\${result[i].objDt}</td>
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