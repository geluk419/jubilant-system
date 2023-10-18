<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
   td{
       padding: 10px;
       text-align: center;
    }
    
    th {
        font-weight: bold;
        font-size: 14px;
        background-color: rgb(182, 26, 63); 
        color: black;
        padding: 10px;
        text-align: center;
    }
</style>
<body class="vertical  light  ">
	<div class="wrapper w-100">
		<main role="main" class="main-content mx-auto">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12 col-xl-10">
						<div class="row align-items-center my-4">
							<div class="col">
								<h2 class="h3 mb-0 page-title">과목 상세</h2>
							</div>
							<div class="col-auto">
								<button type="button" class="btn btn-my" id="update">수정</button>
								<button type="button" class="btn btn-secondary" id="delete">삭제</button>
							</div>
						</div>
						<form action="/subjectDetail" method="post">
							<sec:csrfInput />
							<hr class="my-4">
							<label for="subCode">과목 코드</label> 
							<input class="form-control" id="subCode" value="${subjectVO.subCode}" disabled><br/>
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="subNm">과목명</label> 
									<input type="text" class="form-control" id="subNm" value="${subjectVO.subNm}">
								</div>
								<div class="form-group col-md-6">
								    <label for="subSeCode">과목 구분</label> 
								    <select id="subSeCode" class="form-control">
								        <option>${subjectVO.subSeCode}</option>
								        <c:forEach var="subCodeItem" items="${subSeCode}">
								            <option value="${subCodeItem.codeNm}">${subCodeItem.codeNm}</option>
								        </c:forEach>
								    </select>
								</div>
							</div>
							
							<label for="subYr">신설 연도</label>
							<input class="form-control" id="subYr" value="${subjectVO.subYr}" disabled><br/>
							
							<label for="depCode">학과 코드</label>
							<input class="form-control" id="depCode" value="${subjectVO.depCode}" disabled><br/>
							
							<div class="form-row">
								<div class="form-group col-md-12">
									<label for="depNm">학과명</label> 
									<input type="text" id="depNm" class="form-control" value="${subjectVO.depNm}" disabled>
								</div>
							</div>
							<hr class="my-4">
							<h5 class="mb-2 mt-4">강의 리스트</h5>
							<p class="mb-4">자세한 사항은 강의 페이지로 이동해주세요.</p>
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>강의명</th>
										<th>강의 인원</th>
										<th>강의 개설 학년</th>
										<th>강의 이수 학점</th>
										<th>담당 교수 교번</th>
										<th>담당 교수명</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${lecApplyVO}" var="lecture">
									<tr style="margin-top: 10px;" class ="
					                          	<c:if test='${index.count%2==0}'>even</c:if>
					                          	<c:if test='${index.count%2==1}'>odd</c:if>
					                          ">
									<td>
										<p class="mb-0 text-muted">${lecture.lecaNm}</p>
									</td>
									<td>
										<p class="mb-0 text-muted">${lecture.lecaCap}</p>
									</td>
									<td>
										<p class="mb-0 text-muted">${lecture.lecaTrg}</p>
									</td>
									<td>
										<p class="mb-0 text-muted">${lecture.lecaCrd}</p>
									</td>
									<td>
										<p class="mb-0 text-muted">${lecture.memNo}</p>
									</td>
									<td>
										<p class="mb-0 text-muted">${lecture.memNm}</p>
									</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							
							
							<hr class="my-4">
							<div class="form-row">
								<div class="col-md-6 text-right">
									<button type="button" class="btn btn-my" onclick="subjList()">목록으로 이동</button>
								</div>
							</div>
						</form>
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
		// 과목 목록 페이지로 이동
		function subjList() {
			location.href = "/admin/subjectList";
		}
	</script>
	<script>
	$(document).ready(function(){
		
		// 과목 수정
		$("#update").on("click", () => {
			
			let subjectVO = {
					subCode : $("#subCode").val(),
					subNm : $("#subNm").val(),
					subSeCode : $("#subSeCode").val()
			};
			
			console.log("subjectVO:", subjectVO);
			
			$.ajax({
				type : "PUT",
				url : "/admin/subjectDetail",
				data : JSON.stringify(subjectVO),
			    contentType : "application/json; charset=utf-8",
			    dataType : "text",
			    beforeSend:function(xhr){
		   			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		   	  },
		   	    success : function(rslt){
		   		    console.log("rslt : " + rslt);
		   		  if(rslt) {
		   			  Swal.fire({
		   		        icon: 'success',
		   		        title: "과목 수정이 정상적으로 완료되었습니다."
		   		      }).then((result) => {
	   		    		  window.location.href = "/admin/subjectList";	
		   		      })
	   			 	
	   			  } else {
	   				  Swal.fire("과목 수정에 실패했습니다.");	
	   			  }
		   	    },
			   	  error : function(xhr, status, error) {
		              console.log("code :" + xhr.status);
		              console.log("message :" + xhr.responseText);
		              console.log("error :" + xhr.error);
		   		  }
			});
		});
		
		var subCode = "${param.subCode}";
		
		// 과목 삭제
		$("#delete").on("click", () => {
			console.log("확인:" + subCode);
			$.ajax({
				type: "PUT",
				url : "/admin/subjectDetail/" + subCode,
				dataType : "text",
				beforeSend: function (xhr) {
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
	            success : function(rslt){
	   	   		  console.log("Response : " + rslt);
	   	   		if(rslt) {
	   	   			Swal.fire({
	   	   		      icon: 'success',
	   	   		      title: "과목이 정상적으로 삭제되었습니다."
	   	   		    }).then((result) => {
	      		    		window.location.href = "/admin/subjectList";	
	   	   		    })
	      			 	
	      			} else {
	      				Swal.fire("과목 삭제에 실패했습니다.");	
	      			}
	             
	             },
	             error: function (xhr, status, error) {
	                 console.log("code:" + xhr.status);
	                 console.log("message:" + xhr.responseText);
	                 console.log("error:" + xhr.error);
	             },
				
			});
		});
	});
	
	</script>
</body>