<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<style>
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
<main role="main" class="main-content mx-auto">
   <div class="container-fluid">
      <div class="row justify-content-center">
         <div class="col-12 col-lg-10 col-xl-8">
            <h2 class="h3 mb-4 page-title">학생 상세</h2>
            <hr class="my-4">
            <div class="my-4">
               <form>
                  <div class="row mt-5 align-items-center">
                     <div class="col-md-3 text-center mb-5">
						<div class="avatar avatar-xl">
						   <img id="profile-image" src="${studentVO.memPic}" alt="Profile Image" width="200" height="200">
						</div>
                     </div>
                     
                     <div class="col">
                        <div class="row align-items-center">
                           <div class="col-md-7">
                              <h4 class="mb-1">${studentVO.memNm}</h4>
                              <h6 class="mb-1">${studentVO.memNo}</h6>
                           </div>
                        </div>
                     </div>
                  </div>
                  
                  <hr class="my-4">
                  
                  <div class="form-row">
                     <div class="form-group col-md-6">
                        <label for="memNm">한글 이름</label> 
                        <input type="text" id="memNm" class="form-control" value="${studentVO.memNm}" disabled>
                     </div>
                     
                     
                     <div class="form-group col-md-6">
                        <label for="memNme">영문 이름</label> 
                        <input type="text" id="memNme" class="form-control" value="${studentVO.memNme}" disabled>
                     </div>
                     
                     
<!--                      <div class="form-group col-md-6"> -->
<!--                         <label for="status">학적 상태</label>  -->
<%--                         <input type="text" id="status" class="form-control" value="${stuMyPageVO.codeNm}" disabled> --%>
<!--                      </div> -->
                     
                     
                     <div class="form-group col-md-6">
                        <label for="stuYr">학년</label> 
                        <input type="text" id="stuYr" class="form-control" value="${studentVO.stuYr}" disabled>
                     </div>
                     
                     
                     <div class="form-group col-md-6">
                         <label for="codeNm">단과대학</label> 
                         <input type="text" id="codeNm" class="form-control" value="${college.codeNm}" disabled>
                     </div>
                     
                     
                     <div class="form-group col-md-6">
                        <label for="memNo">학번</label> 
                        <input type="text" id="memNo" class="form-control" value="${studentVO.memNo}" disabled>
                     </div>
                     
                     
                     <div class="form-group col-md-6">
                        <label for="depNm">학과</label> 
                        <input type="text" id="department" class="form-control" value="${department.depNm}" disabled>
                     </div>
                     
                     
                     <div class="form-group col-md-6">
                        <label for="stuSem">재학학기</label> 
                        <input type="text" id="stuSem" class="form-control" value="${studentVO.stuSem}" disabled>
                     </div>
                     
                     <div class="form-group col-md-6">
                        <label for="memMl">Email</label> 
                        <input type="email" id="memMl" class="form-control" value="${studentVO.memMl}" disabled>
                     </div>
                     
                     
                     <div class="form-group col-md-6">
                        <label for="memTel">휴대전화</label> 
                        <input type="text" id="memTel" class="form-control" value="${studentVO.memTel}" disabled>
                     </div>
                  </div>

                  <div class="form-group">
                     <div class="row">
                        <div class="col-md-6">
                           <label for="inputAddress">주소</label>
                           <div class="input-group">
                              <input type="text" class="form-control" id="memZip" value="${studentVO.memZip}" disabled>
                           </div>
                        </div>
                     </div>
                     <br /> 
                     
                     <input type="text" class="form-control" name="memberVO.memAddr1" id="memAddr1" value="${studentVO.memAddr1}" disabled /><br /> 
                     <input type="text" class="form-control" name="memberVO.memAddr2" id="memAddr2" value="${studentVO.memAddr2}" disabled/><br />
                  </div>
   
                  <div class="form-row">
                     <div class="form-group col-md-6">
                        <label for="bank">은행</label> 
                        	<input type="text" class="form-control" id="bank" value="${memberVO.codeNm}" disabled>
                     </div>
                     <div class="form-group col-md-4">
                        <label for="memAccount">계좌번호</label> 
                        <input type="text" class="form-control" id="memAccount" value="${memberVO.memAccount}" disabled>
                     </div>
                     <div class="form-group col-md-2">
                        <label for="memDepo">예금주명</label> 
                        <input type="text" class="form-control" id="memDepo" value="${studentVO.memDepo}" disabled>
                     </div>
                  </div>

                  <hr class="my-4">

                  <div class="form-group text-center">
                      <button type="button" class="btn btn-outline-secondary bg-my text-white" onclick="stuList()" style="width: 30%;">목록 이동</button>
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
<script>
function stuList() {
	location.href = "/admin/stuList";
}

</script>