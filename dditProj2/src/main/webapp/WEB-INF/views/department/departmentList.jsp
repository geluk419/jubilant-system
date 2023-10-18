<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<style>
	img.img-fluid {
		width: 150px;
	}
</style>
<script>
$(document).ready(function() {
    $.ajax({
    	url : "/admin/getList",
    	type: "GET",     
    	dataType : "JSON",
    	success : function(result){
    		console.log(result);

    		let txt ="";
//     		txt += "<div class='card-deck row'>";
    		for(let i = 0; i<result.length; i++){
    			
    			console.log("학과 확인" + result.length);
    			console.log(result[i].depNm);
    			txt += `
    			    <div class='card shadow text-center col-3 mb-4'>
    			        <img src="/resources/master/light/assets/avatars/학사모2.png" class="card-img-top img-fluid mx-auto rounded">
    			        <div class='card-body' style='margin-top: -10px;'>
    			        	<h4 class='h4 card-title mb-1'>\${result[i].colCode}</h4>
    			            <h6 class='h6 card-title mb-1'>\${result[i].depNm}</h6>
    			            <p class="card-text">
    			                <button class="btn btn-my" type="button" onclick="openDepartmentDetail('\${result[i].depCode}')">상세 보기</button>
    			            </p>
    			        </div>
    			    </div>
    			`;

    		}
   			$('#kanghyuk').html(txt);
    	}
    })
    
 	// 버튼 클릭 이벤트 처리
    $("#departmentBtn").click(function () {
        // "/admin/department" URL로 이동
        window.location.href = "/admin/department";
    });
});

function openDepartmentDetail(depCode) {
	  
	  // 상세 페이지로 이동
	  location.href = "/admin/departmentDetail?depCode="+depCode;
}

</script>


<div class="container-fluid">
 <div class="row justify-content-center">
   <div class="col-12 col-lg-10">
     <div class="row align-items-center my-4">
       <div class="col">
         <h2 class="page-title">학과 조회</h2>
       </div>
	   <select id="codeId" class="form-control" style="margin-right: 10px; height:40px; width:150px;" onchange="selectCodeId(this)">
		   <option value="">단과대 선택</option>
           <c:forEach var="colCode" items="${colList}">
               <option value="${colCode.codeId}">${colCode.codeNm}</option>
           </c:forEach>
	   </select>
       <form action="/admin/departmentList" method="get" style="display: flex; align-items: center;">
	       <input type="text" class="form-control" id="search1" name="keyword" value="${param.keyword}" placeholder="학과명을 입력해주세요." style="margin-right: 10px; height:40px; width:300px;">
	       <button type="button"  id="ho" class="btn btn-primary bg-my text-white" style="color:white; border-color: transparent; height:40px;">검색</button>
       </form>
       <div class="col-auto">
         <button type="button" class="btn btn-my my-2" id="departmentBtn">학과 등록</button>
       </div>
     </div>
     
   	 <div id="kanghyuk" class="row">
   	 </div> 

     </div> 
   </div>
 </div> <!-- .row -->

<script>
 window.dataLayer = window.dataLayer || [];

 function gtag()
 {
   dataLayer.push(arguments);
 }
 gtag('js', new Date());
 gtag('config', 'UA-56159088-1');
</script>
<script>
$("#ho").click(function () {
	let selectOption = $("#codeId");
	selectOption.val("");
	
    let searchValue = $("#search1").val();
	console.log(searchValue);
    $.ajax({
        url: "/admin/getList",
        type: "GET",
        data: { keyword: searchValue },
        dataType: "json", 
        success: function (result) {
            console.log(result);
			console.log(result[0].depNm)
            let txt = "";
            for (let i = 0; i < result.length; i++) {
                txt += `
                	<div class='card shadow text-center col-3 mb-4'>
                	<img src="/resources/master/light/assets/avatars/학사모2.png" class="card-img-top img-fluid mx-auto rounded">
			        <div class='card-body' style='margin-top: -10px;'>
			        	<h4 class='h4 card-title mb-1'>\${result[i].colCode}</h4>
			            <h6 class='h6 card-title mb-1'>\${result[i].depNm}</h6>
			            <p class="card-text">
			                <button class="btn btn-my" type="button" onclick="openDepartmentDetail('\${result[i].depCode}')">상세 보기</button>
			            </p>
                    </div>
                    </div>
                `;

            }
            txt += "</div>";
			console.log("첵첵",txt);
            $('#kanghyuk').html(txt);
        },
        error: function (error) {
            console.error("검색 실패:", error);
        }
    });
});
</script>
<script>
function selectCodeId(selectElement) {
    var selectedValue = selectElement.value;
    console.log("선택 단과대 체킁: " + selectedValue);
    $.ajax({
        url: "/admin/selectCodeNm",
        type: "GET",
        data: {selectedValue:selectedValue},
        dataType: "json",
        success: function (result) {
            console.log("제발 확인 : ",result);
            console.log(result[0].depNm)
            let txt = "";
            for (let i = 0; i < result.length; i++) {
                txt += `
                    <div class='card shadow text-center col-3 mb-4'>
                    <img src="/resources/master/light/assets/avatars/학사모2.png" class="card-img-top img-fluid mx-auto rounded">
                    <div class='card-body' style='margin-top: -10px;'>
                        <h4 class='h4 card-title mb-1'>\${result[i].colCode}</h4>
                        <h6 class='h6 card-title mb-1'>\${result[i].depNm}</h6>
                        <p class="card-text">
                            <button class="btn btn-my" type="button" onclick="openDepartmentDetail('\${result[i].depCode}')">상세 보기</button>
                        </p>
                    </div>
                    </div>
                `;
            }
            txt += "</div>";
            console.log("체크체크", txt);
            
            $('#kanghyuk').html(txt);
        },
        error: function (error) {
            console.error("단과대 선택 실패:", error);
        }
    });
}

</script>
</body>