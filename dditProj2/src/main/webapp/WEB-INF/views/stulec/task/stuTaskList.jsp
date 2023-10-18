<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.bg-123 {
	background-color: var(- -my-color);
}
</style>

<div class="col-lg-12 my-4">
	<div class="card shadow">
		<div class="card-body">
		<h5>강의관리 > 과제</h5>
			<div class="alert alert-light bg-light border-0 mb-0" role="alert"
				style="font-size: 0.9em; padding: 15px 30px 15px; 20 px; border: 1px solid #eee;">
				<p style="display: block; text-align: center; font-size: 1.1em;">&#8251;과제 안내 사항</p>
				<hr>
				<p>(1) 과제에 대한 <strong>제출 기간</strong>을 잘 확인하여 불이익이 없도록 합니다.</p>
				<p>(2) 담당교수 채점 후 과제에 대한 점수를 확인할 수 있습니다.</p>
			</div>
			<h5 class="card-title mt-5">
				<i class="mdi mdi-record-circle"></i>&ensp;${lecaNm} - 과제 목록
			</h5>

			<div id="listTask">
				<table class="table table-hover">
					<thead class="bg-my">
						<tr>
							<th>No.</th>
							<th>과제명</th>
							<th>과제 등록일</th>
							<th>과제 마감일</th>
							<th>제출 여부</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="taskVO" items="${taskVOList}" varStatus="stat">
						<tr>
							<td>${stat.count}</td>
							<td style="display:none;">${taskVO.taskCode}</td> 
							<td style="display:none;">${taskVO.taskCon}</td> 
							<td>
								<c:forEach var="taskSubmitVO" items="${taskSubmitVOList }">
									<c:if test="${taskVO.taskCode == taskSubmitVO.taskCode}">
									<c:set var="flag" value="1" />
										<a href="/stu/taskDetailComplete?lecCode=${taskVO.lecCode}&&taskCode=${taskVO.taskCode}&&memNo=${taskSubmitVO.memNo}" style="color:#6c757d;">
										${taskVO.taskNm}
										</a>
									</c:if>
								</c:forEach>
									<c:if test="${flag != 1 }">
									<a href="/stu/taskDetail?lecCode=${taskVO.lecCode}&&taskCode=${taskVO.taskCode}" style="color:#6c757d;">
										${taskVO.taskNm}
									</a>
									</c:if>
							</td>
							<td>${taskVO.taskDe}</td>
							<td>${taskVO.taskDead}</td>
							<td>
								<c:forEach var="taskSubmitVO" items="${taskSubmitVOList }">
									<c:if test="${taskVO.taskCode == taskSubmitVO.taskCode}">
										제출 완료
									</c:if>
								</c:forEach>
								<c:if test="${flag != 1 }">
									<strong>미제출</strong>
								</c:if>
							</td>
						</tr>
						<c:set var="flag" value="0" />
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

