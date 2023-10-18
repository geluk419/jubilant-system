<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
svg.navbar-brand-img {
	fill: var(--my-color);
}

.navbar-light .navbar-nav .nav-link:hover {
	color: var(--my-color);
}
</style>



<aside class="sidebar-left border-right shadow bg-white" id="leftSidebar" data-simplebar>
	<a href="#" class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3" data-toggle="toggle"> 
		<i class="fe fe-x">
		<span class="sr-only"></span>
		</i>
	</a>
	<nav class="vertnav navbar navbar-light bg-white">
		<!-- nav bar -->
		<div class="w-100 mb-4 d-flex">
			<a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="/">
				<svg version="1.1" id="logo" class="navbar-brand-img brand-sm text-my" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 120 120" xml:space="preserve">
                   <img alt="..." src="/resources/master/light/assets/avatars/로고.png" style="max-width: 50%; display: block; margin: auto; min-width: 50px;">
				</svg>
			</a>
		</div>
		<p class="mt-4 mb-1 fs-18 mx-auto">
			<span>MENU</span>
		</p>
		<!-- 공통 메뉴  -->
<!-- 		<ul class="navbar-nav flex-fill w-100 mb-2"> -->
<!-- 			<li class="nav-item dropdown"> -->
<!-- 				<a href="#dashboard" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">  -->
<!-- 					<i class="fe fe-home fe-16"></i> -->
<!-- 						<span class="ml-3 item-text">공통</span>  -->
<!-- 						<span class="sr-only">(current)</span> -->
<!-- 				</a> -->
				
<!-- 				<ul class="collapse list-unstyled pl-4 w-100 show" id="dashboard"> -->
<!-- 					<li class="nav-item"> -->
<!-- 						<a class="nav-link pl-3" href="#">  -->
<!-- 							<span class="ml-1 item-text">학사일정</span> -->
<!-- 						</a> -->
<!-- 					</li> -->
					
<!-- 					<li class="nav-item"> -->
<!-- 						<a class="nav-link pl-3" href="/common/map">  -->
<!-- 							<span class="ml-1 item-text">캠퍼스맵</span> -->
<!-- 						</a> -->
<!-- 					</li> -->
					
<!-- 					<li class="nav-item"> -->
<!-- 						<a class="nav-link pl-3" href="/common/road">  -->
<!-- 							<span class="ml-1 item-text">오시는길</span> -->
<!-- 						</a> -->
<!-- 					</li> -->
					
