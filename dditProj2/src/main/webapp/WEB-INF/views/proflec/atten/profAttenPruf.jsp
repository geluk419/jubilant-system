<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
 .bg-123 {
 background-color: var(--my-color);
 }
 
</style>

<div class="col-lg-12 my-4">
	<div class="card shadow">
		<div class="card-body">
			<h5>강의관리 > 출결 증빙 관리</h5>
			<h5 class="card-title mt-5">
				<i class="mdi mdi-record-circle"></i>&ensp;${lecaNm} - 출결 증빙 자료 제출 목록
			</h5>
			<div>
				<div class="alert alert-light bg-light border-0 mb-0" role="alert" style="font-size: 0.9em; padding: 15px 30px 15px; 20 px; border: 1px solid #eee;">
					<p style="display: block; text-align: center; font-size: 1.1em;">
					&#8251;출결 증빙 안내</p>
					<hr>
<!-- 					<p> -->
<!-- 						다음 사항에 해당되는 경우에 증빙서류를 제출함으로써 해당 과목 강의시간의 출석으로 인정됨<br>  -->
<!-- 						(총 수업 횟수 중 2회(15주 과정) 또는 1회 (8주과정)) -->
<!-- 					<p> -->
<!-- 					<p> -->
<!-- 						① 직계가족의 사망 및 질병<br>  -->
<!-- 						② 병무 관계에 의한 결석<br>  -->
<!-- 						③ 각종 국가자격시험<br> -->
<!-- 						④ 각종 대회출전<br>  -->
<!-- 						⑤ 본인 및 직계 가족의 결혼<br>  -->
<!-- 						⑥ 질병 또는 사고로 인한 입원<br> -->
<!-- 					</p> -->
						<p>
						증빙 자료를 확인하여 승인 또는 반려를 할 수 있습니다.
						</p>
						<p>
						승인시 자동으로 공결 처리가 완료됩니다.
						</p>
				</div>
				<div>
					<form action="/prof/attenPruf" method="get"	style="display: flex; align-items: center;">
						<div class="col-sm-2 my-4">
							<select id="key" class="form-control">
								<option value="nm">이름</option>
								<option value="no">학번</option>
							</select>
						</div>
						<input type="text" class="form-control" id="search1" name="keyword" value="" placeholder="검색어를 입력해주세요." style="margin-right: 10px; height: 40px; width: 300px;">
						<button type="button" id="ho" class="btn btn-my" style="color: white; border-color: transparent; height: 40px;"	onclick="searchPruf()">검색</button>
					</form>
				</div>
				<div id="listStu">
					<table class="table table-hover">
						<thead class="bg-my">
							<tr>
								<th>No.</th>
								<th>날짜</th>
								<th>이름</th>
								<th>학번</th>
								<th>단과대학</th>
								<th>학과</th>
								<th>학년</th>
								<th>연락처</th>
								<th>증빙자료</th>
								<th>승인여부</th>
							</tr>
						</thead>
						<tbody id="result">
							<c:forEach var="attendenceVO" items="${attendenceVOList}" varStatus="stat">
								<tr>
									<td>${stat.count}</td>
									<td class="de">${attendenceVO.atenDe}</td>
									<td>${attendenceVO.memNm}</td>
									<td class="no">${attendenceVO.memNo}</td>
									<td>${attendenceVO.colNm}</td>
									<td>${attendenceVO.depNm}</td>
									<td>${attendenceVO.stuYr}</td>
									<td>${attendenceVO.memTel}</td>
									<td>
										<button type='button' class='btn mb-2 btn-my' onclick="download('${attendenceVO.fileId}')">다운로드</button>
									</td>
									<td>
										<c:if test="${attendenceVO.atenYn == null}">
											<button type='button' class='btn mb-2 btn-outline-success' onclick="approve(this)">승인</button>
											<button type='button' class='btn mb-2 btn-outline-danger' onclick="reject(this)">반려</button>
										</c:if>
										<c:if test="${attendenceVO.atenYn == 'Y'}">
											승인
										</c:if>
										<c:if test="${attendenceVO.atenYn == 'N'}">
											반려
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="d-flex justify-content-center mt-3"	style="display: inline-block;">
			<nav aria-label="Table Paging" class="my-3">
				<ul class="pagination justify-content-end mb-0">
					<li	class="paginate_button page-item previous <c:if test='${currentPage == 1}'>disabled</c:if>" id="dataTable_previous">
						<a class="page-link" href="/prof/attenPruf?lecCode=${lecCd}&&currentPage=${currentPage-1}&&size=${size}" aria-controls="dataTable" data-dt-idx="0" tabindex="0">Previous</a>
					</li>
					<c:forEach var="pNo" begin="1" end="${pageCnt}">
						<c:if test="${currentPage == pNo}">
							<li class='paginate_button page-item active'>
								<a class="page-link" href="/prof/attenPruf?lecCode=${lecCd}&&currentPage=${pNo}&&size=${size}" aria-controls="dataTable" data-dt-idx="1" tabindex="0">${pNo}</a>
							</li>
						</c:if>
						<c:if test="${currentPage != pNo}">
							<li class='paginate_button page-item'>
								<a class="page-link" href="/prof/attenPruf?lecCode=${lecCd}&&currentPage=${pNo}&&size=${size}"	aria-controls="dataTable" data-dt-idx="1" tabindex="0">${pNo}</a>
							</li>
						</c:if>
					</c:forEach>
					<li	class="paginate_button page-item next <c:if test='${currentPage >= pageCnt}'>disabled</c:if>" id="dataTables_next">
						<a class="page-link" href="/prof/attenPruf?lecCode=${lecCd}&&currentPage=${currentPage+1}&&size=${size}" aria-controls="dataTable" data-dt-index="7" tabindex="0">Next</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>

