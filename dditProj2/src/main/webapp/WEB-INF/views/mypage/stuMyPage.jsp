<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!-- 로그인 되어야 함 -->   
<sec:authorize access="isAuthenticated()">
<%--    <sec:authentication property="principal.memberVO" var="memberVO" /> --%>
</sec:authorize>
<style>
   #chModal {
      position: fixed;
      left:0; top:0;
      width:100%;
      height:100%;
      background-color: rgba(220, 220, 220, 0.7);
      z-index: 1000;
      display:none;
   }
   #chCont {
      margin: 50px auto;
      width:50%;
      height:70%;
      background-color: black;
      color:white;
   }
   
   /* 모달 스타일 */
	.modal {
	   display: none;
	   position: fixed;
	   left: 0;
	   top: 0;
	   width: 100%;
	   height: 100%;
	   background-color: rgba(0, 0, 0, 0.5); /* 배경 투명도 설정 */
	   z-index: 1000;
	   justify-content: center;
	   align-items: center;
	}
	
	.modal-dialog {
	   max-width: 400px;
	}
	
	.modal-content {
	   border-radius: 10px;
	}
	
	.modal-header {
	   border-radius: 10px 10px 0 0;
	}
	
	.modal-title {
	   font-weight: bold;
	}
	
	.modal-body {
	   padding: 20px;
	}
	
	.modal-footer {
	   border-top: none;
	   border-radius: 0 0 10px 10px;
	}
	
	/* 모달 닫기 버튼 스타일 */
	.close {
	   color: #fff;
	   font-size: 24px;
	}
	
	/* 입력 필드 스타일 */
	.form-group {
	   margin-bottom: 20px;
	}
	
	/* 확인 버튼 스타일 */
	.btn-primary {
	   background-color: #B61A53;
	   color: #fff;
	}
	
	.btn-secondary {
	   background-color: #6c757d;
	   color: #fff;
	}
</style>
<div id="chModal" class="modal">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title">비밀번호 확인</h4>
            <button type="button" class="close" onclick="chModalCls()">
               <span>&times;</span>
            </button>
         </div>
         <div class="modal-body">
            <div class="form-group">
               <h6>비밀번호</h6>
               <input type="password" id="chPass" class="form-control">
               <br/>
               <p>현재 비밀번호를 입력해주세요.</p>
            </div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-secondary" onclick="chModalCls()">닫기</button>
            <button type="button" class="btn btn-my" onclick="chPassCheck()">확인</button>
         </div>
      </div>
   </div>
</div>

<main role="main" class="main-content mx-auto">
   <div class="container-fluid">
      <div class="row justify-content-center">
         <div class="col-12 col-lg-10 col-xl-8">
            <h2 class="h3 mb-4 page-title">My Page</h2>
            <hr class="my-4">
            <div class="my-4">
               <form>
                  <div class="row mt-5 align-items-center">
                     <div class="col-md-3 text-center mb-5">
						<div class="avatar avatar-xl">
						   <img id="profile-image" src="${memberVO.memPic}" alt="Profile Image" width="200" height="200">
						</div>
						<br/>
                        <div class="form-group">
						   <input type="file" id="memPic" name="memPic">
						</div>
                     </div>
                     
                     <div class="col">
                        <div class="row align-items-center">
                           <div class="col-md-7">
                              <h4 class="mb-1">${memberVO.memNm}</h4>
                              <h6 class="mb-1">${memberVO.memNo}</h6>
                              <p class="small mb-3">
                                 <span class="badge badge-dark">Korea</span>
                              </p>
                           </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col-md-7">
                                <p class="text-muted"><em><br><br>“당신의 미래, 취업딱대학교에서 시작하세요.”</em></p>
                            </div>
                            <div class="col">
                                <p></p>
                                <p></p>
                                <p class="small mb-0 text-muted"></p>
                            </div>
                        </div>
                     </div>
                  </div>
                  
                  <hr class="my-4">
                  
                  <div class="form-row">
                     <div class="form-group col-md-6">
                        <label for="memNm">한글 이름</label> 
                        <input type="text" id="memNm" class="form-control" value="${memberVO.memNm}">
                     </div>
                     
                     
                     <div class="form-group col-md-6">
                        <label for="memNme">영문 이름</label> 
                        <input type="text" id="memNme" class="form-control" value="${memberVO.memNme}">
                     </div>
                     
                     
