<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- <div id="list"></div> -->
<style>
.btn-primary {
    color: #ffffff;
    background-color: #153579;
    border-color: #1b68ff;
}
</style>

  <body class="vertical light">
    <div class="wrapper" style="width : 60%; margin : auto;">
		<div class="row align-items-center mb-4">
			<div class="col">
			<h1 style="margin-top:3%;">사용자 상세</h1>
			</div>
			<div class="col-auto">
				
			</div>
		</div>
		<div class="row">
                <div class="col-md-12">
                  <div class="card shadow mb-4">
                    <div class="card-header">
                      <strong class="card-title">사용자 정보 <!--${memberVO}--></strong>
                    </div>
                    <div class="card-body">
                      <form action="/memberDetail" method="post">
                      <sec:csrfInput/>
                        <div class="form-group">
                          <label for="memType">사용자 구분</label>
						  <input type="text" class="form-control" name="memType" id="memType" value="${memberVO.memType }" required>
                        </div>
                        <div class="form-group">
                          <label for="inputAddress">사용자 번호</label>
                          <input type="text" class="form-control" id="inputAddress5" name="memNo" value="${memberVO.memNo }" disabled>
                        </div>
                        
                        <div class="form-group">
						  <c:choose>
						    <c:when test='${memberVO.memType == "학생" or memberVO.memType == "교수"}'>
						      <div class="form-group" id="colCodeDiv">
						        <label for="memColCode">단과대</label>
						        <input type="text" class="form-control" id="memColCode" name="memColCode" value="${memberVO.memColCode}" required>
						      </div>
						      <div class="form-group" id="depNmDiv">
						        <label for="memDepCode">학과</label>
						        <input type="text" class="form-control" id="memDepCode" name="memDepCode" value="${memberVO.memDepCode}" required>
						      </div>
						    </c:when>
						    <c:when test='${memberVO.memType == "교직원"}'>
						      <div class="form-group" id="teamDiv">
						        <label for="memEmpDv">부서</label>
						        <input type="text" class="form-control" id="memEmpDv" name="memEmpDv" value="${memberVO.memEmpDv}" required>
						      </div>
						      <div class="form-group" id="teamDiv1">
						        <label for="memEmpSe">재직구분</label>
						        <input type="text" class="form-control" id="memEmpSe" name="memEmpSe" value="${memberVO.memEmpSe}" required>
						      </div>
						    </c:when>
						  </c:choose>
						</div>

<!--  						<div class="form-group" id="colCodeDiv"> -->
<!--                           <label for="memColCode">단과대</label> -->
<%--                           <input type="text" class="form-control" id="memColCode" name="memColCode" value="${memberVO.memColCode }" required> --%>
<!--                         </div> -->
<!--                         <div class="form-group" id="depNmDiv"> -->
<!--                           <label for="memDepCode">학과</label> -->
<%--                           <input type="text" class="form-control" id="memDepCode" name="memDepCode" value="${memberVO.memDepCode }" required> --%>
<!--                         </div> -->
<!--                         <div class="form-group" id="teamDiv"> -->
<!--                           <label for="memEmpDv">부서</label> -->
<%--                           <input type="text" class="form-control" id="memEmpDv" name="memEmpDv" value="${memberVO.memEmpDv }" required> --%>
<!--                         </div> -->
<!--                         <div class="form-group" id="teamDiv1"> -->
<!--                           <label for="memEmpSe">재직구분</label> -->
<%--                           <input type="text" class="form-control" id="memEmpSe" name="memEmpSe" value="${memberVO.memEmpSe }" required> --%>
<!--                         </div> -->