<script>
const header = '${_csrf.headerName}';
const token =  '${_csrf.token}';

	const stuList = document.querySelector("#listStu");
	const lecList = document.querySelector("#listLec");
	const prufList = document.querySelector("#listPruf");
	const selMemNo = document.querySelector("#memNo");
	const selMemNm = document.querySelector("#memNm");
	const atenCome = document.querySelector("#atenCome");
	const atenLate = document.querySelector("#atenLate");
	const atenEarlyLeave = document.querySelector("#atenEarlyLeave");
	const atenAbsent = document.querySelector("#atenAbsent");
	const atenOfiAbsent = document.querySelector("#atenOfiAbsent");
	const fitTable = document.querySelector(".fitTable");
	
	var lecCode = "${lecCd}";
	
	

	 // 출결 증빙 승인
	    function approve(pthis) {
	        let de = $(pthis).closest("tr").find(".de").text();
	        let no = $(pthis).closest("tr").find(".no").text();
	        console.log("atenDe", de);
	        console.log("memNo", no);
		
		data = {
				atenDe : de,
				memNo : no,
				lecCode : lecCode
		}
		
		$.ajax({
			url:"/prof/approveAtten",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"put",
			dataType:"json",
			beforeSend: function(xhr) {
		    	xhr.setRequestHeader(header, token);
			},
			success:function(result){
				console.log("result : " + result);
				
				if(result) {
	  				Swal.fire({
	  					icon: "success",
	  					title: "승인처리가 정상적으로 완료되었습니다."
						}).then((rslt) => {
							location.href = "/prof/attenPruf?lecCode="+lecCode;
						})
	  			} else {
	        		Swal.fire({
	   					icon : "error",
	   					title : "승인처리를 하는 중 문제가 생겼습니다."
	   				})
	  			}
			}
		});
   }

	 // 출결 증빙 반려
	    function reject(pthis) {
	        let de = $(pthis).closest("tr").find(".de").text();
	        let no = $(pthis).closest("tr").find(".no").text();
	        console.log("atenDe", de);
	        console.log("memNo", no);
		
		data = {
				atenDe : de,
				memNo : no,
				lecCode : lecCode
		}
		
		$.ajax({
			url:"/prof/rejectAtten",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"put",
			dataType:"json",
			beforeSend: function(xhr) {
		    	xhr.setRequestHeader(header, token);
			},
			success:function(result){
				console.log("result : " + result);
				
				if(result) {
	  				Swal.fire({
	  					icon: "success",
	  					title: "반려처리가 정상적으로 완료되었습니다."
						}).then((rslt) => {
							location.href = "/prof/attenPruf?lecCode="+lecCode;
						})
	  			} else {
	        		Swal.fire({
	   					icon : "error",
	   					title : "반려처리를 하는 중 문제가 생겼습니다."
	   				})
	  			}
			}
		});
   }
	
	// 다운로드
	function download(fileId) {
		data = {
			fileId : fileId	
		}
		
		$.ajax({
			url:"/attach/getAttachVOList",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"post",
			dataType:"json",
			beforeSend: function(xhr) {
		    	xhr.setRequestHeader(header, token);
			},
			success:function(result){
				console.log("result : " + JSON.stringify(result));
				console.log("filePath : " + result[0].filePath);
				console.log("fileOriNm : " + result[0].fileOriNm);
				
				let aTag = document.createElement("a");
				aTag.href = result[0].filePath;
				aTag.download = result[0].fileOriNm;
		
				aTag.click();  // 강제 클릭
			}
		});
   }
	
    // 검색
    function searchPruf() {
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
	        url: "/prof/searchPruf?lecCode="+lecCode,
	        type: "GET",
	        data: searchOptions,
	        dataType : "json",
	        contentType: 'application/x-www-form-urlencoded; charset=utf-8',
	        success: function (result) {
	            console.log("검색 결과:", result);
	            let txt = "";
	            for(let i=0; i<result.length; i++){
	            	txt += 
	            		`
	            		<tr>
	            		<td>${i+1}</td>
						<td class='de'>\${result[i].atenDe}</td>
						<td>\${result[i].memNm}</td>
						<td class='no'>\${result[i].memNo}</td>
						<td>\${result[i].colNm}</td>
						<td>\${result[i].depNm}</td>
						<td>\${result[i].stuYr}</td>
						<td>\${result[i].memTel}</td>
						<td>
						<button type='button' class='btn mb-2 btn-my' onclick="download('\${result[i].fileId}')">다운로드</button>
						</td>
						<td>
						<button type='button' class='btn mb-2 btn-outline-success' onclick="approve(this)">승인</button>
						<button type='button' class='btn mb-2 btn-outline-danger' onclick="reject()">반려</button>
						</td>
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

						
