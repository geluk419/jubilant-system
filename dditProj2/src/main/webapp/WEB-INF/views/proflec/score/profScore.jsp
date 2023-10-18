<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
 .bg-123 {
 background-color: var(--my-color);
 }
 
</style>


<!-- 모달창 -->   
<div class="modal fade" id="varyModal" tabindex="-1" role="dialog" aria-labelledby="varyModalLabel" style="display: none;" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="varyModalLabel">성적 상세</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="attenBotWrap mt-5">
			<div>
				
				<div>
				<h5 class="card-title mt-5">
					<i class="mdi mdi-record-circle"></i>&ensp;학생 정보
				</h5>
					<table class="table table-bordered">
						<thead class="bg-my">
							<tr>
								<th>소속</th>
								<th>학번</th>
								<th>이름</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<input type="text" id="selColDep" class="form-control f9" disabled placeholder="학생을 선택하세요" />
								</td>
								<td>
									<input type="text" id="selMemNo" class="form-control f9" disabled placeholder="학생을 선택하세요" />
								</td>
								<td>
									<input type="text" id="selMemNm" class="form-control f9" disabled placeholder="학생을 선택하세요" />
								</td>
							</tr>
						</tbody>
					</table>
					
					<div class="informDetailTop mt-5">
					<div>
					<h5 class="card-title mt-5">
					<i class="mdi mdi-record-circle"></i>&ensp;출결 현황
					</h5>
						<table class="table datatables dataTable">
							<thead>
								<tr>
									<th class="bg-my">총 결석일</th>
									<th class="bg-my">출석</th>
									<th class="bg-my">지각</th>
									<th class="bg-my">조퇴</th>
									<th class="bg-my">결석</th>
									<th class="bg-my">공결</th>
									
								</tr>
							</thead>
							<tbody>
								<tr>
									<td id="totalAbsent">- 일</td>
									<td class="W">
										<input type="text" id="atenCome" class="form-control f9" disabled
										placeholder="학생의 출석일수가 보여집니다." />
									</td>
									<td class="W">
										<input type="text" id="atenLate" class="form-control f9" disabled
										placeholder="학생의 지각일수가 보여집니다." />
									</td>
									<td class="W">
										<input type="text" id="atenEarlyLeave" class="form-control f9" disabled
										placeholder="학생의 조퇴일수가 보여집니다." />
									</td>
									<td class="W">
										<input type="text" id="atenAbsent" class="form-control f9" disabled
										placeholder="학생의 결석일수가 보여집니다." />
									</td>
									<td class="W">
										<input type="text" id="atenOfiAbsent" class="form-control f9" disabled
										placeholder="학생의 공결일수가 보여집니다." />
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
					
					
					
					<h5 class="card-title mt-5">
					<i class="mdi mdi-record-circle"></i>&ensp;성적 상세 내역
					</h5>
					<div id="scoreDetail">
					<div class="alert alert-light bg-light" role="alert" style="font-size: 0.9em; padding: 15px 30px 15px; 20 px; border: 1px solid #eee;">
						학생의 상세 성적 내역을 확인하려면 위 수강생 목록에서 수강생을 클릭하세요.
					</div>
					</div>
					<div id="scoreDetailMax">
					</div>
				</div>
				
			</div>

				
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 모달 끝 --> 

