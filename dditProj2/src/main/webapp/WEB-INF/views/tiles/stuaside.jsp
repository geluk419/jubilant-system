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
			<a href="/stu/stuLecList" class="nav-link">
			<i class="fe fe-box fe-16"></i> <span	class="ml-3 item-text">강의목록</span>
			</a>
			</li>
			
			<li class="nav-item dropdown">
				<a href="/stu/lecNotice?lecCode=${lecCd}" class="nav-link">
					<i class="fe fe-user-plus fe-16"></i> <span class="ml-3 item-text">강의자료실</span>
				</a>
			</li>
			<li class="nav-item dropdown">
				<a href="/stu/taskList?lecCode=${lecCd}" class="nav-link">
					<i class="fe fe-grid fe-16"></i> <span class="ml-3 item-text">과제</span>
				</a>
			</li>
			<li class="nav-item dropdown">
				<a href="/stu/testNotice?lecCode=${lecCd}" class="nav-link">
					<i class="fe fe-map fe-16"></i> <span class="ml-3 item-text">시험</span>
				</a>
			</li>
			<li class="nav-item dropdown">
				<a href="/stu/atten?lecCode=${lecCd}" class="nav-link">
					<i class="fe fe-mail fe-16"></i> <span class="ml-3 item-text">출석부</span>
				</a>
			</li>
			<li class="nav-item dropdown">
				<a href="/stu/scoreLec?lecCode=${lecCd}" class="nav-link">
					<i class="fe fe-video fe-16"></i> <span class="ml-3 item-text">성적</span>
				</a>
			</li>
			<li class="nav-item dropdown">
				<a href="/stu/stuLecEvaluation?lecCode=${lecCd}" class="nav-link">
					<i class="fe fe-grid fe-16"></i> <span class="ml-3 item-text">강의평가</span>
				</a>
			</li>
		</ul>
		
		

	</nav>
</aside>