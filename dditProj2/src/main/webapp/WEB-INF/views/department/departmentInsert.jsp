<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<main role="main" class="main-content mx-auto">
    <div class="container-fluid">
        <div class="row">
            <div class="col-6">
                <h2 class="h3 mb-4 page-title">학과 등록</h2>
            </div>
            <div class="col-6 text-right">
                <button class="btn btn-info" id="autoBtn">자동입력</button>
            </div>
        </div>
        <hr class="my-4">
        <div class="my-4">
                    <form>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="colCode">단과대학</label> 
                                <select id="colCode" class="form-control">
                                    <option>단과대 선택</option>
                                    <c:forEach var="colCode" items="${colList}">
                                        <option value="${colCode.codeId}">${colCode.codeNm}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="depNm">학과명</label> 
<%--                                 <input type="text" id="depNm" class="form-control" value="${departmentVO.depNm}" placeholder="ex) 경제학과"> --%>
								<select id="codeDetailNm" name="codeDetailNm" class="form-control">
									<option>단과대학을 선택해주세요</option>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="depCode">학과코드</label> 
                                <input type="text" id="depCode" class="form-control" value="${departmentVO.depCode}" disabled>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="depDc">학과 소개</label> 
                                <textarea id="depDc" class="form-control" placeholder="학과  소개를 기입하여 주세요" style="height: 150px;"></textarea>
                            </div>
                        </div><br>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="depCap">최대 정원</label>
                                    <input type="number" id="depCap" class="form-control" value="${departmentVO.depCap}" placeholder="">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="depTel">연락처</label>
                                    <input type="text" id="depTel" class="form-control" value="${departmentVO.depTel}" placeholder="ex) 0421231234">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="provost">학과장</label>
                                    <select id="provost" class="form-control">
                                        <option>학과를 선택해주세요</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TA">조교</label>
                                    <select id="TA" class="form-control">
                                        <option>조교를 선택해주세요</option>
                                        <c:forEach var="TA" items="${TAList}">
                                            <option value="${TA.memNo}">${TA.memNm}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <hr class="my-4">
                        <div class="text-center">
                            <button type="button" id="regBtn" class="btn btn-outline-secondary bg-my text-white" style="font-size: 1.0rem; width: 200px;">등록</button>
                        </div>
                    </form>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.col-12 -->
        </div>
        <!-- .row -->
    </div>
</main>
<!-- main -->
</div>
<!-- .wrapper -->
<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/simplebar.min.js"></script>
<script src='js/daterangepicker.js'></script>
<script src='js/jquery.stickOnScroll.js'></script>
<script src="js/tinycolor-min.js"></script>
<script src="js/config.js"></script>
<script src="js/apps.js"></script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
<script type="text/javascript" src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
    var textarea = document.getElementById("departmentIntro");
    textarea.value = "${departmentVO.depDc}";
