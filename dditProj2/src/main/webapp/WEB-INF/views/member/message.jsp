<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<style>
  .pagination .page-item.active .page-link,
  .pagination .page-item .page-link:hover {
    background-color: #b92143;
    color : white;
    border-color: #1b68ff;
  }
  
  .bg-warning-light {
    background: #b92143;
  }
  .table thead th {
    color: #ffffff;
  }
</style>
  <body class="vertical light">
<%--   <p>범진${data }</p> --%>
    <div class="wrapper" style="width: 100%; margin: 0 auto; padding-left: 10%; padding-right: 10%;">
    
      <main role="main" class="main-content" style="width: 100%; margin: 0 auto;">
        <div class="container-fluid" >
          <div class="row justify-content-center">
            <div class="col-12">
              <div class="row">
                <!-- Small table -->
                <div class="col-md-12 my-0" id="divdiv"> 
			      <div class="row align-items-center mb-4" id="seach">
					<div class="col-auto">
					    <div class="input-group">
							<form action="/admin/message" method="get" style="display: flex; align-items: center;">
<!-- 						    	<select id="userId" class="form-control" style="margin-right: 10px; height:40px; width:150px;"> -->
<!-- 										<option value="학번">학번</option> -->
<!-- 										<option value="교번">교번</option> -->
<!-- 								</select> -->
					        	<input type="text" class="form-control" id="search1" name="keyword" value="${param.keyword}" placeholder="사용자구분/학과 를 입력해주세요." style="margin-right: 10px; height:40px; width:300px;">
					        	<button type="submit" id="ho" class="btn btn-my" style="color:white; border-color: transparent; height:40px;">검색</button>
					   		</form>
					    </div>
					</div>
	              </div>
                  <div class="card shadow">
                    <div class="card-body">
                      <div class="toolbar">
                        <form class="form">
                          <div class="form-row">
                            <div class="form-group col-auto mr-auto">
                              <label class="my-1 mr-2 sr-only" for="inlineFormCustomSelectPref1">Show</label>
                              <select class="custom-select mr-sm-2" id="inlineFormCustomSelectPref1" name="size">
                                <option value="10"
                                	<c:if test="${param.size=='10'}">selected</c:if>
                                >10</option>
                                <option value="20"
                                	<c:if test="${param.size=='20'}">selected</c:if>
                                >20</option>
                                <option value="30"
                                	<c:if test="${param.size=='30'}">selected</c:if>
                                >30</option>
                                <option value="40"
                                	<c:if test="${param.size=='40'}">selected</c:if>
                                >40</option>
                              </select>
                            </div>
                            <div class="form-group col-auto">
                            </div>
                          </div>
                        </form>
                      </div>
                      <!-- table -->
<%--                       <p>개똥이 : ${memberList}</p> --%>
                      <table class="table table-borderless table-hover" aria-describedby="dataTable_info">
                        <thead class="bg-warning-light text-black">
                          <tr>
                          	<!-- 체크하는거 -->
                          	<th><input type="checkbox" id="selectAll"></th>
                            <th>순번</th>
                            <th>사용자 구분</th>
<!--                             <th>단과대/부서</th> -->
                            <th>학과</th>
<!--                             <th>학번/교번</th> -->
                            <th>이름</th>
<!--                             <th>생년월일</th> -->
                            <th>전화번호</th>
<!--                             <th>상세보기</th> -->
                          </tr>
                        </thead>
                        <tbody>
                          <!-- List<MemberVO> memberList -->
                          <c:forEach items="${memberList}" var="memberVO" varStatus="stat" >
                          
                          <tr style="margin-top: 10px;" class ="
                          	<c:if test='${index.count%2==0}'>even</c:if>
                          	<c:if test='${index.count%2==1}'>odd</c:if>
                          ">
                          
                         	 <td>
					          <div class="form-check">
					            <input type="checkbox" class="form-check-input" name="selectedIds" value="${memberVO.memNo}">
					          </div>
					        </td>
					        
                            <td>
                              <div class="avatar avatar-md">
                              	<p class="mb-0 text-muted"><strong>${stat.count+(data.currentPage*10)-10}</strong></p>
                              </div>
                            </td>
                            <td>
                                <p class="mb-0 text-muted"><strong>${memberVO.memType}</strong></p>
                            </td>
                            <td>
                              <p class="mb-0 text-muted"><strong>${memberVO.memDepCode}</strong></p>
                              <c:if test='{memberVO.memType == "학생" or memberVO.memType == "교수" }'>
                              	    <p class="mb-0 text-muted"><strong>${memberVO.memDepCode}</strong></p>
                              </c:if>
<%--                               <p class="mb-0 text-muted"><strong>${memberVO.memEmpDv}</strong></p> --%>
<%--                               <c:if test='{memberVO.memType == "교직원" }'> --%>
<!--                               	    <p class="mb-0 text-muted"><strong></strong></p> -->
<%--                               </c:if> --%>
                            </td>
