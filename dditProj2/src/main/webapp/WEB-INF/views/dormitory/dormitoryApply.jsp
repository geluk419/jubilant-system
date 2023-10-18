<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>

<main role="main" class="main-content mx-auto" style="width: 85%; margin: auto;">
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-12">
				<h2 class="h4 mb-1" style="text-align:center;">기숙사 신청</h2>
				<p class="text-muted" style="text-align:center;">2023학년도 2학기 기숙사 신청</p>
				<%-- 					<p>${dormitoryApplyFormVO}</p> --%>
				<div class="card shadow mb-4">

					<div class="card-body" >
						<div class="row">
							<div class="col-md-6">
								<div class="form-group mb-3">
									<label for="memNm"><strong>* 이름</strong></label>
									<input type="text" id="memNm" name="memNm" class="form-control" placeholder="이름" value="${dormitoryApplyFormVO.memNm}" readonly>
								</div>
								<label for="example-palaceholder"><strong>* 성별</strong></label>
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" id="genderMale" name="doraGender" value="남">
									<label class="custom-control-label" for="genderMale">남자</label>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" id="genderFemale" name="doraGender" value="여">
									<label class="custom-control-label" for="genderFemale">여자</label>
								</div>
								<br />
								<div class="form-group mb-3">
									<label for="memBir"><strong>* 생년월일</strong></label>
									<input type="text" id="memBir" name="memBir" class="form-control" placeholder="생년월일" value="${dormitoryApplyFormVO.memBir}" readonly>
								</div>
								<div class="form-group mb-3">
									<label for="stuMemNo"><strong>* 학번</strong></label>
									<input type="text" id="stuMemNo" name="stuMemNo" class="form-control" placeholder="학번" value="${dormitoryApplyFormVO.memNo}" readonly>
								</div>
								<div class="form-group mb-3">
									<label for="depNm"><strong>* 학과</strong></label>
									<input type="text" id="depNm" name="depNm" class="form-control" placeholder="학과" value="${dormitoryApplyFormVO.depNm}" readonly>
								</div>
								<div class="form-group mb-3">
									<label for="codNm"><strong>* 단과대학</strong></label>
									<input type="text" id="codNm" class="form-control" placeholder="단과대학" value="${dormitoryApplyFormVO.codNm}" readonly>
								</div>
								<div class="form-group mb-3">
									<label for="doraGrd"><strong>* 학점</strong></label>
									<input type="text" id="doraGrd" name="doraGrd" class="form-control" placeholder="학점" >
								</div>
								<label><strong>* 신입생 여부</strong></label>
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" id="freshY" name="fresh" value="Y">
									<label class="custom-control-label" for="freshY">Y</label>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" id="freshN" name="fresh" value="N">
									<label class="custom-control-label" for="freshN">N</label>
								</div>
								<br />
								<div class="form-group mb-3">
									<label for="codeDoraReg"><strong>* 거주지역</strong></label>
									<select class="custom-select" id="codeDoraReg" name="codeDoraReg">
										<option>거주지역 선택</option>
										<option value="경기도">경기도</option>
										<option value="강원도">강원도</option>
										<option value="경상북도">경상북도</option>
										<option value="경상남도">경상남도</option>
										<option value="충청북도">충청북도</option>
										<option value="충청남도">충청남도</option>
										<option value="전라북도">전라북도</option>
										<option value="전라남도">전라남도</option>
										<option value="제주특별자치도">제주특별자치도</option>
									</select>
								</div>
							</div>
							<!-- /.col -->
							<div class="col-md-6">
								<div class="form-group mb-3">
									<label for="doraYr"><strong>* 신청연도</strong></label>
									<input type="text" id="doraYr" class="form-control" name="doraYr" readonly value="2023">
								</div>
								<div class="form-group mb-3">
									<label for="example-disable"><strong>* 신청학기</strong></label>
									<input type="text" class="form-control" id="doraSem" name="doraSem" readonly value="2">
								</div>
								<div class="form-group mb-3">
									<label for="doraName"><strong>* 신청기숙사명</strong></label>
									<select class="custom-select" id="doraNameCode" name="doraNameCode">
										<option>신관/구관 선택</option>
										<option value="구관(여자)">구관(여자)</option>
										<option value="신관(여자)">신관(여자)</option>
										<option value="구관(남자)">구관(남자)</option>
										<option value="신관(남자)">신관(남자)</option>
									</select>
								</div>
								<div class="form-group mb-3">
									<label for="dorNo"><strong>* 희망호수</strong></label>
									<p class="text-muted">신관(101~120),구관(101~120)</p>
									<input type="text" id="dorNo" name="dorNo" class="form-control" placeholder="ex) 101">
								</div>
								<div class="form-group mb-3">
									<label for="memTel"><strong>* 연락처</strong></label>
									<input type="text" id="memTel" name="memTel" class="form-control" placeholder="연락처" value="${dormitoryApplyFormVO.memTel}" readonly>
								</div>
								<div class="form-group mb-3">
									<label for="memTel2"><strong>* 비상연락처</strong></label>
									<input type="text" id="memTel2" class="form-control" placeholder="비상연락처" value="${dormitoryApplyFormVO.memTel2}" readonly>
								</div>
								<div class="form-group">
									<label for="example-palaceholder"><strong>* 신청사유</strong></label>
									<label for="exampleFormControlTextarea1" class="sr-only">Your Message</label>
									<textarea class="form-control bg-light" id="doraRsn" name="doraRsn" rows="2"></textarea>
								</div>
								<div class="d-flex justify-content-end" id="applyBtn">
									<button type="submit" class="btn mb-2 bg-my text-white">신청</button>
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





				<script src="/resources/js/jquery.min.js"></script>