<!--                      <div class="form-group col-md-6"> -->
<!--                         <label for="status">학적 상태</label>  -->
<%--                         <input type="text" id="status" class="form-control" value="${stuMyPageVO.codeNm}" disabled> --%>
<!--                      </div> -->
                     
                     
                     <div class="form-group col-md-6">
                        <label for="stuYr">학년</label> 
                        <input type="text" id="stuYr" class="form-control" value="${gradeInfo.stuYr}" disabled>
                     </div>
                     
                     
                     <div class="form-group col-md-6">
                         <label for="codeNm">단과대학</label> 
                         <input type="text" id="codeNm" class="form-control" value="${college.codeNm}" disabled>
                     </div>
                     
                     
                     <div class="form-group col-md-6">
                        <label for="memNo">학번</label> 
                        <input type="text" id="memNo" class="form-control" value="${memberVO.memNo}" disabled>
                     </div>
                     
                     
                     <div class="form-group col-md-6">
                        <label for="depNm">학과</label> 
                        <input type="text" id="department" class="form-control" value="${department.depNm}" disabled>
                     </div>
                     
                     
                     <div class="form-group col-md-6">
                        <label for="stuSem">재학학기</label> 
                        <input type="text" id="stuSem" class="form-control" value="${gradeInfo.stuSem}" disabled>
                     </div>
                     
                     <div class="form-group col-md-6">
                        <label for="memMl">Email</label> 
                        <input type="email" id="memMl" class="form-control" value="${memberVO.memMl}">
                     </div>
                     
                     
                     <div class="form-group col-md-6">
                        <label for="memTel">휴대전화</label> 
                        <input type="text" id="memTel" class="form-control" value="${memberVO.memTel}">
                     </div>
                  </div>

                  <div class="form-group">
                     <div class="row">
                        <div class="col-md-6">
                           <label for="inputAddress">주소</label>
                           <div class="input-group">
                              <input type="text" class="form-control" id="memZip" value="${memberVO.memZip}" readonly>
                              <div class="input-group-append">
                                 <button type="button" id="btnPostNum" class="btn btn-outline-secondary bg-my text-white">우편번호검색</button>
                              </div>
                           </div>
                        </div>
                     </div>
                     <br /> 
                     
                     <input type="text" class="form-control" name="memberVO.memAddr1" id="memAddr1" value="${memberVO.memAddr1}" /><br /> 
                     <input type="text" class="form-control" name="memberVO.memAddr2" id="memAddr2" value="${memberVO.memAddr2}" /><br />
                  </div>
   
                  <div class="form-row">
                     <div class="form-group col-md-6">
                        <label for="bankList">은행</label> 
                        <select id="bankList" class="form-control">
                           <option value="${memberVO.memBankCode}">${memberVO.codeNm}</option>
                           <c:forEach var="bankList" items="${bankList}">
                              <option value="${bankList.codeId}">${bankList.codeNm}</option>
                           </c:forEach>
                        </select>
                     </div>
                     <div class="form-group col-md-4">
                        <label for="memAccount">계좌번호</label> 
                        <input type="text" class="form-control" id="memAccount" value="${memberVO.memAccount}">
                     </div>
                     <div class="form-group col-md-2">
                        <label for="memDepo">예금주명</label> 
                        <input type="text" class="form-control" id="memDepo" value="${memberVO.memDepo}">
                     </div>
                  </div>

                  <hr class="my-4">

                  <h4>기숙사 정보 </h4>
                  <div class="form-row">
                     <div class="form-group col-md-6">
                        <label for="korean">기숙사명</label> 
                        <input type="text" id="dorNmCode" class="form-control" value="${dormitoryApplyFormVO.dorNmCode}" disabled>
                     </div>
                     
                     <div class="form-group col-md-6">
                        <label for="english">생활학기</label> 
                        <input type="text" id="lifePeriod" class="form-control" value="${dormitoryApplyFormVO.lifePeriod}" disabled>
                     </div>
                     
                     <div class="form-group col-md-6">
                        <label for="english">호수</label> 
                        <input type="text" id="dorNo" class="form-control" value="${dormitoryApplyFormVO.dorNo}" disabled>
                     </div>
                     
                     <div class="form-group col-md-6">
                        <label for="english">납부여부</label> 
                        <input type="text" id="status" class="form-control" value="승인" disabled>
                     </div>
                     
                     <div class="form-group col-md-6">
                        <label for="english">긴급 연락처</label> 
                        <input type="text" id="memTel2" class="form-control" value="${dormitoryApplyFormVO.memTel2}" disabled>
                     </div>
                     
                  </div>
                  <div class="form-group text-center">
                      <button type="button" class="btn btn-outline-secondary bg-my text-white" id="update" style="width: 30%;">등록</button>
                  </div>
               </form>
            </div>
            <!-- /.card-body -->
         </div>
         <!-- /.col-12 -->
      </div>
      <!-- .row -->
   </div>
   <!-- .container-fluid -->
