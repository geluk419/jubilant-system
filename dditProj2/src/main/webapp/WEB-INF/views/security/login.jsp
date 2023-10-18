<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <title>LOGIN</title>
    
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
                        <img alt="..." src="/resources/master/light/assets/avatars/로고.png" style="max-width: 60%; display: block; margin: auto;">
                    </div>
                </a>
            </div>

                <div class="col-6">
                    <h1 class="h6 mb-3" style="font-size: 24px; margin-bottom: 20%; margin-top: 5%; color: white;">LOGIN</h1>

                    <form action="/login" method="post">
                        <sec:csrfInput/>
                        <div class="form-group">
                            <label for="username" class="sr-only">ID</label>
                            <input type="text" id="username" name="username" class="form-control form-control-lg" placeholder="ID" required autofocus>
                        </div>
                        <div class="form-group">
                            <label for="password" class="sr-only">Password</label>
                            <input type="password" id="password" name="password" class="form-control form-control-lg" placeholder="Password" required>
                        </div>

                        <button class="btn btn-outline-light" type="submit" style="width:80%; margin-top: 2%;">Login</button>

                        <div class="form-group my-3">
                            <button class="btn btn-secondary" id="stu">학생</button>
                            <button class="btn btn-secondary" id="prof">교수</button>
                            <button class="btn btn-secondary" id="admin">교직원</button>
                        </div>

                        <div class="checkbox my-3">
                            <label for="remember">
                                <input type="checkbox" name="remember-me" id="remember" value="true"> 자동 로그인
                            </label>
                        </div>
                        
<!--                         <div class="row" style="margin-top: 20px; color: white;"> -->
<!--                       <div class="col"> -->
<!--                           <a href="#">오시는 길</a> -->
<!--                       </div> -->
<!--                       <div class="col"> -->
<!--                           <a href="/common/map">캠퍼스맵</a> -->
<!--                       </div> -->
<!--                   </div> -->
                    </form>
                </div>

                <div class="col-1 pl-0" style="display: flex; flex-direction: column; align-items: flex-end; margin-left: -1%;">
                    <button type="button" class="btn square-button" id="searchID" onclick="findId()">ID 조회</button>
                    <button type="button" class="btn square-button" id="searchPW" onclick="findPw()">PW 찾기</button>
                    <!-- 확인 -->
                </div>
                
            </div>
        </div>
    </div>
</div>
<script>

    // 학생 버튼을 클릭했을 때
    document.getElementById("stu").addEventListener("click", function() {
        document.getElementById("username").value = "202308S001"; // 학생의 아이디
        document.getElementById("password").value = "java"; // 학생의 패스워드
        document.querySelector("form").submit(); // 로그인 폼 제출
    });

    // 교수 버튼을 클릭했을 때
    document.getElementById("prof").addEventListener("click", function() {
        document.getElementById("username").value = "202008P003"; // 교수의 아이디
        document.getElementById("password").value = "java"; // 교수의 패스워드
        document.querySelector("form").submit(); // 로그인 폼 제출
    });

    // 교직원 버튼을 클릭했을 때
    document.getElementById("admin").addEventListener("click", function() {
        document.getElementById("username").value = "201803E006"; // 교직원의 아이디
        document.getElementById("password").value = "java"; // 교직원의 패스워드
        document.querySelector("form").submit(); // 로그인 폼 제출
    });


    // 아이디 조회 페이지로 이동
    function findId() {
        location.href = "/security/findId1";
    }

    // 비밀번호 찾기 페이지로 이동
    function findPw() {
       location.href = "/security/findPw1";
    }

</script>
</body>
</html>
</body>
</html>