<div class="col-lg-12 my-4">
	<div class="card shadow">
		<div class="card-body">
		<h5>강의관리 > 성적 관리</h5>
		
        <div class="alert alert-light bg-light border-0" role="alert" style="font-size: 0.9em; padding: 15px 30px 15px; 20 px; border: 1px solid #eee;">
			<p style="display: block; text-align: center; font-size: 1.1em;">&#8251;
				성적 전산처리 시스템 안내</p>
			<hr>
			<p>
				(1) 전체 교과목은 절대평가를 원칙으로 하며 수업계획서에 입력한 성적 평가 기준에 따라 총점이 책정됩니다.<br>
				(2) 최종성적을 부여하기 전 총점을 기준으로 집계된 수강생별 성적을 확인하십시오.<br> 
				(3) 학생을 클릭하여 학생의 성적	상세 내역(시험·과제)과 출결 현황을 확인할 수 있습니다.<br> 
				(4) 성적 처리 기간동안 성적을 부여할 수 있으며, 처리 즉시 수강생이 확인할 수 있음을 유념하시길 바랍니다.<br>
			</p>
			<p>
				<strong>평가성적</strong><br> ① 시험<br> ② 과제<br> ③ 출석 :
				결석허용한계는 총 수업시간의 1/3을 초과할 수 없으며, 초과 시 성적은 F로 처리됨.<br> 
				(지각3회 또는 조퇴 3회시 결석 1회로 산출)<br>
			</p>
			<strong>성적 처리 기준</strong>
			<table class="table table-bordered">
				<thead style="background: lightgray;">
					<tr>
						<th>시험</th>
						<th>과제</th>
						<th>출결</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>50</td>
						<td>40</td>
						<td>10</td>
					</tr>
				</tbody>
			</table>
		</div>
		<h5 class="card-title mt-5">
			<i class="mdi mdi-record-circle"></i>&ensp;${lecaNm} - 수강생 목록 
		</h5>
				<div id="listStu">
					<table class="table table-hover">
						<thead class="bg-my">
							<tr>
								<th width="50">No.</th>
								<th width="80">이름</th>
								<th width="100">학번</th>
								<th width="120">단과대학</th>
								<th width="100">학과</th>
								<th width="100">학년</th>
								<th style="text-align: center;">시험</th>
								<th style="text-align: center;">과제</th>
								<th style="text-align: center;">출결</th>
								<th width="120" style="text-align: center;">실점</th>
								<th width="120" style="text-align: center;">평점</th>
								<th width="70" style="padding-left: 5px; padding-right: 5px; text-align: center;">
									변경된<br>성적
								</th>
								<th width="70" style="padding-left: 5px; padding-right: 5px; text-align: center;">
									변경된<br>성적 등록
								</th>
								<th width="70" style="padding-left: 5px; padding-right: 5px; text-align: center;">
									기존<br>성적
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="scoreVO" items="${scoreVOList}"	varStatus="stat">
								<tr onclick="stuclick(this)">
									<td>${stat.count}</td>
									<td>${scoreVO.memNm}</td>
									<td>${scoreVO.memNo}</td>
									<td>${scoreVO.colNm}</td>
									<td>${scoreVO.depNm}</td>
									<td style="border-right: 1px solid lightgray;">${scoreVO.stuYr}</td>
									<td style="text-align: center;">${scoreVO.scoreTest}</td>
									<td style="text-align: center;">${scoreVO.scoreTask}</td>
									<td style="text-align: center; border-right: 1px solid lightgray;">${scoreVO.scoreAten}</td>
									<td style="text-align: center;">${scoreVO.scoreTest+scoreVO.scoreTask+scoreVO.scoreAten}</td>
									<td style="text-align: center;">${scoreVO.scoreAll}</td>
									<td style="text-align: center;"></td>
									<td>
										<button type="button" id="gradeRegist${stat.count}" class="btn btn-my" onclick="gradeRegist()" style="display: block; margin: 0 auto;">
											등록
										</button>
									</td>					
									<td style="text-align: center;">${scoreVO.codeScreGrade}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
		</div>
	</div>
</div>






