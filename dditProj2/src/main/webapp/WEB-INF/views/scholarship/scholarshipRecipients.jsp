<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" ></script>

<style>
#table-content {
    max-height: 400px;
    overflow-y: auto;
    margin-bottom: 100px;
}
.alert-danger {
    color: #000000;
    background-color: #ebebeb;
    border-color: #ebebeb;
}
.bg-danger-light {
    background: rgb(182, 26, 63);
}
</style>
<!-- <main role="main" class="main-content"> -->
<!--    <div class="container-fluid"> -->
   
	<div class="container-fluid" style="margin-top:20px;">
      <div class="row justify-content-center">
        <div class="col-12">
          <h2 class="my-2 page-title text-center">장학생 관리</h2>

          <h4 class="mt-4 page-title text-center text-my">장학대상자 조회</h4>
          <div class="mb-3">
            <div class="alert alert-danger" role="alert">
              <h4 class="alert-heading my-4">📢안내사항</h4>
              <p>※ 성적 장학금은 각 학과 학년별 석차순, 수석, 우수, 격려장학금을 수여함</p>
              <p>‣ 수석장학금 등록금의 100%</p>
              <p>‣ 우수장학금 등록금의 50%</p>
              <p>‣ 격려장학금 등록금의 30%</p>
            </div>
          </div>
          
          <form onsubmit="return fsubmit(this)">
          <div class="input-group mb-3 col-9 justify-content-end" style="margin-top:30px;">
          	<div class="mr-2" style="width:17%;">
          		<label for=sSclName class="d-none"></label>
	          	<select id="sSclName" name="sSclName" class="form-control px-2">
	          		<option value="-1">성적장학금</option>
		            <option value="수석장학금">수석장학금</option>
		            <option value="우수장학금">우수장학금</option>
		            <option value="격려장학금">격려장학금</option>
	          	</select>
          	</div>
          
          	<div class="mr-2" style="width:17%;">
          		<label for="sColCode" class="d-none"></label>
	          	<select id="sColCode" name="sColCode" class="form-control px-2" onchange="sColCodeChg(this)">
	          		<option value="-1">단과대</option>
	          		<c:forEach items="${collList}" var="coll">
			           	 <option value="${coll.codeId }">${coll.codeNm }</option>
			        </c:forEach>
<!-- 		            <option value="MGMT">경영대학</option> -->
<!-- 		            <option value="HUM">인문대학</option> -->
<!-- 		            <option value="LSCI">생명과학대학</option> -->
<!-- 		            <option value="ENGR">공과대학</option> -->
<!-- 		            <option value="SOCSCI">사회과학대학</option> -->
<!-- 		            <option value="NATSCI">자연과학대학</option> -->
<!-- 		            <option value="ART">예술대학</option> -->
	          	</select>
			           					
          	</div>
          	
          	<div class="mr-4" style="width:17%;">
          		<label for="depCode" class="d-none"></label>
	          	<select id="depCode" name="depCode"  class="form-control px-2">
	          		<option value="-1">학과</option>
