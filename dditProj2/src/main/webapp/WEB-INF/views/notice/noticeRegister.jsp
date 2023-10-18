<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

		<main class="col-md-12">
				<div class="col-md-12">
                  <div class="card shadow mb-4">
                  	<h2 class="h4 mb-1 text-center" style="margin-top:3%; font-size:35px;">공지사항 등록</h2>
					
<%-- 					<form action="/admin/noticeRegister?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data" name="formData" id="formData"> --%>
	                <form name="formData" id="formData">
	                    <div class="card-body">
	                        <div class="form-row">
	                          
	                          <div class="form-group col-md-6" id="ntcSeCodeList">
	                            <label for="ntcSeCode">공지사항 구분</label>
	                            <select id="ntcSeCode" name="ntcSeCode" class="form-control">
	                              <option value="-1">공지사항 구분을 선택해주세요</option>
	                              <c:forEach items="${noticeSelect}" var="sel">
	                              	<option value="${sel.codeId}">${sel.codeNm}</option>
	                              </c:forEach>
	                            </select>
	                          </div>
	                          
	                          <div class="form-group col-md-6">
	                            <label for="ntcDt">작성일</label>
	                            <input type="date" class="form-control" id="ntcDt" name="ntcDt">
	                          </div>
	                        </div>
	                        
	                        <div class="form-row">
	                          <div class="form-group col-md-6">
	                            <label for="memNo">교번</label>
	                            <input type="text" class="form-control" id="memNo" name="memNo" placeholder="" disabled>
	                          </div>
	                          <div class="form-group col-md-6">
	                            <label for="memNm">작성자</label>
	                            <input type="text" class="form-control" id="memNm" name="memNm" placeholder="" disabled>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label for="ntcTtl">제목</label>
	                          <input type="text" class="form-control" id="ntcTtl" name="ntcTtl" placeholder="제목을 입력하세요.">
	                        </div>
							
							<div class="form-group">
	                          <label for="ntcCon">내용</label>
	                          <textarea id="ntcCon" name="ntcCon" rows="3" cols="50" class="form-control" placeholder="내용을 입력하세요."></textarea>
	                        </div>
							
							<div class="form-group">
								<p><input type="file" id="noticeFiles" name="noticeFiles" multiple /></p>
							</div>		
							
	                        <div class="text-center">
	                        	<button type="button" id="register" class="btn btn-my" style="width : 95px; height : 35px; font-size:16px;">등록</button>
	                        	<button type="button" id="autoBtn" class="btn btn-my" style="width : 95px; height : 35px; font-size:16px;">자동 입력</button>
	                      	</div>
                   		 </div>
                   		 <sec:csrfInput/>
                      </form>
                  </div> <!-- "card shadow mb-4" -->
                </div> <!-- class="col-md-12" -->
				<input type="hidden" id="csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</main>
		
<script type="text/javascript">
	CKEDITOR.replace('ntcCon');
	
	//서버에서 발행된 헤더네임과 토큰값 저장
	const header = '${_csrf.headerName}';
	const token =  '${_csrf.token}';
	
	const $regBtn = $("#register");
	
	//등록
	$regBtn.on("click", () => {
        // form 데이터 수집
        const $ntcSeCode = $("#ntcSeCode").val();
        const $ntcDt = $("#ntcDt").val();
        const $memNo = $("#memNo").val();
        const $memNm = $("#memNm").val();
        const $ntcTtl = $("#ntcTtl").val();
        const $ntcCon = CKEDITOR.instances.ntcCon.getData();
        const $fileId = $("#noticeFiles")[0].files;

        console.log("formData", $ntcSeCode, $ntcDt, $memNo, $memNm, $ntcTtl, $ntcCon, $fileId);

        // FormData 객체 생성
        const formData = new FormData();

        // FormData에 데이터 추가
        //달러("샵formData") => <form></form> 안의 모든 것
        formData.append("ntcSeCode", $ntcSeCode);
        formData.append("ntcDt", $ntcDt);
        formData.append("memNo", $memNo);
        formData.append("memNm", $memNm);
        formData.append("ntcTtl", $ntcTtl);
        formData.append("ntcCon", $ntcCon);

        // 파일들을 FormData에 추가
        for (let i = 0; i < $fileId.length; i++) {
            formData.append("noticeFiles", $fileId[i]);
        }

        console.log("formData", formData);
        
        $.ajax({
            type: "POST",
            url: "/admin/noticeRegister",
            data: formData,
            processData: false,
            contentType: false,
            dataType: "text",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
                if (data == "success") {
                	Swal.fire({
      					icon: "success",
      					title: "새 공지가 정상적으로 등록되었습니다."
                	}).then((rslt) => {
                		location.href = "/admin/notice";
                	});
                } else {
               		Swal.fire({
        				icon : "error",
        				title : "새 공지를 등록하는 중 문제가 생겼습니다."
        			})
                }
            },
            error: function (xhr, status, error) {
                console.log("code: " + xhr.status);
                console.log("message: " + xhr.responseText);
                console.log("error: " + error);
            }
        });
        return false;
    });
	
	$(function () {
        const currentDate = new Date().toISOString().split('T')[0];
        $("#ntcDt").val(currentDate);
        $("#ntcDt").prop("disabled", true);
    });
	
// 	CKEDITOR.config.allowedContent = true;
	
	$("#autoBtn").click(function () {
		$("#memNo").val("201803E006");
		$("#memNm").val("서예린");
		$("#ntcTtl").val("취업딱대학교의 [컴퓨터공학전공] 행정(학사)조교 모집 공고");
		var newContent = `
			<p>안녕하세요. 컴퓨터공학전공에서 아래와 같이 행정(학사)조교를 모집하오니 많은 추천과 홍보 부탁드립니다.</p>
			<p>- 아 래 -</p>
			<p>1. 모집부서 및 인원 : 컴퓨터공학전공 행정(학사)조교 1명</p>
			<p>2. 계약기간 : 2023년 09월 01일 ~ 2025년 09월 01일 (1년 연장가능)</p>
			<p>3. 지원 자격 : 4년제 대학 학사학위 이상 소지자 (2023년 8월 졸업예정자 포함)</p>
			<p>4. 제출서류 :  1) 이력서 1부 (자유 양식, 사진 포함) 2) 자기소개서 1부 (자유 양식) 3) 주민등록등본 1부 4) 졸업증명서 또는 졸업예정증명서 1부</p>
			<p>5. 접수기간 : 2023.07.01 ~ 2023.08.20 15:00까지</p>
			<p>6. 접수방법 : 방문 접수 (취업딱대학교 계의돈기념관 4층 컴퓨터공학전공 사무실 060418호실) / 이메일접수 (yu9894@cinu.kr) 택 1</p>
			`;
			
		CKEDITOR.instances['ntcCon'].setData(newContent);
	})
</script>
