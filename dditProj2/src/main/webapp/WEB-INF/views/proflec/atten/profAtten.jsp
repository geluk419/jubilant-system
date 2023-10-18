<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
 .bg-123 {
 background-color: var(--my-color);
 }
 
</style>

<div class="col-lg-12 my-4">
	<div class="card shadow">
		<div class="card-body">
			<h5>강의관리 > 출결 관리</h5>

			<div class="alert alert-light bg-light border-0" role="alert" style="font-size: 0.9em; padding: 15px 30px 15px; 20 px; border: 1px solid #eee;">
				<p style="display: block; text-align: center; font-size: 1.1em;">
					출결표</p>
				<hr>
				<p>
					(1) 변경 또는 출결을 등록하고 싶은 날짜를 선택합니다.
				</p>
				<p>
					(2) 출결구분 <strong>선택박스를 선택</strong>하고 저장 버튼을 클릭하여 출결을 저장합니다.
				</p>
			</div>


			<h5 class="card-title mt-5">
				<i class="mdi mdi-record-circle"></i>&ensp;${lecaNm} - 수강생 목록
			</h5>
			<div>
			<div>
				<span>강의 날짜 선택 :&ensp;&ensp;&ensp;</span>
				<select id="date" class="form-control col-sm-2 d-inline">
					<option value="null" selected>&nbsp;-</option>
				</select>
				<div class="form-check">
                  <input class="form-check-input" type="checkbox" value="" id="allCheck">
                  <label class="form-check-label" for="allCheck"> 출석 전체선택 </label>
                </div>
				</div>
				<div id="listStu">
					<table class="table table-hover">
						<thead class="bg-my">
							<tr>
								<th>No.</th>
								<th>출결구분</th>
								<th>이름</th>
								<th>학번</th>
								<th>단과대학</th>
								<th>학과</th>
								<th>학년</th>
								<th>연락처</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="attendenceVO" items="${attendenceVOList}"	varStatus="stat">
								<tr>
									<td>${stat.count}</td>
									<td><select style="width: 100px;" name="atenCate" class="atenCate form-control">
											<option value="null">&nbsp;-</option>
											<option value="atenCome" selected>출석</option>
											<option value="atenLate">지각</option>
											<option value="atenEarlyLeave">조퇴</option>
											<option value="atenAbsent">결석</option>
											<option value="atenOfiAbsent">공결</option>
									</select></td>
									<td>${attendenceVO.memNm}</td>
									<td>${attendenceVO.memNo}</td>
									<td>${attendenceVO.colNm}</td>
									<td>${attendenceVO.depNm}</td>
									<td>${attendenceVO.stuYr}</td>
									<td>${attendenceVO.memTel}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div>
					<button type='button' class='btn mb-2 btn-my' onclick="save()">저장</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