<!-- 		            <option value="HUM1">국어국문학과</option> -->
<!-- 		            <option value="HUM2">철학과</option> -->
<!-- 		            <option value="HUM3">사학과</option> -->
	          	</select>
          	</div>
          	
          	<div class="mr-4">
          		<button class="btn btn-my" type="submit" id="selectBtn" style="width:70px; height:33px;">검색</button>
        	</div>
          </div>
          </form>
          
          <div id="table-contentt">
          	<div id="table-content"  style="margin-bottom :30px;">
              <table class="table datatables text-center" id="dataTable-1">
                  <thead class="bg-secondary-light">
                      <tr>
                          <th>단과대학</th>
                          <th>학과</th>
                          <th>학년</th>
                          <th>학번</th>
                          <th>이름</th>
                          <th>장학금(원)</th>
                          <th>상세보기</th>
                      </tr>
                  </thead>
                    <tbody>
                    	<c:choose>
	        				<c:when test="${not empty scholarStuVOList}">
		                    	<c:forEach items="${scholarStuVOList}" var="ScholarshipVO" varStatus="stat">
			          				<tr style="margin-top: 10px;" class ="
			                          	<c:if test='${index.count%2==0}'>even</c:if>
			                          	<c:if test='${index.count%2==1}'>odd</c:if>
			                        ">
			          					<td class="schCode">${ScholarshipVO.codeNm }</td>
			          					<td>${ScholarshipVO.depNm }</td>
			          					<td>${ScholarshipVO.stuYr }</td>
			          					<td>${ScholarshipVO.memNo }</td>
			          					<td>${ScholarshipVO.memNm }</td>
			          					<td><fmt:formatNumber value="${ScholarshipVO.sclLpay/1}" type="number" pattern="#,###,###"/></td>
			          					<td><button class="btn btn-my" data-toggle="modal" data-target="#scholarship" onclick="getStuLec(this)">상세</button></td>
			          				</tr>	
		          				</c:forEach>
	          				</c:when>
	        				<c:otherwise>
	                          	<tr class="odd">
	                          		<td colspan="8" style="text.align:center;">데이터가 없습니다.</td>
	                          	</tr>
	                        </c:otherwise>
    					</c:choose>
          			</tbody>
          		</table>
          	</div>
          	
          		<div class="col" style="text-align: right;">
	            	<button class="btn btn-my" data-toggle="modal" data-target="#insertScholar" style="height:40px; width:150px;">장학생 등록</button>
	            </div>
          		
          		  <!-- 상세보기 모달 -->
				  <div class="modal fade show" id="scholarship" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" style="padding-right: 19px;" aria-modal="true">
				     <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
				       <div class="modal-content">
				
				         <form id="myForm" >
				
				           <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				           <div class="modal-header bg-danger-light">
				             <h4 class="modal-title text-white" id="verticalModalTitle ">학생 상세 정보</h4>
				             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				               <span aria-hidden="true">×</span>
				             </button>
				           </div>
							
							<div class="modal-body">
							    <table class="table table-bordered">
							        <thead class="bg-secondary-light">
							            <tr>
							                <th>학번</th>
							                <th>이수학점</th>
							                <th>이수구분</th>
							                <th>강의명</th>
							                <th>성적</th>
							                <th>학점</th>
							            </tr>
							        </thead>
							        <tbody id="tbody">
							            <tr>
							                <td>${scholarStuVO.memNo}</td>
							                <td>${scholarStuVO.lecaCrd}</td>
							                <td>${scholarStuVO.lecaSeCode}</td>
							                <td>${scholarStuVO.lecaNm}</td>
							                <td class="score">${scholarStuVO.scoreAll}</td>
							                <td>${scholarStuVO.codeScreGrade}</td>
							            </tr>
							        </tbody>
							    </table>
							    <table>
							    	<tbody>
							    		<tr>
							    			<td>총 평점</td>
							    			<td id="totalScore"  style="padding-left: 10px;">4.47</td>
							    		</tr>
							    	</tbody>
							    </table>
							</div>

				            <div class="modal-footer justify-content-center">
				             	<button type="button" class="btn btn-my" data-dismiss="modal" onclick="scholar()">장학금 수여</button>
				            </div>
				            
				         </form>
			           </div>
					</div>
				  </div><!-- 모달 -->
				  
          		  <!-- 장학생 등록 모달 -->
				  <div class="modal fade show" id="insertScholar" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" style="padding-right: 19px;" aria-modal="true">
				     <div class="modal-dialog modal-dialog-centered" role="document">
				       <div class="modal-content">
				
				         <form id="myForm" >
				
				           <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				           <div class="modal-header bg-danger-light">
				             <h4 class="modal-title text-white" id="verticalModalTitle ">예비 장학생 정보</h4>
				             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				               <span aria-hidden="true">×</span>
				             </button>
				           </div>
							
							<div class="modal-body">
							
							    <div class="form-group">
		                            <label for="empMemNo">교직원 번호</label>
		                            <input type="text" class="form-control" id="empMemNo" name="empMemNo" value="" placeholder="ex) 202309E001">
		                        </div>
		                        
							    <div class="form-group">
		                            <label for="memNo">학생 번호</label>
		                            <input type="text" class="form-control" id="memNo" name="memNo" value="" placeholder="ex) 202309S001">
		                        </div>
		                        
		                        <div class="form-row">
		                          <div class="form-group col-md-6">
		                            <label for="colCode">단과대</label>
			                          <select id="colCode" class="form-control" onchange="fColCodeChg(this)">
			                          <option value="-1">단과대를 선택하세요</option>
			           					<c:forEach items="${collList}" var="coll">
			           					       <option value="${coll.codeId }">${coll.codeNm }</option>
			           					</c:forEach>
			                          </select>
		                          </div>
		                          <div class="form-group col-md-6">
	                                <label for="SdepCode">학과</label>
			                          <select id="SdepCode" class="form-control">                     
			                          </select>	
	                              </div>
		                        </div>
		                        
		                        <div class="form-row">
		                          <div class="form-group col-md-6">
		                            <label for="stuYr">학년</label>
		                            <input type="text" class="form-control" id="stuYr" name="stuYr" value=""  placeholder="ex) 1-4">
		                          </div>
		                          <div class="form-group col-md-6">
		                            <label for="memNm">학생 이름</label>
		                            <input type="text" class="form-control" id="memNm" name="memNm" value=""  placeholder="ex) 학생명">
		                          </div>
		                        </div>
		                        
		                        <div class="form-row">
		                          <div class="form-group col-md-6">
		                            <label for="sclYr">장학금 연도</label>
		                            <input type="text" class="form-control" id="sclYr" name="sclYr" value="" placeholder="YYYY" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
		                          </div>
		                          <div class="form-group col-md-6">
		                            <label for="sclSemCode">장학금 학기</label>
		                            <input type="text" class="form-control" id="sclSemCode" name="sclSemCode" value=""  placeholder="ex) 1/2" maxlength="1" pattern="[1-2]">
		                          </div>
		                        </div>
		                        
		                        <div class="form-row">
		                          <div class="form-group col-md-6">
		                            <label for="sclLpay">장학금 지급액</label>
		                            <input type="text" class="form-control" id="sclLpay" name="sclLpay" value=""  placeholder="ex) 3000000">
		                          </div>
		                          <div class="form-group col-md-6">
		                            <label for="sclName">장학금 이름</label>
		                            <input type="text" class="form-control" id="sclName" name="sclName" value=""  placeholder="ex) 성적장학금(수석/우수/격려)">
		                          </div>
		                        </div>
		                        
							</div>

				            <div class="modal-footer justify-content-center">
				             	<button type="button" class="btn btn-my" data-dismiss="modal" onclick="insertScholar()">등록</button>
				            	<button type="button" id="autoBtn" class="btn btn-my">자동 입력</button>
				            </div>
				            
				         </form>
			           </div>
					</div>
				  </div><!-- 모달 -->
          	</div>
          	
        </div> <!-- .col-12 -->
      </div> <!-- .row -->
    </div> <!-- .container-fluid -->
