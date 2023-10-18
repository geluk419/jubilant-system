<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<main role="main" class="main-content" style="width: 85%; margin: auto;">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-10 col-xl-8">
                <h2 class="h3 mb-4 page-title">과목 등록</h2>
                <hr class="my-4">
                <div class="my-4">
                    <form>
                        <div class="form-row">
                        	<div class="form-group col-md-6">
                                <label for="colCode">단과대 선택</label> 
                                <select id="colCode" class="form-control">
                                    <option>단과대 선택</option>
                                    <c:forEach var="colCode" items="${colList}">
                                        <option value="${colCode.codeId}">${colCode.codeNm}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        
                            <div class="form-group col-md-6">
                                <label for="depCode">학과명</label>
                                <select id="depCode" name="depCode" class="form-control">
									<option>단과대학을 선택해주세요</option>
                                </select>
                            </div>
                            
                            <div class="form-group col-md-6">
                                <label for="subCode">과목 코드</label> 
                                <input type="text" id="subCode" class="form-control">
                            </div>
                            
                            <div class="form-group col-md-6">
                                <label for="subNm">과목 이름</label> 
                                <input type="text" id="subNm" class="form-control" placeholder="ex) 회계학이론">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="subYr">과목 신설연도</label> 
                                <input type="text" id="subYr" class="form-control" placeholder="ex) 2023">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="subSeCode">과목 구분</label> 
                                <select id="subSeCode" class="form-control">
                                    <option>과목 구분 선택</option>
                                    <c:forEach var="subCodeItem" items="${subSeCode}">
                                        <option value="${subCodeItem.codeNm}">${subCodeItem.codeNm}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        
                        
                        <hr class="my-4">
                        <div class="text-center">
                            <button type="button" id="regBtn" class="btn btn-outline-secondary bg-my text-white" style="font-size: 1.0rem; width: 200px;">등록</button>
                        </div>
                    </form>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.col-12 -->
        </div>
        <!-- .row -->
    </div>
</main>
<!-- main -->
</div>
<!-- .wrapper -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
<script type="text/javascript" src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
$("#colCode").on("change", function() {
    let str = $(this).val(); // 선택한 단과대의 코드

    console.log("str : " + str);
    
    $("#colCode").val(str);
    
    let data = {"colCode":str};
    
    $.ajax({
        type: "get",
        url: "/admin/getDepartmentList/" + str, 
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function(result) {
        	console.log("ajax result : ",result);
        	
        	$("#depCode").html("<option>선택해주세요</option>");
        	
        	$.each(result, function(index, departmentVO){
        		console.log("depNm : " + departmentVO.depNm);
        		console.log("depCode : " + departmentVO.depCode);
        		
        		$("#depCode").append("<option value='"+departmentVO.depCode+"'>"+departmentVO.depNm+"</option>");
        	});

        },
        error: function() {
            alert('서버에서 데이터를 가져오지 못했습니다.');
        }
    });
});
//강혁 ㅎ
$('#depCode').on('change',function(){
	let depCode = $('#depCode').val();
	let subCode = $('#subCode')
	subCode.val(depCode);
	
});

// 과목 등록
$("#regBtn").on("click", () => {
	let subjectVO = {
			subCode : $("#subCode").val(),
			depCode : $("#depCode").val(),
			subNm : $("#subNm").val(),
			subYr : $("#subYr").val(),
			subSeCode : $("#subSeCode").val()
	};
	console.log("체킁:", subjectVO);
	
	$.ajax({
		type: "post",
		url : "/admin/subjectInsert",
		data : JSON.stringify(subjectVO),
		contentType: "application/json;charset=utf-8",
        dataType: "text",
        beforeSend: function (xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success: function (result) {
            console.log("ch result: " , result);
            if (result == "success") {
            	Swal.fire({
                    icon: 'success',
                    title: "과목 등록이 정상적으로 완료되었습니다."
                 }).then((result) => {
                    location.href = "/admin/subjectList";
                 })
            } else {
                alert("과목 등록에 실패했습니다.");
            }
        },
        error: function (xhr, status, error) {
            console.log("code:" + xhr.status);
            console.log("message: " + xhr.responseText);
            console.log("error:" + error);
            alert("과목 등록 중 오류가 발생했습니다.");
        }
	});
});
</script>