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
    
</style>
<body class="vertical  light  ">
<%-- <p>페이지수: ${pageCnt }</p> --%>
	<div class="wrapper w-75">
		<main role="main" class="main-content mx-auto">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12">
						<div class="row align-items-center my-4">
							<div class="col">
								<h2 class="h3 mb-0 page-title">과목 목록</h2>
							</div>
<!-- 							<div class="col-auto"> -->
<!-- 								<button type="button" id="insertSubj" class="btn btn-my" style="color:white; height:40px; width:150px;" onclick="openSubjectInsert()">과목 등록</button> -->
<!-- 							</div> -->
							<form action="/admin/subjectList" method="get" style="display: flex; align-items: center;">
							    <input type="text" class="form-control" id="search1" name="keyword" value="" placeholder="학과/과목명 입력해주세요." style="margin-right: 10px; height:40px; width:300px;">
							    <button type="button" id="ho" class="btn btn-my" style="color:white; border-color: transparent; height:40px;" onclick="searchSubjects()">검색</button>
							</form>
						</div>
						<!-- table -->
						<div class="card shadow">
							<div class="card-body">
								<table class="table table-borderless">
									<thead>
										<tr>
											<th style="text-align: left;">학과명</th>
											<th style="text-align: left;">과목 코드</th>
											<th style="text-align: left;">과목명</th>
											<th>신설연도</th>
											<th>과목 구분</th>
											<th>상세보기</th>
										</tr>
									</thead>
									<tbody id ="result">
										<c:forEach items="${subjectList}" var="subject" varStatus="status">
										<tr>
										
											
											<td style="text-align: left;">
												<p class="mb-0 text-muted"><small>${subject.depNm}</small></p> 
											</td>
											
											
											<td style="text-align: left;">
												<p class="mb-0 text-muted"></p> 
												<small class="mb-0 text-muted">${subject.subCode}</small>
											</td>
											
											<td class="text-muted" style="text-align: left;">${subject.subNm}</td>
											
											<td>
												<p class="mb-0 text-muted"></p> 
												<small class="mb-0 text-muted">${subject.subYr}</small>
											</td>
											<td>
												<small class="mb-0 text-muted">${subject.subSeCode}</small>
											</td>
											
											<td>
												<button type="button" id="subjDetail" class="btn btn-my" style="color:white; height:40px;" onclick="openSubjectDetail('${subject.subCode}')">상세</button>
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
<%-- 						<p>안들어있는뎅! ${currentPage} 없는뎅</p> --%>
						<div class="d-flex justify-content-center mt-3" style="float: right;">
				            <button type="button" id="insertSubj" class="btn btn-my" style="color:white; height:40px; width:150px;" onclick="openSubjectInsert()">과목 등록</button>
				        </div>
						<div class="d-flex justify-content-center mt-3" style="display: inline-block;">
							<nav aria-label="Table Paging" class="my-3">
								<ul class="pagination justify-content-end mb-0">
									<li class="paginate_button page-item previous
										<c:if test='${currentPage == 1}'>disabled</c:if>
									"
										id="dataTable_previous"><a class="page-link" href="/admin/subjectList?currentPage=${currentPage-1}&size=${size}" aria-controls="dataTable" data-dt-idx="0" tabindex="0"
										>Previous</a></li>
									<c:forEach var="pNo" begin="1" end="${pageCnt}">
										<c:if test="${currentPage == pNo}">
										<li class='paginate_button page-item active'>
											<a class="page-link" href="/admin/subjectList?currentPage=${pNo}&size=${size}" aria-controls="dataTable" data-dt-idx="1" tabindex="0">${pNo}</a>
										</li>
										</c:if>
									
										<c:if test="${currentPage != pNo}">
										<li class='paginate_button page-item'>
											<a class="page-link" href="/admin/subjectList?currentPage=${pNo}&size=${size}" aria-controls="dataTable" data-dt-idx="1" tabindex="0">${pNo}</a>
										</li>
										</c:if>
										
									</c:forEach>
									
									<li class="paginate_button page-item next
										<c:if test='${currentPage >= pageCnt}'>disabled</c:if>
									" id="dataTables_next"><a
									class="page-link" href="/admin/subjectList?currentPage=${currentPage+1}&size=${size}" aria-controls="dataTable" data-dt-index="7" tabindex="0">Next</a></li>
								</ul>
							</nav>
						</div>
					    
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
	<!-- .wrapper -->
	<script>	
		function openSubjectInsert() {
	    	  //과목 등록 페이지로 이동
    	    location.href = "/admin/subjectInsert";
        }
		
		function openSubjectDetail(subCode){
			location.href = "/admin/subjectDetail?subCode="+subCode;
		}
	</script>
	<script>
		function searchSubjects() {
		    let searchValue = $("#search1").val().trim();
		    console.log(searchValue);
		  
		    $.ajax({
		        url: "/admin/searchSubject/"+searchValue,
		        type: "GET",
		        
		        dataType : "json",
		        contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		        success: function (result) {
		            console.log("검색 결과:", result);
		            let txt = "";
		            for(let i=0; i<result.length; i++){
		            	let subject = result[i];
		            	txt += 
		            		`
		            		<tr>
								<td>
									<p class="mb-0 text-muted"><small>\${subject.depNm}</small></p> 
								</td>
								
								<td>
									<small class="mb-0 text-muted">\${subject.subSeCode}</small>
								</td>
								
								<td>
									<p class="mb-0 text-muted"></p> 
									<small class="mb-0 text-muted">\${subject.subCode}</small>
								</td>
								
								<td class="text-muted">\${subject.subNm}</td>
								
								<td>
									<p class="mb-0 text-muted"></p> 
									<small class="mb-0 text-muted">\${subject.subYr}</small>
								</td>
								
								<td>
									<button type="button" id="subjDetail" class="btn btn-my" style="color:white; height:40px;" onclick="openSubjectDetail('\${subject.subCode}')">상세</button>
								</td>
							</tr>
		            		`;
		            }
		            $('#result').html(txt);
		        },
		        error: function (error) {
		            console.error("검색 실패:", error);
		        }
		    });
		};

	
	</script>
</body>