<!--   </div> -->
<!-- </main> -->

<script>
function fsubmit(pThis) {
	if(pThis.sSclName.value == "-1"){
		alert("장학금 종류를 선택해주세요");
		pThis.sSclName.focus();
		return false;
	}

	if(pThis.colCode.value == "-1"){
		alert("단과대를 선택해주세요");
		pThis.colCode.focus();
		return false;

	}

	if(pThis.depCode.value == "-1"){
		alert("학과를 선택해주세요");
		pThis.depCode.focus();
		return false;
	}

	// 제대로 다 선택했으면 전송!
	return true;

}


//본인 성적 상세확인
function getStuLec(pThis) {
	console.log("매개변수 체킁:", pThis);
	
	let $tds = $(pThis).closest("tr").find("td");
	console.log("체킁:", $tds);
	
	let scholarStuVO = {
		memNo : $tds.eq(3).html()
	}
	
	console.log("넘길 데이터:", scholarStuVO);
	
	$.ajax({
		type : "GET",
		url : `/admin/scholarshipRecipientsDetail`,
		data : scholarStuVO,
		dataType : "json",
		beforeSend:function(xhr){
   			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
   		},
   		/*
	    codeScreGrade: "A+" colCode: null depCode: null lecaCrd: 3 lecaNm: "건축학개론"
		lecaSeCode: "전필" memNm: null memNo: "202308S001" sclLpay: 0 scoreAll: "4.5" stuYr: 0
   		*/
		success : function(retVal) {
			
			console.log("체킁retVal:", retVal);
			
			$tds.eq(3).html(retVal[0].memNo);
			console.log("체킁retVal.memNo:", retVal[0].memNo);

			let html = "";
			for(let i=0; i<retVal.length; i++) {
				html += `
				<tr>
					<td>\${retVal[i].memNo}</td>
					<td>\${retVal[i].lecaCrd}</td>
					<td>\${retVal[i].lecaSeCode}</td>
					<td>\${retVal[i].lecaNm}</td>
					<td>\${retVal[i].scoreAll}</td>
					<td>\${retVal[i].codeScreGrade}</td>
				</tr>
				`;
			}
			
			$("#tbody").html(html);
			
			const scoreElements = document.querySelectorAll('.score');
			scoreElements.forEach(element => {
			    const scoreValue = element.textContent; // 엘리먼트의 텍스트 내용을 가져옴
			    console.log('scoreValue:', scoreValue);
			});
			// document.getElementById("totalScore").value = total;
			
		},
		error: function (xhr, status, error) {
            console.log("code: " + xhr.status);
            console.log("message: " + xhr.responseText);
            console.log("error: " + error);
        }
	});
	
}

