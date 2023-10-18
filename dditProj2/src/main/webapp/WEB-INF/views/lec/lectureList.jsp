<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<style>
/*  	div {  */
/*  		border: 1px solid blue;  */
/*  	}  */
    .table-borderless th {
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
	/* 수강 신청 계획서 테이블 */
  .table {
      color: #000000;
  }

  .table-col {
      background-color: #f3b7bd;
  }

  .table-bordered th, .table-bordered td {
      border: 1px solid #000000;
  }

  .td-my {
      text-align: left;
  }
  
  .w-15 {
      width: 15%;
  }
   #modalTable1 tr th {
      color: #000000;
      white-space:nowrap;
  }
</style>

<!-- 모달 -->
            <div class="modal fade show" id="verticalModal" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" style="padding-right: 19px;" aria-modal="true">
              <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h4 class="modal-title" id="verticalModalTitle">강의 계획서</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">×</span>
                    </button>
                  </div>
                  <div class="modal-body">

                    <div class="form-group">
                      <div class="">
                        <table class="table table-bordered text-center border-0" id="modalTable1">
                          <thead></thead>
                          <tbody>
                            <tr><th class="border-0 text-left p-0 pt-3" colspan="6"><h6 class="mb-0">[수업관련]</h6></th></tr>
                            <tr>
                              <th class="table-col">교과목명</th>
                              <td class="td-my" colspan="3" id="subNm"></td>
                              <th class="table-col">강의실</th>
                              <td class="td-my" colspan="3" id="adress"></td>
                            </tr>
                            <tr>
                              <th class="table-col">개설학과</th>
                              <td class="td-my" colspan="3" id="depNm"></td>
                              <th class="table-col" rowspan="2">강의시간</th>
                              <td class="td-my" colspan="3" rowspan="2" id="schedule"></td>
                            </tr>
                            <tr>
                              <th class="table-col">이수구분</th>
                              <td class="td-my"  colspan="1" id="lecaSeCode"></td>
                              <th class="table-col">학점</th>
                              <td colspan="1" id="lecaCrd"></td>
                            </tr>
                            <tr>
                              <th class="table-col">학년</th>
                              <td class="td-my" colspan="3" id="lecaTrg"></td>
                              <th class="table-col">학기</th>
                              <td class="td-my" colspan="3" id="lecaDate"></td>
                            </tr>
                            <tr>
                              <th class="table-col">최대정원</th>
                              <td class="td-my" colspan="3" id="lecaCap"></td>
                              <th class="table-col">총수업일수</th>
                              <td class="td-my" colspan="3" id="lecaCount"></td>
                            </tr>


                            <tr><th class="border-0 text-left p-0 pt-3" colspan="6"><h6 class="mb-0">[교수관련]</h6></th></tr>
                            <tr>
                              <th class="table-col">교수명</th>
                              <td class="td-my" colspan="3" id="proNm"></td>
                              <th class="table-col">연락처</th>
                              <td class="td-my" colspan="3" id="proTel"></td>
                            </tr>
                            <tr>
                              <th class="table-col">소속학과</th>
                              <td class="td-my" colspan="3" id="memDepNm"></td>
                              <th class="table-col">이메일</th>
                              <td class="td-my" colspan="3" id="memMl"></td>
                            </tr>

                            <tr><th class="border-0 text-left p-0 pt-3" colspan="6"><h6 class="mb-0">[평가관련]</h6></th></tr>
                            <tr>
                              <th class="table-col" rowspan="1">평가비율</th>
                              <td class="td-my" colspan="7">중간 30% / 기말 40% / 출결 10% / 과제 20%</td>
                            </tr>
                            <tr>
                              <th class="table-col">평가비율</th>
                              <td class="td-my" colspan="7">
                                <div class="progress rounded my-3" style="height:14px">
                                  <div class="progress-bar bg-danger" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">30%</div>
                                  <div class="progress-bar bg-warning" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">40%</div>
                                  <div class="progress-bar bg-success" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">10%</div>
                                  <div class="progress-bar bg-success" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">20%</div>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <th class="table-col">평가기준</th>
                              <td class="td-my" colspan="7" id="codeNm"></td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>

                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn mb-2 btn-primary" data-dismiss="modal">닫기</button>
                  </div>
                </div>
              </div>
            </div><!-- 모달 -->


