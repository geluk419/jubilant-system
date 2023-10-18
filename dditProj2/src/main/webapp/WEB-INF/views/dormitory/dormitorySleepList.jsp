<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
/*  	div {  */
/*  		border: 1px solid blue;  */
/*  	}  */
th {
	font-weight: bold;
	font-size: 14px;
	background-color: rgb(182, 26, 63);
	color: black;
	padding: 10px;
	text-align: center;
}

td {
	padding: 10px;
	text-align: center;
}

.pagination .page-item.active .page-link {
	background-color: rgb(182, 26, 63);
	color: white;
}

#table-content {
	max-height: 700px;
	overflow-y: auto;
	margin-bottom: 50px;
}
</style>
<div class="wrapper w-75">
	<main role="main" class="main-content mx-auto">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-12">
					<div class="row align-items-center my-4">
					    <div class="col">
					        <h2 class="h3 mb-0 page-title">외박 신청 현황</h2>
					    </div>
					    <div class="col-auto">
					        <div class="input-group">
					            <form action="/admin/member" method="get" style="display: flex; align-items: center;">
					                <select id="userId" class="form-control" style="margin-right: 10px; height:40px; width:150px;">
					                    <option value="기숙사 구분">기숙사 구분</option>
					                    <option value="신관(남자)">신관(남자)</option>
					                    <option value="신관(여자)">신관(여자)</option>
					                </select>
					                <input type="text" class="form-control" id="search1" name="keyword" value="${param.keyword}" placeholder="검색어를 입력해주세요." style="margin-right: 10px; height:40px; width:300px;">
					                <button type="submit" id="ho" class="btn btn-my" style="color:white; border-color: transparent; height:40px;">검색</button>
					            </form>
					        </div>
					    </div>
					</div>
					<div id="table-content">
						<table class="table datatables text-center" id="dataTable-1">
							<thead class="bg-secondary-light">
								<tr>
									<th>기숙사구분</th>
									<th>호수</th>
									<th>이름</th>
									<th>전화번호</th>
									<th>기간</th>
									<th>사유</th>
									<th>상세보기</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>신관(남자)</td>
									<td>102</td>
									<td>정범진</td>
									<td>010-1234-5678</td>
									<td>23/06/15 ~ 23/06/18</td>
									<td>가정사</td>
									<td><button class="btn btn-my" type="button" data-toggle="modal" data-target="#stuRecMan">상세</button></td>
								</tr>
								<tr>
									<td>신관(여자)</td>
									<td>105</td>
									<td>박지연</td>
									<td>010-4545-7878</td>
									<td>23/06/20 ~ 23/06/23</td>
									<td>여행</td>
									<td><button class="btn btn-my">상세</button></td>
								</tr>
								<tr>
									<td>신관(남자)</td>
									<td>205</td>
									<td>이재영</td>
									<td>010-1234-5678</td>
									<td>23/06/15 ~ 23/06/18</td>
									<td>가정사</td>
									<td><button class="btn btn-my">상세</button></td>
								</tr>
								<tr>
									<td>구관(여자)</td>
									<td>405</td>
									<td>조혜경</td>
									<td>010-1234-5678</td>
									<td>23/06/15 ~ 23/06/18</td>
									<td>가정사</td>
									<td><button class="btn btn-my">상세</button></td>
								</tr>
								<tr>
									<td>구관(남자)</td>
									<td>102</td>
									<td>박민우</td>
									<td>010-1234-5678</td>
									<td>23/06/15 ~ 23/06/18</td>
									<td>가정사</td>
									<td><button class="btn btn-my">상세</button></td>
								</tr>
								<tr>
									<td>신관(여자)</td>
									<td>105</td>
									<td>황수경</td>
									<td>010-1234-5678</td>
									<td>23/06/15 ~ 23/06/18</td>
									<td>가정사</td>
									<td><button class="btn btn-my">상세</button></td>
								</tr>
								<tr>
									<td>신관(여자)</td>
									<td>109</td>
									<td>이지인</td>
									<td>010-1234-5678</td>
									<td>23/06/15 ~ 23/06/18</td>
									<td>가정사</td>
									<td><button class="btn btn-my">상세</button></td>
								</tr>
								<tr>
									<td>신관(남자)</td>
									<td>110</td>
									<td>김지훈</td>
									<td>010-1234-5678</td>
									<td>23/06/15 ~ 23/06/18</td>
									<td>가정사</td>
									<td><button class="btn btn-my">상세</button></td>
								</tr>
								<tr>
									<td>신관(남자)</td>
									<td>111</td>
									<td>이민재</td>
									<td>010-1234-5678</td>
									<td>23/06/15 ~ 23/06/18</td>
									<td>가정사</td>
									<td><button class="btn btn-my">상세</button></td>
								</tr>
								<tr>
									<td>신관(여자)</td>
									<td>115</td>
									<td>정지수</td>
									<td>010-1234-5678</td>
									<td>23/06/15 ~ 23/06/18</td>
									<td>가정사</td>
									<td><button class="btn btn-my">상세</button></td>
								</tr>
								<tr>
									<td>구관(여자)</td>
									<td>106</td>
									<td>박민희</td>
									<td>010-1234-5678</td>
									<td>23/06/15 ~ 23/06/18</td>
									<td>가정사</td>
									<td><button class="btn btn-my">상세</button></td>
								</tr>
								<tr>
									<td>신관(남자)</td>
									<td>205</td>
									<td>홍현우</td>
									<td>010-1234-5678</td>
									<td>23/06/15 ~ 23/06/18</td>
									<td>가정사</td>
									<td><button class="btn btn-my">상세</button></td>
								</tr>
								<tr>
									<td>신관(남자)</td>
									<td>103</td>
									<td>홍태영</td>
									<td>010-1234-5678</td>
									<td>23/06/15 ~ 23/06/18</td>
									<td>가정사</td>
									<td><button class="btn btn-my">상세</button></td>
								</tr>
								
							  <!-- 모달 -->
							  <div class="modal fade show" id="stuRecMan" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" style="padding-right: 19px;" aria-modal="true">
							     <div class="modal-dialog modal-dialog-centered" role="document">
							       <div class="modal-content">
							
							         <form id="myForm" >
							
							           <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							           <div class="modal-header bg-danger-light">
							             <h4 class="modal-title text-white" id="verticalModalTitle ">외박 신청 정보</h4>
							             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							               <span aria-hidden="true">×</span>
							             </button>
							           </div>
							           <div class="modal-body">
							             <div class="form-row">
				                          <div class="form-group col-md-6">
				                            <label for="memNo">학번</label>
				                            <input type="text" class="form-control" id="memNo" name="memNo" value="202308S001" disabled>
				                          </div>
				                          <div class="form-group col-md-6">
				                            <label for="recSeCode">이름</label>
				                            <input type="text" class="form-control" id="recSeCode" name="recSeCode" value="정범진" disabled>
				                          </div>
				                        </div>
							             
							             <div class="form-row">
				                          <div class="form-group col-md-6">
				                            <label for="recYr">기숙사 구분</label>
				                            <input type="text" class="form-control" id="recYr" name="recYr" value="신관(남자)" disabled>
				                          </div>
				                          <div class="form-group col-md-6">
				                            <label for="recSem">호수</label>
				                            <input type="text" class="form-control" id="recSem" name="recSem" value="102" disabled>
				                          </div>
				                        </div>
							             
							            <div class="form-group">
				                            <label for="recDt">기간</label>
				                            <input type="text" class="form-control" id="recDt" name="recDt" value="23/06/15 ~ 23/06/18" disabled>
				                        </div>
				                        
							             <div class="form-group mb-3">
							               <label for="recRsn">신청 사유</label>
							               <textarea class="form-control" name="textarea" id="recRsn" rows="4" style="height: 130px; " disabled>가정사</textarea>
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
				</div>
				<!-- .col-12 -->
			</div>
			<!-- .row -->
		</div>
		<!-- .container-fluid -->
	</main>
	<!-- main -->
</div>

<script>
//버튼 클릭 시 모달 창 보이기
$(document).ready(function () {
    $(".btn-primary").click(function () {
        $("#stuRecMan").modal("show");
    });
});

function applyR() {
	location.href = "/admin/dormitorySleepList";
}

//승인처리
function applyR() {
	Swal.fire({
		icon: "success",
		title: "외박승인이 정상적으로 완료되었습니다."
	})
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
}
</script>
