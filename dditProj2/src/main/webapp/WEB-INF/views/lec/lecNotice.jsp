<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.table thead th {
  color: var(--white-color);
  white-space: nowrap;
}
	
.row {
  align-items: flex-end;
}

</style>

<!doctype html>
<html lang="en">

<main role="main" class="main-content" style="width: 100%; margin: auto;">
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-12">
				<div class="row">
					<!-- Small table -->
					<div class="col-md-12 my-4">
						<h2 class="h4 mb-1" style="text-align:center;">강의자료실</h2><br/>
<%-- 						<p class="mb-3" style="text-align:center;">강의이름${lecNoticeVO.subNm}</p> --%>
						<div class="card shadow">
							<div class="card-body">
								<div class="toolbar">
									<form class="form">
										<div class="form-row">
											<div class="form-group col-auto mr-auto">
												<label class="my-1 mr-2 sr-only"
													for="inlineFormCustomSelectPref1">Show</label>

											</div>

										</div>
									</form>
								</div>
								<form action="/stu/" method="get" style="display: flex; justify-content: flex-end;">
								  <input type="text" class="form-control" id="search1" name="keyword" value="${param.keyword}" placeholder="제목을 입력해주세요" style="height:40px; width:300px;">
								  <div style="margin-left: 10px;">
								    <button type="submit" id="ho" class="btn btn-my" style="color:white; border-color: transparent; height:40px;">검색</button>
								  </div>
								</form><br/>
								<!-- table -->
								<table class="table datatables text-center" id="dataTable-1">
									<thead class="bg-my text-black">
										<tr>
											<th></th>
											<th>제목</th>
											<th>내용</th>
											<th>작성일자</th>
											<th></th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${lecNoticeList}" var="lecNoticeVO">
											<tr>

												<td></td>
												<td >
													<p class="mb-0 text-muted">
														<strong>${lecNoticeVO.lecnTtl}</strong>
													</p> <!--                               <small class="mb-0 text-muted">2474</small> -->
												</td>
												<td>
													<p class="mb-0 text-muted">
														<strong>${lecNoticeVO.lecnCon}</strong>
													</p>
												</td>
												<td>
													<p class="mb-0 text-muted">
 													<strong><fmt:formatDate value="${lecNoticeVO.lecnDe}" pattern="yyyy-MM-dd" /></strong>
													</p>
												</td>
												<td><a href="/path/to/your/file.pdf"
													download="my_file.pdf" class="btn btn-my">다운로드</a></td>

												<!--                             <td><button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="openModal()"> -->
												<!--                                 <span class="text-muted sr-only">Action</span> -->
												<!--                               </button> -->
												<!--                               <div class="dropdown-menu dropdown-menu-right"> -->
												<!--                                 <a class="dropdown-item" href="">첨부파일</a> -->

												</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- table -->




								
		<script src="js/apps.js"></script>
		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async
			src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
		<script>
			window.dataLayer = window.dataLayer || [];

			function gtag() {
				dataLayer.push(arguments);
			}
			gtag('js', new Date());
			gtag('config', 'UA-56159088-1');
		</script>
		</body>
</html>