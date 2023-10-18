<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- 로그인 되어야 함 -->   
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memberVO" var="memberVO" />
</sec:authorize>
<script type="text/javascript" src="/resources/master/light/js/jquery.min.js"></script>
<nav class="topnav navbar navbar-light bg-white">
	<button type="button"
		class="navbar-toggler mt-2 p-0 mr-3 collapseSidebar">
		<i class="fe fe-menu navbar-toggler-icon" ></i>
	</button>
<!-- 	<form class="form-inline mr-auto searchform"> -->
<!-- 		<input class="form-control mr-sm-2 border-0 pl-4" type="search" placeholder="Type something..." aria-label="Search"> -->
<!-- 	</form> -->
	<form id="frmLogout" action="/logout" method="post">
        <sec:csrfInput/>
    </form>
	<ul class="nav">
<!--     <li class="nav-item mx-1"> -->
<!--       <a class="nav-link text-white my-2 p-0" href="#" -->
<!--          id="loginBtn" data-mode="light"> -->
<!--         <button type="button" class="btn btn-primary">로그인</button> -->
<!--       </a> -->
<!--     </li> -->

<sec:authorize access="isAuthenticated()">
	<li class="nav-item">
			<a class="nav-link my-2" data-mode="light" id="aLogout" style="cursor:pointer; "><strong style="color: #B61A53;">로그아웃</strong> 
		  </a>
    </li>
</sec:authorize>

    
    <li class="nav-item mx-2 mt-3">
	  	<h6 class=""><span id="countdown" class="item-text text-my">60:00</span>&nbsp;
	    	<!-- 세션 연장을 위한 시계 아이콘 -->
	    	<i class="fe fe-clock fe-16 text-my" id="extendSessionIcon" style="cursor: pointer;" onclick="fChaeHyunResetClock()"></i></h6>
	</li>

	<li class="nav-item">
		<a class="nav-link my-2 text-my" href="#" id="modeSwitcher" data-mode="light"> 
			<i class="fe fe-sun fe-16"></i>
	  	</a>
   	</li>
   	
	<li class="nav-item nav-notif">
      	<a class="nav-link my-2 text-my" href="./#" data-toggle="modal"	data-target=".modal-notif"> 
      		<span class="fe fe-bell fe-16"></span>
			<span class="dot dot-md bg-success"  id="kjBell"  style="display:none"></span>
	    </a>
    </li>
    
    <sec:authorize access="isAuthenticated()">
	<li class="nav-item">
			<p class="nav-link my-2" data-mode="light" id="aLogout" style="cursor:pointer;"><strong style="color: #B61A53;">${memberVO.memNm}</strong>님 환영합니다.</p>
		<input type="hidden" name="memberName" id="memberName" value="${memberVO.memNm}">
    </li>
    </sec:authorize>
    
 	<sec:authorize access="isAuthenticated()">
	<li class="nav-item dropdown">
      	<a class="nav-link dropdown-toggle pr-0 text-my" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
      		
      		<span class="avatar avatar-sm mt-2"> 
<!--       			<img src="/resources/master/light/assets/avatars/face-1.jpg" alt="..." class="avatar-img rounded-circle"> -->
      			<img src="${memberVO.memPic}" alt="..." class="avatar-img rounded-circle">
			</span>
		</a>
			<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
				<a class="dropdown-item" href="#">프로필</a> 
				<a class="dropdown-item" href="#">설정</a> 
				<a class="dropdown-item" href="#">액티비티</a>
			</div>
    </li>
	</sec:authorize>
	</ul>
</nav>
<script>
$("#aLogout").on("click",function(){
	console.log("개똥이");
	$("#frmLogout").submit();
});

let countdownValue;
const countdownElement = document.querySelector("#countdown");

function fChaeHyunResetClock(){
	console.log("리이이세트");
	countdownValue = 3600;
	localStorage.setItem("countdownValue","3600");
}

// 시계 디스틀레이
function displayCountdown() {
    const minutes = Math.floor(countdownValue / 60);
    const seconds = countdownValue % 60;
  
    /*
    console.log("ckk:",countdownElement);
    console.log("minute:",minutes);
    console.log("seconds:",seconds);
    */
    countdownElement.textContent = `\${minutes}:\${seconds.toString().padStart(2, '0')}`; 
}

// 시간 초 다운....
function updateCountdown() {
    displayCountdown();

    countdownValue--;

    localStorage.setItem("countdownValue", countdownValue);

    if (countdownValue >= 0) {
      setTimeout(updateCountdown, 1000); // 1초마다 업데이트
    }
  }


document.addEventListener("DOMContentLoaded", function () {
  countdownValue = localStorage.getItem("countdownValue");
  
  if (countdownValue === null) {
    countdownValue = 3600; // 60분 * 60초
  } else {
    countdownValue = parseInt(countdownValue); // 문자열을 숫자로 변환
  }
  
  displayCountdown();
  updateCountdown();
});


let webSocket; 
function connect() {
    webSocket = new WebSocket("ws://192.168.142.23/emrsoc"); // End Point
  	//이벤트에 이벤트핸들러 등록
  	webSocket.onopen = fOpen; // 소켓 접속되면 자동 실행할 함수
  	webSocket.onmessage = fMessage; // 서버에서 메세지 오면 자동으로 실행할 함수
}

connect();

function fOpen(){
	console.log("소켓이 연결되었습니당");	
}

function fMessage(){
	console.log("받은데이터 확인!",event.data);

	let kjMsg=`<div class="list-group-item bg-transparent">
				<div class="row align-items-center">
					<div class="col-auto">
						<span class="fe fe-box fe-24"></span>
					</div>
					<div class="col">
						<small><strong>\${event.data}</strong></small>
						<div class="my-0 text-muted small">새로운 알림</div>
						<small class="badge badge-pill badge-light text-muted">1분 전</small>
					</div>
				</div>
			 </div>`;

    
	$("#kjBell").css("display","");
	$("#bjList").html($("#bjList").html() + kjMsg);
}





</script>