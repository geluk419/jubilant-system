<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.wrapper {
	border: 1px solid black;
}
.info{
	display: inline-block;
	border: 1px solid black;
}
</style>
</head>
<body>
	<div class="wrapper">
		<div class="wrapper">
			<div class="info">
				<p>교번</p>
				<p>직책</p>
			</div>
			<div class="info">
				<p>1</p>
				<p>학과장</p>
			</div>
			
			<div class="info">
				<p>성명</p>
				<p>재직상태</p>
			</div>
			<div class="info">
				<p>김철수</p>
				<p>재직</p>
			</div>
			<div class="info">
				<p>연락처</p>
				<p>생년월일</p>
			</div>
			<div class="info">
				<p>010-1234-1234</p>
				<p>1992-03-15</p>
			</div>
			<div class="info">
				<p>소속</p>
			</div>
			<div class="info">
				<p>경제학과</p>
			</div>
		
		</div>

		<div class="wrapper">
			<p>연도/학기</p>
			<select name="yr_sem">
				<option>전체</option>
				<option>전체</option>
				<option>전체</option>
				<option>전체</option>
			</select>
			
			<!-- 테이블에 강의 list 뿌리기 -->
			<div id="disp">
			
			</div>	
			
			<button type="button">강의계획서 작성</button>
		</div>
	</div>

<script>
	const myList = document.querySelector("#disp");

	function getList() {
		let xhr = new XMLHttpRequest();
		xhr.open("get","/lec/lecListAll",true);
		xhr.onreadystatechange= function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				//json객체로 바꿈
				console.log("나와랑제발 나와라",xhr.responseText);
				let rslt = JSON.parse(xhr.responseText);
				console.log("나왔다!!!",rslt);
				
				let tblStr = "<table border=1>";
				tblStr += "<tr><th>년도/학기</th><th>학년</th><th>강의명</th><th>제한인원</th><th>개설이수구분</th><th>학점</th><th>강의시간/강의실</th><th>성적평가방식</th><th>계획서 상태</th><th>계획서</th></tr>"
				for(let i=0; i<rslt.length;i++){
					tblStr+= "<tr>"
					tblStr+= `<td>\${rslt[i].lecaYr} \${rslt[i].lecaSem}</td>`
					tblStr+= `<td>\${rslt[i].lecaTrg}</td>`
					tblStr+= `<td>\${rslt[i].lecaNm}</td>`
					tblStr+= `<td>\${rslt[i].lecaCap}</td>`
					tblStr+= "</tr>"
				}
				tblStr +="</table>";
				myList.innerHTML = tblStr;
				
			}
		}
		xhr.send();
	}
	getList();

</script>
</body>
</html>