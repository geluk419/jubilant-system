<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<!DOCTYPE html>

<style>
div {
	border: 0px solid black;
}

#wrapper{
	display: flex;
	width: 100%;
	padding: 0;
}

#myList {
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

.content_edit {position:relative; width:100%; display:block; font-size:14px; font-weight:400;}
.content_edit span {font-weight:500;
	color:#001a4e;
}
.content_edit textarea {position:relative; width:100%;}

#divFileId {position:relative; width:100%; display:block; margin-bottom:1rem;}

/* .table thead th { */
/*       color: var(--white-color); */
/* } */



</style>

<body>
	<div id="wrapper" class="card-footer">
		<div id="myList" class="card-body">
			<!-- list테이블 -->
		</div>
		<div id="form_wrap" class="card-body">
			<form id="dataForm" onsubmit="noticeSubmit()">
				<input type="hidden" id="hiddenLecCode" name="lecCode" value="${lecCd}">
				<input type="hidden" id="hiddenlecnCode" name="lecnCode" value="">
				
				<div class="full_input">
					<label for="lecnTtl">제목</label>
					<input type="text" class="form-control" id="lecnTtl" name="lecnTtl" required>
				</div>
				
				<div class="full_input edit_date">
					<p>
						등록일 : <span id="lecnDe"></span>
					</p>
					<p>
						수정일 : <span id="lecnDeUpdde"></span>
					</p>
				</div>
				<div class="content_edit">
					<span>내용</span>
					<textarea class="form-control" rows="25" cols="90" id="lecnCon" required></textarea>
				</div>	
				<br /> <input type="file" id="inputFile" name="noticeFiles" multiple="multiple"><br />
				<input type="hidden" id="fileId" name="fileId">
				<div id="divFileId">
				
				</div>

				<button class="btn btn-my" onclick="ins()">등록</button>
				<button class="btn btn-my" onclick="upd()">수정</button>
				<button class="btn btn-my" onclick="del()">삭제</button>
				<button class="btn btn-my" type="button" id="reset">글쓰기</button>
			</form>
		</div>
	</div>
	<input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</body>