</script>
<script>
//단과대학 선택 시 해당 단과대학의 학과명 select 처리
$("#colCode").on("change",function(){
	console.log("개똥이");
	
	let codeId = $(this).val();
	console.log("codeId : " + codeId);
	
	let data = {"codeId":codeId};
	
	$.ajax({
        type: "post",
        url: "/admin/getCodeDetail",
        data: JSON.stringify(data),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        beforeSend: function (xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success: function (result) {
        	/*
        	result: [{"codeDetailId":"MGMT1","codeId":"MGMT","groupId":"COLL","codeDetailNm":"경영학과","codeDetailOrd":1}
        	,{"codeDetailId":"MGMT2","codeId":"MGMT","groupId":"COLL","codeDetailNm":"경제학과","codeDetailOrd":2},
        	{"codeDetailId":"MGMT3","codeId":"MGMT","groupId":"COLL","codeDetailNm":"회계학과","codeDetailOrd":3}]
        	*/
//             console.log("result: " + JSON.stringify(result));
            
        	$("#codeDetailNm").html("<option>선택해주세요</option>");
        
            $.each(result,function(index,codeDetailVO){
            	console.log("codeDetailId : " + codeDetailVO.codeDetailId);
            	console.log("codeDetailNm : " + codeDetailVO.codeDetailNm);
            	
            	let sIndex = codeDetailVO.codeDetailNm.indexOf("(");
            	let codeName = codeDetailVO.codeDetailNm.substring(0,sIndex);
            	
            	$("#codeDetailNm").append(`<option value='\${codeDetailVO.codeDetailId}/\${codeName}'  >\${codeDetailVO.codeDetailNm}</option>`);
            });
        }
    });
});

//학과명 선택 시 값을 가져옴
$("#codeDetailNm").on("change",function(){
	let str = $(this).val().split("/")[0];
	
	console.log("str : " + str);
	
	$("#depCode").val(str);
	
	let data = {"depCode":str};
	
	$.ajax({
        type: "post",
        url: "/admin/getProvostList",
        data: JSON.stringify(data),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        beforeSend: function (xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success: function (result) {
        	//result : [{"memNo":"202309P008","depCode":null,"proPosNm":null,"proPosYN":null,"codeProStat":null,"memberVO":null},
        	//{"memNo":"202309P033","depCode":null,"proPosNm":null,"proPosYN":null,"codeProStat":null,"memberVO":null}]
        	console.log("ajax result : ",result);
            
        	$("#provost").html("<option>선택해주세요</option>");
        
            $.each(result,function(index,professorVO){
            	console.log("memNo : " + professorVO.memNo);
            	console.log("memNm : " + professorVO.memNm);
            	
            	$("#provost").append("<option value='"+professorVO.memNo+"'>"+professorVO.memNm+"</option>");
            });
        }
    });
	
});


//학과 등록
$("#regBtn").on("click", () => {
    let departmentVO = {
        colCode: $("#colCode").val(),
        depNm: $("#codeDetailNm").val().split("/")[1],
        depCode: $("#depCode").val(), 
        depDc: $("#depDc").val(),
        depCap: $("#depCap").val(),
        depTel: $("#depTel").val(),
        depDrhf: $("#provost").val(),
        codeDetailNm: $("#codeDetailNm").val(),
        memNo: $("#TA").val()
    };
    //DEP_CODE, COL_CODE, DEP_NM, DEP_DC, DEP_DRHF, DEP_CAP, DEP_TEL, DEP_DEL_YN, MEM_NO
    //{"colCode":"ART","depNm":"미용학과","depCode":"A2","depDc":"asdf","depCap":"2","depTel":"0421231234","provost":"201701P001","TA":"201803E008"}
    console.log("체킁:",departmentVO); // 항상 보내는 값을 먼저 눈으로 확인!

    $.ajax({
        type: "post",
        url: "/admin/department",
        data: JSON.stringify(departmentVO),
        contentType: "application/json;charset=utf-8",
        dataType: "text",
        beforeSend: function (xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success: function (result) {
            console.log("ch result: " , result);
            if (result == "success") {
            	Swal.fire({
                    icon: 'success',
                    title: "학과 등록이 완료되었습니다."
                 }).then((result) => {
                    location.href = "/admin/departmentList";
                 })
            } else {
                alert("학과 등록에 실패했습니다.");
            }
        },
        error: function (xhr, status, error) {
            console.log("code:" + xhr.status);
            console.log("message: " + xhr.responseText);
            console.log("error:" + error);
            alert("학과 등록 중 오류가 발생했습니다.");
        }
    });
});

$("#autoBtn").click(function(){
	$("#depDc").val("미디어영상과 학과는 창의적인 미디어 제작과 디지털 커뮤니케이션을 중심으로 학문과 실무를 결합하는 학과입니다. 이 학과는 다양한 미디어 형식과 플랫폼을 다루며, 학생들에게 미디어 제작, 영상 편집, 그래픽 디자인, 웹 개발, 디지털 마케팅, 영상 제작 및 미디어 커뮤니케이션에 관한 광범위한 지식을 제공합니다. 미디어영상과 학과는 학생들이 현대 미디어 산업에서 성공하기 위한 도구와 지식을 제공하며, 미디어와 커뮤니케이션 분야에 열정을 가진 이들에게 많은 기회를 제공합니다.");
	$("#depCap").val("45");
	$("#depTel").val("0425659898");
})
</script>
