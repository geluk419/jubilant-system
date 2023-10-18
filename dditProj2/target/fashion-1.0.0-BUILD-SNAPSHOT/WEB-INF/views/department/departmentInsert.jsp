<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<main role="main" class="main-content">
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-12 col-lg-10 col-xl-8">
				<h2 class="h3 mb-4 page-title">학과 등록</h2>
				<hr class="my-4">
				<div class="my-4">
					<!--                 <ul class="nav nav-tabs mb-4" id="myTab" role="tablist"> -->
					<!--                   <li class="nav-item"> -->
					<!--                     <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Profile</a> -->
					<!--                   </li> -->
					<!--                   <li class="nav-item"> -->
					<!--                     <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Security</a> -->
					<!--                   </li> -->
					<!--                   <li class="nav-item"> -->
					<!--                     <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Notifications</a> -->
					<!--                   </li> -->
					<!--                 </ul> -->
					<form>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="college">단과대학</label> <select id="college" class="form-control">
									<option>단과대학</option>
									<option>인문대학</option>
									<option>공과대학</option>
									<option>경영대학</option>
									<option>사회과학대학</option>
									<option>생명과학대학</option>
									<option>자연과학대학</option>
									<option>예술대학</option>
								</select>
							</div>
							<div class="form-group col-md-6">
								<label for="korean">학과명</label> 
								<input type="text" id="departmentName" class="form-control" placeholder="ex) 경제학과">
							</div>
							    <label for="english">학과 소개</label> 
							    <textarea id="departmentIntro" class="form-control" placeholder="학과 설명을 기입하여 주세요" style="height: 150px;"></textarea>
							</div><br>
							<div class="form-group col-md-6">
								<label for="status">최대 정원</label> 
								<input type="text" id="max" class="form-control" placeholder="재학/휴학/자퇴/졸업">
							</div>
							<div class="form-group col-md-6">
								<label for=""grade"">학년</label> 
								<select id="grade" class="form-control">
									<option>1학년</option>
									<option>2학년</option>
									<option>3학년</option>
									<option>4학년</option>
								</select>
							</div>
							<div class="form-group col-md-6">
								<label for="stuid">학번</label> 
								<input type="text" id="stuid" class="form-control" placeholder="ex) 20231234">
							</div>
							<div class="form-group col-md-6">
								<label for="department">학과</label> 
								<input type="text" id="department" class="form-control" placeholder="ex) 경제학과">
							</div>
							<div class="form-group col-md-6">
								<label for="semester">재학학기</label> 
								<select id="semester"
									class="form-control">
									<option>1학기</option>
									<option>2학기</option>
								</select>
							</div>
							<div class="form-group col-md-6">
								<label for="phoneNm">휴대전화</label> 
								<input type="text" id="phoneNm" class="form-control" placeholder="01012341234">
							</div>
							<div class="form-group col-md-6">
								<label for="passChange">비밀번호 변경</label>
								<div class="input-group">
									<input type="text" id="passChange" class="form-control" placeholder="변경할 비밀번호를 입력해주세요.">
									<div class="input-group-append">
										<button class="btn btn-outline-secondary bg-my text-white" type="button" id="changePasswordButton">변경</button>
									</div>
								</div>
							</div>

						</div>
						<div class="form-group">
							<label for="inputEmail">Email</label>
							<div class="input-group">
								<input type="text" class="form-control col-6" id="inputEmail"
									placeholder="이메일을 입력해주세요.">
								<div class="input-group-append col-6">
									<select class="form-control" id="selectDomain">
										<option value="@naver.com">@naver.com</option>
										<option value="@gmail.com">@gmail.com</option>
										<option value="@yahoo.com">@yahoo.com</option>
										<option value="@daum.net">@daum.net</option>
										<option value="@hanmail.net">@hanmail.net</option>
										<option value="@nate.com">@nate.com</option>
									</select>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="row">
								<div class="col-md-6">
									<label for="inputAddress">주소</label>
									<div class="input-group">
										<input type="text" class="form-control" id="inputAddress" placeholder="우편번호" readonly>
										<div class="input-group-append">
											<button type="button" id="btnPostNum" class="btn btn-outline-secondary bg-my text-white">우편번호검색</button>
										</div>
									</div>
								</div>
							</div>
							<br /> 
							<input type="text" class="form-control" name="addressVO.address" placeholder="주소" /><br /> 
							<input type="text" class="form-control" name="addressVO.buildingName" placeholder="상세주소" /><br />
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputCompany5">은행</label> 
								<select id="inputBank"
									class="form-control">
									<option selected="은행선택">은행선택</option>
									<option>한국은행</option>
									<option>산업은행</option>
									<option>기업은행</option>
									<option>KB국민은행</option>
									<option>하나은행</option>
									<option>수협은행</option>
									<option>NH농협은행</option>
									<option>우리은행</option>
									<option>신한은행</option>
									<option>신협</option>
									<option>우체국</option>
									<option>카카오뱅크</option>
									<option>기타</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label for="inputAccount">계좌번호</label> 
								<input type="text" class="form-control" id="inputCompany5" placeholder="0000-0000-0000">
							</div>
							<div class="form-group col-md-2">
								<label for="inputZip5">예금주명</label> 
								<input type="text" class="form-control" id="inputZip5" placeholder="홍길동">
							</div>
						</div>

						<hr class="my-4">

						<h4>기숙사 정보</h4>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="korean">기숙사명</label> 
								<select id="domiName" class="form-control">
									<option>구관</option>
									<option>신관</option>
								</select>
							</div>
							<div class="form-group col-md-6">
								<label for="english">생활학기</label> 
								<input type="text" id="lastname" class="form-control" placeholder="생활학기">
							</div>
							<div class="form-group col-md-6">
								<label for="english">호수</label> 
								<input type="text" id="status" class="form-control" placeholder="호수">
							</div>
							<div class="form-group col-md-6">
								<label for="english">납부여부</label> 
								<input type="text" id="status" class="form-control" placeholder="Y/N">
							</div>
							<div class="form-group col-md-6">
								<label for="english">긴급 연락처</label> 
								<input type="text" id="status" class="form-control" placeholder="01012341234">
							</div>
							<div class="form-group col-md-6">
								<label for="english">상벌점</label> 
								<input type="text" id="stuid" class="form-control" placeholder="0점">
							</div>
						</div>
						<button type="submit" class="btn btn-outline-secondary bg-my text-white">확인</button>
					</form>
				</div>
				<!-- /.card-body -->
			</div>
			<!-- /.col-12 -->
		</div>
		<!-- .row -->
	</div>
	<!-- .container-fluid -->
	<div class="modal fade modal-notif modal-slide" tabindex="-1"
		role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="defaultModalLabel">Notifications</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="list-group list-group-flush my-n3">
						<div class="list-group-item bg-transparent">
							<div class="row align-items-center">
								<div class="col-auto">
									<span class="fe fe-box fe-24"></span>
								</div>
								<div class="col">
									<small><strong>Package has uploaded successfull</strong></small>
									<div class="my-0 text-muted small">Package is zipped and uploaded</div>
									<small class="badge badge-pill badge-light text-muted">1m ago</small>
								</div>
							</div>
						</div>
						<div class="list-group-item bg-transparent">
							<div class="row align-items-center">
								<div class="col-auto">
									<span class="fe fe-download fe-24"></span>
								</div>
								<div class="col">
									<small><strong>Widgets are updated successfull</strong></small>
									<div class="my-0 text-muted small">Just create new layout Index, form, table</div>
									<small class="badge badge-pill badge-light text-muted">2m ago</small>
								</div>
							</div>
						</div>
						<div class="list-group-item bg-transparent">
							<div class="row align-items-center">
								<div class="col-auto">
									<span class="fe fe-inbox fe-24"></span>
								</div>
								<div class="col">
									<small><strong>Notifications have been sent</strong></small>
									<div class="my-0 text-muted small">Fusce dapibus, tellus ac cursus commodo</div>
									<small class="badge badge-pill badge-light text-muted">30m ago</small>
								</div>
							</div>
							<!-- / .row -->
						</div>
						<div class="list-group-item bg-transparent">
							<div class="row align-items-center">
								<div class="col-auto">
									<span class="fe fe-link fe-24"></span>
								</div>
								<div class="col">
									<small><strong>Link was attached to menu</strong></small>
									<div class="my-0 text-muted small">New layout has been attached to the menu</div>
									<small class="badge badge-pill badge-light text-muted">1h ago</small>
								</div>
							</div>
						</div>
						<!-- / .row -->
					</div>
					<!-- / .list-group -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btn-block" data-dismiss="modal">Clear All</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade modal-shortcut modal-slide" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="defaultModalLabel">Shortcuts</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
<script type="text/javascript" src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