<%-- 						<p>${memberVO.memBir}</p> --%>
                        <div class="form-group">
                          <label for="inputAddress">한글명</label>
                          <input type="text" class="form-control" id="inputAddress5" name="memNm" value="${memberVO.memNm }" required>
                        </div>
                        <div class="form-group">
                          <label for="inputAddress2">생년월일</label>
                          <input type="date" class="form-control" id="inputAddress6" name="memBir" value="${memberVO.memBir }" required>
                        </div>
                        <div class="form-group">
                          <label for="inputAddress">전화번호</label>
                          <input type="text" class="form-control" id="inputAddress5" name="memTel" value="${memberVO.memTel }" required>
                        </div>
                        <div class="form-group">
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="gridCheck5">
                            <label class="form-check-label" for="gridCheck5">check</label>
                          </div>
                        </div>
						<p><sec:authentication property="principal" var=""/></p> <!-- 시큐리티 권한부여(if써서 admin에게만 보이게 하고, else로 아니다.이런식) -->       
                        <button type="button" id="update" class="btn btn-my" style="width:15%; margin : auto;">수정</button>
                        <button type="button" id="delete" class="btn btn-my" style="width:15%; margin : auto;">삭제</button>
                      </form>
                    </div> 
                    
                  </div> 
                </div> 
              </div>
	</div>
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/moment.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/simplebar.min.js"></script>
    <script src='js/daterangepicker.js'></script>
    <script src='js/jquery.stickOnScroll.js'></script>
    <script src="js/tinycolor-min.js"></script>
    <script src="js/config.js"></script>
    <script src="js/apps.js"></script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];

      function gtag()
      {
        dataLayer.push(arguments);
      }
      gtag('js', new Date());
      gtag('config', 'UA-56159088-1');
      
      
   // var memNo = null;
   // const searchParams = new URLSearchParams(location.search);

   // for (const param of searchParams) {
//        memNo = param;
   // }
   // console.log(memNo[1]);

   const $upBtn = $("#update");
   const $delBtn = $("#delete");

   const $memNo = $("input[name=memNo]");
   const $memNm = $("input[name=memNm]");
   const $memBir = $("input[name=memBir]");
   const $memTel = $("input[name=memTel]");
   
   const $memType = $("input[name=memType]");
   const $memColCode = $("#memColCode");
   const $memDepCode = $("#memDepCode");
   const $memEmpDv = $("#memEmpDv");
   const $memEmpSe = $("#memEmpSe");
   
   console.log($memNo);

   // $memNo.val(memNo[1]);
   //수정
   $upBtn.on("click", ()=>{
	//$upBtn.removeClass("btn-primary").addClass("btn-danger");
	   
   	let memberVO = {
   			memNo : $memNo.val(),
   			memNm : $memNm.val(),
   			memBir : $memBir.val(),
   			memTel : $memTel.val(),
   			memType : $memType.val()
   	}
   	
   	console.log("memType", memType);
   	
   	if($memType.val() == "학생" || $memType.val() == "교수" ){
        memberVO.memColCode = $memColCode.val();
  	 	memberVO.memDepCode = $memDepCode.val();
  	} else {
  		memberVO.memEmpDv = $memEmpDv.val();
  		memberVO.memEmpSe = $memEmpSe.val();
  	}
   	
	console.log("memberVO:", memberVO);
   	
	
   	$.ajax({
   		type : "PUT",
   		url : "/admin/memberDetail",
   		data : JSON.stringify(memberVO),
   		contentType : "application/json; charset=utf-8",
   		dataType : "text",
   		beforeSend:function(xhr){
   			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
   		},
   		success : function(rslt) {
   			console.log("rslt : " + rslt);
   			if(rslt) {
  				Swal.fire({
  					icon: "succes",
  					title: "사용자 정보 수정이 정상적으로 완료되었습니다."
					}).then((rslt) => {
      			  //getList();
   				  location.href = "/admin/member";
					})
   			}
  		},
   		error : function(xhr, status, error) {
            console.log("code :" + xhr.status);
            console.log("message :" + xhr.responseText);
            console.log("error :" + xhr.error);
   		}
   	});
   });
   
   
   //삭제
   $delBtn.on("click", ()=>{
	$delBtn.removeClass("btn-primary").addClass("btn-danger");
	   
   	console.log("확인:", $memNo.val());
   	
   	memNo = $memNo.val();
   	
   	$.ajax({
   		type: "PUT",
   		url : "/admin/memberDetail/"+ memNo,
   		dataType : "text",
   		beforeSend:function(xhr){
   			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
   		},
   		success : function(rslt) {
   			console.log("Response:", rslt);
   			if(rslt){
   				Swal.fire({
   					icon : "success",
   					title : "사용자정보가 정상적으로 삭제되었습니다."
   				}).then((rslt) => {
   		     		location.href = "/admin/member";
   				})
// 	   		        $memNo.val("");
// 	   		        $memNm.val("");
// 	   		        $memBir.val("");
// 	   		        $memTel.val("");
   					//$memNo.focus(); //커서 위치
   			} else {
   				Swal.fire({
   					icon : "false",
   					title : "사용자정보가 삭제되지 않았습니다."
   				})
   			}
   		},
        error: function (xhr, status, error) {
            console.log("code:" + xhr.status);
            console.log("message:" + xhr.responseText);
            console.log("error:" + xhr.error);
   		}
   	});
   });
   
   </script>
  </body>
