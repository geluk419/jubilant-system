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
            <h2 class="h3 mb-4 page-title">사생 상세</h2>
            <hr class="my-4">
            <div class="my-4">
               <form>
                  <div class="form-row">
                     <div class="form-group col-md-6">
                        <label for="memNm">한글 이름</label> 
                        <input type="text" id="memNm" class="form-control" value="${dormiVO.memNm}" disabled>
                     </div>
                     
                     <div class="form-group col-md-6">
                        <label for="memNme">영문 이름</label> 
                        <input type="text" id="memNme" class="form-control" value="${dormiVO.memNme}" disabled>
                     </div>
                     
                     <div class="form-group col-md-6">
                        <label for="memNo">학번</label> 
                        <input type="text" id="memNo" class="form-control" value="${dormiVO.memNo}" disabled>
                     </div>
                     
                     <div class="form-group col-md-6">
                        <label for="depNm">학과</label> 
                        <input type="text" id="department" class="form-control" value="${dormiVO.depNm}" disabled>
                     </div>
                     
                     <div class="form-group col-md-6">
                        <label for="memTel">연락처</label> 
                        <input type="text" id="memTel" class="form-control" value="${dormiVO.memTel}" disabled>
                     </div>
                     
                     <div class="form-group col-md-6">
                        <label for="memTel">비상 연락처</label> 
                        <input type="text" id="memTel2" class="form-control" value="${dormiVO.memTel2}" disabled>
                     </div>
                     
                     <div class="form-group col-md-6">
                         <label for="codeNm">기숙사명</label> 
                         <input type="text" id="codeNm" class="form-control" value="${dormiVO.dorNmCode}" disabled>
                     </div>
                     
                     <div class="form-group col-md-6">
                        <label for="stuYr">호수</label> 
                        <input type="text" id="stuYr" class="form-control" value="${dormiVO.dorNo}" disabled>
                     </div>
                     
                     <div class="form-group col-md-6">
                        <label for="stuSem">성별</label> 
                        <input type="text" id="stuSem" class="form-control" value="${dormiVO.doraGender}" disabled>
                     </div>
                     
                     <div class="form-group col-md-6">
                        <label for="memMl">기숙사 생활 기간</label> 
                        <input type="email" id="memMl" class="form-control" value="${dormiVO.lifePeriod}" disabled>
                     </div>
                     
                     <div class="form-group col-md-6">
                        <label for="rewards">상점</label> 
                        <input type="text" id="rewards" class="form-control" value="${dormiVO.dormRewards}" disabled>
                     </div>
                     
                     <div class="form-group col-md-6">
                        <label for="penalties">벌점</label> 
                        <input type="text" id="penalties" class="form-control" value="${dormiVO.dormPenalties}" disabled>
                     </div>
                  </div>

                  <div class="form-group">
                     <div class="row">
                        <div class="col-md-6">
                           <label for="inputAddress">주소</label>
                           <div class="input-group">
                              <input type="text" class="form-control" id="memZip" value="${dormiVO.memZip}" disabled>
                           </div>
                        </div>
                     </div>
                     <br /> 
                     
                     <input type="text" class="form-control" name="memberVO.memAddr1" id="memAddr1" value="${dormiVO.memAddr1}" disabled/><br /> 
                     <input type="text" class="form-control" name="memberVO.memAddr2" id="memAddr2" value="${dormiVO.memAddr2}" disabled/><br />
                  </div>
   
                  <div class="form-row">
                     <div class="form-group col-md-6">
                        <label for="bank">은행</label> 
                        	<input type="text" class="form-control" id="bank" value="${memberVO.codeNm}" disabled>
                     </div>
                     <div class="form-group col-md-4">
                        <label for="memAccount">계좌번호</label> 
                        <input type="text" class="form-control" id="memAccount" value="${dormiVO.memAccount}" disabled>
                     </div>
                     <div class="form-group col-md-2">
                        <label for="memDepo">예금주명</label> 
                        <input type="text" class="form-control" id="memDepo" value="${dormiVO.memDepo}" disabled>
                     </div>
                  </div>

                  <hr class="my-4">

                  <h4>상벌점 부여
                  &nbsp;<button type="button" class="btn btn-outline-secondary bg-my text-white" style="width:10%;" id="giveScore">점수 부여</button>
                  &nbsp;<button type="button" class="btn btn-info style="width:10%;" id="autoBtn">자동 입력</button>
                  </h4>
                  <div class="form-row">
                     <div class="form-group col-md-6">
                        <label for="dormAwards">상점</label> 
                        <input type="number" id="dormAwards" class="form-control" value="" placeholder="상점을 입력해주세요.">
                     </div>
                     
                     <div class="form-group col-md-6">
                        <label for="dormPenalties">벌점</label> 
                        <input type="number" id="dormPenalties" class="form-control" value="" placeholder="벌점을 입력해주세요.">
                     </div>
                     
                     <div class="form-group col-md-6">
                        <label for="dormSleDe">발생일자</label> 
                        <input type="date" id="dormSleDe" class="form-control" value="">
                     </div>
                     
                     <div class="form-group col-md-6">
					     <label for="status">사유</label> 
					     <textarea id="status" class="form-control" rows="5" cols="60"></textarea>
					 </div>
                  </div>
                  <div class="form-group text-center">
                      <button type="button" class="btn btn-outline-secondary bg-my text-white" id="back" style="width: 30%;" onclick="dormiList()">목록 이동</button>
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
<script>
window.dataLayer = window.dataLayer || [];

function gtag() {
   dataLayer.push(arguments);
}
gtag('js', new Date());
gtag('config', 'UA-56159088-1');
</script>
<script>
function dormiList() {
	location.href = "/admin/dormitoryAdminList";
}
</script>
<script>
$(document).ready(function(){
	
	let str = "${param.memNo}";
	
	console.log("str : " + str);
	
	let data = {"memNo":str};
	
	var memNo = "${param.memNo}";
	
	$("#giveScore").click(function(){
      //상점 부여 안 되었을 때
      let pride = $("#dormAwards").val(); 
		if(!pride){
         pride = 0;
      }

      //벌점 부여 안 되었을 때
      let punish = $("#dormPenalties").val();
		if(!punish){
         punish = 0;
      }

		let dormitoryApplyFormVO = {
				memNo : "${param.memNo}",
				dormRewards: pride,
				dormPenalties: punish
		};
		console.log("dormitoryApplyFormVO:", dormitoryApplyFormVO);
		
		$.ajax({
			type : "PUT",
			url : "/admin/dormitoryAdminDetail",
			data : JSON.stringify(dormitoryApplyFormVO),
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
	  	   		      title: "상벌점 부여가 정상적으로 완료되었습니다."
	  	   		    }).then((result) => {
	     		    		location.href = "/admin/dormitoryAdminList";	
	  	   		    })
	   	    	} else {
	   	    		Swal.fire("상벌점 부여에 실패했습니다.");	
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


$("#autoBtn").click(function(){
	$("#dormPenalties").val("3");
	$("#dormSleDe").val("2023-10-17");
	$("#status").val("음주 및 고성방가");
})

</script>