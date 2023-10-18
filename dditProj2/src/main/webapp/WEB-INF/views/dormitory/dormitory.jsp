<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<main role="main" class="main-content mx-auto" style="width: 80%;">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-12">
					<h2 class="h4 mb-1" style="text-align:center;">기숙사 정보</h2>
					<p class="text-muted"></p>
					<div class="card shadow mb-4">

						<div class="card-body">
							<div class="row">
								<div class="col-md-6">

									<div class="form-group mb-3">
										<label for="example-palaceholder" style="font-weight: bold;">*
											사생정보</label><br /> <label for="example-palaceholder"><strong>이름</strong></label> <input
											type="text" class="form-control" id="example-disable" disabled=""
											value="${dormitoryFormVO.memNm}">
									</div>
									<div class="form-group mb-3">
										<label for="example-palaceholder"><strong>학번</strong></label> <input type="text"
											class="form-control" id="example-disable" disabled
											value="${dormitoryFormVO.memNo}">
									</div>
									<div class="form-group mb-3">
										<label for="example-disable"><strong>기숙사명</strong></label> <input type="text"
											class="form-control" id="example-disable" disabled
											value="${dormitoryFormVO.dorNmCode}">
									</div>
									<div class="form-group mb-3">
										<label for="example-disable"><strong>호수</strong></label> <input type="text" class="form-control"
											id="example-disable" disabled value="${dormitoryFormVO.dorNo}">
										
									</div>
									<div class="form-group mb-3">
										<label for="example-disable"><strong>성별</strong></label> <input type="text" class="form-control"
											id="example-disable" disabled value="${dormitoryFormVO.doraGender}">
									</div>

								</div>
								
								
								<!-- /.col -->
								<div class="col-md-6">
								
									<div class="form-group mb-3">
										<label for="example-disable" style="font-weight: bold;">&nbsp;</label><br /> 
										<label for="example-disable"><strong>학과</strong></label> <input type="text" class="form-control"
											id="example-disable" disabled value="${dormitoryFormVO.depNm}">
									</div>
									
									<div class="form-group mb-3" >
										<label for="example-disable"><strong>연락처</strong></label> <input type="text" class="form-control"
											id="example-disable" disabled value="${dormitoryFormVO.memTel}">
									</div>
									<div class="form-group mb-3">
										<label for="example-disable"><strong>비상연락처</strong></label> <input type="text"
											class="form-control" id="example-disable" disabled
											value="${dormitoryFormVO.memTel2}">
									</div>
									<div class="form-group mb-3">
										<label for="example-disable"><strong>기숙사 생활기간</strong></label> <input type="text"
											class="form-control" id="example-disable" disabled
											value="${dormitoryFormVO.lifePeriod}">
									</div>
									<div class="form-group mb-3">
										<label for="example-disable"><strong>기숙사 입사 승인여부</strong></label> <input type="text"
											class="form-control" id="example-disable" disabled
											value="승인">
									</div>


								</div>
							</div>
						</div>
					</div>
					<!-- / .card -->
					</div>
				</div>
			</div>
		</main>




					<script>
						/*
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
								url: "/stu/dormitory",
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
							   		    		window.location.href = "/index";	
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
						*/
					</script>