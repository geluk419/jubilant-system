<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" ></script>
<style>
  .text-muted {
    font-size: 18px;
  }

  .wrapper main p {
    font-size: 20px;
  }
</style>
<body class="vertical  light  ">
  <div class="wrapper">
    <main role="main" class="main-content" style="width:100%; margin: 0 auto;">
      <div class="container-fluid" style="width:1600px;">
        <div class="row justify-content-center">
          <div class="col-12 col-lg-10 col-xl-8">
            <div class="row align-items-center mb-4">
              <div class="col">
                <h2 class="page-title">학과 상세</h2>
              </div>
              <div class="col-auto">
                <button type="button" id="update" class="btn btn-my">수정</button>
                <button type="button" id="delete" class="btn btn-secondary">삭제</button>
              </div>
            </div>
            <div class="card shadow">
              <div class="card-body p-5" >
                 <form action="/departmetDetail" method="post">
                <div class="row mb-5" >
                  <div class="col-12 text-center mb-4">
<!--                     <img src="/resources/master/light/assets/avatars/학사모.png" alt="..." class="card-img-top img-fluid rounded"> -->
                    <h2 class="mb-0 text-uppercase" id="depCode">${departmentVO.depCode}</h2>
                    <input type="hidden" id="depCode2"  value="${departmentVO.depCode}" >
                    <p class="text-muted" id="codeNm">${departmentVO.colCode}</p><br />
                    <p id="depNm">${departmentVO.depNm}</p>
                  </div>
                  <div class="col-md-7">
                <p class="small text-muted text-uppercase mb-2">학과 소개</p>
                <textarea id="depDc" class="form-control" style="height: 150px;">${departmentVO.depDc}</textarea>
              </div>
                  <div class="col-md-5">
                    <p class="small text-muted text-uppercase mb-2">최대 정원</p>
                    <input type="number" id="depCap" class="form-control" value="${departmentVO.depCap}">
                    <br/><br/>
                    <p class="small text-muted text-uppercase mb-2">연락처</p>
                      <input type="text" id="depTel" class="form-control" value="${departmentVO.depTel}">
                  </div>
                </div> <!-- /.row -->
                <div class="row mt-3">
              <div class="col-md-6">
                <label for="provost">학과장</label>
                <select id="provost" class="form-control">
                  <option value="${departmentVO.memNo}">${departmentVO.profNm}</option>
                  
                  <c:forEach var="provost" items="${provostList}">
                    <option value="${provost.memNo}">${provost.memNm}</option>
                  </c:forEach>
                  
                </select>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="TA">조교</label>
                  <select id="TA" class="form-control">
                    <option value="${departmentVO.memNo}">${departmentVO.empNm}</option>
                    
                    <c:forEach var="TA" items="${TAList}">
                      <option value="${TA.memNo}">${TA.memNm}</option>
                    </c:forEach>
                    
                  </select>
                </div>
              </div>
            </div>
         </form>
       </div> <!-- /.card-body -->
     </div> <!-- /.card -->
     <br/><br/>
    <div class="form-group text-center">
        <button type="button" class="btn btn-my" onclick="departmentList()" style="width: 30%;">목록 이동</button>
    </div>
   </div> <!-- /.col-12 -->
 </div> <!-- .row -->
</div> <!-- .container-fluid -->
</main> <!-- main -->
</div> <!-- .wrapper -->

<script>
$(document).ready(function(){
   
   //학과명 선택 시 값을 가져옴 시작//////////////////////////////////////
   let str = "${param.depCode}";//LSCI3
   
   console.log("str : " + str);
   
   let data = {"depCode":str};
   
   $.ajax({
        type: "post",
        url: "/admin/getProvostList",
        data: JSON.stringify(data),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        beforeSend: function (xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success: function (result) {
           //result : [{"memNo":"202309P008","depCode":null,"proPosNm":null,"proPosYN":null,"codeProStat":null,"memberVO":null},
           //{"memNo":"202309P033","depCode":null,"proPosNm":null,"proPosYN":null,"codeProStat":null,"memberVO":null}]
           console.log("ajax result : ",result);
            
           $("#provost").html("<option>${departmentVO.profNm}</option>");
        
            $.each(result,function(index,professorVO){
               console.log("memNo : " + professorVO.memNo);
               console.log("memNm : " + professorVO.memNm);
               
               $("#provost").append("<option value='"+professorVO.memNo+"'>"+professorVO.memNm+"</option>");
            });
        }
    });
   //학과명 선택 시 값을 가져옴 끝//////////////////////////////////////


   var depCode = "${param.depCode}";
   
   //학과 삭제
   $("#delete").on("click", () => {
       console.log("확인:"+depCode);
       $.ajax({
           type: "PUT",
           url: "/admin/departmentDetail/" + depCode,
           dataType: "text",
           beforeSend: function (xhr) {
               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
           },
           success : function(rslt){
 	   		  console.log("Response : " + rslt);
 	   		if(rslt) {
 	   			Swal.fire({
 	   		      icon: 'success',
 	   		      title: "학과가 정상적으로 삭제되었습니다."
 	   		    }).then((result) => {
    		    		location.href = "/admin/departmentList";	
 	   		    })
    			 	
    			} else {
    				Swal.fire("학과 삭제에 실패했습니다.");	
    			}
           
           },
           error: function (xhr, status, error) {
               console.log("code:" + xhr.status);
               console.log("message:" + xhr.responseText);
               console.log("error:" + xhr.error);
           },
       });
   });
   
   // 학과 수정
   $("#update").on("click", () => {
	   
// 	   let $depDc = $("#depDc");
// 	   let $depCap = $("#depCap");
// 	   let $depTel = $("#depTel");
// 	   let $depDrhf = $("#provost");
// 	   let $memNo = $("#TA");
	   
// 	   let departmentVO = {
// 			   depDc : $depDc.val(),
// 			   depDrhf : $depDrhf.val(),
// 			   depCap : $depCap.val(),
// 			   depTel : $depTel.val(),			   
// 			   memNo : $memNo.val()
// 	   }
	   let departmentVO = {
		        depDc: $("#depDc").val(),
		        depCap: $("#depCap").val(),
		        depTel: $("#depTel").val(),
		        depDrhf: $("#provost").val(),
		        memNo: $("#TA").val(),
		        depCode : $("#depCode2").val()
	    };
	   console.log("departmentVO:", departmentVO);
	   
	   $.ajax({
		  type : "PUT",
		  url : "/admin/departmentDetail",
		  data : JSON.stringify(departmentVO),
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
	   		      title: "학과 수정이 정상적으로 완료되었습니다."
	   		    }).then((result) => {
   		    		window.location.href = "/admin/departmentList";	
	   		    })
   			 	
   			} else {
   				Swal.fire("학과 수정에 실패했습니다.");	
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
function departmentList() {
	location.href = "/admin/departmentList";
}
</script>
</body>