<!-- 				<script src="js/popper.min.js"></script> -->
<!-- 				<script src="js/moment.min.js"></script> -->
<!-- 				<script src="js/bootstrap.min.js"></script> -->
<!-- 				<script src="js/simplebar.min.js"></script> -->
<!-- 				<script src='js/daterangepicker.js'></script> -->
<!-- 				<script src='js/jquery.stickOnScroll.js'></script> -->
<!-- 				<script src="js/tinycolor-min.js"></script> -->
<!-- 				<script src="js/config.js"></script> -->
<!-- 				<script src="js/apps.js"></script> -->
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
				
				<script>
					$("#applyBtn").on("click", () => {
				       let dormitoryApplyFormVO = {
			    		   stuMemNo: $("#stuMemNo").val(),
			    		   doraNameCode : $("#doraNameCode").val(),
			    		   dorNo : $("#dorNo").val(),
			    		   doraYr : $("#doraYr").val(),
			    		   doraSem : $("#doraSem").val(),
			    		   doraRsn : $("#doraRsn").val(),
			    		   codeDoraReg : $("#codeDoraReg").val(),
			    		   doraGrd : $("#doraGrd").val(),
			    		   doraFreshYn: $("input[name=fresh]").val(),
			    		   doraGender : $("input[name=doraGender]").val()
				       }
				       console.log("dormitoryApplyFomrVO : ", dormitoryApplyFormVO);
				       let csrfHeader = $("#_csrf_header").attr('content')
					   let csrfToken = $("#_csrf").attr('content')
				       $.ajax({
				           type:"post",
				           url:"/stu/dormitoryApply",
				           data: JSON.stringify(dormitoryApplyFormVO),
				           contentType:"application/json;charset=utf-8",
				           dataType:"text",
				           beforeSend: function(xhr) {
								xhr.setRequestHeader(csrfHeader, csrfToken);
				                xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
				                xhr.setRequestHeader("Content-type","application/json");
				           },
				           success:function(rslt){
				               console.log(rslt);
				               
				               if(rslt == 1){
				   	   			Swal.fire({
				  	   		      icon: 'success',
				  	   		      title: "신청이 완료되었습니다"
				  	   		    }).then((result) => {
				     		    		window.location.href = "/stu/dormitory";	
				  	   		    })
				     			 	
				     					
				     			} else {
				     				Swal.fire("신청실패");	
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
				