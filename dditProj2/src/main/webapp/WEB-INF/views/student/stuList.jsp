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
<%--  <p>페이지수:${sList}</p> --%>
	<div class="wrapper w-75">
		<main role="main" class="main-content mx-auto">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12">
						<div class="row align-items-center my-4">
							<div class="col">
								<h2 class="h3 mb-0 page-title">학생 현황 조회</h2>
							</div>
							<form action="/admin/stuList" method="get" style="display: flex; align-items: center;">
							    <input type="text" class="form-control" id="search1" name="keyword" value="${param.keyword}" placeholder="검색어를 입력해주세요." style="margin-right: 10px; height:40px; width:300px;">
							    <button type="submit" id="ho" class="btn btn-my" style="color:white; border-color: transparent; height:40px;">검색</button>
							</form>
						</div>
						<!-- table -->
						<div class="card shadow">
							<div class="card-body">
								<div class="toolbar">
			                       <form class="form">
			                         <div class="form-row">
			                           <div class="form-group col-auto mr-auto">
			                             <label class="my-1 mr-2 sr-only" for="inlineFormCustomSelectPref1">Show</label>
<!-- 			                             <select class="custom-select mr-sm-2" id="inlineFormCustomSelectPref1" name="size"> -->
<!-- 			                               <option value="10" -->
<%-- 			                               	<c:if test="${param.size=='10'}">selected</c:if> --%>
<!-- 			                               >10</option> -->
<!-- 			                               <option value="20" -->
<%-- 			                               	<c:if test="${param.size=='20'}">selected</c:if> --%>
<!-- 			                               >20</option> -->
<!-- 			                               <option value="30" -->
<%-- 			                               	<c:if test="${param.size=='30'}">selected</c:if> --%>
<!-- 			                               >30</option> -->
<!-- 			                               <option value="40" -->
<%-- 			                               	<c:if test="${param.size=='40'}">selected</c:if> --%>
<!-- 			                               >40</option> -->
<!-- 			                             </select> -->
			                           </div>
			                           <div class="form-group col-auto">
			                           </div>
			                         </div>
			                       </form>
			                     </div>
								<table class="table table-borderless">
									<thead>
										<tr>
											<th style="width:20%;">학번</th>
											<th style="width:15%;">이름</th>
											<th style="width:25%;">전화번호</th>
											<th style="text-align: left;width:25%;">주소</th>
											<th style="width:15%;">상세보기</th>
										</tr>
									</thead>
									<tbody id ="result">
										<c:forEach items="${sList.content}" var="student" varStatus="status">
										<tr style="margin-top: 10px;" class ="
				                          	<c:if test='${index.count%2==0}'>even</c:if>
				                          	<c:if test='${index.count%2==1}'>odd</c:if>
				                          ">
										
											<td>
												<p class="mb-0 text-muted"><small>${student.memNo}</small></p> 
											</td>
											
											<td>
												<small class="mb-0 text-muted">${student.memNm}</small>
											</td>
											
											<td>
												<p class="mb-0 text-muted"></p> 
												<small class="mb-0 text-muted">${student.memTel}</small>
											</td>
											
											<td style="text-align: left;" class="text-muted">${student.memAddr1} ${student.memAddr2}</td>
											
											
											<td>
												<button type="button" id="stuDetail" class="btn btn-my" style="color:white; height:40px;" onclick="openStudentDetail('${student.memNo}')">상세</button>
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="d-flex justify-content-center mt-3" style="display: inline-block;">
<!-- 							<div class="ctable table-borderless table-hover"> -->
<!-- 		                      <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing -->
<%-- 		                    	${(sList.currentPage*sList.size) - (sList.size-1)} --%>
<!-- 		                    	to -->
<%-- 		                    	${sList.currentPage*sList.size} --%>
<%-- 		                    	of ${sList.total} entries --%>
<!-- 		                      </div> -->
<!-- 		                    </div> -->
							<c:if test="${param.currentPage==null}">
								<c:set var="page" value="1" />
							</c:if>
							<c:if test="${param.currentPage!=null}">
								<c:set var="page" value="${param.currentPage}" />
							</c:if>
							<nav aria-label="Table Paging" class="mb-0 text-muted">
		                        <ul class="pagination justify-content-center mb-0">
		                          <li class="paginate_button page-item previous
		                          	<c:if test='${page==1}'>disabled</c:if>
		                          " 
		                          	id="dataTable_previous"><a class="page-link " href="/admin/stuList?currentPage=${page - 1}&size=${sList.size}" aria-controls="dataTable" data-dt-idx="0" tabindex="0"
		                          	>Previous</a></li>
		                          	
		                          <c:forEach var="pNo" begin="${sList.startPage}" end="${sList.endPage+4}">
		                            <c:if test="${pNo <= sList.totalPages }">
		                          	<li class='paginate_button page-item
		                          		<c:if test="${page==pNo}">active</c:if>
		                          	'><a class="page-link" href="/admin/stuList?currentPage=${pNo}&size=${sList.size}" aria-controls="dataTable" data-dt-idx="1" tabindex="0"
		                          	>${pNo}</a></li>
		                          	</c:if>	
		                          </c:forEach>
		                         
		                          <li class="paginate_button page-item next
		                          	<c:if test='${page == data.totalPages}'>disabled</c:if>
		                          " id="dataTable_next"><a
		                           class="page-link" href="/admin/stuList?currentPage=${page+1}&size=${data.size}" aria-controls="dataTable" data-dt-idx="7" tabindex="0">Next</a></li>
		                        </ul>
		                      </nav>
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
		function openStudentDetail(memNo){
			location.href = "/admin/stuDetail?memNo="+memNo;
		}
	</script>
	<script>
// 		function searchStudents() {
// 		    let searchValue = $("#search1").val().trim();
// 		    console.log("Search value:", searchValue);
		  
// 		    $.ajax({
// 		        url: "/admin/stuList/"+searchValue,
// 		        type: "GET",
		        
// 		        dataType : "json",
// 		        contentType: 'application/x-www-form-urlencoded; charset=utf-8',
// 		        success: function (result) {
// 		            console.log("검색 결과:", result);
// 		            let txt = "";
// 		            for(let i=0; i<result.length; i++){
// 		            	let subject = result[i];
// 		            	txt += 
// 		            		`
// 		            		<tr>
// 								<td>
// 									<p class="mb-0 text-muted"><small>\${student.memNo}</small></p> 
// 								</td>
								
// 								<td>
// 									<small class="mb-0 text-muted">\${student.memNm}</small>
// 								</td>
								
// 								<td>
// 									<p class="mb-0 text-muted"></p> 
// 									<small class="mb-0 text-muted">\${student.memTel}</small>
// 								</td>
								
// 								<td class="text-muted">\${student.memAddr1}</td>
								
// 								<td>
// 									<p class="mb-0 text-muted"></p> 
// 									<small class="mb-0 text-muted">\${student.memAddr2}</small>
// 								</td>
								
// 								<td>
// 									<button type="button" id="stuDetail" class="btn btn-my" style="color:white; height:40px;" onclick="openStudentDetail('\${student.memNo}')">상세</button>
// 								</td>
// 							</tr>
// 		            		`;
// 		            }
// 		            $('#result').html(txt);
// 		        },
// 		        error: function (error) {
// 		            console.error("검색 실패:", error);
// 		        }
// 		    });
// 		};

	
	</script>
</body>