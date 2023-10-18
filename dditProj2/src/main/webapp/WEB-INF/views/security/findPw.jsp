<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <title>Find PW</title>
    
    <!-- Simple bar CSS -->
    <link rel="stylesheet" href="/resources/master/light/css/simplebar.css">
    <!-- Fonts CSS -->
    <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <!-- Icons CSS -->
    <link rel="stylesheet" href="/resources/master/light/css/feather.css">
    <!-- Date Range Picker CSS -->
    <link rel="stylesheet" href="/resources/master/light/css/daterangepicker.css">
    <!-- App CSS -->
    <link rel="stylesheet" href="/resources/master/light/css/app-light.css" id="lightTheme">
    <link rel="stylesheet" href="/resources/master/light/css/app-dark.css" id="darkTheme" disabled>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
</head>
<style>
    .col-5 {
        background-color: rgba(255, 132, 143, 0.7);
    }
    
    .col-6 {
    	background-color : rgba(205, 46, 87, 0.7);
    }
    
    #searchID, #searchPW {
        width: 80px;
        height: 80px;
        border-radius: 10px;
        color: white; 
        font-size: 14px; 
        margin: 0;
    }
    
    #searchID {
    	background-color: #F06464;
    }
    
    #searchPW {
    	background-color: #FABCBC;
    }
    
    .checkbox label {
        color: white; 
        font-size: 15px; 
    }
    
    body {
    	overflow: hidden;
	}
	
	.scrollable-content {
	    max-height: 80vh; 
	    overflow-y: auto; 
	}
    
</style>
<body class="light" style="background-image: url('/resources/master/light/assets/avatars/고려대+5.png'); background-size: cover; background-repeat: no-repeat; background-attachment: fixed;">

<div class="wrapper vh-100">
    <div class="row align-items-center h-100">
        <div class="col-lg-8 col-10 mx-auto text-center">
            <div class="row">

                <div class="col-5 d-flex align-items-center justify-content-center">
				    <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="./index.html">
				        <div style="text-align: center;">
				            <img alt="..." src="/resources/master/light/assets/avatars/로고.png" style="max-width: 40%; display: block; margin: auto;">
				        </div>
				    </a>
				</div>

                <div class="col-6">
                    <h1 class="h6 mb-3" style="font-size: 24px; margin-bottom: 20%; margin-top: 5%; color: white;">비밀번호 찾기</h1>

                    <form action="/findPw" method="post">
                        <sec:csrfInput/>
                        <div class="form-group">
						    <label for="email" class="sr-only">이메일</label>
						    <input type="email" id="memMl" name="email" class="form-control form-control-lg" placeholder="이메일을 입력해주세요." value="" required autofocus>
						</div>
						<div class="form-group">
						    <label for="id" class="sr-only">아이디</label>
						    <input type="text" id="memNo" name="id" class="form-control form-control-lg" placeholder="아이디를 입력해주세요." value="" required>
						</div>


                        <button class="btn btn-outline-light" type="button" id="sendMail" style="width:80%; margin-top: 2%;">이메일 전송</button>

                        <div class="checkbox mb-3" style="margin-top: 5%;">
						    <button type="button" class="btn btn-outline-light" onclick="goLogin()">로그인 하기</button>
						    <button type="button" class="btn btn-info" id="autoBtn">자동 입력</button>
						</div>

                    </form>
                </div>
                
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/resources/master/light/js/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script>
// 로그인 페이지로 이동
function goLogin() {
	location.href = "/security/login";
}
</script>
<script>
$("#sendMail").on("click", function() {
    var memMl = $("#memMl").val();
    var memNo = $("#memNo").val();
    console.log("memMl", memMl);
    console.log("memNo", memNo);
    
    $.ajax({
        type: "GET",
        url: "/security/findPw1/" + memMl + "/" + memNo, // 이 URL은 실제로는 해당 기능을 처리하는 서버의 URL로 변경해야 합니다.
        
        dataType: "text",
        beforeSend: function(xhr) {
            xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
        },
        success: function(response) {
            if (response === "success") {
                Swal.fire("메일이 전송되었습니다.");
            } else {
                Swal.fire("존재하지 않는 이메일입니다.");
            }
        },
        error: function(xhr, status, error) {
            console.log("code: " + xhr.status);
            console.log("message: " + xhr.responseText);
            console.log("error: " + error);
        }
    });
});

$("#autoBtn").click(function(){
	$("#memMl").val("chaehyun7743@gmail.com");
	$("#memNo").val("202309P044");
})

</script>
</body>
</html>
</body>
</html>