<!--                             <td> -->
<%--                               <p class="mb-0 text-muted"><strong>${memberVO.memDepCode}</strong></p> --%>
<%--                               <c:if test='{memberVO.memType == "학생" or memberVO.memType == "교수" }'> --%>
<%--                               	    <p class="mb-0 text-muted"><strong>${memberVO.memDepCode}</strong></p> --%>
<%--                               </c:if> --%>
<%--                               <p class="mb-0 text-muted"><strong>${memberVO.memEmpSe}</strong></p> --%>
<%--                               <c:if test='{memberVO.memType == "교직원" }'> --%>
<%--                               	    <p class="mb-0 text-muted"><strong>${memberVO.memEmpSe}</strong></p> --%>
<%--                               </c:if> --%>
<!--                             </td> -->
<!--                             <td> -->
<%--                               <p class="mb-0 text-muted"><strong>${memberVO.memNo}</strong></p> --%>
<!--                             </td> -->
                            <td>
                              <p class="mb-0 text-muted">${memberVO.memNm}</p>
                            </td>
<!--                             <td> -->
<%--                               <p class="mb-0 text-muted"><a href="#" class="text-muted">${memberVO.memBir}</a></p> --%>
<!--                             </td> -->
                            <td class="mb-0 text-muted"><small class="text-muted">${memberVO.memTel}</small></td>
<!--                             <td> -->
<%--                             <button type="button" id="hov" class="btn btn-my" style="color:white; border-color:transparent; height:40px;" onclick="openMemberDetail('${memberVO.memNo}')">상세</button> --%>
<!--                             </td> -->
                          </tr>
                          </c:forEach>
                          <c:if test="${data.hasNoArticles()}">
                          	<tr class="odd">
                          		<td colspan="7" style="text.align:center;">데이터가 없습니다.</td>
                          	</tr>
                          </c:if>
                        </tbody>
                      </table>
                      
                      
                      <div class="avatar avatar-md">
