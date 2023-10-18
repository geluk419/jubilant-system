<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
/* table */
.table thead th {
	color: var(- -white-color);
	white-space: nowrap;
}

.info {
	display: inline-block;
	/* 	border: 1px solid black; */
}

.modal {
	background-color: rgba(0, 0, 0, 0.7); /* 회색 배경색 및 투명도 조절 */
	z-index: 999; /* 다른 요소 위로 표시 */
	display: none;
	position: fixed;
}

#modal-content {
	width: 730px;
	height: 800px;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* 그림자 효과 */
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%); /* 가운데 정렬 */
}

.close {
	position: absolute;
	top: 10px;
	right: 10px;
	font-size: 20px;
	cursor: pointer;
}

#nav-link {rgb (182, 26, 63)
	
}

/* 시간표 설정 */
#our_table td {
	width: 50px;
	height: 50px;
	text-align: center;
	vertical-align: middle;
	background-color: #ccc;
}

#our_table td.highlighted {
	background-color: #999;
}

#timeInfo {
	display: flex;
}

.nav-pills .nav-link.active {
	background-color: var(--my-color);
}

.nav-item a {
	color: var(--my-color);
}

.no-select {
    pointer-events: none; /* 마우스 이벤트 비활성화 */
    user-select: none; /* 텍스트 선택 비활성화 (선택 텍스트를 드래그하지 못하도록) */
}

#our_table td[style="background-color: rgb(182, 26, 63)"] {
 }
 
</style>