</main>
<!-- main -->
</div>
<!-- .wrapper -->
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
<script type="text/javascript" src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
window.dataLayer = window.dataLayer || [];

function gtag() {
   dataLayer.push(arguments);
}
gtag('js', new Date());
gtag('config', 'UA-56159088-1');

$(function() {
	const $tempFile = $("#memPic")
	
    //파일업로드
   $tempFile.on("change",function(){
      var formData = new FormData();
      formData.append("file",$tempFile[0].files[0])
      console.log("나의 파일 : ",$tempFile[0].files[0])
      
      $.ajax({
         url:"/stu/tempUpload",
         type:"post",
         data:formData,
            contentType:false,  //defult값이 application/x-www-form-urlencoded
            processData:false,  //defult값이 application/x-www-form-urlencoded
            cache:false,        //요건 선택 권장!
            dataType:"text",
            beforeSend:function(xhr){
               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
           },
           success : function(result){
//               if(result!=null || result !=""){
//                  alert("직인등록 성공");
//               }
           },
            error:function(xhr, status, error){
                console.log("code: " + xhr.status)
                console.log("message: " + xhr.responseText)
                console.log("error: " + error);
            }
      });
   });
   
	
	
   $("#btnPostNum").on("click", function() {
      new daum.Postcode({
         //다음 창에서 검색이 완료되면 콜백함수에 의해 결과 데이터가 data 객체로 들어옴
         oncomplete : function(data) {
            $("input[name=\"memberVO.memZip\"]").val(
                  data.zonecode);
            $("input[name=\"memberVO.memAddr1\"]").val(
                  data.address);
            $("input[name=\"memberVO.memAddr2\"]").val(
                  data.buildingName);

         }
      }).open();
   });
   
   //기숙사 정보
   $.ajax({
      url:"/stu/dormitory",
      contentType:"application/json;charset:utf-8",
      type:"post",
      dataType:"json",
      beforeSend: function(xhr) {
            xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
        },
      success:function(result){
         console.log("result:",result);

         $("#dorNmCode").val(result.dorNmCode);
         $("#lifePeriod").val(result.lifePeriod);
         $("#dorNo").val(result.dorNo);
         $("#memTel2").val(result.memTel2);
         
         var selectedBank = $("#bankList").val();
            if (selectedBank === "038") {
                $("#otherBankField").css("display", "block");
            } else {
                $("#otherBankField").css("display", "none");
            }
         
      }
   });
});
</script>
<script>

   const chModal = document.querySelector("#chModal");
   const chPass = document.querySelector("#chPass");
   let isPassCheck = false;  // 비밀번호 확인 안했음 초기값, 전역변수
   function chPassCheck(){
      if(!chPass.value.trim()){
         alert("현재 비밀번호를 입력 바랍니다.");
         chPass.focus(); // 커서 주깅!
         return;   // 끝
      }

      // 요기성 암호체킁 아작승
      $.ajax({
         type:"post",
         url:"/stu/mypass",
         contentType:"application/json",
         data:chPass.value,
         dataType:"text",
         beforeSend:function(xhr){
               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
         }, 
         success:function(rslt){
            console.log("체킁:",rslt);
            if(rslt=="OK"){
               alert("비밀번호가 일치합니다. 정보 수정을 완료 해주세요.");
               isPassCheck = true;
               chModal.style.display="none";
            }else {
               alert("비밀번호가 일치하지 않습니다. 재입력 바랍니다.");
               chPass.value="";  // 클리어 해주공!
               chPass.focus();
            }
         },
         error:function(xhr){
            console.log("에러지롱",xhr.status);
         }
      })
   }

   function chModalCls(){
      chModal.style.display="none";
   }