<script>
	CKEDITOR.replace("lecnCon");
	//서버에서 발행된 헤더네임과 토큰갑사 저장
	const header = '${_csrf.headerName}';
	const token =  '${_csrf.token}';
	
	function formatDate(dateString) {
	    const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
	    return new Date(dateString).toLocaleDateString(undefined, options);
	}
	
	/* 버튼마다 */
	function ins() {
		btnWho = event.currentTarget.innerHTML;
	}
	function upd() {
		btnWho = event.currentTarget.innerHTML;
	}
	function del() {
		btnWho = event.currentTarget.innerHTML;
	}

	function noticeSubmit() {
		event.preventDefault();
		var form = $("#dataForm")[0];
		var formData = new FormData(form);
		console.log("formData",formData);
		
		const lecnCon = CKEDITOR.instances.lecnCon.getData();
		formData.append("lecnCon",lecnCon);
		
		/* 아작스 */
		if (btnWho == "등록") {
			
			$.ajax({
				type:"post",
				url:"/prof/insertNotice",
				data:formData,
				processData: false,
				contentType: false,
				beforeSend: function(xhr) {
	            	xhr.setRequestHeader(header, token);
	    		},
	    		success:function(result){
	    			Swal.fire({
      					icon: "success",
      					title: "강의자료가 등록되었습니다."
                	})
	    			getlist();
					fileList();
	    		},
	    		error: function (xhr, status, error) {
				    console.log("code: " + xhr.status)
				    console.log("message: " + xhr.responseText)
				    console.log("error: " + error);
				}
				
			})
			
			
		} else if (btnWho == "수정") {
			
			$.ajax({
				type:"POST",
				url:"/prof/updateLecnotice",
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
	      					title: "강의자료가 수정되었습니다."
	                	})
						getlist();
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
			
		} else if (btnWho == "삭제") {
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
							url:"/prof/deleteLecNotice",
							data: formData,
							processData: false,
							contentType: false,
							beforeSend: function(xhr) {
				            	xhr.setRequestHeader(header, token);
				    		},
				    		success: function(data){
								if(data=="success"){
									getlist();
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
	
	
	document.querySelector("#reset").addEventListener("click", clearForm);
	
	/* 입력필드 초기화하기 */
	function clearForm(){
		document.querySelector("#lecnTtl").value = "";
		CKEDITOR.instances.lecnCon.setData("");
		document.querySelector("#inputFile").value = "";
		document.querySelector("#lecnDe").innerText = "";
		document.querySelector("#lecnDeUpdde").innerText = "";
		divFileId.innerHTML = "";
	}
	
	
	/* 리스트 만들기  */
	const myList = document.querySelector("#myList") ;
	
	function dateFormat(date) {
	        let month = date.getMonth() + 1;
	        let day = date.getDate();
	        let hour = date.getHours();
	        let minute = date.getMinutes();
	        let second = date.getSeconds();
	
	        month = month >= 10 ? month : '0' + month;
	        day = day >= 10 ? day : '0' + day;
	        hour = hour >= 10 ? hour : '0' + hour;
	        minute = minute >= 10 ? minute : '0' + minute;
	        second = second >= 10 ? second : '0' + second;
	
	        return date.getFullYear() + '-' + month + '-' + day;
	}
	
	function getlist(){
		let lecCode = document.querySelector("#hiddenLecCode").value;
		console.log("lecCodec체크",lecCode);
		/* 강의자료실 목록물러오기 */
		$.ajax({
			url:"/prof/lecNotice/"+lecCode,
			type:"get",
			dataType:"json",
			beforeSend: function(xhr) {
	        	xhr.setRequestHeader(header, token);
			},
			success:function(rslt){
				console.log("rslt!!!!!!!!!",JSON.stringify(rslt));
				
				
				let str = "<table class='table table-hover'>";
				str += "<thead class='bg-my text-black'>"
				str += "<tr><th>No.</th><th>제목</th><th>내용</th><th>작성일</th></tr>"
				str += "</thead>"
				for(i=0;i<rslt.length;i++){
			 		str +="<tr class='table table-hover' onclick=fmclick(this)>";
			 		str +=`<td>\${rslt.length - i}</td>`;
			 		str +=`<td>\${rslt[i].lecnTtl}</td>`;
			 		str +=`<td >\${rslt[i].lecnCon}</td>`;
					let lecnDe = Number(rslt[i].lecnDe);
					let lecnDe2 = new Date(lecnDe);
					console.log("lecnDe2 : " + dateFormat(lecnDe2));
			 		str +=`<td>`+dateFormat(lecnDe2)+`</td>`;
			 		str +=`<td class="fileId" style="display:none;">\${rslt[i].fileId}</td>`;
			 		str +=`<td style="display:none;">\${rslt[i].lecnCode}</td>`;
			 		str +=`<td style="display:none;">\${rslt[i].lecnUpdde}</td>`;
			 		str +="</tr>";
			 	}
				str += "</table>";
				myList.innerHTML = str;
			},
			error: function (xhr, status, error) {
			    console.log("code: " + xhr.status)
			    console.log("message: " + xhr.responseText)
			    console.log("error: " + error);
			}
		})
	}
	
	getlist();
	
	//Tr 클릭시
	const lecnTtl = document.querySelector("#lecnTtl");
	const lecnDe = document.querySelector("#lecnDe");
	const lecnDeUpdde = document.querySelector("#lecnDeUpdde");
	const lecnCon = document.querySelector("#lecnCon");
	const fileId = document.querySelector("#fileId");
	const lecnCode = document.querySelector("#hiddenlecnCode");
	
	function fmclick(pthis){
		lecnTtl.value = pthis.children[1].innerText;
		lecnDe.textContent = pthis.children[3].innerText;
		lecnDeUpdde.textContent = pthis.children[6].innerText;
// 		lecnCon.value = pthis.children[2].innerText;
		
		fileId.value = pthis.children[4].innerText;
		lecnCode.value = pthis.children[5].innerText;
		document.querySelector("#inputFile").value = "";
		
		const ckeditorInstance = CKEDITOR.instances['lecnCon'];
	    ckeditorInstance.setData(pthis.children[2].innerText);
		
		console.log("fileId.value",fileId.value);
		
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