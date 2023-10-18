<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<main role="main" class="main-content mx-auto" style="width: 70%; margin: auto;">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-12">
					<h2 class="h4 mb-1" style="text-align:center;">기숙사 외박신청</h2>
					<p class="text-muted"></p>
					<div class="card shadow mb-4">

						<div class="card-body">
							<div class="row">
								<div class="col-md-6">
									<form action="/">
										<div class="form-group mb-3">
											<label for="sleepStart" style="font-weight: bold;">*
												외박신청</label><br /> <label for="example-palaceholder"><strong>&nbsp;외박일정</strong></label>
											<input type="date" id="sleepStart" name="sleepStart" class="form-control"
												placeholder="외박일정"> <br/>
											<label for="sleepEnd"><strong>&nbsp;귀가일정</strong></label> 
											<input type="date" id="sleepEnd" name="sleepEnd" class="form-control"
												placeholder="귀가일정">
										</div>
										<div class="form-group">
											<label for="sleepRsn"><strong>외박사유</strong></label> <label for="exampleFormControlTextarea1"
												class="sr-only">Your
												Message</label>
											<textarea class="form-control bg-light" id="sleepRsn" name="sleepRsn"
												rows="2"></textarea>
										</div>
										<button type="button" class="btn mb-2 bg-my text-white"
											id="applyBtn">&nbsp;외박신청</button>
										<button type="button" class="btn mb-2 bg-primary text-white" id="autoFill">자동입력</button>
									</form>
									<br />
									<br />

								</div>
								
								
								<!-- /.col -->
								<div class="col-md-6">
									<div class="form-group mb-3">
										<label for="example-palaceholder" style="font-weight: bold;">*
											승인여부</label><br /> <label for="example-palaceholder"><strong>결과</strong></label> <input
											type="text" id="example-palaceholder" class="form-control" placeholder="" disabled>
									</div>
									<div class="form-group mb-3">
										<label for="example-palaceholder"><strong>반려사유</strong></label> <input type="text"
											id="example-palaceholder" class="form-control" placeholder="" disabled>
									</div>
									<div class="form-group mb-3">
										<label for="example-palaceholder" style="font-weight: bold;">*
											상벌점현황</label><br /> <label for="example-palaceholder"><strong>상점</strong></label> <input
											type="text" id="example-palaceholder" class="form-control" value="${score.dormRewards}" disabled>
<!-- 											<label for="example-palaceholder"><strong>상점사유</strong></label> -->
<!-- 											<input -->
<!-- 											type="text" id="example-palaceholder" class="form-control" value="청소" disabled> -->
									</div>
									<div class="form-group mb-3">
										<label for="example-palaceholder"><strong>벌점</strong></label> <input type="text"
											id="example-palaceholder" class="form-control" value="${score.dormPenalties}" disabled>
									</div>
									
<!-- 											<label for="example-palaceholder"><strong>벌점사유</strong></label> -->
<!-- 											<input -->
<!-- 											type="text" id="example-palaceholder" class="form-control" value="음주" disabled> -->
								</div>
								

									


								</div>
							</div>
						</div>
					</div>
					<!-- / .card -->
				</div>
			</div>
		</main>

<script>
$("#autoFill").on("click", function() {
  	  //외박 신청 자동입력
  	  $("#sleepStart").val("2023-10-17")
  	  $("#sleepEnd").val("2023-10-18")
  	  $("#sleepRsn").val("코딩동아리 여행")
  	  
    })


					

						//서버에서 발행된 헤더네임과 토큰갑사 저장
						const header = '${_csrf.headerName}';
						const token = '${_csrf.token}';
						

						$("#applyBtn").on("click", () => {
							let sleepoverVO = {
								//sleepCode: $("#sleepCode").val(),
								stuMemNo : '${dormitoryFormVO.memNo}',
								sleepStart: $("#sleepStart").val(),
								sleepEnd: $("#sleepEnd").val(),
								sleepRsn: $("#sleepRsn").val(),
							}
							console.log("sleepoverVO : ", sleepoverVO);
							$.ajax({
								type: "post",
								url: "/stu/dormitorySleep",
								data: JSON.stringify(sleepoverVO),
								contentType: "application/json;charset=utf-8",
								dataType: "text",
								beforeSend: function (xhr) {
									xhr.setRequestHeader(header, token);
									//xhr.setRequestHeader(header, token);
									//xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
									//xhr.setRequestHeader("Content-type","application/json");
								},
								success: function (rslt) {
									console.log(rslt);

									if (rslt == 1) {
							   			Swal.fire({
								   		      icon: 'success',
								   		      title: "외박신청이 완료되었습니다"
								   		    }).then((result) => {
							   		    		window.location.href = "/stu/dormitorySleep";	
								   		    })
							   			 	
							   					
							   			} else {
							   				Swal.fire("외박신청실패");	
							   			}
								},
								error: function (xhr, status, error) {
									console.log("code: " + xhr.status)
									console.log("message: " + xhr.responseText)
									console.log("error: " + error);
								}
							})
						});
					</script>