$(function() {
   // 마이페이지 수정
   $("#update").on("click", () => {

//          alert("채현짜앙!");
      if(!isPassCheck){
         chModal.style.display="block";
         return;
      } 
   

      /*
      let memberVO = {
    		memPic: $("#memPic").val(),
         memNm: $("#memNm").val(),
         memNme: $("#memNme").val(),
         memMl: $("#memMl").val(),
         memTel: $("#memTel").val(),
         memZip: $("#memZip").val(),
         memAddr1: $("#memAddr1").val(),
         memAddr2: $("#memAddr2").val(),
         memBankCode: $("#bankList").val(),
         memAccount: $("#memAccount").val(),
         memDepo: $("#memDepo").val()
      };
      console.log("memberVO 수정 : ", memberVO);
      */
      
      // 아작스로 파일보내려면 무저건 FormData  multipart/form-data

      let formData = new FormData();
      //formData.append("memPic",$("#memPic").val());
      formData.append("memNm",$("#memNm").val());
      formData.append("memNme",$("#memNme").val());
      formData.append("memMl",$("#memMl").val());
      formData.append("memTel",$("#memTel").val());
      formData.append("memZip",$("#memZip").val());
      formData.append("memAddr1",$("#memAddr1").val());
      formData.append("memAddr2",$("#memAddr2").val());
      formData.append("memBankCode",$("#bankList").val());
      formData.append("memAccount",$("#memAccount").val());
      formData.append("memDepo",$("#memDepo").val());
      formData.append("uploadFile",$("#memPic")[0].files[0]);  // 파일업로드를 위해서는 이름이 아닌 실제 파일을 담아야 함!

      console.log("formData",formData);

      $.ajax({
         type :"PUT",
         url : "/stu/mypage",
         data : formData,
        // contentType : "application/json; charset=utf-8",
         contentType:false,
         processData:false,
         cache:false,
         dataType : "text",
         beforeSend:function(xhr){
               xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
         }, 
         success : function(rslt){
            console.log("rslt : " , rslt);
            if(rslt){
               Swal.fire({
                  icon: 'success',
                  title: "개인정보 수정이 완료되었습니다."
               }).then((result) => {
                  location.href = "/stu/mypage";
               })
            }else {
                  Swal.fire("개인정보 수정에 실패했습니다.")
               }
            },
            error : function(xhr, status, error) {
               console.log("code :" + xhr.status);
               console.log("message :" + xhr.responseText);
               console.log("error :" + xhr.error);
            }
            
      });
      
   });
   
});
</script>
<script>
const memPic = document.getElementById('memPic');
const profileImage = document.getElementById('profile-image');

memPic.addEventListener('change', function() {
   const file = memPic.files[0]; 
   if (file) {
      const reader = new FileReader();

      reader.onload = function(e) {
         profileImage.src = e.target.result;
      };

      reader.readAsDataURL(file);
   }
});

</script>