const header = '${_csrf.headerName}';
const token =  '${_csrf.token}';

	const stuList = document.querySelector("#listStu");
	const lecList = document.querySelector("#listLec");
	const prufList = document.querySelector("#listPruf");
	const atenCome = document.querySelector("#atenCome");
	const atenLate = document.querySelector("#atenLate");
	const atenEarlyLeave = document.querySelector("#atenEarlyLeave");
	const atenAbsent = document.querySelector("#atenAbsent");
	const atenOfiAbsent = document.querySelector("#atenOfiAbsent");
	const fitTable = document.querySelector(".fitTable");
	const atenCate = document.querySelector(".atenCate");
	const date = document.querySelector("#date");
	
	var lecCode = "${lecCd}";
	
	
	//출석 전체 선택
	$('#allCheck').click(function(){
		var checked = $('#allCheck').is(':checked');
		
		if(checked){
			let str="";
			str += '<option value="null">&nbsp;-</option>';
            str += '<option value="atenCome" selected>출석</option>';
            str += '<option value="atenLate">지각</option>';
            str += '<option value="atenEarlyLeave">조퇴</option>';
            str += '<option value="atenAbsent">결석</option>';
            str += '<option value="atenOfiAbsent">공결</option>';
            
            let trs = document.querySelectorAll("#listStu table tbody tr");
            for (let j = 0; j < trs.length; j++) {
            	trs[j].querySelector(".atenCate").innerHTML = str;
            }
		}else{
			let str="";
			str += '<option value="null" selected>&nbsp;-</option>';
            str += '<option value="atenCome">출석</option>';
            str += '<option value="atenLate">지각</option>';
            str += '<option value="atenEarlyLeave">조퇴</option>';
            str += '<option value="atenAbsent">결석</option>';
            str += '<option value="atenOfiAbsent">공결</option>';
            
            let trs = document.querySelectorAll("#listStu table tbody tr");
            for (let j = 0; j < trs.length; j++) {
            	trs[j].querySelector(".atenCate").innerHTML = str;
            }
		}
	});
	
	// 저장 버튼 눌렀을 때
	async function save() {
	    const atenCateElements = document.querySelectorAll('.atenCate');
	    const atenDe = document.querySelector("#date").value;
	
	    const promises = [];
	
	    for (const element of atenCateElements) {
	        const memNo = element.closest('tr').querySelector("td:nth-child(4)").textContent;
	        let codeAtenSe = "";
	
	        switch (element.value) {
	            case "atenCome": codeAtenSe = "1"; break;
	            case "atenLate": codeAtenSe = "2"; break;
	            case "atenEarlyLeave": codeAtenSe = "3"; break;
	            case "atenAbsent": codeAtenSe = "4"; break;
	            case "atenOfiAbsent": codeAtenSe = "5"; break;
	        }
	        console.log("codeAtenSe", codeAtenSe);
	
	        const record = {
	            lecCode: lecCode,
	            memNo: memNo,
	            codeAtenSe: codeAtenSe,
	            atenDe: atenDe,
	            atenRsn: 'N',
	            atenPruf: 'N'
	        };
	
	        const promise = attenChkCnt(record);
	        promises.push(promise);
	    }
	
	    await Promise.all(promises);
	
	    Swal.fire({
	        icon: "success",
	        title: "출결이 정상적으로 저장되었습니다."
	    });
	}
	
	//출결 유무 확인
	async function attenChkCnt(record) {
		try {
	        const result = await sendAjaxRequest("/prof/atten/cnt", "POST", record);
	        if (result !== 0) {
	            await attenUpdate(record);
	        } else {
	            await attenInsert(record);
	        }
	        return true;
	    } catch (error) {
	        return false;
	    }
	}
	    	
		// 출결구분 등록 
		async function attenInsert(record) {
		    await sendAjaxRequest('/prof/atten', 'post', record);
		}
		
		// 출결구분 수정
		async function attenUpdate(record) {
			 await sendAjaxRequest('/prof/atten', 'put', record);
		}
		
		// AJAX 요청
		async function sendAjaxRequest(url, method, data) {
		    try {
		        const result = await $.ajax({
		            url: url,
		            type: method,
		            contentType: "application/json",
		            data: JSON.stringify(data),
		            dataType: 'JSON',
		            beforeSend: function (xhr) {
		                xhr.setRequestHeader(header, token);
		            }
		        });
		        return result;
		    } catch (error) {
		        console.error("에러 발생:", error);
		        throw error;
		    }
		}
	
	// 강의 날짜 생성
	  $(document).ready(function () {
		  var lecCount= 32;
		  
		  // 강의가 있는 요일 (금요일: 5)
	      const lectureDays = [3,5];
	
	      // 강의 주차 수 
	      const numberOfWeeks = 16;
	      
	  	  // 개강일
	      let firstLectureDate = new Date(2023, 8, 1); 
	      
	      const lectureSchedule = [];
	
	      const lectureScheduleFom = [];
	      
	      const today = new Date();
		  console.log("today",today);
		  
		  const customDate = new Date();
		  customDate.setMonth(9); 
		  customDate.setDate(17);
		  console.log("customDate",customDate);
	      
	      for (let week = 1; week <= numberOfWeeks; week++) {
	        for (const day of lectureDays) {
	          const lectureDate = new Date(firstLectureDate);
	          lectureDate.setDate(firstLectureDate.getDate() + (week-1) * 7 + (day - firstLectureDate.getDay() + 7) % 7);
	          
	          if (lectureDate < customDate) {
	                lectureSchedule.push(lectureDate);
	            }
	        }
	      }
	      
	      lectureSchedule.sort((a, b) => a - b);
	
	      for (const date of lectureSchedule) {
	      	const year = date.getFullYear();
	      	  const month = (date.getMonth() + 1).toString().padStart(2, '0');
	      	  const day = date.getDate().toString().padStart(2, '0');
	      	  const atenDe = `\${year}-\${month}-\${day}`;
	      	  
	      	  lectureScheduleFom.push(atenDe);
	      }
	      
			if(lectureSchedule != null){
				
				var str = "";
				
	          for (let i = 0; i < lecCount; i++) {
	          	if (lectureSchedule[i] != null) {
	          		str += `<option value="\${lectureScheduleFom[i]}">\${lectureScheduleFom[i]}</option>`;
	              }
	          }
	          date.innerHTML = str;
	          
	          attenListByDate();
			}
	  });
		
	  $(document).on('change', '#date' ,function() {
		  $('#allCheck').prop('checked', false);
		  attenListByDate();
	  });
	
	//해당 날짜 출결 목록
	function attenListByDate() {
		console.log("date.value",date.value);
		console.log("lecCode",lecCode);
		
		$.ajax({
			url : "/prof/attenListByDate",
			type : 'get',
			data : {
				lecCode : lecCode,
				atenDe : date.value,
			},
			dataType : 'JSON',
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
  			},		
			success : function(result) {
				console.log("해당날짜",result);
				
				let str="";
				str += '<option value="null">&nbsp;-</option>';
                str += '<option value="atenCome">출석</option>';
                str += '<option value="atenLate">지각</option>';
                str += '<option value="atenEarlyLeave">조퇴</option>';
                str += '<option value="atenAbsent">결석</option>';
                str += '<option value="atenOfiAbsent">공결</option>';
                
                let trs = document.querySelectorAll("#listStu table tbody tr");
                   for (let j = 0; j < trs.length; j++) {
                   	trs[j].querySelector(".atenCate").innerHTML = str;
                   }
				
				for(let i=0; i<result.length; i++){
					let selectedOption = result[i].codeAtenSe;
           			
	            	let str="";
	            	str += '<option value="null">&nbsp;-</option>';
                    str += '<option value="atenCome" ' + (selectedOption == "1" ? "selected" : "") + '>출석</option>';
                    str += '<option value="atenLate" ' + (selectedOption == "2" ? "selected" : "") + '>지각</option>';
                    str += '<option value="atenEarlyLeave" ' + (selectedOption == "3" ? "selected" : "") + '>조퇴</option>';
                    str += '<option value="atenAbsent" ' + (selectedOption == "4" ? "selected" : "") + '>결석</option>';
                    str += '<option value="atenOfiAbsent" ' + (selectedOption == "5" ? "selected" : "") + '>공결</option>';
                    
                    let trs = document.querySelectorAll("#listStu table tbody tr");
                    for (let j = 0; j < trs.length; j++) {
                        let memNo = trs[j].querySelector("td:nth-child(4)").textContent;
                        if (memNo == result[i].memNo) {
                            let selectElement = trs[j].querySelector(".atenCate");
                            if (selectElement) {
                                selectElement.innerHTML = str;
                            }
                        }
                    }
				}
			}
		})
	}
	
</script>