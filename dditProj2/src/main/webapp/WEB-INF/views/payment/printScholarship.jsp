<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!-- 로그인 되어야 함 -->   
<sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal.memberVO" var="memberVO" />
</sec:authorize>
<style>
.card-my {
   margin-top: 20px;
   margin-left: auto;
   margin-right: auto;
   width: 1000px;
}

.card-body {
   margin-left: auto;
   margin-right: auto;
   width: 1000px;
}

.center {
   text-align: center;
}

.right {
   text-align: right;
}

/* 테이블 시작 */
#detailTab {
   margin-left: auto;
   margin-right: auto;
   width: 99%;
   font-size: 20px;
   height: 350px;
}

#detailTab tr td {
	padding: 13px;
}

.bg-my-table{
	background-color: #b7e1fd;
}
/* 테이블  끝 */

#footer {
   padding-top: 10px;
   padding-bottom: 10px;
   font-size: 30px;
   font-weight: bold;
   height: 100px;
}

#header {
   margin: auto;
   width: 90%;
   padding-top: 10px;
   padding-bottom: 10px;
   font-size: 25px;
   text-align: center;
   font-weight: bold;
}

#detailTab {
/*    background-image: url("/resources/images/opacity_logo.png"); */
   background-size: 250px;
   background-repeat: no-repeat;
   background-position: top center;
   font-weight: bold;
   color: black;
}

.markImg {
/*    position: absolute; */
   width: 100px;
   left: 700px;
   bottom: 80px;
}

#pdfButtonContainer {
   position: relative;
   text-align: right;
   margin-top: 20px; 
   margin-right: 10px;
}

.center-button-container {
   display: flex;
   justify-content: center;
   margin-top: 50px;
}

</style>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript" defer="defer">
function savePdf() {
   //저장 영역 div id
   html2canvas($('.card-body')[0], {
      //logging : true,      // 디버그 목적 로그
      //proxy: "html2canvasproxy.php",
      allowTaint : true, // cross-origin allow 
      useCORS : true, // CORS 사용한 서버로부터 이미지 로드할 것인지 여부
      scale : 2
   // 기본 96dpi에서 해상도를 두 배로 증가
   }).then(
         function(canvas) {
            // 캔버스를 이미지로 변환
            var imgData = canvas.toDataURL('image/png');
            var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
            var pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이 계산 A4 기준
            var imgHeight = canvas.height * imgWidth / canvas.width;
            var heightLeft = imgHeight;
            var margin = 10; // 출력 페이지 여백설정
            var doc = new jsPDF('p', 'mm');
            var position = 50;
            // 첫 페이지 출력
            doc.addImage(imgData, 'PNG', margin, position, imgWidth,
                  imgHeight);
            heightLeft -= pageHeight;
            // 파일 저장
            doc.save('취업딱대학교_장학금.pdf');
         });


   }
</script>
<body>
<div class="">
<div id="pdfButtonContainer">
   <button onclick="savePdf()" id="btn1" class="btn btn-my" style="padding: 8px 8px 6px;">PDF 저장</button>
</div>
   <div class="card card-my">
      <div class="card-body">
         <div id="header" class="text-black">장학금 수여 내역</div>
         <table border ="1" id="detailTab">
         	<tr>
	         	<td colspan="4" class="center bg-my-table">2023년도 2학기 장학금</td>
         	</tr>
         	<tr>
         		<td class="center bg-my-table">대학</td>
         		<td colspan="3">${college.codeNm}</td>
   			</tr>
         	<tr>
         		<td class="center bg-my-table">학과(전공)</td>
         		<td colspan="3">${department.depNm}</td>
   			</tr>
         	<tr>
         		<td class="center bg-my-table">학번</td>
         		<td>${memberVO.memNo}</td>
         		<td class="center bg-my-table">학년</td>
         		<td class="center">${gradeInfo.stuYr}</td>
         	</tr>
         	<tr>
         		<td class="center bg-my-table">성명</td>
         		<td colspan="3">${memberVO.memNm}</td>
         	</tr>
         	<tr>
         		<td class="center bg-my-table">수여일자</td>
         		<td colspan="7">2023/10/17</td>
         	</tr>
         	<tr>
         		<td class="center bg-my-table">장학금액</td>
         		<td colspan="7">${getScholarStu.sclLpay}3,000,000</td>
         	</tr>
         	<tr id="footer">
            	<td colspan="8">
               		<div class="center">
	               		<div style="display: inline; padding-left: 12%;">취 업 딱 대 학 교  총 장</div>
	               		<img class="markImg" alt="" src="/resources/master/light/assets/avatars/로고.png" style="display: inline;">
               		</div>
            	</td>
         	</tr>
         </table>
      </div>
   </div>
   <div class="col-12 center mt-5">
	  <button onclick="goBackToList()" class="btn btn-lg btn-my">돌아가기</button>
   </div>
</div>








   <script>
	function goBackToList() {
	   location.href = '/stu/scholarship';
	}
	</script>
</body>