<script>
const header = '${_csrf.headerName}';
const token =  '${_csrf.token}';

	const selMemNo = document.getElementById("selMemNo");
	const selMemNm = document.getElementById("selMemNm");
	const stuList = document.querySelector("#listStu");
	const atenCome = document.querySelector("#atenCome");
	const atenLate = document.querySelector("#atenLate");
	const atenEarlyLeave = document.querySelector("#atenEarlyLeave");
	const atenAbsent = document.querySelector("#atenAbsent");
	const atenOfiAbsent = document.querySelector("#atenOfiAbsent");
	const selColDep = document.querySelector("#selColDep");
	const scoreDetail = document.querySelector("#scoreDetail");
	const scoreDetailMax = document.querySelector("#scoreDetailMax");
	const totalAbsent = document.querySelector("#totalAbsent");
	
	var lecCode = "${lecCd}";
	
	
	
	
	

	function calculateAndSetGrade() {
	    var rows = document.querySelectorAll("#listStu tbody tr");

	    rows.forEach(function(row) {
	        
	        var totalScore = parseInt(row.cells[9].textContent);

	        var scoreAll = '0';
	        var grade = '';
	        if (totalScore >= 93) {
	            grade = 'A+';
	            scoreAll = '4.5';
	        } else if (totalScore >= 86) {
	            grade = 'A0';
	            scoreAll = '4.3';
	        } else if (totalScore >= 79) {
	            grade = 'A-';
	            scoreAll = '4.0';
	        } else if (totalScore >= 72) {
	            grade = 'B+';
	            scoreAll = '3.5';
	        } else if (totalScore >= 65) {
	            grade = 'B0';
	            scoreAll = '3.3';
	        } else if (totalScore >= 58) {
	            grade = 'B-';
	            scoreAll = '3.0';
	        } else if (totalScore >= 51) {
	            grade = 'C+';
	            scoreAll = '2.5';
	        } else if (totalScore >= 44) {
	            grade = 'C0';
	            scoreAll = '2.3';
	        } else if (totalScore >= 37) {
	            grade = 'C-';
	            scoreAll = '2.0';
	        } else if (totalScore >= 30) {
	            grade = 'D+';
	            scoreAll = '1.5';
	        } else if (totalScore >= 23) {
	            grade = 'D0';
	            scoreAll = '1.3';
	        } else if (totalScore >= 16) {
	            grade = 'D-';
	            scoreAll = '1.0';
	        } else {
	            grade = 'F';
	        }

	        row.cells[10].textContent = scoreAll;
	        row.cells[11].textContent = grade;
	        
	        if(row.cells[13].textContent.trim() !== '' && row.cells[11].textContent != row.cells[13].textContent){
	        	row.cells[13].textContent = row.cells[13].textContent;
	        }else if(row.cells[11].textContent == row.cells[13].textContent){
	        	row.cells[12].querySelector('button').style.display = 'none';
	        }
	    });
	}

	window.addEventListener('load', calculateAndSetGrade);

	
	
	

	window.addEventListener('load', setSelectedGrade);

	function setSelectedGrade() {
	    var selectElements = document.querySelectorAll("select[name='grade']");

	    selectElements.forEach(function(select) {
	        var selectedValue = select.getAttribute('data-selected-value'); 

	        var options = select.querySelectorAll("option");
	        options.forEach(function(option) {
	            if (option.value === selectedValue) {
	                option.selected = true;
	            }
	        });
	    });
	}

	//성적 등록 버튼을 누르면
	function gradeRegist(){
		let memNm = $(event.target).closest('tr').find("td:nth-child(2)").text();
		let memNo = $(event.target).closest('tr').find("td:nth-child(3)").text();
		
		let scoreTest = $(event.target).closest('tr').find("td:nth-child(7)").text();
		let scoreTask = $(event.target).closest('tr').find("td:nth-child(8)").text();
		let scoreAten = $(event.target).closest('tr').find("td:nth-child(9)").text();
		let scoreScore = $(event.target).closest('tr').find("td:nth-child(10)").text();
		let scoreAll = $(event.target).closest('tr').find("td:nth-child(11)").text();
		let codeScreGrade = $(event.target).closest('tr').find("td:nth-child(12)").text();
		
		console.log("codeScreGrade",codeScreGrade);
		console.log("memNo",memNo);
		
		let data = {
				lecCode : lecCode,
				memNo : memNo,
				codeScreGrade : codeScreGrade,
				memNm : memNm,
				scoreTest : scoreTest,
				scoreTask : scoreTask,
				scoreAten : scoreAten,
				scoreScore : scoreScore,
				scoreAll : scoreAll
			}
			console.log("체킁:",data);
		
		// 성적 유무확인
		$.ajax({
			url: "/prof/gradeCheck",
			type : 'post',
			contentType: "application/json",
			data : JSON.stringify(data),
			dataType : 'JSON',
		    beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
    		},		
			success : function(result) {
				console.log("result  : " + result);
				
				if(result != 0) {
					gradeUpdate(lecCode, memNo, codeScreGrade, memNm, scoreTest, scoreTask, scoreAten, scoreScore, scoreAll);
				}else {
					gradeInsert(lecCode, memNo, codeScreGrade, memNm, scoreTest, scoreTask, scoreAten, scoreScore, scoreAll);
				}
			}
			
		})
		
		// 성적 등록 
		function gradeInsert(lecCode, memNo, codeScreGrade, memNm, scoreTest, scoreTask, scoreAten, scoreScore, scoreAll) {
			
			$.ajax({
				url : "/prof/gradeInsert",
				type : 'post',
				contentType: "application/json",
				data : JSON.stringify({
					lecCode : lecCode,
					memNo : memNo,
					codeScreGrade : codeScreGrade,
					scoreTest : scoreTest,
					scoreTask : scoreTask,
					scoreAten : scoreAten,
					scoreScore : scoreScore,
					scoreAll : scoreAll
				}),
				dataType : 'JSON',
				beforeSend: function(xhr) {
		            xhr.setRequestHeader(header, token);
	    		},		
				success : function(result) {
					console.log("등록 성공");
					
					if(result) {
		  				Swal.fire({
		  					icon: "success",
		  					title: memNm + " 학생의 성적을 등록했습니다."
							}).then((rslt) => {
								location.href = "/prof/score?lecCode="+lecCode;
							})
		  			} else {
		        		Swal.fire({
		   					icon : "error",
		   					title : "성적을 등록하는 중 문제가 생겼습니다."
		   				})
		  			}
					
				}
			})
		}
		
		// 성적 수정
		function gradeUpdate(lecCode, memNo, codeScreGrade, memNm, scoreTest, scoreTask, scoreAten, scoreScore, scoreAll) {
			
			$.ajax({
				url : "/prof/gradeUpdate",
				type : 'put',
				contentType: "application/json",
				data : JSON.stringify({
					lecCode : lecCode,
					memNo : memNo,
					codeScreGrade : codeScreGrade,
					scoreTest : scoreTest,
					scoreTask : scoreTask,
					scoreAten : scoreAten,
					scoreScore : scoreScore,
					scoreAll : scoreAll
				}),
				dataType : 'JSON',
				beforeSend: function(xhr) {
		            xhr.setRequestHeader(header, token);
	    		},		
				success : function(result) {
					console.log("수정 성공");
					
					if(result) {
		  				Swal.fire({
		  					icon: "success",
		  					title: memNm + " 학생의 성적을 수정했습니다."
							}).then((rslt) => {
								location.href = "/prof/score?lecCode="+lecCode;
							})
		  			} else {
		        		Swal.fire({
		   					icon : "error",
		   					title : "성적을 수정하는 중 문제가 생겼습니다."
		   				})
		  			}
				}
			})
		}
	}
	
	// 성적 상세 내역 - 세부 점수
	function scoreAndMaxScore(memNo, lecCode) {
		$.ajax({
			url : "/prof/score/list/max",
			data : {
				"memNo" : memNo,
				"lecCode" : lecCode,
			},
			type : 'get',
			dataType : 'JSON',
			success : function(rslt) {
				console.log("rslt",rslt);
				
				let tblStr = '<table class="table table-bordered"><thead>';
				tblStr += "<tr>";
				tblStr += '<th class="bg-my">점수/총점</th>';
				tblStr += `<td>\${rslt[0].stuCurScore || '없음'}&emsp;/&emsp;\${rslt[0].lecScore || '없음'}</td>`;
				
				tblStr += '</tr>';
				tblStr += '</thead>';
				tblStr += '</table>';
				scoreDetailMax.innerHTML = tblStr;
			}
		})
	}
	
	
	//성적 상세 내역 - 평가
	function totalScoreDetail(memNo, lecCode) {
		$.ajax({
			url : "/prof/score/list/detail",
			type : 'get',
			data : {
				"memNo" : memNo,
				"lecCode" : lecCode
			},
			dataType : 'JSON',
			success : function(rslt) {
				
				let tblStr = '<table class="table table-bordered">';
					tblStr += '<thead class="bg-my">';
					tblStr += "<tr><th>구분</th><th>평가명</th><th>점수/총점</th></tr></thead><tbody>";
					
				for(let i=0; i<rslt.length; i++){
					tblStr += "<tr>";
					tblStr += `<td>\${rslt[i].div || '없음'}</td>`;
					tblStr += `<td>\${rslt[i].evelNm || '없음'}</td>`;
					tblStr += `<td>\${rslt[i].score || '없음'}</td>`;
					tblStr += "</tr>";
					
				}
				
				tblStr += '</tbody></table>';
				
				
				scoreDetail.innerHTML = tblStr;
			
			}
		})
	}
	
	
	
	
	
	// 해당 교수 강의 목록 > 수강생 목록 > cnt 조회
	function stuclick(pthis) {
	    const clickedElement = event.target;
	    
	    // 마지막 td 안의 요소 클릭 시 이벤트 중지
	    if (clickedElement.closest('td') === pthis.lastElementChild) {
	        event.stopPropagation();
	        return;
	    }
	    
		// 13번째 td 안의 요소 클릭 시 이벤트 중지
		if (clickedElement.closest('td') === pthis.querySelector('tr td:nth-child(13)')) {
		    event.stopPropagation();
		    return;
		}

		// 12번째 td 안의 요소 클릭 시 이벤트 중지
		if (clickedElement.closest('td') === pthis.querySelector('tr td:nth-child(12)')) {
		    event.stopPropagation();
		    return;
		}
	    
	    let memNm = pthis.children[1].innerText;
	    let memNo = pthis.children[2].innerText;
	    let col = pthis.children[3].innerText;
	    let dep = pthis.children[4].innerText;
	
	    $.ajax({
	        url: "/prof/atten/attendanceCnt",
	        type: 'get',
	        data: {
	            lecCode: lecCode,
	            memNo: memNo
	        },
	        dataType: 'JSON',
	        success: function (result) {
	        	console.log("result",result);
	        	
	            selMemNo.value = memNo;
	            selMemNm.value = memNm;
	            atenCome.value = result.attendenceVO.atenCome;
	            atenLate.value = result.attendenceVO.atenLate;
	            atenEarlyLeave.value = result.attendenceVO.atenEarlyLeave;
	            atenAbsent.value = result.attendenceVO.atenAbsent;
	            atenOfiAbsent.value = result.attendenceVO.atenOfiAbsent;
	            selColDep.value = col + " " + dep;
	            
                var late = parseInt(atenLate.value);
                var earlyLeave = parseInt(atenEarlyLeave.value);
                var absent = parseInt(atenAbsent.value);

                let count = (late + earlyLeave)/3
                absent = absent + parseInt(count);

                console.log("absent",absent);
                totalAbsent.innerHTML = absent;
            
                let codeScreGrade = "";
                
                switch(totalAbsent.value) {
				case 1:
					codeScreGrade = "F";
					break;
				case 2:
					codeScreGrade = "F";
					break;
				case 3:
					codeScreGrade = "F";
					break;
				default:
					codeScreGrade = "F";
				}

				totalScoreDetail(memNo, lecCode);
				scoreAndMaxScore(memNo, lecCode);
			}
		});

		$("#varyModal").modal();
	}
</script>