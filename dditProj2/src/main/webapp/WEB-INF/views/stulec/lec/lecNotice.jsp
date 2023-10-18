<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.table thead th {
  white-space: nowrap;
}
	
.row {
  align-items: flex-end;
}


</style>

<!doctype html>
<html lang="en">

<main role="main" class="main-content mx-auto w-100" >
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-12">
				<div class="row">
					<!-- Small table -->
					<div class="col-md-12 my-4">
						<h2 class="h4 mb-1" style="text-align:center;">강의자료실</h2><br/>
 						<p class="mb-3" style="text-align:center;">경제학개론</p>
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
								<form method="get" style="display: flex; justify-content: flex-end;">
									<div class="mr-2">
									<select name="searchCondition" class="form-control px-2">
										<option value="t" ${'t' eq param.searchCondition ? 'selected' : '' }>제목</option>
										<option value="c" ${'c' eq param.searchCondition ? 'selected' : '' }>내용</option>
										<option value="tc" ${'tc' eq param.searchCondition ? 'selected' : '' }>제목+내용</option>
									</select>
									</div>
									
								
								  <input type="text" class="form-control px-2" id="searchWord" name="searchWord" value="${param.searchWord}" placeholder="" style="height:35px; width:300px;">
								  <div style="margin-left: 10px;">
								    <button type="submit" id="ho" class="btn btn-my" style="color:white; border-color: transparent; height:35px;">검색</button>
								  </div>
								  <input type="hidden" name="lecCode" value="${lecCode }">
								</form><br/>
								<!-- table -->
								<table class="table datatables text-center" id="dataTable-1">
									<thead class="bg-my text-white" style="text-align:center;">
										<tr>
											<th></th>
											<th style="text-align:left;">제목</th>
											<th style="text-align:left;">내용</th>
											<th >작성일자</th>
											<th></th>
										</tr>
									</thead>

									<tbody id="sTbody">
										<script>
											var sTbody = document.querySelector("#sTbody");
										</script>
									<!--   -->
										<c:forEach items="${lecNoticeList}" var="lecNoticeVO" varStatus="status">										
											<tr id="syrTr${status.count}">

												<td></td>
												<td style="text-align:left;">
													<p class="mb-0 text-muted">
														<strong>${lecNoticeVO.lecnTtl}</strong>
													</p> <!--                               <small class="mb-0 text-muted">2474</small> -->
												</td>
												<td style="text-align:left;">
													<p class="mb-0 text-muted">
														💾<strong>${lecNoticeVO.lecnCon}</strong>
													</p>
												</td>
												<td>
													<p class="mb-0 text-muted">
 													<strong><fmt:formatDate value="${lecNoticeVO.lecnDe}" pattern="yyyy-MM-dd" /></strong>
													</p>
												</td>
												<td id="syerin${status.count}">
													<button type="button" class="btn btn-my" onclick="fDownload('${lecNoticeVO.filePath}')">다운</button>
											    </td>
											</tr>
											<c:if test="${ status.index != 0 && (lecNoticeList[status.index].lecnTtl == lecNoticeList[status.index-1].lecnTtl) }">
												<script>
													// 
													$(function(){
														let tr = document.querySelector("#syrTr${status.count}");
														if(tr){
															sTbody.removeChild(tr); // tr없애기
														}

														let td = document.querySelector("#syerin${status.count-1}");
														if(td){
															let btnHtml  = `<button type="button" class="btn btn-my" onclick="fDownload('${lecNoticeVO.filePath}')">다운</button>`;
															td.innerHTML += btnHtml;
														}		
													});
												</script>
											</c:if>																						
										</c:forEach>
									</tbody>
								</table>
								<!-- table -->
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</main>



								

		
		<script type="text/javascript">
		function fDownload(fPath){
			console.log("체킁:",fPath);
			let fileNm =  fPath.substring(fPath.lastIndexOf("/")+1);
			console.log("체킁2:",fileNm);

			let aTag = document.createElement("a");
			aTag.href = fPath;
			aTag.download = fileNm;

			aTag.click();  // 강제 클릭


			
		}
		</script>
		</body>
</html>