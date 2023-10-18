<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" ></script>

<style>
#table-content {
    max-height: 600px;
    overflow-y: auto;
    margin-bottom: 100px;
}
.alert-danger {
    color: #000000;
    background-color: #f1e4e5;
    border-color: #f1e4e5;
}
</style>
<!-- <main role="main" class="main-content"> -->
<!--    <div class="container-fluid"> -->
   
	<div class="container-fluid" style="margin-top:20px;">
      <div class="row justify-content-center">
        <div class="col-12">
          <h2 class="my-2 page-title text-center">장학생 관리</h2>

          <h4 class="mt-4 page-title text-center text-my" style="margin-bottom: 20px;">장학금 지급 내역 조회</h4>

			<hr/>
			
			<form onsubmit="return fsubmit(this)">
			<div class="input-group mb-3 col-9 justify-content-end" style="margin-top:30px;">
          	<!-- 장학금 select는 임시로 넣어둔 것 -->
          	<div class="mr-2" style="width:17%;">
          		<label for=sclName class="d-none"></label>
	          	<select id="sclName" name="sclName" class="form-control px-2">
	          		<option value="-1">성적장학금</option>
		            <option value="수석장학금">수석장학금</option>
		            <option value="우수장학금">우수장학금</option>
		            <option value="격려장학금">격려장학금</option>
	          	</select>
          	</div>
          
          	<div class="mr-2" style="width:17%;">
          		<label for=sclYr class="d-none"></label>
	          	<select id="sclYr" name="sclYr" class="form-control px-2">
	          		<option value="-1">연도</option>
<%-- 	          		<c:forEach items="${sclYr}" var="yr"> --%>
<%-- 	          			<option value="${yr.sclYr }">${yr.sclYr }</option> --%>
<%-- 	          		</c:forEach> --%>
		            <option value="2023">2023</option>
		            <option value="2022">2022</option>
		            <option value="2021">2021</option>
		            <option value="2020">2020</option>
	          	</select>
          	</div>
          	
          	<div class="mr-4" style="width:17%;">
          		<label for="sclSemCode" class="d-none"></label>
	          	<select id="sclSemCode" name="sclSemCode" class="form-control px-2">
	          		<option value="-1">학기</option>
<%-- 	          		<c:forEach items="${sclSemCode}" var="sem"> --%>
<%-- 	          			<option value="${sem.sclSemCode }">${sem.sclSemCode }</option> --%>
<%-- 	          		</c:forEach> --%>
		            <option value="1">1</option>
		            <option value="2">2</option>
	          	</select>
          	</div>
          	
          	<div class="mr-4">
          		<button class="btn btn-my" type="submit" id="selectBtn" style="width:70px; height:33px;">검색</button>
        	</div>
          </div>
          </form>
			
			<div id="table-content">
              <table class="table datatables text-center" id="dataTable-1">
                  <thead class="bg-secondary-light">
                      <tr>
                          <th>No.</th>
                          <th>연도</th>
                          <th>학기</th>
                          <th>학번</th>
                          <th>이름</th>
                          <th>장학금명</th>
                          <th>장학금(원)</th>
                      </tr>
                  </thead>
                    <tbody>
                    	<c:choose>
	        				<c:when test="${not empty scholarList}">
		                    	<c:forEach items="${scholarList}" var="ScholarshipVO" varStatus="stat">
			          				<tr style="margin-top: 10px;" class ="
						                          	<c:if test='${index.count%2==0}'>even</c:if>
						                          	<c:if test='${index.count%2==1}'>odd</c:if>
						            ">
			          					<td class="schCode">${stat.count+(data.currentPage*10)}</td>
			          					<td>${ScholarshipVO.sclYr}</td>
			          					<td>${ScholarshipVO.sclSemCode}</td>
			          					<td>${ScholarshipVO.memNo}</td>
			          					<td>${ScholarshipVO.memNm}</td>
			          					<td>${ScholarshipVO.sclName}</td>
			          					<td><fmt:formatNumber value="${ScholarshipVO.sclLpay/1}" type="number" pattern="#,###,###"/></td>
			          				</tr>
		          				</c:forEach>
	          				</c:when>
		        			<c:otherwise>
	                          	<tr class="odd">
	                          		<td colspan="7" style="text.align:center;">데이터가 없습니다.</td>
	                          	</tr>
	                    	</c:otherwise>
    					</c:choose>
          			</tbody>
          		</table>
          	</div>

        </div> <!-- .col-12 -->
      </div> <!-- .row -->
    </div> <!-- .container-fluid -->
<!--   </div> -->
<!-- </main> -->

<script>
function fsubmit(pThis) {
	if(pThis.sclName.value == "-1"){
		alert("장학금 종류를 선택해주세요");
		pThis.sclName.focus();
		return false;
	}

	if(pThis.sclYr.value == "-1"){
		alert("연도를 선택해주세요");
		pThis.sclYr.focus();
		return false;

	}

	if(pThis.sclSemCode.value == "-1"){
		alert("학기를 선택해주세요");
		pThis.sclSemCode.focus();
		return false;
	}

	// 제대로 다 선택했으면 전송!
	return true;
}


</script>