// //버튼 클릭 시 모달 창 보이기
// $(document).ready(function () {
//     $(".btn btn-my").click(function () {
//         $("#insertScholar").modal("show");
//     });
// });

//장학생 등록
function insertScholar() {
	let scholarshipVO = {
		empMemNo : $("#empMemNo").val(),
		memNo : $("#memNo").val(),
		sclYr : $("#sclYr").val(),
		sclSemCode : $("#sclSemCode").val(),
		sclLpay : $("#sclLpay").val(),
		sclName : $("#sclName").val(),
		colCode : $("#colCode").val(),
		depCode : $("#SdepCode").val(),
		stuYr : $("#stuYr").val(),
		memNm : $("#memNm").val()
	}
		console.log($("#depCode").val());
	
	console.log("체킁scholarshipVO:" + JSON.stringify(scholarshipVO));
	
	$.ajax({
		type : "post",
		url : `/admin/scholarshipInsert`,
		data : JSON.stringify(scholarshipVO),
		contentType : "application/json;charset=utf-8",
		dataType : "text",
  		beforeSend:function(xhr){
  			xhr.setRequestHeader('${_csrf.headerName}','${_csrf.token}');
  		},
  		success : function(rslt) {
  			console.log("rslt:" + rslt);
  			if(rslt) {
  				Swal.fire({
  					icon: "success",
  					title: "장학생 등록이 정상적으로 완료되었습니다."
					}).then((rslt) => {
      			  //getList();
   				  location.href = "/admin/scholarshipRecipients";
					})
  			} else {
        		Swal.fire({
   					icon : "error",
   					title : "장학생 등록을 하는 중 문제가 생겼습니다."
   				})
  			}
  		},
  		error : function(xhr, status, error) {
  			console.log("code:" + xhr.status);
  			console.log("message: " + xhr.responseText);
  			console.log("error:" + error);
  		}
	});
}

