<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
.btn-primary {
    color: #ffffff;
    background-color: #153579;
    border-color: #1b68ff;
}
</style>

  <body class="vertical light">
<%--     <p>경진 디버깅용${collList}</p> --%>
    <div class="wrapper" style="width : 60%; margin : auto;">
		<div class="row align-items-center mb-4">
			<div class="col">
			<h1 style="margin-top:3%;">사용자 등록</h1>
			</div>
<!-- 			<div class="col-auto"> -->
<!-- 			</div> -->
		</div>
		<div class="row">
                <div class="col-md-12">
                  <div class="card shadow mb-4">
                    <div class="card-header">
                      <strong class="card-title">사용자 정보</strong>
                    </div>
                    <div class="card-body">
                      <form action="/memberRegister" method="post">
                      <sec:csrfInput/>
                     	<div class="form-group">
                          <label for="memType">사용자 구분</label>
                          <div>
							  <input type="radio" name="memType" id="student" value="학생" onclick="fdivision(this)" style="margin-right:5px;">학생
							  <input type="radio" name="memType" id="professor" value="교수" onclick="fdivision(this)" style="margin-right:5px; margin-left:15px;">교수
							  <input type="radio" name="memType" id="employee" value="교직원" onclick="fdivision(this)" style="margin-right:5px; margin-left:15px;">교직원
                          </div>
                        </div>
                        <div class="form-group">
                          <label for="inputAddress">사용자 번호</label>
                          <input type="text" class="form-control" id="memNo" name="memNo" value="" placeholder="학번/교번" required>
                        </div>
                        <div class="form-group" id="colCodeDiv">
                          <label for="memColCode">단과대</label>
                          <select id="memColCode" class="form-control" onchange="fColCodeChg(this)">
                          <option value="-1">단과대를 선택하세요</option>
           					<c:forEach items="${collList}" var="coll">
           					       <option value="${coll.codeId }">${coll.codeNm }</option>
           					</c:forEach>
                          </select>
                        </div>
                        <div class="form-group" id="depNmDiv">
                          <label for="memDepCode">학과</label>
                          <select id="memDepCode" class="form-control">                     
                          </select>
                        </div>
                        <div class="form-group" id="teamDiv">
                          <label for="memEmpDv">부서</label>
                          <select id="memEmpDv" class="form-control">
                            <option value="-1">부서를 선택하세요</option>
                          	<c:forEach items="${codeList2}" var="code">
	                          	<option value="${code.codeNm }">${code.codeNm }</option>
                          	</c:forEach>
                          </select>
                        </div>
                        <div class="form-group" id="teamDiv1">
                          <label for="memEmpSe">재직구분</label>
                          <select id="memEmpSe" class="form-control">
                            <option value="-1">재직구분을 선택하세요</option>
                            <c:forEach items="${codeList3}" var="codeD">
	                          	<option value="${codeD.codeNm }">${codeD.codeNm }</option>
                          	</c:forEach>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="inputAddress">한글명</label>
                          <input type="text" class="form-control" id="memNm" name="memNm" value="" placeholder="홍길동" required>
                        </div>
                        <div class="form-group">
                          <label for="inputAddress2">생년월일</label>
                          <input type="date" class="form-control" id="memBir" name="memBir" value="" placeholder="19990611" required>
                        </div>
                        <div class="form-group">
                          <label for="inputAddress">전화번호</label>
                          <input type="text" class="form-control" id="memTel" name="memTel" value="" placeholder="010-1234-1234" required>
                        </div>
                        <div class="form-group">
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="gridCheck5">
                            <label class="form-check-label" for="gridCheck5">check</label>
                          </div>
                        </div>
