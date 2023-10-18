<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<aside class="sidebar-left border-right bg-white shadow"
	id="leftSidebar" data-simplebar>
	<a href="#"
		class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3"
		data-toggle="toggle"> <i class="fe fe-x"><span class="sr-only"></span></i>
	</a>
	<nav class="vertnav navbar navbar-light">
		<!-- nav bar -->
		<div class="w-100 mb-4 d-flex">
			<a class="navbar-brand mx-auto mt-2 flex-fill text-center"
				href="/index"> <svg version="1.1" id="logo"
					class="navbar-brand-img brand-sm"
					xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
					viewBox="0 0 120 120" xml:space="preserve">
                <g>
                  <polygon class="st0"
						points="78,105 15,105 24,87 87,87 	" />
                  <polygon class="st0"
						points="96,69 33,69 42,51 105,51 	" />
                  <polygon class="st0"
						points="78,33 15,33 24,15 87,15 	" />
                </g>
              </svg>
			</a>
		</div>
		<p class="mt-4 mb-1 fs-18 mx-auto">
			<span>MENU</span>
		</p>
		<ul class="navbar-nav flex-fill w-100 mb-2">
			<li class="nav-item dropdown"><a href="#dashboard"
				data-toggle="collapse" aria-expanded="false"
				class="dropdown-toggle nav-link"> <i class="fe fe-home fe-16"></i>
					<span class="ml-3 item-text">대시보드</span><span class="sr-only">(current)</span>
			</a>
				<ul class="collapse list-unstyled pl-4 w-100" id="dashboard">
					<li class="nav-item active"><a class="nav-link pl-3"
						href="/index"><span class="ml-1 item-text">기본</span></a>
					</li>
					<li class="nav-item"><a class="nav-link pl-3"
						href="#"><span class="ml-1 item-text">해석학</span></a>
					</li>
					<li class="nav-item"><a class="nav-link pl-3"
						href="#"><span class="ml-1 item-text">전자상거래</span></a>
					</li>
					<li class="nav-item"><a class="nav-link pl-3"
						href="#"><span class="ml-1 item-text">Saas 대시보드</span></a></li>
					<li class="nav-item"><a class="nav-link pl-3"
						href="#"><span class="ml-1 item-text">시스템</span></a>
					</li>
				</ul></li>
		</ul>
		<p class="text-muted nav-heading mt-4 mb-1">
			<span>컴포넌트</span>
		</p>
		<ul class="navbar-nav flex-fill w-100 mb-2">
			<li class="nav-item dropdown"><a href="#ui-elements"
				data-toggle="collapse" aria-expanded="false"
				class="dropdown-toggle nav-link"> <i class="fe fe-box fe-16"></i>
					<span class="ml-3 item-text">등록&장학</span>
			  </a>
				<ul class="collapse list-unstyled pl-4 w-100" id="ui-elements">
					<li class="nav-item"><a class="nav-link pl-3"
						href="#"><span class="ml-1 item-text">등록</span>
					</a></li>
					<li class="nav-item"><a class="nav-link pl-3"
						href="#"><span class="ml-1 item-text">장학</span></a>
					</li>
				</ul>
      </li>
			<li class="nav-item dropdown"><a href="#forms"
				data-toggle="collapse" aria-expanded="false"
				class="dropdown-toggle nav-link"> <i
					class="fe fe-credit-card fe-16"></i> <span class="ml-3 item-text">입력폼</span>
			</a>
				<ul class="collapse list-unstyled pl-4 w-100" id="forms">
					<li class="nav-item"><a class="nav-link pl-3"
						href="#"><span class="ml-1 item-text">기본 요소</span></a></li>
					<li class="nav-item"><a class="nav-link pl-3"
						href="#"><span class="ml-1 item-text">고급 요소</span></a></li>
					<li class="nav-item"><a class="nav-link pl-3"
						href="#"><span class="ml-1 item-text">레이아웃</span></a>
					</li>
					<li class="nav-item"><a class="nav-link pl-3"
						href="#"><span class="ml-1 item-text">파일 업로드</span></a></li>
				</ul></li>
			<li class="nav-item dropdown">
				<a href="#" class="nav-link">
					<i class="fe fe-credit-card fe-16"></i> <span class="ml-3 item-text">증명서발급</span>
				</a>
			</li>
			<li class="nav-item dropdown">
				<a href="#" class="nav-link">
					<i class="fe fe-grid fe-16"></i> <span class="ml-3 item-text">기숙사</span>
				</a>
			</li>
      <li class="nav-item dropdown">
        <a href="#" class="nav-link">
          <i class="fe fe-map fe-16"></i> <span class="ml-3 item-text">수강신청</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a href="#" class="nav-link">
          <i class="fe fe-clock fe-16"></i> <span class="ml-3 item-text">수강관리</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a href="#ui-2" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link"> <i class="fe fe-pen-tool fe-16"></i>
          <span class="ml-3 item-text">성적&평가</span>
        </a>
        <ul class="collapse list-unstyled pl-4 w-100" id="ui-2">
          <li class="nav-item"><a class="nav-link pl-3" href="#"><span class="ml-1 item-text">성적</span>
          </a></li>
          <li class="nav-item"><a class="nav-link pl-3" href="#"><span class="ml-1 item-text">평가</span></a>
          </li>
        </ul>
      </li>
      <li class="nav-item dropdown">
        <a href="#" class="nav-link">
          <i class="fe fe-calendar fe-16"></i> <span class="ml-3 item-text">학적관리</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a href="#" class="nav-link">
          <i class="fe fe-user-plus fe-16"></i> <span class="ml-3 item-text">상담</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a href="#" class="nav-link">
          <i class="fe fe-camera fe-16"></i> <span class="ml-3 item-text">화상회의</span>
        </a>
      </li>

		</ul>
		<p class="text-muted nav-heading mt-5 mb-1">
			<span>선적 서류 비치</span>
		</p>
		<ul class="navbar-nav flex-fill w-100 mb-2">
			<li class="nav-item w-100"><a class="nav-link"
				href="../docs/index.html"> <i class="fe fe-help-circle fe-16"></i>
					<span class="ml-3 item-text">Getting Start</span>
			</a></li>
		</ul>

	</nav>
</aside>