<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
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
	    max-height: 900px;
	    margin-bottom: 50px;
	    overflow-y: auto;
    }
</style>
<body class="vertical  light  ">
<%--  <p>페이지수:${sList}</p> --%>
	<div class="wrapper w-75">
		<main role="main" class="main-content mx-auto">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12">
						
						<div class="row align-items-center my-4">
							<div class="col">
								<h2 class="h3 mb-0 page-title">사생 목록</h2>
							</div>
							<form action="/admin/dormitoryAdminList" method="get" style="display: flex; align-items: center;">
							    <input type="text" class="form-control" id="search1" name="keyword" value="${param.keyword}" placeholder="검색어를 입력해주세요." style="margin-right: 10px; height:40px; width:300px;">
							    <button type="submit" id="ho" class="btn btn-my" style="color:white; border-color: transparent; height:40px;">검색</button>
							</form>
						</div>
						
						<!-- table -->
<!-- 						<div class="card shadow"> -->
							<div id="table-content">
								<table class="table">
									<thead>
										<tr>
											<th>학번</th>
											<th>이름</th>
											<th>기숙사 구분</th>
											<th>호수</th>
											<th>성별</th>
											<th>상세보기</th>
										</tr>
									</thead>
									<tbody id ="result">
										<c:forEach items="${dormiList}" var="dormitory" varStatus="status">
										<tr>
											<td>
												<p class="mb-0 text-muted"><small>${dormitory.memNo}</small></p> 
											</td>
											
											<td>
												<small class="mb-0 text-muted">${dormitory.memNm}</small>
											</td>
											
											<td>
												<p class="mb-0 text-muted"></p> 
												<small class="mb-0 text-muted">${dormitory.dorNmCode}</small>
											</td>
											
											<td class="text-muted">${dormitory.dorNo}</td>
											
											<td>
												<p class="mb-0 text-muted"></p> 
												<small class="mb-0 text-muted">${dormitory.doraGender}</small>
											</td>
											
											<td>
												<button type="button" id="dormiDetail" class="btn btn-my" style="color:white; height:40px;" onclick="openDormiDetail('${dormitory.memNo}')">상세</button>
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
<!-- 						</div> -->
					</div>
					<!-- .col-12 -->
				</div>
				<!-- .row -->
			</div>
			<!-- .container-fluid -->
		</main>
		<!-- main -->
	</div>
	<!-- .wrapper -->
	<script>	
		function openDormiDetail(memNo){
			location.href = "/admin/dormitoryAdminDetail?memNo="+memNo;
		}
	</script>
</body>