<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
.custom-file-input:lang(en) ~ .custom-file-label::after {
    content: "파일 선택";
}
</style>
		
<% 
    Date today = new Date();
    SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String simDate = simpleDate.format(today);
    System.out.println("simDate"+simDate);
%>

<c:set var="Today" value="<%= simDate %>" />		
<fmt:parseDate value="${taskVO.taskDead}" pattern="yyyy-MM-dd" var="parsedDate" />
<fmt:parseDate value="${Today}" pattern="yyyy-MM-dd" var="Today" />
<c:set var="dateComparison" value="${parsedDate.compareTo(Today)}" />
		
	<div class="col-lg-12">
		<div class="card cardBasic" style="position: relative;">
			<div class="card-body">
			<h5>강의관리 > 과제 > 제출 목록 > 상세</h5>
				<div style="min-height: 530px;">
					<div>
						<div class="col-lg-12 mt-3 mt-lg-0 boardWrapper">
						<div class="mb-5 pt-3 pl-3 pr-3 pb-1 bg-my">
							<h4 class="text-white">${lecaNm}</h4>
						</div>
								<input type="hidden" name="taskCd" id="taskCd" value="${taskVO.taskCode }" />
								<input type="hidden" name="lecCd" id="lecCd" value="${taskVO.lecCode }" />
								<input type="hidden" id="fileId" value="${taskVO.fileId}" />

								<div class="mb-3 boardTitleWrap boardT">
									<h5 class="boardTitleH">${taskVO.taskNm}</h5>
								</div>
								<div class="mb-3 boardTitleWrap boardTInput" style="display: none;padding-top: 11px;">
									<input type="text" name="taskNm" value="${taskVO.taskNm}" id="taskNm"
										class="form-control boardTitle" maxlength="50" required
										data-toggle="maxlength" data-placement="top"/>
								</div>

								<div class="boardDetail">
									<span>
										<strong>작성자&emsp;${taskSubmitVO.memNm}&emsp;</strong>
									</span>
									<span>
										&emsp;등록일&emsp;${taskSubmitVO.tsubDt}&emsp;
									</span>
									<span>
										<strong>수정일&emsp;${taskSubmitVO.tsubUpdde}</strong>
									</span>
								</div>
						</div>
					</div>
				<hr>
<!-- 학생 제출란 -->
				<form id="taskForm" method="post" action="/prof/taskScoreUpdate" enctype="multipart/form-data" >
					<input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
					<input type="hidden" name="taskCode" value="${taskVO.taskCode }" /> 
					<input type="hidden" name="lecCode"	value="${taskVO.lecCode }" /> 
					<input type="hidden" name="tsubCode" value="${taskSubmitVO.tsubCode }" /> 
					<input type="hidden" name="memNo" value="${taskSubmitVO.memNo }" />

					<div>
						<div class="alert alert-light bg-light" role="alert" style="font-size: 0.9em;">
							학생 점수 부여는 <strong>1점에서 총점까지</strong> 등록 가능합니다.
						</div>
						<table class="table mb-4" style="border-bottom: 1px solid #eef2f7;">
							<tr style="border-bottom: 1px solid #eef2f7;">
								<th style="width: 15%; background: #f8f8f8;">내용</th>
								<td style="width: 85%;">
									<div style="min-height: 150px;">
										<p>${taskSubmitVO.tsubCon}</p>
									</div>
								</td>
							</tr>
							<tr>
								<th style="width: 15%; background: #f8f8f8;">첨부파일</th>
								<td style="width: 85%;">
									<c:if test="${taskSubmitVO.fileId != null}">
										<div class="col-md-3">
											<div class="card shadow text-center mb-4 shadow-lg">
												<div class="card-body file">
													<div class="file-action">
														<button type="button"
															class="btn btn-link more-vertical p-0 text-muted mx-auto"
															onclick="download('${taskSubmitVO.fileId}')">
															<span class="fe fe-24 fe-download"></span>
														</button>
													</div>
													<div class="circle circle-lg bg-light my-4">
														<span
															class="fe
														  <c:if test="${taskSubmitVO.fileExtsn == 'application/pdf'}">fe-file</c:if>
														  <c:if test="${taskSubmitVO.fileExtsn == 'application/octet-stream'}">fe-file</c:if>
														  <c:if test="${taskSubmitVO.fileExtsn == 'image/jpeg'}">fe-image</c:if>
														  <c:if test="${taskSubmitVO.fileExtsn == 'image/png'}">fe-image</c:if>
														  fe-24 text-danger"></span>
													</div>
													<div class="file-info">
														<span class="badge badge-light text-muted mr-2">${taskSubmitVO.fileSize}</span>
														<span class="badge badge-pill badge-light text-muted">${taskSubmitVO.fileExtsn}</span>
													</div>
												</div>
												<!-- .card-body -->
												<div class="card-footer bg-transparent border-0 fname">
													<strong>${taskSubmitVO.fileOriNm}</strong>
												</div>
												<!-- .card-footer -->
											</div>
											<!-- .card -->
										</div>
									</c:if>
								</td>
							</tr>
							<tr>
								<th style="width: 15%; background: #f8f8f8;">과제 점수</th>
								<td><input type="number" name="codeTsubScore"
									id="taskScore" min="1" max="${taskVO.taskScore}"
									class="form-control col-sm-1 d-inline"
									value="${taskSubmitVO.codeTsubScore}" /> <span>&nbsp;/&nbsp;${taskVO.taskScore}</span>
								</td>
							</tr>
						</table>

						<div class="modiBtn">
							<a
								href="/prof/submitTaskList?lecCode=${taskVO.lecCode}&&taskCode=${taskVO.taskCode}"
								class="btn btn-light btn-sm goList">목록</a>
						</div>
						<div style="float: right;">
							<button type="submit" class="btn btn-my btn-sm">점수 등록</button>
						</div>
					</div>
				</form>
			</div>
			</div>
		</div>
	</div>
<!-- 학생 제출란 끝-->		
<c:if test="${not empty successMessage}">
    <c:out value="<script>
        Swal.fire({
            icon: 'success',
            title: '${successMessage}'
        });
    </script>" escapeXml="false" />
</c:if>
	
<script>
const header = '${_csrf.headerName}';
const token =  '${_csrf.token}';

let fileId = document.querySelector("#fileId").value;

let data = {"fileId":fileId};

console.log("data",data);

//다운로드
function download(fileId) {
	data = {
		fileId : fileId	
	}
	
	$.ajax({
		url:"/attach/getAttachVOList",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data),
		type:"post",
		dataType:"json",
		beforeSend: function(xhr) {
	    	xhr.setRequestHeader(header, token);
		},
		success:function(result){
			console.log("result : " + JSON.stringify(result));
			console.log("filePath : " + result[0].filePath);
			console.log("fileOriNm : " + result[0].fileOriNm);
			
			let aTag = document.createElement("a");
			aTag.href = result[0].filePath;
			aTag.download = result[0].fileOriNm;
	
			aTag.click();  // 강제 클릭
		}
	});
}

</script>