//단과대 선택시 학과 불러오기
const $colCode = $("#colCode");
const $SdepCode = $("#SdepCode");

function fColCodeChg(pThis){
    if(pThis.value != -1){
      $.ajax({
        type:"get",
        url:`/admin/depCodeIdList/\${pThis.value}`,
        dataType: "json",
        success: function(rslt){
          console.log("체킁R:",rslt);

          $SdepCode.empty();
          $SdepCode.append('<option value="-1" selected>학과를 선택하세요</option>'); 
          $.each(rslt, (inx,opt) => {
            console.log("체킁",opt);
            console.log(opt.codeDetailId,opt.codeDetailNm);
            console.log("ppp",$SdepCode);   
            $SdepCode.append($("<option></option>").val(opt.codeDetailId).html(opt.codeDetailNm));
          })
        },
        error : function(xhr, status, error) {
  			 console.log("code:" + xhr.status);
  			 console.log("message: " + xhr.responseText);
  			 console.log("error:" + error);
  		 }
      })
    }
}

//검색 - 단과대 선택시 학과 불러오기
const $sColCode = $("#sColCode");
const $depCode = $("#depCode");

function sColCodeChg(pThis){
    if(pThis.value != -1){
      $.ajax({
        type:"get",
        url:`/admin/depCodeIdList/\${pThis.value}`,
        dataType: "json",
        success: function(rslt){
          console.log("체킁R:",rslt);

          $depCode.empty();
          $depCode.append('<option value="-1" selected>학과를 선택하세요</option>'); 
          $.each(rslt, (inx,opt) => {
            console.log("체킁",opt);
            console.log(opt.codeDetailId,opt.codeDetailNm);
            console.log("ppp",$depCode);   
            $depCode.append($("<option></option>").val(opt.codeDetailId).html(opt.codeDetailNm));
          })
        },
        error : function(xhr, status, error) {
  			 console.log("code:" + xhr.status);
  			 console.log("message: " + xhr.responseText);
  			 console.log("error:" + error);
  		 }
      })
    }
}

//장학금 수여
function scholar() {
	let memNo = document.querySelector("#tbody tr:first-child td:first-child").innerText;	
   	console.log("memNo",memNo);
	
	$.ajax({
		type : "PUT",
		url : "/admin/scholarship/" + memNo,
		dataType : "text",
  		beforeSend:function(xhr){
  			xhr.setRequestHeader('${_csrf.headerName}','${_csrf.token}');
  		},
  		success : function(rslt) {
  			console.log("rslt", rslt);
   			if(rslt){
   				Swal.fire({
   					icon : "success",
   					title : "장학금 수여가 정상적으로 완료되었습니다."
   				}).then((rslt) => {
   		     		location.href = "/admin/scholarshipRecipients";
   				})
   			} else {
   				Swal.fire({
   					icon : "false",
   					title : "장학금 수여를 하는 중 문제가 생겼습니다."
   				})
   			}
  		},
  		error : function (xhr, status, error) {
            console.log("code:" + xhr.status);
            console.log("message:" + xhr.responseText);
            console.log("error:" + xhr.error);
   		}
	});

}

$("#autoBtn").click(function () {
	$("#empMemNo").val("201803E001");
	$("#memNo").val("201908S002");
// 	$("#colCode").val("SOCSCI");
// 	$("#SdepCode").val("SOCSCI2");
	$("#stuYr").val("4");
	$("#memNm").val("이철희");
	$("#sclYr").val("2023");
	$("#sclSemCode").val("2");
	$("#sclLpay").val("3500000");
	$("#sclName").val("수석장학금");
})


</script>