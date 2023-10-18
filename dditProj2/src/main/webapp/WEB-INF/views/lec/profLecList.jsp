<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

              <div class="col-lg-12 my-4">
              <div class="row align-items-center my-4">
                <div class="col">
                  <h2 class="h3 mb-0 page-title">강의 목록</h2>
                </div>
              </div>

                    <div class="card-footer">
                     <table class="table table-hover">
					<thead class="bg-my">
						<tr>
							<th>No.</th>
							<th>강의명</th>
							<th>년도</th>
							<th>학기</th>
							<th>개설학년</th>
							<th>개강여부</th>
<!-- 							<th>삭제여부</th> -->
						</tr>
					</thead>
					<tbody>
<c:forEach var="lecNoticeVO" items="${lecNoticeVOList}" varStatus="stat">
							<tr>
								<td>${stat.count}</td>
								<td><a href="/prof/lecNotice?lecCode=${lecNoticeVO.lecCode}" style="color:#6c757d;">${lecNoticeVO.lecaNm}</a></td>
								<td>${lecNoticeVO.lecaYr}</td>
								<td>${lecNoticeVO.lecaSem}</td>
								<td>${lecNoticeVO.lecaTrg}</td>
								<td>${lecNoticeVO.lecStatYn}</td>
<%-- 								<td>${lecNoticeVO.lecDelYn}</td> --%>
							</tr>
</c:forEach>
					</tbody>
				</table>
                    </div> <!-- /.card-footer -->
                <div class="col-md-9">
                </div> <!-- .col -->
              </div> <!-- .col-lg-12 my-4 -->
              