<!-- 	                      <div class="ctable table-borderless table-hover"> -->
<!-- 	                      	<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing -->
<%-- 	                      	 ${(data.currentPage*data.size) - (data.size-1)} --%>
<!-- 	                      	 to -->
<%-- 	                      	 ${data.currentPage*data.size} --%>
<%-- 	                      	 of ${data.total} entries --%>
<!-- 	                      	 </div> -->
<!-- 	                      </div> -->
	                      <nav aria-label="Table Paging" class="mb-0 text-muted">
	                        <ul class="pagination justify-content-center mb-0">
	                          <li class="paginate_button page-item previous
	                          	<c:if test='${page==1}'>disabled</c:if>
	                          " 
	                          	id="dataTable_previous"><a class="page-link " href="/admin/message?currentPage=${page - 1}&size=${data.size}&keyword=${param.keyword}" aria-controls="dataTable" data-dt-idx="0" tabindex="0"
	                          	>Previous</a></li>
	                          	
	                          <c:forEach var="pNo" begin="${data.startPage}" end="${data.endPage+4}">
	                            <c:if test="${pNo <= data.totalPages }">
	                          	<li class='paginate_button page-item
	                          		<c:if test="${page==pNo}">active</c:if>
	                          	'><a class="page-link" href="/admin/message?currentPage=${pNo}&size=${data.size}&keyword=${param.keyword}" aria-controls="dataTable" data-dt-idx="1" tabindex="0"
	                          	>${pNo}</a></li>
	                          	</c:if>	
	                          </c:forEach>
	                         
	                          <li class="paginate_button page-item next
	                          	<c:if test='${page == data.totalPages}'>disabled</c:if>
	                          " id="dataTable_next"><a
	                           class="page-link" href="/admin/message?currentPage=${page+1}&size=${data.size}&keyword=${param.keyword}" aria-controls="dataTable" data-dt-idx="7" tabindex="0">Next</a></li>
	                        </ul>
	                      </nav>
                      </div>
                      	
                    </div>
                  </div>
                  <br />
                  
                  <div class="card shadow mb-4">
                  <div class="card-header">
                    <strong class="card-title">문자발송</strong>
                  </div>
                  <div class="card-body">
                    <form>
                      <div class="form-group row">
                        <label for="sendTel" class="col-sm-3 col-form-label">발신자번호</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" id="sendTel" placeholder="번호를 입력하세요" >
                        </div>
                        
                      </div>
                      <div class="form-group row">
                        <label for="inputPassword3" class="col-sm-3 col-form-label">수신자번호</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" id="inputPassword3" >
                        </div>
                        <div class="col-sm-3">
						    <button class="btn btn-my" type="button" class="btn btn-primary" id="selectRecipients">수신자선택</button>
						  </div>
                      </div>
                      
                      <div class="form-group row">
                        <label for="cont" class="col-sm-3 col-form-label" >내용</label>
                        <div class="col-sm-9">
                          <textarea class="form-control" id="cont" rows="10" cols=""></textarea>
                        </div>
                      </div>
                      
                      <div class="form-group mb-2">
                        <button class="btn btn-my" type="button" onclick="sendMessage()" class="btn btn-primary">발송</button>
                        <button class="btn btn-my" type="button" onclick="auto()" class="btn btn-primary">자동완성</button>
                      </div>
                    </form>
                  </div>
                </div>
                  
                </div> <!-- customized table -->
                
               
                <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              </div>
			</div>
		</div>
	</div>
    </main> <!-- main -->
    </div> <!-- .wrapper -->
    
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
    <script>
    const header = '${_csrf.headerName}';
	const token =  '${_csrf.token}';
      // 약간의 페이지 사기
      if(location.href.indexOf("?") == -1){
       //alert("체킁");
        let pageItems = document.querySelectorAll(".page-item");
        console.log("체킁:",pageItems[1]);
        $(pageItems[1]).addClass("active");
      }

      window.dataLayer = window.dataLayer || [];
	
      function gtag()
      {
        dataLayer.push(arguments);
      }
      gtag('js', new Date());
      gtag('config', 'UA-56159088-1');
      
      
      $(function(){
    	 $("#inlineFormCustomSelectPref1").on("change",function(){
    		 let val = $(this).val();
    		 console.log("val :" +val);
    		 location.href="/admin/message?currentPage=1&size="+val;
    	 });
      });
      
      
      $(document).ready(function() {
    	    $("#selectAll").click(function() {
    	      $("input[name='selectedIds']").prop("checked", $(this).prop("checked"));
    	    });

    	    $("input[name='selectedIds']").click(function() {
    	      if (!$(this).prop("checked")) {
    	        $("#selectAll").prop("checked", false);
    	      }
    	    });
    	  });
      
	  var selectedRecipients = [];
	  
      $(document).ready(function() {
			// "수신자선택" 버튼을 클릭할 때
			$("#selectRecipients").click(function() {
			
			selectedRecipients = [];
				
			// 선택된 모든 체크박스를 반복 처리
			$("input[name='selectedIds']:checked").each(function() {
			  var $row = $(this).closest("tr"); // 가장 가까운 행(row)을 가져옴
			  var name = $row.find("td:eq(4)").text().trim(); // 6번째 열(인덱스 5)에서 이름 추출
			  console.log("name",name);
			  var number = $row.find("td:eq(5)").text().trim(); // 5번째 열(인덱스 4)에서 번호 추출
			  console.log("number",number);
			  
			  // 선택된 수신자의 이름과 번호를 배열에 추가
			  selectedRecipients.push({ name, number });
			});
//     	        console.log("selectedRecipients",selectedRecipients);
    	      

   	      // "inputPassword3" 필드 값을 선택된 수신자의 이름과 번호로 설정
			var recipientsString = selectedRecipients.map(function(recipient) {
			    return recipient.name + ": " + recipient.number;
			  }).join(", ");
			  
			  $("#inputPassword3").val(recipientsString);
			});
    	    
   	  });
      
      function sendMessage(){
    	  
			console.log("selectedRecipients",selectedRecipients);
			let sendTel = document.querySelector("#sendTel").value;
			let cont = document.querySelector("#cont").value;
			console.log("sendTel",sendTel);
			console.log("cont",cont);
    	  	
			
// 			let formData = new FormData();
// 			formData.append("sendTel", sendTel);
// 			formData.append("content", content);
// 			formData.append("selectedRecipients", JSON.stringify(selectedRecipients));
			let sendData = {
            sendTel: sendTel,
            cont: cont,
            selectedRecipients: selectedRecipients
        }; 
			 
    	  $.ajax({
  			url:"/admin/sendMessage",
  			type:"post",
  			data:JSON.stringify(sendData),
  			processData: false,  // 필수
  			contentType: "application/json",
  			beforeSend: function(xhr) {
              	xhr.setRequestHeader(header, token);
      		},
      		success: function(data){
      			Swal.fire({
  					icon: "success",
  					title: "문자가 발송되었습니다."
            	})
				
			},
			error: function (xhr, status, error) {
			    console.log("code: " + xhr.status)
			    console.log("message: " + xhr.responseText)
			    console.log("error: " + error);
			}
  		});
      }
      
      function auto(){
    	  const sendTelInput = document.getElementById("sendTel");
    	  const contInput = document.getElementById("cont");
    	  
    	  sendTelInput.value = "01075231114";
    	  contInput.value = "<긴급>알립니다. 금일 오후 15시 30분 대전지역 지진으로 인해 우리대학 학생의 안전 보호를 위해 지금 시간부터 휴강합니다.<취업딱대학교 학사관리팀>"
      }
    </script>
  </body>