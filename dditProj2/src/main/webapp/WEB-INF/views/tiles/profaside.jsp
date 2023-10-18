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

<aside class="sidebar-left border-right shadow bg-white"
	id="leftSidebar" data-simplebar>
	<a href="#"
		class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3"
		data-toggle="toggle"> <i class="fe fe-x"><span class="sr-only"></span></i>
	</a>
	<nav class="vertnav navbar navbar-light bg-white">
		<!-- nav bar -->
		<div class="w-100 mb-4 d-flex">
			<a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="/">
				<svg version="1.1" id="logo"
					class="navbar-brand-img brand-sm text-my"
					xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
					viewBox="0 0 120 120" xml:space="preserve">
						<img alt="..." src="/resources/master/light/assets/avatars/로고.png" style="max-width: 50%; display: block; margin: auto; min-width: 50px;">
				</svg>
			</a>
		</div>
		
		
		
		<p class="nav-heading mt-4 mb-1">
			<span>강의관리</span>
		</p>
		<ul class="navbar-nav flex-fill w-100 mb-2">
			
			<li class="nav-item dropdown">
				<a href="/prof/profLecList" class="nav-link">
					<i class="fe fe-box fe-16"></i> <span class="ml-3 item-text">강의목록</span>
				</a>
			</li>
			<li class="nav-item dropdown">
				<a href="/prof/lecNotice?lecCode=${lecCd}" class="nav-link">
					<i class="fe fe-user-plus fe-16"></i> <span class="ml-3 item-text">강의자료실</span>
				</a>
			</li>
			<li class="nav-item dropdown">
				<a href="/prof/task?lecCode=${lecCd}" class="nav-link">
					<i class="fe fe-grid fe-16"></i> <span class="ml-3 item-text">과제</span>
				</a>
			</li>
			<li class="nav-item dropdown">
				<a href="/prof/test?lecCode=${lecCd}" class="nav-link">
					<i class="fe fe-map fe-16"></i> <span class="ml-3 item-text">시험</span>
				</a>
			</li>
			
			<li class="nav-item dropdown">
				<a href="#ui-1"	data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link"> 
					<i class="fe fe-mail fe-16"></i> <span class="ml-3 item-text">출결</span>
				</a>
				<ul class="collapse list-unstyled pl-4 w-100" id="ui-1">
					<li class="nav-item">
						<a class="nav-link pl-3" href="/prof/atten?lecCode=${lecCd}"> 
							<span class="ml-1 item-text">출결 관리</span>
						</a>
					</li>

					<li class="nav-item">
						<a class="nav-link pl-3" href="/prof/attenPruf?lecCode=${lecCd}"> 
							<span class="ml-1 item-text">출결 증빙 관리</span>
						</a>
					</li>
				</ul>
			</li>
			
			<li class="nav-item dropdown">
				<a href="#ui-2"	data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link"> 
					<i class="fe fe-pen-tool fe-16"></i> <span class="ml-3 item-text">성적</span>
				</a>
				<ul class="collapse list-unstyled pl-4 w-100" id="ui-2">
					<li class="nav-item">
						<a class="nav-link pl-3" href="/prof/score?lecCode=${lecCd}"> 
							<span class="ml-1 item-text">성적 관리</span>
						</a>
					</li>

					<li class="nav-item">
						<a class="nav-link pl-3" href="/prof/scoreObj?lecCode=${lecCd}"> 
							<span class="ml-1 item-text">성적 이의 신청 관리</span>
						</a>
					</li>
				</ul>
			</li>
		</ul>
		
		

	</nav>
</aside>