<!--                         <button type="button" id="autoBtn" class="btn btn-my" style="width:15%; margin : auto;">자동 입력</button> -->
                        <button type="button" id="register" class="btn btn-my" style="width:15%; margin : auto;">등록</button>
                        <button type="button" id="autoBtn"  class="btn btn-my" style="width:15%; margin : auto;">자동 입력</button>
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
      
      const $regBtn = $("#register");

      const $memNo = $("input[name=memNo]");
      const $memNm = $("input[name=memNm]");
      const $memBir = $("input[name=memBir]");
      const $memTel = $("input[name=memTel]");
      
      const $memType = $("input[name=memType]");
      const $memColCode = $("#memColCode");
      const $memDepCode = $("#memDepCode");
	  const $memEmpDv = $("#memEmpDv");
	  const $memEmpSe = $("#memEmpSe");

      function fColCodeChg(pThis){
        if(pThis.value != -1){
          $.ajax({
            type:"get",
            url:`/admin/codeIdList/\${pThis.value}`,
            dataType: "json",
            success: function(rslt){
              console.log("체킁R:",rslt);

              $memDepCode.empty();
              $memDepCode.append('<option value="-1" selected>학과를 선택하세요</option>'); 
              $.each(rslt, (inx,opt) => {
                console.log("체킁",opt);
                console.log(opt.codeDetailId,opt.codeDetailNm);
                console.log("ppp",$memDepCode);   
                $memDepCode.append($("<option></option>").val(opt.codeDetailId).html(opt.codeDetailNm));
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

      //등록
      $regBtn.on("click",()=>{
// 	const register = document.querySelector("#register");
//     //form 전송 직전에 발생하는 이벤트
//     register.addEventListener("submit", fAjax);
//     function fAjax(){
        $regBtn.removeClass("btn-primary").addClass("btn-danger");
    	  
        let memType = $("input[name=memType]:checked").val();

      	let memberVO = {
      			memNo : $memNo.val(),       // 공통 사용자번호
      			memNm : $memNm.val(),       // 공통 이름
      			memBir : $memBir.val(),     // 공통 생년월일
      			memTel : $memTel.val(),     // 공통 전화번호
      			memType : memType,          // 사용자구분
      	}

        // 공통 아닌거
        if(memType == "학생" || memType == "교수" ){
              memberVO.memColCode = $memColCode.val();
        	  memberVO.memDepCode = $memDepCode.val();
        } else {
  	  		  memberVO.memEmpDv = $memEmpDv.val();
  	  		  memberVO.memEmpSe = $memEmpSe.val();
        }


      	//memberVO: {memNo: '1', memNm: '2', memBir: '3', memTel: '4', memType : '학생'}
      	console.log("memberVO:" + JSON.stringify(memberVO));
      	
        
      	$.ajax({
      		type : "post",
      		url : "/admin/memberRegister",
      		data : JSON.stringify(memberVO),
      		contentType : "application/json;charset=utf-8",
      		dataType : "text",
      		beforeSend:function(xhr){
      			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
      		},
      		success : function(rslt) {
      			//rslt : success
      			console.log("rslt : " + rslt);
      			if(rslt) {
      				Swal.fire({
      					icon: "success",
      					title: "사용자 등록이 정상적으로 완료되었습니다."
   					}).then((rslt) => {
	      			  //getList();
       				  location.href = "/admin/member";
   					})
      			} else {
            		Swal.fire({
       					icon : "false",
       					title : "사용자 등록을 하는 중 문제가 생겼습니다."
       				})
      			}
      		},
      		error : function(xhr, status, error) {
      			console.log("code:" + xhr.status);
      			console.log("message: " + xhr.responseText);
      			console.log("error:" + error);
      		}
      	});
    
      });
      
      
      function fdivision(obj) {
    	  var selectedValue = obj.value;
      
          //alert(selectedValue)
    	  if(selectedValue ==='학생' || selectedValue ==='교수') {
          //alert("체킁1");
    		  $('#colCodeDiv').css('display', 'block');
    		  $('#depNmDiv').css('display', 'block');
    		  $('#teamDiv').css('display', 'none');
    		  $('#teamDiv1').css('display', 'none');
    	  } else if(selectedValue === '교직원') {
          // alert("체킁2");
    		  $('#colCodeDiv').css('display', 'none');
    		  $('#depNmDiv').css('display', 'none');
    		  $('#teamDiv').css('display', 'block');
    		  $('#teamDiv1').css('display', 'block');
    	  }
        autoGetMemNo(selectedValue);
      }

      function autoGetMemNo(mType){
        $.ajax({
           type:"get",
           url:"/admin/memberChoose",
           data:`memberType=\${mType}`,
           dataType:"text",    // json이라 쓰면 JSON.parse(돌아온값)
           success:function(rslt){
              console.log("체킁:", rslt);
              $memNo.val(rslt);
          },
          error : function(xhr, status, error) {
      			console.log("code:" + xhr.status);
      			console.log("message: " + xhr.responseText);
      			console.log("error:" + error);
      		}
        })


      }
      
      $("#autoBtn").click(function () {
    	  $("#memNm").val("이설이");
    	  $("#memBir").val("1990-06-01");
    	  $("#memTel").val("010-4767-8637");
      });
    </script>
</body>