<body class="vertical  light  ">
<%--  <p>페이지수:${sList}</p> --%>
	<div class="wrapper w-75">
		<main role="main" class="main-content mx-auto">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12">
						<div class="row align-items-center my-4">
							<div class="col">
								<h2 class="h3 mb-0 page-title">강의목록 조회</h2>
							</div>
						</div>
							<div class="mb-3">
					            <div class="alert alert-danger" role="alert">
					              <h4 class="alert-heading my-4">📢안내사항</h4>
					              <p>‣ 승인구분은 상태가 나타며 승인클릭시 승인취소 대기클릭시 승인이됨 </p>
					            </div>
					          </div>
					    <div class="row align-items-center my-2 justify-content-end pr-3">
							<form action="/admin/lectureList" method="get" style="display: flex; align-items: center;">
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
			                           </div>
			                           <div class="form-group col-auto">
			                           </div>
			                         </div>
			                       </form>
			                     </div>
								<table class="table table-borderless">
									<thead>
										<tr>
											<th>년도</th>
											<th>학기</th>
											<th>학과</th>
											<th>담당교수</th>
											<th>교수전화</th>
											<th>학년</th>
											<th style="text-align: left;">강의명</th>
											<th>상세</th>
											<th>승인구분</th>
										</tr>
									</thead>
									<tbody id ="result">
										<c:forEach items="${lList.content}" var="lecture" varStatus="status">
										<tr style="margin-top: 10px;" class ="
				                          	<c:if test='${index.count%2==0}'>even</c:if>
				                          	<c:if test='${index.count%2==1}'>odd</c:if>
				                          ">
											<td>
												<p class="mb-0 "></p> 
												<small class="mb-0 ">${lecture.lecaYr}</small>
											</td>
										
											<td>
												<p class="mb-0 "></p> 
												<small class="mb-0 ">${lecture.lecaSem}</small>
											</td>
											
											<td>
												<p class="mb-0 "></p> 
												<small class="mb-0 ">${lecture.depNm}</small>
											</td>
											
											<td>
												<p class="mb-0 "></p> 
												<small class="mb-0 ">${lecture.memNm}</small>
											</td>
											
											<td>
												<p class="mb-0 "></p> 
												<small class="mb-0 ">${lecture.memTel}</small>
											</td>
											
											<td>
												<p class="mb-0 "></p> 
												<small class="mb-0 ">${lecture.lecaTrg}</small>
											</td>
											
											<td style="text-align: left;">
												<p class="mb-0 "></p> 
												<small class="mb-0 ">${lecture.lecaNm}</small>
											</td>
											
											
											<td data-leca-id="${lecture.lecaId}">
												 <button class="btn btn-sm btn-primary viewBtn" type="button" data-toggle="modal" data-target="#verticalModal">강의계획서 보기</button>
											</td>
											
											<td id="lecbtn" >
											    <p class="mb-0 text-muted"></p> 
											    <c:if test="${lecture.lecYn eq 'Y'}">
											        <button type="button" onclick="lecStatus(this)" class="btn btn-success" value="${lecture.lecYn}">승인</button>
											    </c:if>
											    <c:if test="${lecture.lecYn eq 'N'}">
											        <button type="button" onclick="lecStatus(this)" class="btn btn-warning" value="${lecture.lecYn}">대기</button>
											    </c:if>
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="d-flex justify-content-center mt-3" style="display: inline-block;">
							
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
		                          id="dataTable_previous"><a class="page-link " href="/admin/lectureList?currentPage=${page - 1}&size=${lList.size}" aria-controls="dataTable" data-dt-idx="0" tabindex="0"
		                          	>Previous</a></li>
		                          	
		                          <c:forEach var="pNo" begin="${lList.startPage}" end="${lList.endPage+4}">
		                            <c:if test="${pNo <= lList.totalPages }">
		                          	<li class='paginate_button page-item
		                          		<c:if test="${page==pNo}">active</c:if>
		                          	'><a class="page-link" href="/admin/lectureList?currentPage=${pNo}&size=${lList.size}" aria-controls="dataTable" data-dt-idx="1" tabindex="0"
		                          	>${pNo}</a></li>
		                          	</c:if>	
		                          </c:forEach>
		                         
		                          <li class="paginate_button page-item next
		                          	<c:if test='${page == data.totalPages}'>disabled</c:if>
		                          " id="dataTable_next"><a
		                           class="page-link" href="/admin/lectureList?currentPage=${page+1}&size=${data.size}" aria-controls="dataTable" data-dt-idx="7" tabindex="0">Next</a></li>
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
	<input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<!-- .wrapper -->
	<script>	
	const header = '${_csrf.headerName}';
	const token =  '${_csrf.token}';
	
	// 수강계획서 보기 버튼 클릭 시
    $(document).on("click", ".viewBtn", function() {
    	  const lecaId = $(this).closest("td").data("leca-id");
          console.log("lecaId: " + lecaId);
          $("#input_m_1").val(lecaId);
          
        // 강의 정보 가져오기
        $.ajax({
            type: "GET",
            url: "/admin/lectureDetail/" + lecaId,
            beforeSend: function(xhr) {
            	xhr.setRequestHeader(header, token);
    		},
            dataType: "json",
            success: function(data) {
               console.log("data",data);
            	if (data) {
                  // 강의계획서에 필요한 데이터(한 개의 강의에 여러개의 요일이 있어 data[0]으로 해줘야 함)
                    console.log("로그 : " + JSON.stringify(data[0]));
                    let subNm = data[0].subNm;
                    let adress = data[0].bldNm + " - " + data[0].roomNo + "호실";
                    let depNm = data[0].depNm;
                    let lecaSeCode = data[0].lecaSeCode;
                    let lecaCrd = data[0].lecaCrd + "점";
                    let lecaTrg = data[0].lecaTrg + "학년";
                    let lecaCap = data[0].lecaCap + "명";
                    let lecaDate = data[0].lecaYr + "년 " + data[0].lecaSem + "학기";
                    let lecaCount = data[0].lecaCount + "일";
                    let proNm = data[0].memNm;
                    let proTel = data[0].memTel;
                    let memDepNm = data[0].memDepNm;
                    let memMl = data[0].memMl;
                    let codeNm = data[0].codeNm;

                    $("#subNm").text(subNm);
                    $("#adress").text(adress);
                    $("#depNm").text(depNm);
                    $("#lecaSeCode").text(lecaSeCode);
                    $("#lecaCrd").text(lecaCrd);
                    $("#lecaTrg").text(lecaTrg);
                    $("#lecaDate").text(lecaDate);
                    $("#lecaCap").text(lecaCap);
                    $("#lecaCount").text(lecaCount);
                    $("#proNm").text(proNm);
                    $("#proTel").text(proTel);
                    $("#memDepNm").text(memDepNm);
                    $("#memMl").text(memMl);
                    $("#codeNm").text(codeNm);

                    let schedule = "";
                    $.each(data, function(index, item) {
                        if (item.lecdWeek == null){
                            schedule = "데이터가 없습니다.";
                        } else {
                            schedule += item.lecdWeek + " " + item.lecdSt + " ~ " + item.lecdEt + "<br>";
                        }
                    });
                    $("#schedule").html(schedule);
                }
            },
            error: function(xhr, status, error) {
                console.log("code: "+xhr);
                console.log("message: "+status);
                console.log("error: "+error);
            }
        });

//          모달 창 보이기
        $("#verticalModal").modal("show");
    });
	
	function lecStatus(pthis){
		//.closest("tr").find("td:eq(8)").text();
		var lecYn = $(pthis).attr("value");
		let lecaId = $(pthis).closest("tr").find("td[data-leca-id]").data("leca-id");
		console.log("lecYn",lecYn);
		console.log("lecaId",lecaId);
		var text='';
		if(lecYn ==='Y'){
			var text = '해당 강의를 취소 하시겠습니까?';
		}if(lecYn ==='N'){
			var text = '해당 강의를 승인 하시겠습니까?';
		}
		
		Swal.fire({
            text: text,
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#2378e7',
            confirmButtonText: '예',
            cancelButtonColor: '#9a9a9a',
            cancelButtonText: '아니오'
	     }).then((result) => {
	        if (result.isConfirmed) {
// 	            '예'를 클릭한 경우 AJAX 요청 실행
	            $.ajax({
	            	type: "post",
	                url: "/admin/lecStatus/",
	                data: {
	                	"lecYn":lecYn,
	                	"lecaId":lecaId	
	                },
	                beforeSend: function(xhr) {
	                	xhr.setRequestHeader(header, token);
	                },
	                success: function(data){
	                	console.log("data",data);
	                	if(data="1"){
	                		location.reload();
	                	}
	    			},
	    			error: function (xhr, status, error) {
    				    console.log("code: " + xhr.status)
    				    console.log("message: " + xhr.responseText)
    				    console.log("error: " + error);
	    			}
	    		})
	        }
	    });
	}
	
	
	

	
	</script>

</body>