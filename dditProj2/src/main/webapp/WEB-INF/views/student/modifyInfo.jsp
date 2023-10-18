<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<main role="main" class="main-content">
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-12 col-lg-10 col-xl-8">
				<h2 class="h3 mb-4 page-title">개인 정보 입력</h2>
				<hr class="my-4">
				<div class="my-4">
					<form>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="korean">한글 이름</label> 
								<input type="text" id="korean" class="form-control" placeholder="홍길동">
							</div>
							<div class="form-group col-md-6">
								<label for="english">영문 이름</label> 
								<input type="text" id="english" class="form-control" placeholder="Hong Gil Dong">
							</div>
							<div class="form-group col-md-6">
							    <label for="residentNum">주민등록번호</label>
							    <input type="text" id="residentNum" class="form-control" placeholder="000102-4555555">
							</div>

							<div class="form-group col-md-6">
								<label for="birth">생년월일</label> 
								<input type="date" id="birth" class="form-control" placeholder="">
							</div>
							
							<div class="form-group col-md-6">
								<label for="stuId">아이디</label> 
								<input type="text" id="stuId" class="form-control" placeholder="20231234" readonly>
							</div>
							
							<div class="form-group col-md-6">
								<label for="passChange">현재 비밀번호</label>
								<div class="input-group">
									<input type="text" id="passChange" class="form-control" placeholder="현재 비밀번호를 입력해주세요.">
									<div class="input-group-append">
										<button class="btn btn-my" type="button" id="passCheck">확인</button>
									</div>
								</div>
							</div>
							
							<div class="form-group col-md-6">
								<label for="passChange">변경 비밀번호</label>
								<div class="input-group">
									<input type="text" id="passChange" class="form-control" placeholder="변경할 비밀번호를 입력해주세요.">
								</div>
							</div>
							
							<div class="form-group col-md-6">
								<label for="passChange">비밀번호 확인</label>
								<div class="input-group">
									<input type="text" id="passChange" class="form-control" placeholder="변경할 비밀번호를 재입력해주세요.">
									<div class="input-group-append">
										<button class="btn btn-my" type="button" id="passCheck">확인</button>
									</div>
								</div>
							</div>
							
							<div class="form-group col-md-6">
								<label for="phoneNm">Email</label> 
								<input type="email" id="inputEmail" class="form-control" placeholder="aaa@naver.com">
							</div>
							
							<div class="form-group col-md-6">
								<label for="phoneNm">휴대전화</label> 
								<input type="text" id="phoneNm" class="form-control" placeholder="01012341234">
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-md-6">
									<label for="inputAddress">주소</label>
									<div class="input-group">
										<input type="text" class="form-control" id="inputAddress" placeholder="우편번호" readonly>
										<div class="input-group-append">
											<button type="button" id="btnPostNum" class="btn btn-my">우편번호검색</button>
										</div>
									</div>
								</div>
							</div>
							<br /> 
							<input type="text" class="form-control" name="addressVO.address" placeholder="주소" /><br /> 
							<input type="text" class="form-control" name="addressVO.buildingName" placeholder="상세주소" /><br />
						</div>
						
						
						<div class="d-flex justify-content-center">
						    <button type="submit" class="btn btn-my" style="width:25%;">정보 변경</button>
						</div>
                        <div class="d-flex justify-content-end mt-3">
                            <button type="submit" class="btn btn-outline-danger">뒤로 가기</button>
                        </div>
					</form>
				</div>
				<!-- /.card-body -->
			</div>
			<!-- /.col-12 -->
		</div>
		<!-- .row -->
	</div>
</main>
<!-- main -->
</div>
<!-- .wrapper -->
<script type="text/javascript" src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
$(function() {
	$("#btnPostNum").on("click", function() {
	      new daum.Postcode({
	         //다음 창에서 검색이 완료되면 콜백함수에 의해 결과 데이터가 data 객체로 들어옴
	         oncomplete : function(data) {
	            $("input[name=\"memberVO.memZip\"]").val(
	                  data.zonecode);
	            $("input[name=\"memberVO.memAddr1\"]").val(
	                  data.address);
	            $("input[name=\"memberVO.memAddr2\"]").val(
	                  data.buildingName);

	         }
	      }).open();
   });
});
</script>
