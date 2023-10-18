<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


		<style>
		.modal-dialog modal-dialog-centered {
			width: 100%;
			height: 100%;
		}
	    
	    /*
	    .row my-3 {
		    width: 50%;
		}
		*/
	    
	    hr {
		  border: 2px solid lightgray;
		}
		</style>
		
		
		
		<div class="wrapper" style="width: 100%; margin: auto;">
		<main role="main" class="main-content mx-auto">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12">
						<h2 class="h4 mb-1" style="text-align:center;">성적관리</h2>
		
							<%-- <p>나와바${scoreList}</p> --%>
							
							
							<div style="text-align:right;">
							</div>






							<!-- Small table -->
							<div class="row my-3">
								<div class="col-md-12">
									<!-- table -->
									<!-- Small table -->
									<div class="row my-3">
										<div class="col-md-12">
											<div class="card shadow">
												<div class="card-body">
			
													<!-- table -->
													
													<table class="table datatables text-center"
														id="dataTable-1">
														<thead class="bg-my text-black">
															<h5>현재학기성적</h5>
															<tr>
																<th>년도</th>
																<th>학기</th>
																<th style="text-align:left;">강의명</th>
																<th>이수구분</th>
																<th>이수학점</th>
																<th>평점</th>
																<th>등급</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${scoreListCurrent}" var="scoreVO">
																<tr>
																	<td>${scoreVO.lecApplyVOList[0].lecaYr }</td>
																	<td>${scoreVO.lecApplyVOList[0].lecaSem }</td>
																	<td style="text-align:left;">${scoreVO.lecApplyVOList[0].lecaNm }</td>
																	<td>${scoreVO.lecApplyVOList[0].lecaSeCode}</td>
																	<td>${scoreVO.lecApplyVOList[0].lecaCrd}</td>
																	<td>${scoreVO.scoreAll }</td>
																	<td>${scoreVO.codeScreGrade }</td>
																</tr>
														</tbody>
														</c:forEach>
													</table>
													
											
			
												</div>
											</div>
										</div> <!-- end section -->
									</div> <!-- .col-12 -->
								</div> <!-- .row -->
							</div> <!-- .container-fluid -->
							
							<!-- Small table -->
								<div class="row my-3">
									<div class="col-md-3 offset-md-9">
										<!-- table -->
										<!-- Small table -->
										<div class="row my-3">
											<div class="col-md-12">
												<div class="card shadow">
													<div class="card-body">
				
														<!-- table -->
														<table class="table datatables text-center"
															id="dataTable-1">
															<thead class="bg-my text-black">
																<h5></h5>
																<tr>
																	<th>총 이수학점</th>
																	<th>총 평점</th>
																</tr>
															</thead>
															<tbody>
<%-- 																<c:forEach items="${scoreList}" var="scoreVO"> --%>
																	<tr>
																		<td id="totalCreditHoursCurrent"></td>
																		<td id="totalGPACurrent"></td>
																	</tr>
															</tbody>
