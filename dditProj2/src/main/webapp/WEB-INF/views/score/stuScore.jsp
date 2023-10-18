<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!doctype html>
<html lang="en">

<main role="main" class="main-content" style="width: 70%; margin: auto;">
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-12">
				<h2 class="page-title">성적조회</h2>
				<p class="text-muted">강의명</p>
				<div class="card-deck">

					<div class="card shadow mb-4">
						
						<div class="card-body">
							<form>
								<div class="form-group row">
									<label for="inputEmail3" class="col-sm-3 col-form-label">시험점수</label>
									<div class="col-sm-9">
										<input type="" class="form-control" id="inputEmail3"
											placeholder="">
									</div>
								</div>
								<div class="form-group row">
									<label for="inputEmail3" class="col-sm-3 col-form-label">과제점수</label>
									<div class="col-sm-9">
										<input type="" class="form-control" id="inputEmail3"
											placeholder="">
									</div>
								</div>
								<div class="form-group row">
									<label for="inputEmail3" class="col-sm-3 col-form-label">출결점수</label>
									<div class="col-sm-9">
										<input type="" class="form-control" id="inputEmail3"
											placeholder="">
									</div>
								</div>
								<div class="form-group row">
									<label for="inputEmail3" class="col-sm-3 col-form-label">총점수</label>
									<div class="col-sm-9">
										<input type="" class="form-control" id="inputEmail3"
											placeholder="">
									</div>
								</div>
								<div class="form-group row">
									<label for="inputEmail3" class="col-sm-3 col-form-label">총등급</label>
									<div class="col-sm-9">
										<input type="" class="form-control" id="inputEmail3"
											placeholder="">
									</div>
								</div>
								
							</form>
						</div>
					</div>
				</div>

			</div>
			<!-- /. col -->
		</div>

	</div>
	<!-- .row -->
	</div>
	
	<div class="modal fade modal-shortcut modal-slide" tabindex="-1"
		role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="defaultModalLabel">Shortcuts</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body px-5">
					<div class="row align-items-center">
						<div class="col-6 text-center">
							<div class="squircle bg-success justify-content-center">
								<i class="fe fe-cpu fe-32 align-self-center text-white"></i>
							</div>
							<p>Control area</p>
						</div>
						<div class="col-6 text-center">
							<div class="squircle bg-primary justify-content-center">
								<i class="fe fe-activity fe-32 align-self-center text-white"></i>
							</div>
							<p>Activity</p>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-6 text-center">
							<div class="squircle bg-primary justify-content-center">
								<i class="fe fe-droplet fe-32 align-self-center text-white"></i>
							</div>
							<p>Droplet</p>
						</div>
						<div class="col-6 text-center">
							<div class="squircle bg-primary justify-content-center">
								<i class="fe fe-upload-cloud fe-32 align-self-center text-white"></i>
							</div>
							<p>Upload</p>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-6 text-center">
							<div class="squircle bg-primary justify-content-center">
								<i class="fe fe-users fe-32 align-self-center text-white"></i>
							</div>
							<p>Users</p>
						</div>
						<div class="col-6 text-center">
							<div class="squircle bg-primary justify-content-center">
								<i class="fe fe-settings fe-32 align-self-center text-white"></i>
							</div>
							<p>Settings</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<!-- main -->
</div>
<!-- .wrapper -->
<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/simplebar.min.js"></script>
<script src='js/daterangepicker.js'></script>
<script src='js/jquery.stickOnScroll.js'></script>
<script src="js/tinycolor-min.js"></script>
<script src="js/config.js"></script>
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

<script>
				 $(document).ready(function () {
				        $("#testBtn").click(function () {
				            swal({
				                position: 'top-end',
				                icon: 'success',
				                title: '제출되었습니다',
				                showConfirmButton: false,
				                timer: 2000
				            });
				        });
				    });
				
					$("#applyBtn").on("click", () => {
				       let dormitoryApplyFormVO = {
				    	   : $("#").val(),
				    	    : $("#").val(),
				    	    : $("#").val(),
				    	    : $("#").val(),
				    	    : $("#").val(),
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
				                   //alert("성공");
				                   
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
</body>
</html>