<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

		<main class="col-md-12">
				<div class="col-md-12">
                  <div class="card shadow mb-4">
                  	<h2 class="h4 mb-1 text-center" style="margin-top:3%; font-size:35px;">공지사항 상세 </h2>
<%--                   	<p>${noticeVO }</p> --%>
					
<!-- 	                <form action="/noticeDetail" method="post" > -->
	                <form name="formData" id="formData" >
	                	<input type="hidden" id="ntcCode" value="${noticeVO.ntcCode}" />
	                    <div class="card-body">
	                    
		                    <div class="w-100">
		                    
		                        <div class="form-row">
		                        <sec:csrfInput/>
		                          <div class="form-group col-md-4" id="ntcSeCodeList">
		                            <label for="ntcSeCode">공지사항 구분</label>
		                            <input type="text" class="form-control"  value="${noticeVO.ntcSeName }" disabled>
 		                            <input type="hidden" class="form-control" name="ntcSeCode" id="ntcSeCode" value="${noticeVO.ntcSeCode }" >
		                          </div>
		                          <div class="form-group col-md-4">
		                            <label for="ntcDt">작성일</label>
		                             <input type="date" class="form-control" id="ntcDt" name="ntcDt" value="<fmt:formatDate value='${noticeVO.ntcDt}' pattern='yyyy-MM-dd' />" disabled>
		                          </div>
		                          <div class="form-group col-md-4">
		                            <label for="memNm">작성자</label>
		                            <input type="text" class="form-control" id="memNm" name="memNm" value="${noticeVO.memNm }" disabled>
		                          </div>
		                        </div>
		                        
		                        <div class="form-row">
		                          <div class="form-group col-md-6 d-none">
		                            <label for="memNo">교번</label>
		                            <input type="hidden" class="form-control" id="memNo" name="memNo" value="${noticeVO.memNo }">
		                          </div>
		                          
		                        </div>
		                        
		                        <div class="form-group">
		                          <label for="ntcTtl">제목</label>
		                          <input type="text" class="form-control" id="ntcTtl" name="ntcTtl" value="${noticeVO.ntcTtl }">
		                        </div>
	                        
							</div>
							
							<div class="form-group">
	                          <label for="ntcCon">내용</label>
	                          <textarea id="ntcCon" name="ntcCon" rows="3" cols="50" class="form-control">${noticeVO.ntcCon }</textarea>
	                        </div>

					        <c:if test="${noticeVO.filePath != null }">						        
					        <div class="form-group" >
 					        	<label for="fileId">첨부 파일</label>
 					            <a kjFile href='${noticeVO.filePath}' download="${noticeVO.filePath.split("/")[2]}" >${noticeVO.fileOriNm}</a>
								<p><input type="file" id="noticeFiles" name="noticeFiles" multiple /></p>
					        </div>
					        </c:if>
					        <c:if test="${noticeVO.filePath == null }">						        
					        <div class="form-group" >
								<p><input type="file" id="noticeFiles" name="noticeFiles" multiple /></p>
					        </div>
					        </c:if>
					        
					        <div id="divFileId">
					        
					        </div>
					    
	                        <div class="text-center">
	                        	<button type="button" id="update" class="btn btn-my" style="width : 80px; height : 40px; font-size:16px;">수정</button>
	                        	<button type="button" id="delete" class="btn btn-my" style="width : 80px; height : 40px; font-size:16px;">삭제</button>
	                      	</div>
                   		 </div>
                      </form>
                  </div> <!-- "card shadow mb-4" -->
                </div> <!-- class="col-md-12" -->
				<input type="hidden" id="csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</main>