<%-- 															</c:forEach> --%>
														</table>
				
													</div>
												</div>
												</div> <!-- end section -->
											</div> <!-- .col-12 -->
										</div> <!-- .row -->
									</div> <!-- .container-fluid -->	
							
							<hr />
							<form name="frmSearch">
							<div class="input-group mb-3 col-9 justify-content-start" style="margin-top:3%">
								<div class="mr-2">
									<label for="inputSeleteYear" class="d-none"></label>
									<select id="inputSeleteYear" name="searchYear" class="form-control px-2">
								        <option value="0">년도</option>
								        <c:forEach begin="2023" end="2023" var="year" step="1">
								        	<option value="${year}" ${param.searchYear == year ? 'selected':'' }>${year}년</option>
								        </c:forEach>
								    </select>
								</div>
							
								<div class="mr-2">
									<label for="inputSeleteSem" class="d-none"></label> 
									<select id="inputSeleteSem" name="searchSem" class="form-control px-2">
								        <option value="0">학기</option>
								        <c:forEach begin="1" end="2" var="sem" step="1">
								        	<option value="${sem}" ${param.searchSem == sem ? 'selected':'' }>${sem}학기</option>
								        </c:forEach>
								    </select>
								</div>
							
								<div class="">
									<button class="btn btn-my" type="submit" id="selectBtn" style="height:35px">검색</button>
								</div>
							</div>	
							</form>
								
							<!-- Small table -->
							<div class="row my-3">
								<div class="col-md-12">
									<!-- table -->
									<!-- Small table -->
									<div class="row my-3">
										<div class="col-md-12">
											<div class="card shadow">
												<div class="card-body">
			
													<!-- table -->
													<table class="table datatables text-center" id="dataTable-1">
													
														<thead class="bg-my text-black">
															<h5>전체학기성적</h5>
															<tr>
																<th>년도</th>
																<th>학기</th>
																<th style="text-align:left;">강의명</th>
																<th>이수구분</th>
																<th>이수학점</th>
																<th>평점</th>
																<th>등급</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${scoreList}" var="scoreVO">
																<tr>
																	<td>${scoreVO.lecApplyVOList[0].lecaYr }</td>
																	<td>${scoreVO.lecApplyVOList[0].lecaSem }</td>
																	<td style="text-align:left;">${scoreVO.lecApplyVOList[0].lecaNm }</td>
																	<td>${scoreVO.lecApplyVOList[0].lecaSeCode}</td>
																	<td>${scoreVO.lecApplyVOList[0].lecaCrd}</td>
																	<td>${scoreVO.scoreAll }</td>
																	<td>${scoreVO.codeScreGrade }</td>
																</tr>
														</tbody>
														</c:forEach>
													</table>
			
												</div>
											</div>
											</div> <!-- end section -->
										</div> <!-- .col-12 -->
									</div> <!-- .row -->
								</div> <!-- .container-fluid -->
							
				
								<!-- Small table -->
								<div class="row my-3">
									<div class="col-md-3 offset-md-9">
										<!-- table -->
										<!-- Small table -->
										<div class="row my-3">
											<div class="col-md-12">
												<div class="card shadow">
													<div class="card-body">
				
														<!-- table -->
														<table class="table datatables text-center"
															id="dataTable-1">
															<thead class="bg-my text-black">
																<h5></h5>
																<tr>
																	<th>총 이수학점</th>
																	<th>총 평점</th>
																</tr>
															</thead>
															<tbody>
<%-- 																<c:forEach items="${scoreList}" var="scoreVO"> --%>
																	<tr>
																		<td id="totalCreditHours"></td>
																		<td id="totalGPA"></td>
																	</tr>
															</tbody>
<%-- 															</c:forEach> --%>
														</table>
				
													</div>
												</div>
												</div> <!-- end section -->
											</div> <!-- .col-12 -->
										</div> <!-- .row -->
									</div> <!-- .container-fluid -->
				
				
			</div>
		</main> <!-- main -->
	</div>









	








<script>
	//총이수학점, 총평점 현재학기
	$(document).ready(function () {
	    var totalCreditHoursCurrent = 0;
	    var totalGPACurrent = 0;
	    
	    let countCurrent = 0
	
	    <c:forEach items="${scoreListCurrent}" var="scoreVO">
	    totalCreditHoursCurrent += parseInt("${scoreVO.lecApplyVOList[0].lecaCrd}");
	    totalGPACurrent += parseFloat("${scoreVO.scoreAll}");
	    	countCurrent++
	    </c:forEach>
	
	    $("#totalCreditHoursCurrent").text(totalCreditHoursCurrent);
	    $("#totalGPACurrent").text((totalGPACurrent / countCurrent).toFixed(2));
	});
	
	//총이수학점, 총평점 전체학기
    $(document).ready(function () {
        var totalCreditHours = 0;
        var totalGPA = 0;
        
        let count = 0

        <c:forEach items="${scoreList}" var="scoreVO">
            totalCreditHours += parseInt("${scoreVO.lecApplyVOList[0].lecaCrd}");
            totalGPA += parseFloat("${scoreVO.scoreAll}");
            count++
        </c:forEach>

        $("#totalCreditHours").text(totalCreditHours);
        $("#totalGPA").text((totalGPA / count).toFixed(2));
    });
</script>