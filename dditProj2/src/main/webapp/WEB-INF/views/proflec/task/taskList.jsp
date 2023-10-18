<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<style>
div {
	border: 0px solid black;
}

#wrapper{
	display: flex;
	width: 100%;
	padding: 0;
}

#taskList {
	position:relative;
	width:50%;
	padding: 1rem;
	overflow-y: scroll;
}

#form_wrap {
	position: relative;
	width:50%;
	padding:1rem;
}

.full_input {
	position:relative;
	width:100%;
	display:inline-flex;
	margin-bottom:1rem;
	font-size:14px;
	align-items:center;
}

.full_input label {
	width:10%;
 	font-weight:500;
	color:#001a4e;
	margin-bottom:0;
}

.full_input input {
	width:90%;
	font-weight:400;
	color:#495057;
}

.edit_date {
	flex-direction:column;
	align-items:flex-end;
}

.edit_date p {
	margin-bottom:0;c
}

.content_edit {position:relative; width:100%; display:block; font-size:14px; margin-bottom:1rem; font-weight:400;}
.content_edit span {font-weight:500;
	color:#001a4e;
}
.content_edit textarea {position:relative; width:100%;}

#divFileId {position:relative; width:100%; display:block; margin-bottom:1rem;}
</style>

</head>

<body>
	<div id="wrapper" class="card-footer">
		<div id="taskList" class="card-body">
			<!-- 테이블나오는곳 -->
		</div>
			
		<div class="card-body" id="form_wrap">
			<form name="dataForm" id="dataForm" onsubmit="task()">
				<input type="hidden" name=lecCode id="hiddenLecCode" value="${lecCd}">
				<input type="hidden" name=taskCode id="hiddentaskCode" value="">
				
				<div class="full_input">
					<label for="lecnTtl">과제이름</label>
					<input type="text" class="form-control" id="taskNm" name="taskNm" required > 
				</div>
				
				<div class="full_input edit_date">
					<p>
						등록일 : <span id="taskDe"></span>
					</p>
					<p>
						수정일 : <span id="taskUpdde"></span>
					</p>
				</div>
				
				<div class="content_edit">
					<span>과제내용</span>
					<textarea id="description" class="form-control" rows="25" cols="90" required ></textarea>
				</div>
				
				<div class="full_input">
					<label for="taskDead">마감일자</label>
					<input type="date" class="form-control" name="taskDead" required>
				</div>
				
				<div class="full_input">
					<label for="taskScore">과제점수</label>
					<input type="number" class="form-control" name="taskScore" required>
				</div>
				<input id="input_file" type=file multiple="multiple" name="taskFiles" value="">
				<input type="hidden" name="fileId" id="fileId"  value="">
				<div id="divFileId">
				
				</div>
				
				<button class="btn btn-my" onclick="ins()">등록</button>
				<button class="btn btn-my" onclick="upd()">수정</button>
				<button class="btn btn-my" onclick="del()">삭제</button>
				<button class="btn btn-my" id="clearButton" type="button">글쓰기</button>
			</form>
		</div>
		
	</div>
	<input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />



