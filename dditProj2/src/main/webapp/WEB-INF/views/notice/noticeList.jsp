<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

<style>
.table thead th {
    color: #ffffff;
}
.bg-secondary-light {
    background: #868e96;
}
</style>

<main style="margin : 0 auto; width : 90%;">
              <div class="row">
                <!-- Small table -->
                <div class="col-md-12 my-4">
                  <h2 class="h4 mb-1 text-center" style="font-size:35px;">공지사항</h2>
                  <hr/>
                  
                  <div class="card shadow">
                    <div class="card-body">
                    
                      <div class="toolbar" style="display: flex;">
                        <form class="form">
                          <div class="form-row">
                            <div class="form-group col-auto mr-auto">
                              <label class="my-1 mr-2 sr-only" for="inlineFormCustomSelectPref1">Show</label>
                              <select class="custom-select mr-sm-2" id="inlineFormCustomSelectPref1" name="size">
                                <option value="10"
                                	<c:if test="${param.size=='10'}">selected</c:if>
                                >10</option>
                                <option value="20"
                                	<c:if test="${param.size=='20'}">selected</c:if>
                                >20</option>
                                <option value="30"
                                	<c:if test="${param.size=='30'}">selected</c:if>
                                >30</option>
                                <option value="40"
                                	<c:if test="${param.size=='40'}">selected</c:if>
                                >40</option>
                              </select>
                            </div>
                          </div>
                        </form>
                      </div>
                  
                  
		              <div style="display: flex; justify-content: center; align-items: center; margin-bottom : 20px;">
		                   <form action="/common/notice" method="get" style="display: flex; align-items: center;" onsubmit="return fsubmit(this)">
		                      	<select class="form-control" id="ntcSeCode" name="ntcSeCode" style="width:150px; margin-right: 10px; height:40px;">
			                        <option value="-1">공지 구분</option>
			                        <c:forEach items="${notice}" var="sel">
		                              	<option value="${sel.codeId}">${sel.codeNm}</option>
		                            </c:forEach>
			                    </select>
				        	<input type="text" class="form-control" id="search1" name="keyword" value="${param.keyword}" placeholder="검색어를 입력하세요." style="margin-right: 10px; height:40px; width:300px;">
				        	<button type="submit" id="ho" class="btn btn-my" style="color:white; border-color: transparent; height:40px;">검색</button>
				   		</form>
				   	  </div>
					   		
                      <!-- table -->
                      <table class="table table-borderless table-hover">
                        <thead class="col p-2 bg-danger-dark">
                          <tr>
                          	<th class="text-center" style="width:10%;">No.</th>
                            <th style="width:50%;">제목</th>
                            <th style="width:10%;">작성자</th>
                            <th class="text-center" style="width:20%;">작성일자</th>
                            <th class="text-center" style="width:10%;">조회수</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${noticeList}" var="noticeVO" varStatus="stat">
                          <tr>
                            <td class="text-center">
                              <div class="avatar avatar-md">
                                <p class="mb-0 text-muted"><strong>${stat.count+(data.currentPage*10)-10}</strong></p>
                              </div>
                            </td>
                            
                            <td>
	                            <div class="d-flex align-items-center">
								  <p class="mb-0 text-muted" style="margin-right: 10px;">
	                              	<strong>
	                              		<c:choose>
	                              			<c:when test="${noticeVO.attachOX}">
	                              				💾	                              			
                              				</c:when>
	                              			<c:otherwise>
	                              				
	                              			</c:otherwise>
	                              		</c:choose>
	                              	</strong>
	                              </p>
	                              <a href="/common/noticeListDetail?ntcCode=${noticeVO.ntcCode}" class="mb-0 text-muted"><strong>${noticeVO.ntcTtl}</strong></a>
	                           	</div>
                            </td>
                            
                            <td>
                              <p class="mb-0 text-muted"><strong>${noticeVO.memNm}</strong></p>
                            </td>
                            
                            <td class="text-center" >
                              <p class="mb-0 text-muted">
                              	<strong>
                              		<fmt:formatDate value="${noticeVO.ntcDt }" pattern="yyyy-MM-dd"/>
                              	</strong>
                              </p>
                            </td>
                            
                            <td class="text-center" >
                              <p class="mb-0 text-muted "><strong>${noticeVO.hit}</strong></p>
                            </td>
                          </tr>
                          </c:forEach>
                          <c:if test="${data.hasNoArticles()}">
                          	<tr class="odd">
                          		<td colspan="7" style="text.align:center;">데이터가 없습니다.</td>
                          	</tr>
                          </c:if>
                        </tbody>
                      </table>
                      
                      <nav aria-label="Table Paging" class="mb-0 text-muted">
                        <ul class="pagination justify-content-center mb-0">
                          <li class="paginate_button page-item previous
                          	<c:if test='${param.currentPage==1}'>disabled</c:if>
                          " 
                          	id="dataTable_previous"><a class="page-link " href="/common/notice?currentPage=${param.currentPage - 1}&size=${data.size}&keyword=${param.keyword}&ntcSeCode=${param.ntcSeCode}" aria-controls="dataTable" data-dt-idx="0" tabindex="0"
                          	>Previous</a></li>
                          	
                          <c:forEach var="pNo" begin="${data.startPage}" end="${data.endPage+4}">
                            <c:if test="${pNo <= data.totalPages }">
                          	<li class='paginate_button page-item
                          		<c:if test="${param.currentPage==pNo}">active</c:if>
                          	'><a class="page-link" href="/common/notice?currentPage=${pNo}&size=${data.size}&keyword=${param.keyword}&ntcSeCode=${param.ntcSeCode}" aria-controls="dataTable" data-dt-idx="1" tabindex="0"
                          	>${pNo}</a></li>
                          	</c:if>	
                          </c:forEach>
                         
                          <li class="paginate_button page-item next
                          	<c:if test='${param.currentPage == data.totalPages}'>disabled</c:if>
                          " id="dataTable_next"><a
                           class="page-link" href="/common/notice?currentPage=${param.currentPage+1}&size=${data.size}&keyword=${param.keyword}&ntcSeCode=${param.ntcSeCode}" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
                           >Next</a></li>
                        </ul>
	                  </nav>
                    </div>
                  </div>
                </div> 
              </div>
</main>
              
<script>
$(function(){
	 $("#inlineFormCustomSelectPref1").on("change",function(){
		 let val = $(this).val();
		 console.log("val :" +val);
		 location.href="/common/notice?currentPage=1&size="+val;
	 });
});

let pageItems = document.querySelectorAll(".page-item");

//약간의 페이지 사기
if(location.href.indexOf("?") == -1 || pageItems.length <= 3){
    //alert("체킁");
     let pageItems = document.querySelectorAll(".page-item");
     console.log("체킁:",pageItems[1]);
     $(pageItems[1]).addClass("active");
}

function fsubmit(pThis) {
	if(pThis.ntcSeCode.value == "-1"){
		alert("공지구분을 선택해주세요.");
		pThis.ntcSeCode.focus();
		return false;
	}

	// 제대로 다 선택했으면 전송!
	return true;
}

</script>