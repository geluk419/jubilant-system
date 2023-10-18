<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 로그인 되어야 함 -->   
<sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal.memberVO" var="memberVO" />
</sec:authorize>
<style>
.body{
	margin-top : 150px;
}
.center {
   text-align: center;
}
.right{
text-align: right;
}
td{
text-align: center;
}
#header {
	height: 20%;
	font-size: 30px;
	text-align: center;
}
#footer {
   padding-top: 10px;
   padding-bottom: 10px;
   font-size: 25px;
   font-weight: bold;
   height: 100px;
}

#tab {
	
	border: 1px solid black;
	border-collapse: collapse;
	width : 50%;
	height: 100%;
	float: left;
}
#tab2 {
	border: 1px solid black;
	border-collapse: collapse;
	width : 50%;
	height: 100%;
	float: right;
	
}
.card{
	margin-top : 30px;
	margin-left : 15%;
	height: 500px;
	width : 1000px;
	
}
#tabdiv1{
	
	height: 500px;
	width : 1000px;
	margin:auto;
}
#btnDiv{
	position : relative;
	right : 185px;
	bottom : 60px;
}
#btnDiv #pay{
	padding : 8px;
}
#pdfSave{
	padding : 8px;
}
.headerDiv{
	font-size: 15px;
	text-align: center;
	margin-bottom: 0px;
}
#tab, #tab2{
	background-image: url("/resources/images/opacity_logo.png");
	background-size : 300px;
	background-repeat: no-repeat;
	background-position : center center;
	font-weight : bold;
	color : black;
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
            doc.save('취업딱대학교_등록금 고지서.pdf');
         });


   }
</script>
<body>
<div class="">
<div id="pdfButtonContainer">
   <button onclick="savePdf()" id="btn1" class="btn btn-my" style="padding: 8px 8px 6px;">PDF 저장</button>
</div>
   <div id="tabdiv1" class="card-body">
	<table id="tab" border='1'>
		<tr>
			<td colspan="4" id="header" style="color:inherit;">등록금 고지서 (학생용)
			<div class="headerDiv" id="header1"></div>
			</td>
		</tr>
		<tr>
			<td>학번</td>
			<td>${memberVO.memNo}</td>
			<td>학년</td>
			<td>${gradeInfo.stuYr}</td>
		</tr>
		<tr>
			<td>성명</td>
			<td id="td1">${memberVO.memNm}</td>
			<td>학과</td>
			<td>${department.depNm}</td>
		</tr>
		<tr>
			<td colspan="2">구분</td>
			<td>등록금(1)</td>
			<td>장학금(2)</td>
		</tr>
		<tr>
			<td colspan="2">입학금</td>
			<td class="right">0</td>
			<td class="right">0</td>
		</tr>
		<tr>
			<td colspan="2">수업료</td>
			<td class="right">4,150,500</td>
			<td class="right">100,000</td>
		</tr>
		<tr>
			<td colspan="2">납입금액(1)-(2)</td>
			<td colspan="2" id="td2" class="right">3,150,500<td>
		</tr>
		<tr>
			<td>납부계좌</td>
			<td colspan="3">우리 1002747911748</td>
		</tr>
		<tr>
			<td colspan="4" id="footer">
			    <div style="display: inline; padding-left: 12%; font-size: 20px;">취 업 딱 대 학 교 수 입 징 수 관</div>
			    <img class="markImg" alt="" src="/resources/master/light/assets/avatars/로고.png" style="display: inline; float: right;">
			</td>
		</tr>
	</table>
	<table id="tab" border='1'>
		<tr>
			<td colspan="4" id="header" style="color:inherit;">등록금 고지서 (은행용)
			<div class="headerDiv" id="header1"></div>
			</td>
		</tr>
		<tr>
			<td>학번</td>
			<td>${memberVO.memNo}</td>
			<td>학년</td>
			<td>${gradeInfo.stuYr}</td>
		</tr>
		<tr>
			<td>성명</td>
			<td id="td1">${memberVO.memNm}</td>
			<td>학과</td>
			<td>${department.depNm}</td>
		</tr>
		<tr>
			<td colspan="2">구분</td>
			<td>등록금(1)</td>
			<td>장학금(2)</td>
		</tr>
		<tr>
			<td colspan="2">입학금</td>
			<td class="right">0</td>
			<td class="right">0</td>
		</tr>
		<tr>
			<td colspan="2">수업료</td>
			<td class="right">4,150,500</td>
			<td class="right">100,000</td>
		</tr>
		<tr>
			<td colspan="2">납입금액(1)-(2)</td>
			<td colspan="2" id="td2" class="right">3,150,500<td>
		</tr>
		<tr>
			<td>납부계좌</td>
			<td colspan="3">우리 1002747911748</td>
		</tr>
		<tr>
			<td colspan="4" id="footer">
			    <div style="display: inline; padding-left: 12%;  font-size: 20px;">취 업 딱 대 학 교 수 입 징 수 관</div>
			    <img class="markImg" alt="" src="/resources/master/light/assets/avatars/로고.png" style="display: inline; float: right;">
			</td>
		</tr>
	</table>
	
	<br>
	</div>
   	<div class="col-12 center mt-5">
	  <button onclick="goBackToList()" class="btn btn-lg btn-my">목록 이동</button>
	</div>
</div>
   <script>
	function goBackToList() {
	   location.href = '/stu/payment';
	}
	</script>
</body>
