<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!doctype html>
<html lang="en">

<main role="main" class="main-content" style="width: 70%; margin: auto;">
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-12">
				<h2 class="page-title" style="text-align:center;">시험응시</h2>
				<p class="text-muted" style="text-align:center;">${testStuVO[0].lecaNm }</p>
				<div class="card-deck">
					<div class="card shadow mb-4">
						<div class="card-header" style="text-align:center;">
							<strong class="card-title">${testStuVO[0].testNm }</strong>
						</div>
						<div class="card-body">
							<form action="/stu/testStuStart" method="post" id="testForm">
							<sec:csrfInput/>
							<c:set var="testNo" value="1"></c:set>
							<input type="hidden" name="lecCode" value="${testStuVO[0].lecCode }">
							<input type="hidden" name="memNo" value="">
							<c:forEach items="${testStuVO}" var="testStuVO" varStatus="stat">
								<c:if test="${stat.index % 4 == 0 }">
								<div id="problems" class="card my-3">
									<div class="card-body">
										<div class="form-group m-0" id="problem">
											<h5 class="card-title h6">
												${testNo}.
												${testStuVO.steQue}
											</h5>
											<!-- 보기 시작 -->
								</c:if>
											<div class="form-check py-2 card-text">
												<input class="form-check-input" type="radio" name="${testStuVO.steNo}" id="steType${testStuVO.steNo}option${testStuVO.steSelectNo}" value="${testStuVO.steSelectNo}">
												<label class="form-check-label" for="steType${testStuVO.steNo}option${testStuVO.steSelectNo}">${testStuVO.steSelect}</label>
<%-- 												<input type="text" readonly class="form-control" id="steSelect" name="steSelect" value="${testStuVO.steSelect}"> --%>
											</div>
								<c:if test="${stat.index % 4 == 3 }">
										<!-- 보기 끝 -->
										</div>
									</div>
								</div>
								<c:set var="testNo" value="${testNo+1 }"></c:set>
								</c:if>
							</c:forEach>
							<div class="form-group mb-2" style="text-align: center;">
								<button type="submit" class="btn btn-my" id="testBtn">제출</button>
								<button type="button" class="btn btn-primary" id="autoFill">자동 완성</button>
							</div>
							</form>
						</div>
					</div>
				</div>

			</div>
			<!-- /. col -->
		</div>

	</div>
	<!-- .row -->
	</div>

	
</main>
<!-- main -->
</div>
<!-- .wrapper -->


<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1">
	
	window.dataLayer = window.dataLayer || [];
	
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());
	gtag('config', 'UA-56159088-1');
	
	
	
</script>


<script>
$("#autoFill").on("click", function() {
	
	// autoFill 버튼 클릭 시 실행될 코드
    // 10개의 문제에 대해 라디오 버튼을 1번부터 4번까지의 순서대로 선택합니다.

    // 보기의 라디오 버튼을 선택하는데 사용할 클래스 이름 설정
    const radioClassName = "form-check-input";

    // 모든 라디오 버튼 요소를 가져오기
    const radioButtons = document.querySelectorAll("." + radioClassName);

    // 라디오 버튼 선택을 위한 순서 배열
    const answerSequence = [2, 2, 1, 2, 3, 1, 4, 1, 4, 1]; // 10개의 문제에 대한 선택 순서

    // 라디오 버튼 선택
    answerSequence.forEach(function(answer, index) {
        radioButtons[index * 4 + answer - 1].checked = true;
    });
})



// $(document).ready(function() {
//     $("#testBtn").click(function() {

//         const lecCode = "${testStuVO[0].lecCode}";
        
// //         rslt = true;
        
//         if (rslt) {
//             Swal.fire({
//                 icon: 'success',
//                 title: "시험이 제출되었습니다"
//             }).then((result) => {
//                 location.href = "/stu/testNotice/?lecCode=" + lecCode;
//             });
//         } else {
//             Swal.fire("시험이 제출되지 않았습니다");
//         }
//     });
// });
</script>
</body>
</html>