<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<style>
  .row {
      align-items: flex-end;
  }
 
 
  .modal-dialog modal-dialog-centered{
  	width : 100%;
  	height : 100%;
  }
</style>

              <div class="col-lg-12 my-4">
              <div class="row align-items-center my-4">
                <div class="col">
                  <h2 class="h3 mb-0 page-title">수강생 목록</h2>
                </div>
              </div>

                    <div class="card-footer">
                     <table class="table table-hover">
					<thead class="bg-my">
						<tr>
							<th>No.</th>
							<th>학번</th>
							<th>이름</th>
							<th>학생상세</th>
						</tr>
					</thead>
					<tbody>
<%-- 					<c:forEach var="lecNoticeVO" items="${lecNoticeVOList}" varStatus="stat"> --%>
							<tr>
								<td>1</td>
								<td>202308S001</td>
								<td>정범진</td>
								<td><button class="btn btn-my" type="button" data-toggle="modal" data-target="#stuDetail">상세</button></td>
							</tr>
<%-- 					</c:forEach> --%>
					</tbody>
				</table>
                    </div> <!-- /.card-footer -->
                <div class="col-md-9">
                </div> <!-- .col -->
              </div> <!-- .col-lg-12 my-4 -->
              

					<!-- 모달 -->
		            <div class="modal fade show" id="scoreApply" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" style="padding-right: 19px;" aria-modal="true">
		              <div class="modal-dialog modal-dialog-centered" role="document">
		                <div class="modal-content">
		                  <div class="modal-header">
		                    <h4 class="modal-title" id="verticalModalTitle">학생 상세</h4>
		                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                      <span aria-hidden="true">×</span>
		                    </button>
		                  </div>
		                  <div class="card-body">
                      
                            <div class="modal-body">
                              <form>
                                <div class="form-group">
                                  <label for="recipient-name" class="col-form-label">이름</label>
                                  <input type="text" class="form-control" id="objNm" value="정범진">
                                </div>
                                <div class="form-group">
                                  <label for="recipient-name" class="col-form-label">학번</label>
                                  <input type="text" class="form-control" id="obj" value="202308S001">
                                </div>
                                <div class="form-group">
                                  <label for="recipient-name" class="col-form-label">단과대학</label>
                                  <input type="text" class="form-control" id="obj" value="경영대학">
                                </div>
                                <div class="form-group">
                                  <label for="recipient-name" class="col-form-label">학과</label>
                                  <input type="text" class="form-control" id="obj" value="경제학과">
                                </div>
                                <div class="form-group">
                                  <label for="recipient-name" class="col-form-label">Email</label>
                                  <input type="text" class="form-control" id="obj" value="jung@naver.com">
                                </div>
                                <div class="form-group">
                                  <label for="recipient-name" class="col-form-label">휴대전화</label>
                                  <input type="text" class="form-control" id="obj" value="010-1234-5678">
                                </div>
                              </form>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
            		<!-- 모달 -->
            		
<script>
//버튼 클릭 시 모달 창 보이기
$(document).ready(function () {
    $(".btn-my").click(function () {
        $("#scoreApply").modal("show");
    });
});
</script>
