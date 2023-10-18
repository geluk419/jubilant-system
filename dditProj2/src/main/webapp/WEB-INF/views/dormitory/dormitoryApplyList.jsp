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
    
    td{
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
						        <h2 class="h3 mb-0 page-title">기숙사 신청 현황</h2>
						    </div>
						    <div class="col-auto">
						        <div class="input-group">
						            <form action="/admin/member" method="get" style="display: flex; align-items: center;">
						                <select id="userId" class="form-control" style="margin-right: 10px; height:40px; width:150px;">
						                    <option value="2023">2023년</option>
								            <option value="2022">2022년</option>
								            <option value="2021">2021년</option>
								            <option value="2020">2020년</option>
						                </select>
						                <select id="userId" class="form-control" style="margin-right: 10px; height:40px; width:150px;">
						                    <option value="">월별</option>
								            <option value="01">1월</option>
								            <option value="02">2월</option>
								            <option value="03">3월</option>
								            <option value="04">4월</option>
								            <option value="05">5월</option>
								            <option value="06">6월</option>
								            <option value="07">7월</option>
								            <option value="08">8월</option>
								            <option value="09">9월</option>
								            <option value="10">10월</option>
								            <option value="11">11월</option>
								            <option value="12">12월</option>
						                </select>
						                <button type="submit" id="ho" class="btn btn-my" style="color:white; border-color: transparent; height:40px;">검색</button>
						            </form>
						        </div>
						    </div>
						</div>
						
						<div id="table-content">
			              <table class="table datatables text-center" id="dataTable-1">
			                  <thead class="bg-secondary-light">
			                      <tr>
			                          <th>신청연도</th>
			                          <th>신청학기</th>
			                          <th>학번</th>
			                          <th>이름</th>
			                          <th>성별</th>
			                          <th>성적</th>
			                          <th>상세보기</th>
			                      </tr>
			                  </thead>
			                    	<tbody>
			                    		<tr>
			                    			<td>2023</td>
			                    			<td>1</td>
			                    			<td>202308S001</td>
			                    			<td>정범진</td>
			                    			<td>남</td>
			                    			<td>4.4</td>
			                    			<td><button class="btn btn-my" type="button" data-toggle="modal" data-target="#stuRecMan">상세</button></td>
			          					</tr>
			          					<tr>
			                    			<td>2023</td>
			                    			<td>1</td>
			                    			<td>202308S002</td>
			                    			<td>김채현</td>
			                    			<td>여</td>
			                    			<td>3.4</td>
			                    			<td><button class="btn btn-my">상세</button></td>
			          					</tr>
			          					<tr>
			                    			<td>2023</td>
			                    			<td>1</td>
			                    			<td>202308S003</td>
			                    			<td>서예린</td>
			                    			<td>여</td>
			                    			<td>4.0</td>
			                    			<td><button class="btn btn-my">상세</button></td>
			          					</tr>
			          					
			          					<tr>
			                    			<td>2020</td>
			                    			<td>1</td>
			                    			<td>202308S016</td>
			                    			<td>이미지</td>
			                    			<td>여</td>
			                    			<td>4.0</td>
			                    			<td><button class="btn btn-my">상세</button></td>
			          					</tr>
			          					<tr>
			                    			<td>2021</td>
			                    			<td>1</td>
			                    			<td>202308S015</td>
			                    			<td>임석일</td>
			                    			<td>남</td>
			                    			<td>3.0</td>
			                    			<td><button class="btn btn-my">상세</button></td>
			          					</tr>
			          					<tr>
			                    			<td>2022</td>
			                    			<td>2</td>
			                    			<td>202308S012</td>
			                    			<td>이현우</td>
			                    			<td>남</td>
			                    			<td>4.0</td>
			                    			<td><button class="btn btn-my">상세</button></td>
			          					</tr>
			          					<tr>
			                    			<td>2020</td>
			                    			<td>2</td>
			                    			<td>202308S022</td>
			                    			<td>김민준</td>
			                    			<td>남</td>
			                    			<td>3.8</td>
			                    			<td><button class="btn btn-my">상세</button></td>
			          					</tr>
			          					<tr>
			                    			<td>2023</td>
			                    			<td>1</td>
			                    			<td>202308S019</td>
			                    			<td>이설이</td>
			                    			<td>여</td>
			                    			<td>4.3</td>
			                    			<td><button class="btn btn-my">상세</button></td>
			          					</tr>
			          					<tr>
			                    			<td>2020</td>
			                    			<td>1</td>
			                    			<td>202308S029</td>
			                    			<td>임이윤</td>
			                    			<td>여</td>
			                    			<td>4.1</td>
			                    			<td><button class="btn btn-my">상세</button></td>
			          					</tr>
			          					<tr>
			                    			<td>2020</td>
			                    			<td>2</td>
			                    			<td>202308S015</td>
			                    			<td>이석우</td>
			                    			<td>남</td>
			                    			<td>2.9</td>
			                    			<td><button class="btn btn-my">상세</button></td>
			          					</tr>
			          					<tr>
			                    			<td>2020</td>
			                    			<td>1</td>
			                    			<td>202308S031</td>
			                    			<td>임경운</td>
			                    			<td>여</td>
			                    			<td>4.0</td>
			                    			<td><button class="btn btn-my">상세</button></td>
			          					</tr>
			          					<tr>
			                    			<td>2018</td>
			                    			<td>1</td>
			                    			<td>202308S034</td>
			                    			<td>임민지</td>
			                    			<td>여</td>
			                    			<td>3.3</td>
			                    			<td><button class="btn btn-my">상세</button></td>
			          					</tr>
			          					<!-- 모달 -->
									  <div class="modal fade show" id="stuRecMan" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" style="padding-right: 19px;" aria-modal="true">
									     <div class="modal-dialog modal-dialog-centered" role="document">
									       <div class="modal-content">
									
									         <form id="myForm" >
									
									           <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									           <div class="modal-header bg-danger-light">
									             <h4 class="modal-title text-white" id="verticalModalTitle ">기숙사 신청 정보</h4>
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
						                            <label for="recYr">신청연도</label>
						                            <input type="text" class="form-control" id="recYr" name="recYr" value="2023" disabled>
						                          </div>
						                          <div class="form-group col-md-6">
						                            <label for="recSem">신청학기</label>
						                            <input type="text" class="form-control" id="recSem" name="recSem" value="2" disabled>
						                          </div>
						                        </div>
						                        
						                        <div class="form-row">
						                          <div class="form-group col-md-6">
						                            <label for="recYr">성적</label>
						                            <input type="text" class="form-control" id="recYr" name="recYr" value="4.4" disabled>
						                          </div>
						                          <div class="form-group col-md-6">
						                            <label for="recSem">성별</label>
						                            <input type="text" class="form-control" id="recSem" name="recSem" value="남" disabled>
						                          </div>
						                        </div>
									             
									             <div class="form-group mb-3">
									               <label for="recRsn">신청 사유</label>
									               <textarea class="form-control" name="textarea" id="recRsn" rows="4" style="height: 130px; " disabled>거리문제</textarea>
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
	location.href = "/admin/dormitoryApplyList";
}

//승인처리
function applyR() {
	Swal.fire({
		icon: "success",
		title: "외박승인이 정상적으로 완료되었습니다."
	})
}

//반려처리s
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
