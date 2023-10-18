<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<style>
.table thead th {
	color: var(- -white-color);
	white-space: nowrap;
}

.row {
	align-items: flex-end;
}
</style>

<div class="wrapper" style="width: 100%; margin: auto;">
	<main role="main" class="main-content mx-auto">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-12">
					<h2 class="h4 mb-1" style="text-align: center;">출석부</h2>
					<p class="mb-3" style="text-align:center;">경제학개론</p>





					<!-- Small table -->
					<div class="row my-3">
						<div class="col-md-12">
							<div class="card shadow">
								<div class="card-body">

									<!-- table -->
									<p></p>
<%--  									<p>체크${attendenceVOList}</p>  --%>
									<div class="row mt-4 justify-content-end">

										<form method="get">
										<div class="input-group mb-3 justify-content-end">
										
											<input type="hidden" name="lecCode" value="${lecCode }">
											<!-- <input type="hidden" name="memNo" value="">  세션에서 꺼내오기-->
											<input type="hidden" name="searchCondition" value="">
											<input type="hidden" name="searchWord" value="">
											<input type="hidden" name="firstIndex" value="0">
											<input type="hidden" name="lastIndex" value="10">
											<div class="">
												<label for="inputSeleteMonth" class="d-none"></label> 
											    <select id="inputSeleteMonth" name="searchMonth" class="form-control px-2">
											        <option value="0">월별</option>
											        <c:forEach begin="1" end="12" var="month" step="1">
											        	<option value="${month}" ${param.searchMonth == month ? 'selected':'' }>${month}월</option>
											        </c:forEach>
											    </select>
											</div>

											<div class="">
											    <label for="inputSeleteDay" class="d-none"></label> 
											    <select id="inputSeleteDay" name="searchDate" class="form-control px-2">
											        <option value="0">일별</option>
											        <c:forEach begin="1" end="31" var="date" step="1">
											        	<option value="${date}" ${param.searchDate == date ? 'selected':'' }>${date}일</option>
											        </c:forEach>
											    </select>
											</div>

											<div class="">
												<button type="submit" id="ho" style="color:white; background-color: rgb(182, 26, 63); border: none; border-radius: 5px; height: 35px; width:50px;">검색</button>
											</div>
											
										</form>	
										</div>
									</div>
									


									<table class="table datatables text-center" id="dataTable-1">

										<thead class="bg-my text-white">

											<tr>
												<th>일자</th>
												<th>출석</th>
												<th>지각</th>
												<th>조퇴</th>
												<th>결석</th>
												<th>병결</th>
												<th>출결증빙자료제출</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${attendanceList}" var="attendance">
												<tr>
													<td>${attendance.atenDe}</td>
													<td>${attendance.atenCome}</td>
													<td>${attendance.atenLate}</td>
													<td>${attendance.atenEarlyLeave}</td>
													<td>${attendance.atenAbsent}</td>
													<td>${attendance.atenOfiAbsent}</td>
													<td>
													<c:choose>
													    <c:when test="${attendance.atenLate >= 1 || attendance.atenEarlyLeave >= 1 || attendance.atenAbsent >= 1 || attendance.atenOfiAbsent >= 1}">
													        <c:choose>
													            <c:when test="${empty attendance.fileId}">
													                <button class="btn btn-my" type="button" data-toggle="modal" data-target="#verticalModal" onclick="fState('${attendance.atenDe}', '${attendance.lecCode}')">제출하기</button>
													            </c:when>
													            <c:otherwise>
													                <button class="btn btn-primary" type="button">제출완료</button>
													            </c:otherwise>
													        </c:choose>
													    </c:when>
													</c:choose>
													</td>
												</tr>
											</c:forEach>

											<!-- 모달 -->
											<div class="modal fade show" id="verticalModal" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" style="padding-right: 19px;" aria-modal="true">
												<div class="modal-dialog modal-dialog-centered"
													role="document">
													<div class="modal-content">
														<div class="modal-header">


															<h4 class="modal-title" id="verticalModalTitle">출결증빙자료제출</h4>

															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">×</span>
															</button>
														</div>
														<br />
														<p style="text-align: center;">

															<input type="file" id="inputFile" name="pictures"
																style="display: inline-block;" />

															<button type="button" class="btn btn-my"
																onclick="fYerinUpload()">제출</button>
														</p>

													</div>
												</div>
											</div>
											<!-- 모달 -->

										</tbody>
									</table>
									<nav aria-label="Table Paging" class="mb-0 text-muted">
										<ul class="pagination justify-content-center mb-0">
											<li class="page-item ${paginationInfo.firstPageNoOnPageList eq 1 ? 'disabled':'' }">
												<a class="page-link" href="/stu/atten?lecCode=${param.lecCode }&requestPageNo=${paginationInfo.firstPageNoOnPageList - paginationInfo.pageSize }">Previous</a>
											</li>
											<c:forEach begin="${paginationInfo.firstPageNoOnPageList }" end="${paginationInfo.lastPageNoOnPageList }" var="index">
											<li class="page-item ${paginationInfo.currentPageNo eq index ? 'active' : '' }">
												<a class="page-link" href="/stu/atten?lecCode=${param.lecCode }&requestPageNo=${index }">${index }</a>
											</li>
											</c:forEach>
											<li class="page-item ${paginationInfo.lastPageNoOnPageList eq paginationInfo.totalPageCount ? 'disabled':'' }">
												<a class="page-link" href="/stu/atten?lecCode=${param.lecCode }&requestPageNo=${paginationInfo.firstPageNoOnPageList + paginationInfo.pageSize }">Next</a>
											</li>
										</ul>
									</nav>
								</div>
							</div>


							
						</div>
						<!-- simple table -->



					</div>
					<!-- end section -->
				</div>
				<!-- .col-12 -->
			</div>
			<!-- .row -->
		</div>
		<!-- .container-fluid -->
	</main>
	<!-- main -->