<!-- 					<li class="nav-item"> -->
<!-- 						<a class="nav-link pl-3" href="#">  -->
<!-- 							<span class="ml-1 item-text">마이페이지</span> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 			</li> -->
<!-- 		</ul> -->

		<!-- 학생 권한 메뉴 -->
		<sec:authorize access="hasRole('STUDENT')">
			<ul class="navbar-nav flex-fill w-100 mb-2">
				<li class="nav-item dropdown">
					<a href="/stu/mypage" class="nav-link">
						<i class="fe fe-credit-card fe-16"></i> 
							<span class="ml-3 item-text">마이페이지</span>
					</a>
				</li>
				
				<li class="nav-item dropdown">
					<a href="/stu/recApply" class="nav-link"> 
						<i class="fe fe-calendar fe-16"></i> 
							<span class="ml-3 item-text">학적관리</span>
					</a>
				</li>
				
				<li class="nav-item dropdown">
					<a href="/stu/lecApply"class="nav-link"> 
						<i class="fe fe-map fe-16"></i> 
							<span class="ml-3 item-text">수강신청</span>
					</a>
				</li>
				
				<li class="nav-item dropdown">
					<a href="/stu/stuLecList" class="nav-link"> 
						<i class="fe fe-clock fe-16"></i> 
							<span class="ml-3 item-text">수강관리</span>
					</a>
				</li>
				
				<li class="nav-item dropdown">
					<a href="#ui-2" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link"> 
						<i class="fe fe-pen-tool fe-16"></i> 
							<span class="ml-3 item-text">성적&장학금</span>
					</a>
					<ul class="collapse list-unstyled pl-4 w-100" id="ui-2">
						<li class="nav-item">
							<a class="nav-link pl-3" href="/stu/score">
								<span class="ml-1 item-text">성적</span> 
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link pl-3" href="/stu/scholarship">
								<span class="ml-1 item-text">장학금</span>
							</a>
						</li>
					</ul>
				</li>
				
				<li class="nav-item dropdown">
					<a href="/stu/payment" class="nav-link">
						<i class="fe fe-box fe-16"></i> 
							<span class="ml-3 item-text">등록금 고지서</span>
					</a>
				</li>
			
				<li class="nav-item dropdown">
					<a href="#ui-elements2" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link"> 
						<i class="fe fe-layers fe-16"></i>
							<span class="ml-3 item-text">기숙사</span>
					</a>
					<ul class="collapse list-unstyled pl-4 w-100" id="ui-elements2">
						<li class="nav-item">
							<a class="nav-link pl-3" href="/stu/dormitoryApplyForm">
								<span class="ml-1 item-text">기숙사 신청</span> 
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link pl-3" href="/stu/dormitorySleep">
								<span class="ml-1 item-text">기숙사 외박신청</span> 
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link pl-3" href="/stu/dormitory">
								<span class="ml-1 item-text">기숙사 정보</span>
							</a>
						</li>
					</ul>
				</li>
				
				
				<li class="nav-item dropdown">
					<a href="/stu/coun" class="nav-link"> 
						<i class="fe fe-user-plus fe-16"></i> 
							<span class="ml-3 item-text">상담</span>
					</a>
				</li>
				
			</ul>
		</sec:authorize>


		<!-- 교수 권한 메뉴 -->
		<sec:authorize access="hasRole('PROFESSOR')">
			<ul class="navbar-nav flex-fill w-100 mb-2">
			
				<li class="nav-item dropdown">
					<a href="/prof/mypage" class="nav-link">
						<i class="fe fe-credit-card fe-16"></i> 
							<span class="ml-3 item-text">마이페이지</span>
					</a>
				</li>
				
				<li class="nav-item dropdown">
					<a href="/prof/lecList" class="nav-link"> 
						<i class="fe fe-book-open fe-16"></i> 
							<span class="ml-3 item-text">강의 개설관리</span>
					</a>
				</li>
				
				<li class="nav-item dropdown">
					<a href="/prof/profLecList" class="nav-link"> 
						<i class="fe fe-box fe-16"></i> 
							<span class="ml-3 item-text">강의 관리</span>
					</a>
				</li>

				<li class="nav-item dropdown">
					<a href="/prof/coun" class="nav-link"> 
						<i class="fe fe-grid fe-16"></i> 
							<span class="ml-3 item-text">상담</span>
					</a>
				</li>
			</ul>
		</sec:authorize>

		<!-- 교직원 메뉴 -->
		<sec:authorize access="hasRole('ADMIN')">
			<ul class="navbar-nav flex-fill w-100 mb-2">
				<li class="nav-item dropdown">
					<a href="/admin/mypage" class="nav-link">
						<i class="fe fe-credit-card fe-16"></i> 
							<span class="ml-3 item-text">마이페이지</span>
					</a>
				</li>
			
				<li class="nav-item dropdown">
				    <a href="#ui-e-1-user-management" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
				        <i class="fe fe-users fe-16"></i>
				        <span class="ml-3 item-text">사용자관리</span>
				    </a>
				    <ul class="collapse list-unstyled pl-4 w-100" id="ui-e-1-user-management">
				        <li class="nav-item">
				            <a class="nav-link pl-3" href="/admin/member">
				                <span class="ml-1 item-text">사용자 정보 조회</span>
				            </a>
				        </li>
				
				        <li class="nav-item">
				            <a class="nav-link pl-3" href="/admin/message">
				                <span class="ml-1 item-text">문자발송</span>
				            </a>
				        </li>
				    </ul>
				</li>

				<li class="nav-item dropdown show">
					<a href="#ui-2" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link"> 
						<i class="fe fe-pen-tool fe-16"></i> 
							<span class="ml-3 item-text">학생 관리</span>
					</a>
					<ul class="collapse list-unstyled pl-4 w-100" id="ui-2">
						<li class="nav-item">
							<a class="nav-link pl-3" href="/admin/stuList">
								<span class="ml-1 item-text">학생 현황 조회</span> 
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link pl-3" href="/admin/recMan">
								<span class="ml-1 item-text">학생 재적 관리</span>
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link pl-3" href="/admin/paymentAdmin">
								<span class="ml-1 item-text">등록금 관리</span>
							</a>
						</li>
					</ul>
				</li>
				
				
				
				<li class="nav-item dropdown show">
					<a href="#ui-e-1" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link"> 
						<i class="fe fe-user-plus fe-16"></i>
							<span class="ml-3 item-text">장학생 관리</span>
					</a>
					<ul class="collapse list-unstyled pl-4 w-100" id="ui-e-1">
						<li class="nav-item">
							<a class="nav-link pl-3" href="/admin/scholarshipRecipients">
								<span class="ml-1 item-text">장학대상자 조회</span>
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link pl-3" href="/admin/scholarship">
								<span class="ml-1 item-text">장학금 지급내역 조회</span>
							</a>
						</li>
					</ul>
				</li>
			
				<li class="nav-item dropdown">
					<a href="/admin/subjectList" class="nav-link">
						<i class="fe fe-book-open fe-16"></i> 
							<span class="ml-3 item-text">교과목 관리</span>
					</a>
				</li>
				
				<li class="nav-item dropdown">
					<a href="/admin/lectureList" class="nav-link"> 
						<i class="fe fe-airplay fe-16"></i> 
							<span class="ml-3 item-text">강의 관리</span>
					</a>
				</li>
				
				<li class="nav-item dropdown">
					<a href="#ui-elements2" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link"> 
						<i class="fe fe-box fe-16"></i>
							<span class="ml-3 item-text">학사 관리</span>
					</a>
					<ul class="collapse list-unstyled pl-4 w-100" id="ui-elements2">
						<li class="nav-item dropdown">
							<a href="/admin/schedule" class="nav-link"> 
								<i class="fe fe-calendar fe-16"></i> 
									<span class="ml-3 item-text">학사 일정</span>
							</a>
						</li>
						
						<li class="nav-item dropdown">
							<a href="/admin/departmentList" class="nav-link">
								<i class="fe fe-tool fe-16"></i> 
									<span class="ml-3 item-text">학과 관리</span>
							</a>
						</li>
					</ul>
				</li>
				
				<li class="nav-item dropdown show">
					<a href="#ui-3" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link"> 
						<i class="fe fe-briefcase fe-16"></i> 
							<span class="ml-3 item-text">기숙사 관리</span>
					</a>
					<ul class="collapse list-unstyled pl-4 w-100" id="ui-3">
						<li class="nav-item">
							<a class="nav-link pl-3" href="/admin/dormitoryAdminList">
								<span class="ml-1 item-text">사생 조회</span> 
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link pl-3" href="/admin/dormitoryApplyList">
								<span class="ml-1 item-text">기숙사 신청 현황</span>
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link pl-3" href="/admin/dormitorySleepList">
								<span class="ml-1 item-text">외박 신청 현황</span>
							</a>
						</li>
					</ul>
				</li>
				
				<li class="nav-item dropdown">
					<a href="/admin/notice" class="nav-link">
						<i class="fe fe-clipboard fe-16"></i> 
							<span class="ml-3 item-text">공지사항 관리</span>
					</a>
				</li>
			</ul>
		</sec:authorize>
	</nav>
</aside>