</body>
<script type="text/javascript">
	CKEDITOR.replace("description");
	//서버에서 발행된 헤더네임과 토큰갑사 저장
	const header = '${_csrf.headerName}';
	const token =  '${_csrf.token}';

	const taskNm = document.querySelector("input[name=taskNm]");
	const taskCon = CKEDITOR.instances.description.getData(); 
	const taskDead = document.querySelector("input[name=taskDead]");
	const taskScore = document.querySelector("input[name=taskScore]");
	const lecCode = document.querySelector("input[name=hiddenLecCode]");
	const taskDe = document.querySelector("#taskDe");
	const taskUpdde = document.querySelector("#taskUpdde");
	const taskCode = document.querySelector("#hiddentaskCode");
	const inputFile = document.querySelector("#input_file");
	const fileId = document.querySelector("#fileId");
	console.log("taskCode",taskCode);
	console.log("lecCode!!!!!",lecCode);
	
	function getList(){
		let lecCode = document.querySelector("#hiddenLecCode").value;
		console.log("lecCode???????",lecCode);
		
		$.ajax({
			url:"/prof/taskList/"+ lecCode,
			type:"get",
			dataType:"json",
			beforeSend: function(xhr) {
            	xhr.setRequestHeader(header, token);
    		},
			success: function(rslt){
				console.log("rslt!!!!!!!!!",rslt);
				let str = "<table class='table table-hover' >";
				str += "<thead class='bg-my text-black'>"
				str += "<tr><th>No.</th><th>제목</th><th>과제등록일</th><th>과제마감일</th><th>제출목록</th></tr>"
				str += "</thead>"
			 	for(i=0;i<rslt.length;i++){
			 		str +="<tr onclick=fmclick(this)>";
			 		str +=`<td>\${rslt.length - i}</td>`;
			 		str +=`<td>\${rslt[i].taskNm}</td>`;
			 		str +=`<td>\${rslt[i].taskDe}</td>`;
			 		str +=`<td>\${rslt[i].taskDead}</td>`;
			 		str +=`<td class="fileId" style="display:none;">\${rslt[i].fileId}</td>`;
			 		str +=`<td style="display:none;">\${rslt[i].taskCon}</td>`;
			 		str +=`<td style="display:none;">\${rslt[i].taskScore}</td>`;
			 		str +=`<td style="display:none;">\${rslt[i].taskUpdde}</td>`;
			 		str +=`<td><a href="/prof/submitTaskList?lecCode=\${rslt[i].lecCode}&&taskCode=\${rslt[i].taskCode}">보기</a></td>`;
			 		str +=`<td style="display:none;">\${rslt[i].taskCode}</td>`;
			 		str +="</tr>";
			 	}
				str += "</table>";
				myList.innerHTML = str;
			}
		})
	}
	getList();
	
	
	/* 버튼에마다 이벤트 먹이기 */
	function ins(){
		btnWho = event.currentTarget.innerHTML;
	}
	function upd(){
		btnWho = event.currentTarget.innerHTML;
	}
	function del(){
		btnWho = event.currentTarget.innerHTML;
	}
	
	// 비우기 버튼 클릭 시 폼 초기화 함수를 연결
	document.querySelector("#clearButton").addEventListener("click", clearForm);
	
	function clearForm() {
	    taskNm.value = ""; // 과제이름 입력 필드 초기화
	    CKEDITOR.instances.description.setData(""); // 과제내용 입력 필드 초기화
	    taskDead.value = ""; // 마감일자 입력 필드 초기화
	    taskScore.value = ""; // 과제점수 입력 필드 초기화
	    taskDe.textContent = ""; // 등록일 초기화
	    taskUpdde.textContent = ""; // 수정일 초기화
	    divFileId.innerHTML = ""; // 첨부 파일 목록 초기화
	    // 파일 입력 필드 초기화 (선택한 파일도 초기화해야 합니다.)
	    fileId.value = "";
	    inputFile.value = "";
	}

	
	/* 폼 submit 로직 */
	function task(){
		event.preventDefault(); 
		
		//id 속성의 값이 dataForm인 요소를 select
		var form = $("#dataForm")[0];
		
		//<form id="dataForm"...>모든 폼데이터(name속성,값 가진..)</form>
		//가상의 폼
		var formData = new FormData(form);
		const taskCon = CKEDITOR.instances.description.getData();
// 		taskCon : <p>과젲내열2</p>
		console.log("taskCon : " + taskCon);
		formData.append("taskCon",taskCon);
		
	if(btnWho== "등록"){
		/* 파일 업로드 multiple ajax 처리 */
		console.log("btnWho : " + btnWho);
		$.ajax({
			type:"POST",
			url: "/prof/insertTask",
			data: formData,
			processData: false,
			contentType: false,
			beforeSend: function(xhr) {
            	xhr.setRequestHeader(header, token);
    		},
			success: function(data){
				if(data=="success"){
					Swal.fire({
      					icon: "success",
      					title: "과제가 등록되었습니다."
                	})
					getList();
					fileList();
				}else
					alert("오류");
				},
				error: function (xhr, status, error) {
				    console.log("code: " + xhr.status)
				    console.log("message: " + xhr.responseText)
				    console.log("error: " + error);
				}
			})
			
			return false;
		
		}else if(btnWho== "수정"){
			console.log("btnWho2 : " + btnWho);
			$.ajax({
				type:"POST",
				url:"/prof/updateTask",
				data: formData,
				processData: false,
				contentType: false,
				beforeSend: function(xhr) {
	            	xhr.setRequestHeader(header, token);
	    		},
	    		success: function(data){
					if(data=="success"){
						Swal.fire({
	      					icon: "success",
	      					title: "과제가 수정되었습니다."
	                	})
						getList();
						fileList();
					}else
						alert("오류");
					},
					error: function (xhr, status, error) {
					    console.log("code: " + xhr.status)
					    console.log("message: " + xhr.responseText)
					    console.log("error: " + error);
					}
				})
			
			
		}else if(btnWho== "삭제"){
			Swal.fire({
				   text: '게시물을 삭제하시겠습니까?',
				   icon: 'warning',
				   
				   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				   confirmButtonText: '예', // confirm 버튼 텍스트 지정
				   cancelButtonText: '아니오', // cancel 버튼 텍스트 지정
				   
				   
				}).then(result => {
					if (result.isConfirmed) {
						$.ajax({
							type:"POST",
							url:"/prof/deleteTask",
							data: formData,
							processData: false,
							contentType: false,
							beforeSend: function(xhr) {
				            	xhr.setRequestHeader(header, token);
				    		},
				    		success: function(data){
								if(data=="success"){
									getList();
									fileList();
									clearForm();
								}else
									alert("오류");
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
		
	
	function fileList(){
			let data = {"fileId":fileId.value};
			console.log("fileId!!!!!!",fileId.value);
			console.log("data!!!!!!",data);
			
			//fileId를 파라미터로 던지면 List<AttachVO>를 받아옴
			$.ajax({
				url:"/attach/getAttachVOList",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(data),
				type:"post",
				dataType:"json",
				beforeSend: function(xhr) {
			       	xhr.setRequestHeader(header, token);
				},
				success:function(result){
					console.log("result : " + JSON.stringify(result));
			
					let str = "";
					$.each(result,function(i,attachVO){
						console.log("attachVO.filePath : " + attachVO.filePath);
						
						str+="<a href='/attach/download?fileName="+attachVO.fileOriNm+"' style='margin:10px 10px 10px 0px;'>"+attachVO.fileOriNm+"</a><br/>";
					});
					$("#divFileId").html(str);
				}
			});
		}
	
	}
	
	
	const myList = document.querySelector("#taskList") ;
	


	//Tr 클릭시
	
	function fmclick(pthis){
		taskNm.value = pthis.children[1].innerText;
// 		taskCon.value = pthis.children[5].innerText;
		taskDead.value = pthis.children[3].innerText;
		taskScore.value = pthis.children[6].innerText;//20
		taskDe.textContent =  pthis.children[2].innerText;
		taskUpdde.textContent = pthis.children[7].innerText;	
		taskCode.value = pthis.children[9].innerText;
		fileId.value = pthis.children[4].innerText;
		inputFile.value = "";
		console.log("fileId.value",fileId.value);
		
		const ckeditorInstance = CKEDITOR.instances['description'];
	    ckeditorInstance.setData(pthis.children[5].innerText);
		
		let data = {"fileId":pthis.children[4].innerText};
		
		//fileId를 파라미터로 던지면 List<AttachVO>를 받아옴
		$.ajax({
			url:"/attach/getAttachVOList",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"post",
			dataType:"json",
			beforeSend: function(xhr) {
            	xhr.setRequestHeader(header, token);
    		},
			success:function(result){
				console.log("result : " + JSON.stringify(result));
				
				let str = "";
				$.each(result,function(i,attachVO){
					console.log("attachVO.filePath : " + attachVO.filePath);
					
					str+="<a href='/attach/download?fileName="+attachVO.fileOriNm+"' style='margin:10px 10px 10px 0px;'>"+attachVO.fileOriNm+"</a><br/>";
				});
				$("#divFileId").html(str);
			}
		});
	}
	
	
	
	
</script>