</div>

</div>

<!-- JavaScript 코드 추가 -->
<script>
    //서버에서 발행된 헤더네임과 토큰갑사 저장
    const header = '${_csrf.headerName}';
    const token =  '${_csrf.token}';


    let ATEN_DE ="";    // 전역
    let LEC_CODE = ""   // 전역
    function fState(p1,p2){
    	//alert("예린 만만세");
        ATEN_DE = p1;
        LEC_CODE = p2;    	
    }
    
    const yerinFile = document.querySelector("#inputFile");
    
    function fYerinUpload(){
       if(!yerinFile.value){
         alert("파일먼저 선택행 바보얌!");
         yerinFile.focus();  // 커서 주깅
         return;
       }

       // 아작스로 파일 올리깅!
       // 파일업로드에는 FormData;

       console.log("atenDe",ATEN_DE);
       console.log("lecCode",LEC_CODE);
 	
       let formData = new FormData();  // content-Type이 multipart/form-data 형식으로 전송해줌
       formData.append("atenFile",yerinFile.files[0]); // file객체를 담아야 파일이 전송되는게 뽀인통!
       formData.append("atenDe",ATEN_DE); 
       formData.append("lecCode",LEC_CODE); 


 
       let xhr = new XMLHttpRequest();
       xhr.open("post","/stu/fileUp",true);
       //바닐라 자바스크립트 사용시 AJAX send 전에 헤더값 세팅 필요
       xhr.setRequestHeader(header, token);

       xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
           console.log(xhr.responseText);
           if(xhr.responseText == "ok"){
	   			Swal.fire({
		   		      icon: 'success',
		   		      title: "파일제출이 완료되었습니다"
		   		    }).then((result) => {
	   		    		window.location.href = "/stu/atten/?lecCode="+LEC_CODE;
		   		    })
	   			 	
	   					
	   			} else {
	   				Swal.fire("파일제출 실패");	
	   			}
        }
       }
       xhr.send(formData);
       
      /*
       $.ajax({
         type:"post",
         url:"",
         data: formData,
         contentType:false, // 파일업로드시 필수, application/x-www-form-urlencoded
         processData:false, // 파일업로드시 필수
         dataType:"text",
         success:function(rslt){
          console.log("체킁:",rslt);
          if (rslt == "ok") {
              Swal.fire({
                  icon: 'success',
                  title: "File submission completed"
              }).then((result) => {
                  window.location.href = "/stu/atten/?lecCode=" + LEC_CODE;
              });
          } else {
              Swal.fire("File submission failed");
          }
         },
         error:function(xhr){
           console.log(xhr.status);
         }
       })
       */

    }

    //  버튼 클릭 시 모달 창 보이기
    $(document).ready(function () {
        $(".btn-my").click(function () {
            $("#verticalModal").modal("show");
        });
    });
</script>

<script>
//     var selectElement = document.getElementById("inputSeleteDay");

//     for (var i = 1; i <= 31; i++) {
//         var optionElement = document.createElement("option");
//         var day = (i < 10) ? "0" + i : i;
//         optionElement.value = day;
//         optionElement.textContent = i + "일";
//         selectElement.appendChild(optionElement);
//     }
</script>

<script>
//     var selectElement = document.getElementById("inputSeleteMonth");

//     var months = [
//         "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"
//     ];

//     for (var i = 0; i < months.length; i++) {
//         var optionElement = document.createElement("option");
//         optionElement.value = (i+1);
//         optionElement.textContent = months[i];
//         selectElement.appendChild(optionElement);
//     }
</script>
