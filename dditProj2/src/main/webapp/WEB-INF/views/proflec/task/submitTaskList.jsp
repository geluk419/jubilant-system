<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-lg-12 my-4">
	<div class="card shadow">
		<div class="card-body">
		<h5>강의관리 > 과제 > 제출 목록</h5>
			<div class="alert alert-light bg-light border-0 mb-0" role="alert"
				style="font-size: 0.9em; padding: 15px 30px 15px; 20 px; border: 1px solid #eee;">
				<p style="display: block; text-align: center; font-size: 1.1em;">&#8251;과제 채점 안내사항</p>
				<hr>
				<p>과제명을 클릭하여 상세 내역을 확인할 수 있습니다.</p> 
			</div>
			<h5 class="card-title mt-5">
				<i class="mdi mdi-record-circle"></i>&ensp;${lecaNm} - 과제 제출 목록
			</h5>

			<div id="listTask">
				<table class="table table-hover">
					<thead class="bg-my">
						<tr>
							<th>No.</th>
							<th>과제명</th>
							<th>작성자</th>
							<th>제출일</th>
							<th>과제 마감일</th>
							<th>점수</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="taskSubmitVO" items="${taskSubmitVOList }" varStatus="stat">
						<tr>
							<td>${stat.count}</td>
						<c:forEach var="taskVO" items="${taskVOList}" >
							<td style="display:none;">${taskVO.taskCode}</td> 
							<td style="display:none;">${taskVO.taskCon}</td> 
							<td>
							<a href="/prof/taskDetailScore?lecCode=${taskVO.lecCode}&&taskCode=${taskVO.taskCode}&&memNo=${taskSubmitVO.memNo}" style="color:#6c757d;">
							${taskVO.taskNm}
							</a>
							</td>
							<td>${taskSubmitVO.memNm}</td>
							<td>${taskSubmitVO.tsubDt}</td>
							<td>${taskVO.taskDead}</td>
							<td>${taskSubmitVO.codeTsubScore}/${taskVO.taskScore}</td>
						</c:forEach>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>