</head>
<body>
	<!-- 모달모달모달모달모달모달모달모달모달모달모달모달모달모달모달모달모달모달모달모달모달모달모달모달모달모달창 -->
	<div id="myModal" class="modal">
		<div class="modal-content" id="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<!-- 모달내용 -->
			<div class="card-body">
				<h5>강의계획서 작성</h5>
				<ul class="nav nav-pills nav-fill mb-3" id="pills-tab"
					role="tablist">
					<li class="nav-item"><a class="nav-link active"
						id="pills-home-tab" data-toggle="pill" href="#pills-home"
						role="tab" aria-controls="pills-home" aria-selected="true">기본
							사항 작성</a></li>
					<li class="nav-item"><a class="nav-link"
						id="pills-contact-tab" data-toggle="pill" href="#pills-contact"
						role="tab" aria-controls="pills-contact" aria-selected="false">시간표 선택</a></li>
				</ul>
				<div class="tab-content mb-1" id="pills-tabContent">
					<div class="tab-pane fade active show" id="pills-home"
						role="tabpanel" aria-labelledby="pills-home-tab">
						<p>개인정보</p>
						<table class="table">
							<tr>
								<td>담당교수</td>
								<td><input type="text" name="memNm" id="memNm"
									class="form-control" readonly></td>
								<td>교수소속</td>
								<td><input type="text" name="depName" id="depName"
									class="form-control" readonly></td>
							</tr>
							<tr>
								<td>학과전화</td>
								<td><input type="text" name="deTel" id="deTel"
									class="form-control" readonly></td>
								<td>교수전화</td>
								<td><input type="text" name="profTel" id="profTel"
									class="form-control" readonly></td>
							</tr>
						</table>
						<p>강의 기본사항</p>
						<table class="table">
							<tr>
								<td>년도</td>
								<td><select id="lecaYr" class="form-control" required>
										<option value="2023">2023</option>
								</select></td>
								<td>학기</td>
								<td><select id="lecaSem" class="form-control" required>
										<option value="1">1학기</option>
										<option value="2">2학기</option>
								</select></td>
							</tr>

							<tr>
								<td>대상학년</td>
								<td><select id="lecaTrg" class="form-control" required>
										<option value="1">1학년</option>
										<option value="2">2학년</option>
										<option value="3">3학년</option>
										<option value="4">4학년</option>
								</select></td>
								<td>학점</td>
								<td><select id="lecaCrd" class="form-control" required>
										<option value="1">1학점</option>
										<option value="2">2학점</option>
										<option value="3">3학점</option>
								</select></td>
							</tr>

							<tr>
								<td>강의명</td>
								<td><input type="text" id="lecaNm" class="form-control"
									required></td>

								<td>평가기준</td>
								<td><select id="lecaStdCode" class="form-control" required>
										<c:forEach var="leesCode" items="${leesCodeVO}">
											<option value="${leesCode.codeId}">${leesCode.codeNm}</option>
										</c:forEach>
								</select></td>
							</tr>

							<tr>
								<td>과목이름</td>
								<td><select id="subCode" onchange="getsubSeCode()"
									class="form-control" required>
										<c:forEach var="subject" items="${subjectVO}">
											<option value="${subject.subCode}"
												data-subsecode="${subject.subSeCode}">${subject.subNm}</option>
										</c:forEach>
								</select></td>
								<td>이수구분</td>
								<td><input type="text" id="lecaSeCode" class="form-control"
									readonly required></td>
							</tr>
							<tr>
								<td>강의총수업일수</td>
								<td><input type="number" id="lecaCount"
									class="form-control" required></td>
								<td>최대정원</td>
								<td><input type="number" id="lecaCap" class="form-control"
									required></td>
								<td>
							</tr>

						</table>
						<button class="btn btn-my" type="button" onclick="auto()">자동완성</button>
					</div>

					<div class="tab-pane fade" id="pills-contact" role="tabpanel"
						aria-labelledby="pills-contact-tab">
						<div>
							<p>시간표 선택</p>
							<select class="form-control"
								style="width: 180px; display: inline-block;" id="bldCode"
								onchange="updateRoomOptions()">
								<option>선택하세요</option>
								<c:forEach var="building" items="${buildingVO}">
									<option value="${building.bldCode}">${building.bldNm}</option>
								</c:forEach>
							</select> <select id="roomNo" class="form-control"
								style="width: 135px; display: inline-block;"
								onchange="getTime()">
								<option>선택하세요</option>
							</select>
						</div>
						<div id="timeInfo" class="mt-3">
							<div>
								<table id="our_table" class="table table-bordered mb-2">
									<tr>
										<th style="width: 70px;"></th>
										<th>월</th>
										<th>화</th>
										<th>수</th>
										<th>목</th>
										<th>금</th>
									</tr>
									<tr>
										<th>1교시</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th>2교시</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th>3교시</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th>4교시</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th>5교시</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th>6교시</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th>7교시</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th>8교시</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th>9교시</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</table>
								<button class="btn btn-my" type="button" id="timeTableBtn">시간
									선택하기</button>
							</div>


							<div class="ml-4">
								<p>희망시간</p>
								<textarea class="form-control" id="textArea4time" rows="10"
									cols="40" readonly>
							</textarea>
								<br />
								<button class="btn btn-my" id="btnlecIns" type="button"
									onclick="applyRegist()">강의계획서 등록</button>
								<button class="btn btn-my" id="btnlecUpd" type="button"
									style="display: none;" onclick="applyUpdate()">강의계획서
									수정</button>
								<input type="hidden" id="hiddenlecCode"></input> <input
									type="hidden" id="hiddenlecaId"></input>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 모달내용 -->
		</div>
	</div>
	<!-- 모달모달모달모달모달모달모달모달모달모달모달모달모달모달창모달모달모달모달모달모달모달모달모달모달 -->
	<div class="col-lg-12 my-4">

		<div class="card-footer">
			<div class="wrapper">
				<table>
					<tr>
						<td>교번</td>
						<td><input type="text" name="memNo" id="memNo"
							class="form-control" readonly></td>
						<td>성명</td>
						<td><input type="text" name="name" class="form-control"
							readonly></td>
						<td>연락처</td>
						<td><input type="text" name="tel" class="form-control"
							readonly></td>
						<td>소속</td>
						<td><input type="text" name="depNm" class="form-control"
							readonly></td>
					</tr>

					<tr>
						<td>직책</td>
						<td><input type="text" name="proNm" class="form-control"
							readonly></td>
						<td>재직상태</td>
						<td><input type="text" name="stat" class="form-control"
							readonly></td>
						<td>생년월일</td>
						<td><input type="text" name="birth" class="form-control"
							readonly></td>
					</tr>
				</table>
			</div>

			<div class="wrapper">
				<br /> 연도/학기<select name="getYrSem" id="getYrSem"
					class="form-control" style="width: 100px;"
					onchange="getListAgain()">
					<option value="">전체</option>
					<!-- b.LECA_YR, b.LECA_SEM -->
					<c:forEach var="yrsem" items="${yrsemList}">
						<option value="${yrsem.lecaYr}${yrsem.lecaSem}">${yrsem.lecaYr}/${yrsem.lecaSem}</option>
					</c:forEach>
				</select>

				<!-- 테이블에 강의 list 뿌리기 -->
				<div>
					<table class='table table-hover'>
						<thead class='bg-my text-black'>
							<tr class="text-center">
								<th>년도/학기</th>
								<th>학년</th>
								<th>강의명</th>
								<th>제한인원</th>
								<th>개설이수구분</th>
								<th>학점</th>
								<th>강의시간/강의실</th>
								<th>성적평가방식</th>
								<th>강의 승인여부</th>
								<th>취소</th>
							</tr>
						</thead>
						<tbody id="disp">

						</tbody>
					</table>
				</div>
				<!-- 테이블에 강의 list 뿌리기 -->
				<div class="text-right">
					<button type="button" class="btn btn-my" onclick="openModal()">강의계획서
						작성</button>
				</div>
			</div>
			<input id="csrf" type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</div>
	</div>
	<script>
	    function getTime(){
	    	let bldCode = document.querySelector("#bldCode").value;
	    	let roomNo = document.querySelector("#roomNo").value;
	    	let lecaYr = document.querySelector("#lecaYr").value;
	    	let lecaSem = document.querySelector("#lecaSem").value;
	    	
	    	let tableCells = document.querySelectorAll('#our_table td');
	        tableCells.forEach(cell => {
	        	cell.style.backgroundColor = "";
	        });
	    	
	    	console.log("bldCode",bldCode);
	    	console.log("roomNo",roomNo);
	    	lectureVO ={
	    			"bldCode":bldCode,
	    			"roomNo":roomNo,
	    			"lecaYr":lecaYr,
	    			"lecaSem":lecaSem
	    	}
	    	$.ajax({
				url:"/prof/getTime",
				type:"get",
				data:lectureVO,
				dataType:"json",
				beforeSend: function(xhr) {
	            	xhr.setRequestHeader(header, token);
	    		},
				success: function(lecSchedule){
		            getLight(lecSchedule);
		        },
				error: function (xhr, status, error) {
				    console.log("code: " + xhr.status)
				    console.log("message: " + xhr.responseText)
				    console.log("error: " + error);
				}
			})
	    }
	    
	    /* 중복시간표  */
	    function getLight(lecSchedule){
	    	console.log("췍췍",lecSchedule);
	    		
	    		 let tableCells = document.querySelectorAll('#our_table td');
			        tableCells.forEach(cell => {
			        	cell.classList.remove("highlighted");
			        });
					console.log("lecSchedule[0]",lecSchedule[0]);
					
//	 				강의 스케줄을 반복하며 해당 시간에 하이라이트
					lecSchedule.forEach(schedule => {
				        let lecdWeekfull = schedule.lecdWeek;
				        let lecdWeek = lecdWeekfull.replace("요일", "");  // 요일 ("월요일")
				        let lecdSt = schedule.lecdSt;     // 시작 교시 ("2교시")
				        let lecdEt = schedule.lecdEt;     // 종료 교시 ("6교시")
						console.log("lecdWeek",lecdWeek);
						console.log("lecdSt",lecdSt);
						console.log("lecdEt",lecdEt);

				        // 각 요일과 교시에 해당하는 테이블 셀을 찾아 하이라이트 적용
				        const dayIndex = {
				            '월': 0,
				            '화': 1,
				            '수': 2,
				            '목': 3,
				            '금': 4
				        }
				        const startHour = parseInt(lecdSt.substring(0, lecdSt.indexOf('교시')));
				        const endHour = parseInt(lecdEt.substring(0, lecdEt.indexOf('교시')));
				        console.log("startHour",startHour);
				        console.log("endHour",endHour);
				        
				        if (dayIndex.hasOwnProperty(lecdWeek) && !isNaN(startHour) && !isNaN(endHour)) {
				            for (let hour = startHour; hour <= endHour; hour++) {
				                const cellIndex = (hour - 1) * 5 + dayIndex[lecdWeek];
				                if (cellIndex >= 0 && cellIndex < tableCells.length) {
				                	 tableCells[cellIndex].style.backgroundColor = 'rgb(182, 26, 63)';
				                	 tableCells[cellIndex].classList.add('no-select');
				                }
				            }
				        }
				        
				    });
	    }
	    
	/* 자동완성 버튼 */
		function auto(){
			let lecaYrSelect = document.getElementById("lecaYr");
		    lecaYrSelect.value = "2023"; 
		    let lecaSemSelect = document.getElementById("lecaSem");
		    lecaSemSelect.value = "2"; 
		    let lecaTrgSelect = document.getElementById("lecaTrg");
		    lecaTrgSelect.value = "1"; 
		    let lecaCrdSelect = document.getElementById("lecaCrd");
		    lecaCrdSelect.value = "3"; 
		    let lecaNmInput = document.getElementById("lecaNm");
		    lecaNmInput.value = "경제학의 원리"; 
		    let lecaStdCodeSelect = document.getElementById("lecaStdCode");
		    lecaStdCodeSelect.value = "2"; 
		    let lecaCountInput = document.getElementById("lecaCount");
		    lecaCountInput.value = "32"; 
		    let lecaCapInput = document.getElementById("lecaCap");
		    lecaCapInput.value = "50";
		    let subCodeSelect = document.getElementById("subCode");
		    subCodeSelect.value = "MGMT2-03";
		    getsubSeCode();
		    let bldCodeSelect = document.getElementById("bldCode");
		    bldCodeSelect.value = "BLD_M_101";
		    updateRoomOptions();
		    let roomNoSelect = document.getElementById("roomNo");
		    roomNoSelect.value = "206";
		    getTime();
		}
	
		const header = '${_csrf.headerName}';
		const token =  '${_csrf.token}';
	
		//강의계획서 등록
		function applyRegist(){
			console.log("등록");
			/* 강의 계획서 기본사항 */
			let memNo = document.querySelector("#memNo").value;
// 			console.log("memNo!!",memNo);
			let subCode = document.querySelector("#subCode").value;
// 			console.log("subCode!!",subCode);
			let lecaYr  = document.querySelector("#lecaYr").value;
// 			console.log("lecaYr!!",lecaYr);
			let lecaSem  = document.querySelector("#lecaSem").value;
// 			console.log("lecaSem!!",lecaSem);
			let lecaNm = document.querySelector("#lecaNm").value;
// 			console.log("lecaNm!!",lecaNm);
			let lecaSeCode = document.querySelector("#lecaSeCode").value;
// 			console.log("lecaSeCode!!",lecaSeCode);
			let lecaTrg = document.querySelector("#lecaTrg").value;
// 			console.log("lecaTrg!!",lecaTrg);
			let lecaCrd = document.querySelector("#lecaCrd").value;
// 			console.log("lecaCrd!!",lecaCrd);
			let lecaCount = document.querySelector("#lecaCount").value;
// 			console.log("lecaCount!!",lecaCount);
			let lecaCap = document.querySelector("#lecaCap").value;
// 			console.log("lecaCap!!",lecaCap);
			let lecaStdCode = document.querySelector("#lecaStdCode").value;
// 			console.log("lecaStdCode!!",lecaStdCode);

			/* 강의 계획서 기본사항 */
			
			/* 시간표 사항 */
			let bldCode = document.querySelector("#bldCode").value;
// 			console.log("bldCode!!",bldCode);
			let roomNo = document.querySelector("#roomNo").value;
// 			console.log("roomNo!!",roomNo);
			console.log("timeTableData!!",timeTableData);
			/* 시간표 사항 */
			
			
			data ={
				memNo:memNo,
				subCode:subCode,
				lecaYr:lecaYr,
				lecaSem:lecaSem,
				lecaNm:lecaNm,
				lecaSeCode:lecaSeCode,
				lecaTrg:lecaTrg,
				lecaCrd:lecaCrd,
				lecaCount:lecaCount,
				lecaCap:lecaCap,
				lecaStdCode:lecaStdCode,
				bldCode:bldCode,
				roomNo:roomNo,
				timeTableData:timeTableData
			}
			
			
			 //data!!!!{memNo=202008P003, subCode=MGMT2-01, lecaYr=2023, lecaSem=1, lecaSeCode=전필, lecaTrg=1, lecaCrd=1, lecaCount=20, lecaCap=20, lecaStdCode=1, bldCode=BLD_A_101, roomNo=202, timeTableData=[{lecdWeek=월요일, lecdSt=1교시, lecdEt=2교시}, {lecdWeek=월요일, lecdSt=4교시, lecdEt=5교시}, {lecdWeek=금요일, lecdSt=1교시, lecdEt=2교시}, {lecdWeek=금요일, lecdSt=4교시, lecdEt=5교시}]}
			$.ajax({
				url:"/prof/insertLecApply",
				type:"post",
				data:JSON.stringify(data),
				contentType: "application/json",
				beforeSend: function(xhr) {
	            	xhr.setRequestHeader(header, token);
	    		},
				success:function(result){
					if (result="success"){
						Swal.fire({
	      					icon: "success",
	      					title: "강의가 등록되었습니다."
	                	}).then(result => {
							getListAgain();
	                		$("#myModal").hide();
	                	});
					}else{
						alert("실패");
					}
				},
				error: function (xhr, status, error) {
				    console.log("code: " + xhr.status)
				    console.log("message: " + xhr.responseText)
				    console.log("error: " + error);
				}
			})
		}
		
		//셀렉트 옵션 건물,호수 동적으로 
		function updateRoomOptions() {
			
			selectedBuildingCode = $("#bldCode").val();
			
			console.log("selectedBuildingCode",selectedBuildingCode);
			
			$.ajax({
				url:"/prof/roomNo",
				type:"get",
				async:false,
				data:{
					buildingCode: selectedBuildingCode
				},
				dataType:"json",
				beforeSend: function(xhr) {
	            	xhr.setRequestHeader(header, token);
	    		},
				success: function(rslt){
					let roomOptions = $("#roomNo");
		            roomOptions.empty(); // 기존 옵션을 모두 제거
		            
		            for (var i = 0; i < rslt.length; i++) {
		            	for(var j= 0;j< rslt[i].roomVO.length; j++)
		                roomOptions.append(`<option value="\${rslt[i].roomVO[j].roomNo}">\${rslt[i].roomVO[j].roomNo}</option>`);

		            }
		        }
			})
		}
		/* 이수구분 불러오기 */
		function getsubSeCode(){
			let selectedOption = document.querySelector("#subCode option:checked");
		    console.log("selectedOption",selectedOption);
		    let subSeCode = selectedOption.getAttribute("data-subsecode");
		    console.log("subSeCode",subSeCode);
		    // lecaSeCode input 요소에 값을 넣음
		    document.querySelector("#lecaSeCode").value = subSeCode;
		}
	
		//모달열기
		function openModal() {
			const modal = document.getElementById('myModal');
			modal.style.display = 'block';
			
			const btnlecIns = document.getElementById("btnlecIns");
		    const btnlecUpd = document.getElementById("btnlecUpd");
		    btnlecIns.style.display = "block";
		    btnlecUpd.style.display = "none";
			
			
			let xhr = new XMLHttpRequest();
			xhr.open("get", "/prof/getProf", true);
			xhr.beforeSend = function(request) {
			    request.setRequestHeader(header, token);
			};
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					//json객체로 바꿈
					let rslt = JSON.parse(xhr.responseText);

					$("#memNm").val(rslt[0].memNm);
					$("#depName").val(rslt[0].departmentVO[0].depNm);
					$("#deTel").val(rslt[0].departmentVO[0].depTel);
					$("#profTel").val(rslt[0].memTel);

				}
			}
			xhr.send();

		}

		//모달닫기
		function closeModal() {
			const modal = document.getElementById('myModal');
			modal.style.display = 'none';
			
			document.getElementById('lecaYr').selectedIndex = 0;
		    document.getElementById('lecaSem').selectedIndex = 0;
		    document.getElementById('lecaTrg').selectedIndex = 0;
		    document.getElementById('lecaCrd').selectedIndex = 0;
		    document.getElementById('lecaNm').value = '';
		    document.getElementById('lecaStdCode').selectedIndex = 0;
		    document.getElementById('subCode').selectedIndex = 0;
		    
		    document.getElementById('lecaSeCode').value = '';
		    document.getElementById('lecaCount').value = '';
		    document.getElementById('lecaCap').value = '';
		    $('#textArea4time').empty();
		    
		    let tableCells = document.querySelectorAll('#our_table td');
	        tableCells.forEach(cell => {
	        	cell.classList.remove("highlighted");
	        	cell.style.backgroundColor = "";
	        });
		    
	        timeTableData = [];
	        
		}

		const myList = document.querySelector("#disp");
		const getYrSem = document.querySelector("#getYrSem");
		
		/* 강의계획서 목록 select 옵션에 따라 보이기 */
		function getListAgain() {
		    // 드롭다운에서 선택한 값을 가져옵니다.
		    const lecaYrSem = document.getElementById("getYrSem").value;
		    const lecaYr = lecaYrSem.substring(0, 4); // 선택한 값에서 연도를 추출합니다.
		    const lecaSem = lecaYrSem.substring(4,5);
		    //lecaYrSem : 20232
		    console.log("lecaYrSem : " + lecaYrSem);
		    //lecaYr : 2023
		    console.log("lecaYr : " + lecaYr);
		    
		    console.log("lecaSem : " + lecaSem);
		
		    // http://localhost/lec/lecListSel?lecaYr=2023&lecaSem=2
		    let xhr = new XMLHttpRequest();
		    xhr.open("get", "/prof/lecListSel?lecaYr=" + lecaYr + "&lecaSem=" + lecaSem, true);
		    xhr.beforeSend = function(request) {
		        request.setRequestHeader(header, token);
		    };
		    xhr.onreadystatechange = function () {
		        if (xhr.readyState == 4 && xhr.status == 200) {
		            // JSON 응답을 파싱하고 목록을 업데이트합니다.
		            let rslt = JSON.parse(xhr.responseText);
		            console.log("rslt????????????",rslt);
		            updateList(rslt);
		            
		        }
		    }
		    xhr.send();
		}
		
		// 응답 데이터를 기반으로 목록을 업데이트하는 함수
		function updateList(data) {
		    console.log("data",data);
			let tblStr= '';
			for (let i = 0; i < data.length; i++) {
				let test = data[i]
				let testtt = JSON.stringify(test)
				tblStr += "<tr onclick=fmclick(this)>"
				tblStr += `<td style="display:none;">\${testtt}</td>`
		    	tblStr += `<td>\${data[i].lecaYr} \${data[i].lecaSem}</td>`
		        tblStr += `<td>\${data[i].lecaTrg}</td>`
		        tblStr += `<td>\${data[i].lecaNm}</td>`
		        tblStr += `<td>\${data[i].lecaCap}</td>`
		        tblStr += `<td>\${data[i].lecaSeCode}</td>`
		        tblStr += `<td>\${data[i].lecaCrd}</td>`
		        tblStr += "<td>"; // 강의시간/강의실 데이터 표시 부분 시작
		        for (let a = 0; a < data[i].lectureVOList.length; a++) {
		            const lecture = data[i].lectureVOList[a];
		            for (let b = 0; b < lecture.lectureDetailVO.length; b++) {
		                const detail = lecture.lectureDetailVO[b];
		                tblStr += `\${detail.lecdWeek} (\${detail.lecdSt}-\${detail.lecdEt}), `;
		            }
		             	tblStr += `강의실 : \${lecture.bldCode} \${lecture.roomNo}호`;
		        }
		        tblStr += "</td>"; // 강의시간/강의실 데이터 표시 부분 끝
		        tblStr += `<td>\${data[i].lecaStdCode == 1 ? '상대평가' : '절대평가' }</td>`;
		        if (data[i].lectureVOList[0].lecYn === 'Y') {
				    tblStr += `<td class="text-center"><span class='badge badge-pill badge-success pt-sm-2'>완료</span></td>`
					tblStr += "<td></td>"
		        } else if (data[i].lectureVOList[0].lecYn === 'N') {
				    tblStr += `<td class="text-center"><span class='badge badge-pill badge-warning pt-sm-2'>대기</span></td>`
			        tblStr += `<td><button class='btn btn-my' type='button' onclick='delLec(event)' data= '\${data[i].lecaId}'>취소</button></td>`
		        }
		        tblStr += "</tr>"
		    }
		   
		
		    // HTML 요소를 새로운 목록으로 업데이트합니다.
		    const myList = document.querySelector("#disp");
		    myList.innerHTML = tblStr;
		}
			getListAgain();
		
		const memNo = document.querySelector("input[name=memNo]");
		const name = document.querySelector("input[name=name]");
		const tel = document.querySelector("input[name=tel]");
		const depNm = document.querySelector("input[name=depNm]");
		const proNm = document.querySelector("input[name=proNm]");
		const stat = document.querySelector("input[name=stat]");
		const birth = document.querySelector("input[name=birth]");

		/* 교수 정보 리스트 */
		function getProf() {
			let xhr = new XMLHttpRequest();
			xhr.open("get", "/prof/getProf", true);
			xhr.beforeSend = function(request) {
			    request.setRequestHeader(header, token);
			};
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					
					let rslt = JSON.parse(xhr.responseText);
					console.log("rsltssssssss",rslt);
					memNo.value = rslt[0].memNo;
					name.value = rslt[0].memNm;
					tel.value = rslt[0].memTel;
					depNm.value = rslt[0].departmentVO[0].depNm;
					proNm.value = rslt[0].professorVO[0].proPosYN;
					stat.value = rslt[0].professorVO[0].codeProStat;
					birth.value = rslt[0].memBir;
				}
			}
			xhr.send();
		}
		getProf();
		
		//시간표 드래그 이벤트/////////////////////////////////////////////////////////////////////////////

		$(function () {
		      var isMouseDown = false;
		      $("#our_table td")
		        .mousedown(function () {
		          isMouseDown = true;
		          $(this).toggleClass("highlighted");
		          return false; // prevent text selection
		        })
		        .mouseover(function () {
		          if (isMouseDown) {
		            $(this).toggleClass("highlighted");
		          }
		        })
		        .bind("selectstart", function () {
		          return false; // prevent text selection in IE
		        });

		      $(document)
		        .mouseup(function () {
		          isMouseDown = false;
		        });
		    });
		
		
		var timeTableData = [];
		
		$(document).ready(function(){
			$('#timeTableBtn').on('click', function() {
			
				console.log("짜짠");
				timeTableData = [];
				
				$('#textArea4time').empty();
				timeTable = $('#our_table');
				str = '';
				
				for(j = 0; j <= 4; j++) {
					for(i = 1; i <= 9; i++) {
						cellObj = timeTable.find("tr").eq(i).find("td").eq(j);
						
						if(cellObj.hasClass("highlighted")) {
							
							if(j == 0) {
								str += "월요일 " + i + "교시\n";
							}else if(j == 1) {
								str += "화요일 " + i + "교시\n";
							}else if(j == 2) {
								str += "수요일 " + i + "교시\n";
							}else if(j == 3) {
								str += "목요일 " + i + "교시\n";
							}else if(j == 4) {
								str += "금요일 " + i + "교시\n";
							}
						}
					}
				}
				
				$('#textArea4time').append(str);

				
				let table = document.getElementById('our_table');
				let daysOfWeek = ["월요일", "화요일", "수요일", "목요일", "금요일"]; // 요일 목록

				for (let i = 1; i < table.rows[0].cells.length; i++) {
				    let lecdWeek = daysOfWeek[i - 1]; // 요일 정보
				    let lecdSt = ""; 
				    let lecdEt = ""; 
				    
				    for (let j = 1; j < table.rows.length; j++) {
				        let cell = table.rows[j].cells[i];
				        if (cell.classList.contains('highlighted')) {
				            if (lecdSt === "") {
				            	lecdSt = table.rows[j].cells[0].textContent.trim(); // 첫 번째 highlighted 셀의 시작 시간
				            }
				            lecdEt = table.rows[j].cells[0].textContent.trim(); // 계속해서 업데이트하여 종료 시간 설정
				        } else if (lecdSt !== "") {
				            timeTableData.push({
				            	lecdWeek: lecdWeek,
				            	lecdSt: lecdSt,
				            	lecdEt: lecdEt
				            });
				            lecdSt = ""; // 시작 시간 초기화
				            lecdEt = ""; // 종료 시간 초기화
				        }
				    }
				    // 마지막 셀이 highlighted로 끝나는 경우를 처리
				    if (lecdSt !== "") {
				        timeTableData.push({
				        	lecdWeek: lecdWeek,
				        	lecdSt: lecdSt,
				        	lecdEt: lecdEt
				        });
				        
				    }
				}

				console.log("timeTableData!!!!", timeTableData);
				console.log("timeTableData!!!!!!", timeTableData[0].lecdWeek);
			});
		})
		
		function fmclick(pthis){
			
			
			console.log("체크체크");
		    openModal();
		    
		    btnlecIns.style.display = "none";
		    btnlecUpd.style.display = "block";
		    
			test = pthis.children[0].innerText;
//     		console.log("test", test);
			data = JSON.parse(test)
    		console.log("data", data);
			hiddenlecaId.value = data.lecaId;
			console.log("hiddenlecaId",hiddenlecaId);
			hiddenlecCode.value = data.lectureVOList[0].lecCode;
			console.log("hiddenlecCode",hiddenlecCode);
			lecanm = data.lecaNm;
			lecaNm.value = lecanm;
			lecayr = data.lecaYr;
			lecasem = data.lecaSem;
//     		console.log("lecasem", lecasem);
			lecatrg = data.lecaTrg;
			lecacrd = data.lecaCrd;
			lecaStdcode = data.lecaStdCode;
			subCode.value = data.subCode;
			getsubSeCode();
			lecaCount.value = data.lecaCount;
			lecaCap.value = data.lecaCap;
			selectedBuilding = data.lectureVOList[0].bldCode;
			selectedRoom = data.lectureVOList[0].roomNo;
    		console.log("selectedRoom", selectedRoom);
			const lecSchedule = data.lectureVOList[0].lectureDetailVO;
    		console.log("lecSchedule", lecSchedule);
    		console.log("lecSchedulelength", lecSchedule.length);
    		
 			for (let i = 0; i < lecaYr.options.length; i++) {
		        if (lecaYr.options[i].value == lecayr) {
		            lecaYr.options[i].selected = true;
		            break; 
		        }
		    }
		    for (let i = 0; i < lecaSem.options.length; i++) {
		        if (lecaSem.options[i].value == lecasem) {
		            lecaSem.options[i].selected = true;
		            break; 
		        }
		    }
		    for (let i = 0; i < lecaTrg.options.length; i++) {
		        if (lecaTrg.options[i].value == lecatrg) {
		        	lecaTrg.options[i].selected = true;
		            break; 
		        }
		    }
		    for (let i = 0; i < lecaCrd.options.length; i++) {
		        if (lecaCrd.options[i].value == lecacrd) {
		        	lecaCrd.options[i].selected = true;
		            break; 
		        }
		    }
		    for (let i = 0; i < lecaStdCode.options.length; i++) {
		        if (lecaStdCode.options[i].value == lecaStdcode) {
		        	lecaStdCode.options[i].selected = true;
		            break; 
		        }
		    }
			
		    for (let i = 0; i < bldCode.options.length; i++) {
 			    if (bldCode.options[i].value == selectedBuilding) {
 			        bldCode.options[i].selected = true;
 			        break;
 			    }
 			}
 		    updateRoomOptions();
		    
		    for (let i = 0; i < roomNo.options.length; i++) {
// 			    	console.log("체크",roomNo.options[i].value, selectedRoom);
			    if (roomNo.options[i].value == selectedRoom) {
			    	console.log("roomNo.options[i].value",roomNo.options[i].value);
			    	console.log("roomNo.options[i]",roomNo.options[i]);
			    	roomNo.options[i].selected = true;
			    	break;
			    }
			}
		    
		    function highlightSchedule(lecSchedule) {
		        // 초기화: 모든 테이블 셀의 스타일을 초기화
				console.log("왔니");
				console.log("lecSchedule",lecSchedule);
		    
		        let tableCells = document.querySelectorAll('#our_table td');
		        tableCells.forEach(cell => {
		        	cell.classList.remove("highlighted");
		        });
				console.log("lecSchedule[0]",lecSchedule[0]);
				
// 				강의 스케줄을 반복하며 해당 시간에 하이라이트
				lecSchedule.forEach(schedule => {
			        let lecdWeekfull = schedule.lecdWeek;
			        let lecdWeek = lecdWeekfull.replace("요일", "");  // 요일 ("월요일")
			        let lecdSt = schedule.lecdSt;     // 시작 교시 ("2교시")
			        let lecdEt = schedule.lecdEt;     // 종료 교시 ("6교시")
					console.log("lecdWeek",lecdWeek);
					console.log("lecdSt",lecdSt);
					console.log("lecdEt",lecdEt);

			        // 각 요일과 교시에 해당하는 테이블 셀을 찾아 하이라이트 적용
			        const dayIndex = {
			            '월': 0,
			            '화': 1,
			            '수': 2,
			            '목': 3,
			            '금': 4
			        }
			        const startHour = parseInt(lecdSt.substring(0, lecdSt.indexOf('교시')));
			        const endHour = parseInt(lecdEt.substring(0, lecdEt.indexOf('교시')));
			        console.log("startHour",startHour);
			        console.log("endHour",endHour);
			        
			        if (dayIndex.hasOwnProperty(lecdWeek) && !isNaN(startHour) && !isNaN(endHour)) {
			            for (let hour = startHour; hour <= endHour; hour++) {
			                const cellIndex = (hour - 1) * 5 + dayIndex[lecdWeek];
			                if (cellIndex >= 0 && cellIndex < tableCells.length) {
			                	tableCells[cellIndex].classList.add("highlighted"); // 원하는 하이라이트 색상으로 변경
			                	isMouseDown = true;
			                	
			                }
			            }
			        }
			        
			    });
				 document.getElementById("timeTableBtn").click();
			}
		    highlightSchedule(lecSchedule);
		}
		
		function applyUpdate(){
			
			console.log("등록");
			/* 강의 계획서 기본사항 */
			let subCode = document.querySelector("#subCode").value;
			let lecaYr  = document.querySelector("#lecaYr").value;
			let lecaSem  = document.querySelector("#lecaSem").value;
			let lecaNm = document.querySelector("#lecaNm").value;
			let lecaSeCode = document.querySelector("#lecaSeCode").value;
			let lecaTrg = document.querySelector("#lecaTrg").value;
			let lecaCrd = document.querySelector("#lecaCrd").value;
			let lecaCount = document.querySelector("#lecaCount").value;
			let lecaCap = document.querySelector("#lecaCap").value;
			let lecaStdCode = document.querySelector("#lecaStdCode").value;
			let lecCode = document.querySelector("#hiddenlecCode").value
			let lecaId = document.querySelector("#hiddenlecaId").value
			console.log("lecCode",lecCode);
			console.log("lecaId",lecaId)
			
			/* 강의 계획서 기본사항 */
			
			/* 시간표 사항 */
			let bldCode = document.querySelector("#bldCode").value;
			let roomNo = document.querySelector("#roomNo").value;
			console.log("timeTableData!!",timeTableData);
			/* 시간표 사항 */
			
			
			data ={
				lecaId:lecaId,
				lecCode:lecCode,
				subCode:subCode,
				lecaYr:lecaYr,
				lecaSem:lecaSem,
				lecaNm:lecaNm,
				lecaSeCode:lecaSeCode,
				lecaTrg:lecaTrg,
				lecaCrd:lecaCrd,
				lecaCount:lecaCount,
				lecaCap:lecaCap,
				lecaStdCode:lecaStdCode,
				bldCode:bldCode,
				roomNo:roomNo,
				timeTableData:timeTableData
			}
			$.ajax({
				url:"/prof/updateLecApply",
				type:"post",
				data:JSON.stringify(data),
				contentType: "application/json",
				beforeSend: function(xhr) {
	            	xhr.setRequestHeader(header, token);
	    		},
				success:function(result){
					if (result="success"){
						alert("성공");
						getListAgain();
					}else{
						alert("실패");
					}
				},
				error: function (xhr, status, error) {
				    console.log("code: " + xhr.status)
				    console.log("message: " + xhr.responseText)
				    console.log("error: " + error);
				}
			})
			
		}
		
		function delLec(event){
			event.stopPropagation();
			console.log("체크123");	
			var lecaId = event.target.getAttribute('data');
			console.log("체크lecaId",lecaId);	
			console.log(typeof lecaId);
			
			Swal.fire({
				   text: '강의 등록을 취소하시겠습니까?',
				   icon: 'warning',
				   
				   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
				   
				   
				}).then(result => {
				   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
				   $.ajax({
						url:"/prof/delLec",
						type:"post",
						data: {"lecaId":lecaId},
// 						dataType:"json",
						beforeSend: function(xhr) {
			            	xhr.setRequestHeader(header, token);
			    		},
						success:function(result){
								getListAgain();
						},
						error: function (xhr, status, error) {
						    console.log("code: " + xhr.status)
						    console.log("message: " + xhr.responseText)
						    console.log("error: " + error);
						}
					})
					   
				   }
				});
		}
	</script>
</body>
</html>