<script type="text/javascript">
	CKEDITOR.replace("ntcCon");
	
	//서버에서 발행된 헤더네임과 토큰값 저장
	const header = '${_csrf.headerName}';
	const token =  '${_csrf.token}';
	
	const $upBtn = $("#update");
	const $delBtn = $("#delete");
	
	// 수정 버튼 클릭 이벤트 핸들러
	$upBtn.on("click", () => {
	    const $ntcTtl = $("#ntcTtl").val();

	    // 제목이 50글자를 초과하는지 확인
	    if ($ntcTtl.length > 50) {
	        Swal.fire({
	            icon: "error",
	            title: "제목이 너무 깁니다. 50글자 이하로 입력해주세요."
	        });
	    } else {
	        // 50글자 이하인 경우에만 수정 요청을 보냄
	        const $ntcCode = $("#ntcCode").val();
	        const $ntcUpdde = $("#ntcUpdde").val();
	        const $ntcSeCode = $("#ntcSeCode").val();
	        const $ntcDt = $("#ntcDt").val();
	        const $memNo = $("#memNo").val();
	        const $memNm = $("#memNm").val();
	        const $ntcTtl = $("#ntcTtl").val();
	        const $ntcCon = CKEDITOR.instances.ntcCon.getData(); // CKEditor 내용 가져오기
	        const $fileId = $("#noticeFiles")[0].files;

	        console.log("formData", $ntcUpdde, $ntcSeCode, $ntcDt, $memNo, $memNm, $ntcTtl, $ntcCon, $fileId);

	        const formData = new FormData();

	        formData.append("ntcCode", $ntcCode);
	        formData.append("ntcUpdde", $ntcUpdde);
	        formData.append("ntcSeCode", $ntcSeCode);
	        formData.append("ntcDt", $ntcDt);
	        formData.append("memNo", $memNo);
	        formData.append("memNm", $memNm);
	        formData.append("ntcTtl", $ntcTtl);
	        // CKEditor 내용 설정
	        formData.append("ntcCon", $ntcCon);
	        formData.append("fileId", '${noticeVO.fileId}');

	        for (let i = 0; i < $fileId.length; i++) {
	            formData.append("noticeFiles", $fileId[i]);
	        }

	        console.log("formData", formData);

	        $.ajax({
	            type: "post",
	            url: "/admin/noticeDetail",
	            data: formData,
	            processData: false,
	            contentType: false,
	            dataType: "text",
	            beforeSend: function (xhr) {
	                xhr.setRequestHeader(header, token);
	            },
	            success: function (data) {
	                if (data === "success") {
	                    Swal.fire({
	                        icon: "success",
	                        title: "공지가 정상적으로 수정되었습니다."
	                    }).then((rslt) => {
	                        location.href = "/admin/notice";
	                    });
	                } else {
	                    Swal.fire({
	                        icon: "error",
	                        title: "공지를 수정하는 중 문제가 생겼습니다."
	                    });
	                }
	            },
	            error: function (xhr, status, error) {
	                console.log("code: " + xhr.status);
	                console.log("message: " + xhr.responseText);
	                console.log("error: " + error);
	            }
	        });
	    }
	});

	
	//삭제
	$delBtn.on("click", ()=>{
		const $fileId = $("[kjFile]")[0];
		const $ntcCode = $("#ntcCode").val();
		
		console.log("fileId",$fileId);
		console.log("ntcCode",$ntcCode);
		
		let url = "/admin/memberDetail/member/" + $ntcCode;
		if ($fileId) {
			url = "/admin/memberDetail/notice/" + '${noticeVO.fileId}';
		}
		console.log("url:",url);
		
		$.ajax({
			type : "PUT",
			url : url,
			dataType : "text",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            success : function (data) {
                if (data == "success") {
                	Swal.fire({
      					icon: "success",
      					title: "공지가 정상적으로 삭제되었습니다."
                	}).then((rslt) => {
                		location.href = "/admin/notice";
                	})
                } else {
               		Swal.fire({
        				icon : "error",
        				title : "공지를 삭제하는 중 문제가 생겼습니다."
        			});
                }
            },
            error: function (xhr, status, error) {
                console.log("code: " + xhr.status);
                console.log("message: " + xhr.responseText);
                console.log("error: " + error);
            }
			
		});
	});
	
	
</script>
