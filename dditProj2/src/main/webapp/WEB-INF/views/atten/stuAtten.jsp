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
					<h2 class="h4 mb-1" style="text-align: center;">출결</h2>






					<!-- Small table -->
					<div class="row my-3">
						<div class="col-md-12">
							<div class="card shadow">
								<div class="card-body">

									<!-- table -->
									<p></p>
<%--  									<p>체크${attendenceVOList}</p>  --%>
									<div class="row mt-4 justify-content-end">


										<div class="input-group mb-3 col-9 justify-content-end">
											<div class="mr-2">
												<label for="inputSeleteYear" class="d-none"></label> <select
													id="inputSeleteYear" class="form-control px-2">
<%-- 													<option value="">${AttenadenceVO.lecCode}</option> --%>
 													<option value="">경제학개론</option> 
												</select>
											</div>
										
										
											<div class="mr-2">
												<label for="inputSeleteYear" class="d-none"></label> <select
													id="inputSeleteYear" class="form-control px-2">
													<option value="2023">2023년</option>
													<option value="2022">2022년</option>
													<option value="2021">2021년</option>
													<option value="2020">2020년</option>
												</select>
											</div>

											<div class="mr-2">
												<label for="inputSeleteMonth" class="d-none"></label> <select
													id="inputSeleteMonth" class="form-control px-2">
													<option value="">월별</option>
													<option value="01">1월</option>
													<option value="02">2월</option>
													<option value="03">3월</option>
													<option value="04">4월</option>
													<option value="05">5월</option>
													<option value="06">6월</option>
													<option value="07">7월</option>
													<option value="08">8월</option>
													<option value="09" selected>9월</option>
													<option value="10">10월</option>
													<option value="11">11월</option>
													<option value="12">12월</option>
												</select>
											</div>

											<div class="">
												<button class="btn btn-my type="button" id="selectBtn">검색</button>
											</div>
										</div>
									</div>

									<table class="table datatables text-center" id="dataTable-1">

										<thead class="bg-my text-black">

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
											<c:forEach items="${attendenceVOList}" var="AttenadenceVO">
												<tr>
													<td>${AttenadenceVO.get("ATEN_DE")}</td>
													<td>${AttenadenceVO.get("ATEN_COME")}</td>
													<td>${AttenadenceVO.get("ATEN_LATE")}</td>
													<td>${AttenadenceVO.get("ATEN_EARLYLEAVE")}</td>
													<td>${AttenadenceVO.get("ATEN_ABSENT")}</td>
													<td>${AttenadenceVO.get("ATEN_OFIABSENT")}</td>
													<td>
													<c:choose>
													    <c:when test="${AttenadenceVO.get('ATEN_LATE') >= 1 || AttenadenceVO.get('ATEN_EARLYLEAVE') >= 1 || AttenadenceVO.get('ATEN_ABSENT') >= 1 || AttenadenceVO.get('ATEN_OFIABSENT') >= 1}">
													        <c:choose>
													            <c:when test="${empty AttenadenceVO.get('FILE_ID')}">
													                <button class="btn btn-my" type="button" data-toggle="modal" data-target="#verticalModal" onclick="fState('${AttenadenceVO.get("ATEN_DE")}', '${AttenadenceVO.get("LEC_CODE")}')">제출하기</button>
													            </c:when>
													            <c:otherwise>
													                <button class="btn btn-my" type="button" data-toggle="modal" data-target="#verticalModal" onclick="fState('${AttenadenceVO.get("ATEN_DE")}', '${AttenadenceVO.get("LEC_CODE")}')">제출완료</button>
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
											<li class="page-item"><a class="page-link" href="#">Previous</a></li>
											<li class="page-item active"><a class="page-link"
												href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link" href="#">4</a></li>
											<li class="page-item"><a class="page-link" href="#">5</a></li>
											<li class="page-item"><a class="page-link" href="#">Next</a></li>
										</ul>
									</nav>
								</div>
							</div>


							<!--               <div class="col-sm-12 col-md-3 my-4"> -->
							<!--               <div class="dataTables_info" id="dataTable-1_btn" > -->
							<!--                 <button type="button" class="btn btn-my">등록</a></button> -->
							<!--               </div> -->
							<!--               </div> -->
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
	   		    		window.location.href = "/stu/atten";	
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
         },
         error:function(xhr){
           console.log(xhr.status);
         }
       })
       */

    }

    //  버튼 클릭 시 모달 창 보이기
    $(document).ready(function () {
        $(".btn-primary").click(function () {
            $("#verticalModal").modal("show");
        });
    });
</script>


