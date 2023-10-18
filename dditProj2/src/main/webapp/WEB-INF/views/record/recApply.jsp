<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  // 현재 인증된 사용자 정보를 가져옴
  Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

  // 사용자 정보에서 memNo를 추출
  String memNo = authentication.getName();
%>
<style>
  .table thead th, .table tbody tr th {
      color: var(--white-color);
      white-space:nowrap;
  }
  .row {
      align-items: flex-end;
  }
</style>

<div class="wrapper w-75">
  <main role="main" class="main-content mx-auto p-0">
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-12">
          <h2 class="my-2 page-title text-center">학적관리</h2>

          <h4 class="mt-4 page-title text-center text-my">학적 변동 신청</h4>
          <div class="mb-5">
            <div class="alert alert-danger" role="alert">
              <h4 class="alert-heading my-4">📢안내사항</h4>
              <p>1️⃣ 신청유형에 따라 담당교수의 상담 내역이 필요합니다.</p>
              <p>2️⃣ 승인대기 신청은 취소할 수 있으며 승인 및 반려 처리가 되면 취소할 수 없습니다.</p>
              <p>3️⃣ 하단의 신청 버튼을 눌러 신청 할 수 있습니다.</p>
              <p>4️⃣ 현재 승인된 내역이 있다면 만료 후 새로 신청할 수 있습니다.</p>
            </div>
          </div>

          <h5 class="text-my">학적 변동 내역</h5>

          <!-- Small table -->
          <div class="row my-3">
            <div class="col-md-12">
              <div class="card shadow">
                <div class="card-body">

                  <div id="loading-spinner" class="text-center">
                    <div id="" class="spinner-grow mr-3 text-danger" role="status">
                      <span class="sr-only">Loading...</span>
                    </div>
                  </div>
                  <!-- table -->
                  <div id="table-content">
                  </div>

                </div>
              </div>
            </div> <!-- simple table -->
          </div> <!-- end section -->

        </div> <!-- .col-12 -->
      </div> <!-- .row -->
    </div> <!-- .container-fluid -->

    <div class="row flex-row-reverse">

      <div class="col-5 my-1">
        <div class="dataTables_info text-right mr-3" id="dataTable-2_btn" >
          <button type="button" id="insertBtn" class="btn btn-my mr-3" data-toggle="modal" data-target="#verticalModal">학적변동 신청</button>
        </div>
      </div>


      <!-- 모달 -->
      <div class="modal fade show" id="verticalModal" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" style="padding-right: 19px;" aria-modal="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">

            <form id="myForm" >

              <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              <div class="modal-header bg-danger-light">
                <h4 class="modal-title text-white" id="verticalModalTitle ">학적 변동 신청서 작성</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="alert alert-warning mb-4" role="alert">
                  <span class="fs-24 mb-1"><span class="fe fe-alert-triangle mr-2"></span>안내사항</span>
                  <p class="m-0"> 1) 학적구분 선택 후 학기 및 휴학기 및 기간을 선택하여 주세요.</p>
                  <p class="m-0"> 2) 학적구분에 따라 선택할 수 있는 옵션이 달라집니다. </p>
                  <p class="m-0"> 3) 이름 및 신청날짜는 자동 입력 됩니다.</p>
                  <p class="m-0"> 4) *는 필수 선택/입력 정보입니다.</p>
                </div>

                <div class="row text-center fs-20 justify-content-center">
                  <div class="form-check col-3">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="02" required>
                    <label class="form-check-label" for="inlineRadio1">휴학</label>
                  </div>
                  <div class="form-check col-3">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="04" required>
                    <label class="form-check-label" for="inlineRadio2">복학</label>
                  </div>
                  <div class="form-check col-3">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio4" value="05" required>
                    <label class="form-check-label" for="inlineRadio4">자퇴</label>
                  </div>
                </div>
                <hr class="border">
                <div class="card-body row py-1 justify-content-center" id="div_card">
                  <div class="form-group col-5">
                    <label for="example-s-date" class="m-0">시작일</label>
                    <input class="form-control" id="example-s-date" type="date" name="starDate" required>
                  </div>
                  <div class="form-group">
                    <span class="text-center h4 mb-sm-1">~</span>
                  </div>
                  <div class="form-group col-5">
                    <label for="example-e-date" class="m-0">종료일</label>
                    <input class="form-control" id="example-e-date" type="date" name="endDate" required>
                  </div>
                </div>
                <div class="form-group mb-3">
                  <label for="simpleinput">신청자</label>
                  <input type="text" id="simpleinput" name="username" class="form-control" value="" readonly>
                </div>
                <div class="form-group mb-3">
                  <label for="example-textarea">신청 사유</label>
                  <textarea class="form-control" name="textarea" id="example-textarea" rows="4" style="height: 130px; " placeholder="사유를 입력하여 주세요." required></textarea>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn mb-2 btn-info" id="auto-input">자동입력</button>
                <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">취소</button>
                <button type="submit" class="btn mb-2 btn-my">신청</button>
              </div>
            </form>

          </div>
        </div>
      </div><!-- 모달 -->

      <!-- 모달 -->
      <div class="modal fade show" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalTitle" style="padding-right: 19px;" aria-modal="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">

            <div class="modal-header bg-danger-light">
              <h4 class="modal-title text-white" id="detailModalTitle">학적 변동 결과</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">

              <div class="row">
                <div class="form-group mb-3 col-6">
                  <label for="detail-seCode">신청유형</label>
                  <input type="text" id="detail-seCode" name="detail-seCode" class="form-control" value="" readonly>
                </div>

                <div class="form-group mb-3 col-6">
                  <label for="detail-input">신청자</label>
                  <input type="text" id="detail-input" name="detail-input" class="form-control" value="" readonly>
                </div>
              </div>

              <div class="form-group mb-3">
                <label for="detail-textarea">신청 사유</label>
                <textarea class="form-control" name="textarea" id="detail-textarea" rows="4" style="height: 190px; " readonly></textarea>
              </div>
              <hr class="border">
              <div class="form-group mb-3">
                <label for="detail-emp">답변자</label>
                <input type="text" id="detail-emp" name="detail-emp" class="form-control" value="" readonly>
              </div>
              <div class="form-group mb-3">
                <label for="detail-return">반려 사유</label>
                <textarea class="form-control" name="textarea" id="detail-return" rows="4" style="height: 190px; " readonly></textarea>
              </div>

            </div>
            <div class="modal-footer">
              <button type="button" class="btn mb-2 btn-my" data-dismiss="modal">확인</button>
            </div>

          </div>
        </div>
      </div><!-- 모달 -->

    </div>

  </main> <!-- main -->
</div>

<!-- 추가 JavaScript 코드 -->
<script>

  $(document).ready(function () {
      // 시큐리티 CSRF 토큰 값을 가져옵니다.
      const csrf = $("#csrf").val();
      // 초기 로딩 스피너 표시
      $("#loading-spinner").show();
      const memNo = "<%=memNo%>";
      const memNm =  $("#memberName").val();
      // console.log(memNo);

      // 초기 리스트 로딩
      reloadList();

      // 리스트를 다시 로드하는 비동기 함수
      function reloadList() {
          $.ajax({
              type: "GET", // 또는 필요한 HTTP 메서드
              url: "/stu/recApplyList", // 리스트를 로드하는 엔드포인트 URL
              data: {
                  memNo: memNo
              },
              dataType: "json", // 리스트 HTML을 반환하는 경우
              success: function(data) {
                  // 받은 JSON 데이터를 사용하여 HTML 생성
                  let html = "";
                  html += `
                  <table class="table datatables text-center mb-0" id="dataTable-1">
                    <thead class="bg-secondary-light">
                    <tr>
                      <th>No.</th>
                      <th>신청유형</th>
                      <th>신청연도</th>
                      <th>신청학기</th>
                      <th>기간</th>
                      <th>승인여부</th>
                      <th>상세</th>
                    </tr>
                    </thead>
                    <tbody>
                  `;
                  $.each(data, function(index, item) {
                      html += "<tr>";
                      html += "<td>" + (index+1) + "</td>";
                      html += "<td>" + item.recSeCode + "</td>";
                      html += "<td>" + item.recYr + "</td>";
                      html += "<td>" + item.recSem + "학기</td>";
                      html += "<td>" + item.recSde + " ~ " + item.recEde + "</td>";
                      html += "<td>";

                      // 상태에 따른 badge 표시
                      if (item.recReturn != null) {
                          html += `<span class='badge badge-pill badge-danger pt-sm-2'>반려</span>`;
                      } else if (item.recYn === 'N') {
                          html += `<span class='badge badge-pill badge-warning pt-sm-2'>대기</span>`;
                      } else {
                          html += `<span class='badge badge-pill badge-success pt-sm-2'>완료</span>`;
                      }
                      html += "</td>";
                      html += "<td>";
                      // 조건에 따른 버튼 표시
                      if (item.recYn === 'N' && item.recReturn != null) {
                          html += `<button class='btn btn-sm btn-danger bg-danger-light pb-0 recDetailBtn' data-rec-code='\${item.recCode}'>사유보기</button>`;
                      } else if (item.recYn === 'N' && item.recReturn == null) {
                          html += `<button class='btn btn-sm btn-warning bg-warning-lighter pb-0 recDelBtn' data-rec-code='\${item.recCode}'>취소</button>`;
                      }
                      html += "</td></tr>";
                  });
                  html += "</tbody></table>";

                  // 로딩 스피너 숨김
                  $("#loading-spinner").hide();
                  // 리스트 컨테이너 업데이트
                  $("#table-content").html(html);
              },
              error: function() {
                  console.log('리스트 로딩 중 에러 발생');
                  // 로딩 스피너 숨김
                  $("#loading-spinner").hide();
              }
          });
      }

    // 학적 사유 보기 버튼
    $(document).on('click', ".recDetailBtn", function() {
      let recCode = $(this).data("rec-code");
      $("#detailModal").modal("show");
      // console.log(recCode);

      $.ajax({
        type: "GET",
        url: "/stu/recDetail/" + recCode,
        headers: {
          "X-CSRF-TOKEN": csrf // CSRF 토큰을 헤더에 추가
        },
        dataType: "json",
        success: function(data) {
          if (data) {
            // console.log(data);

            let recSeCode;
            switch (data.recSeCode) {
              case "02" : recSeCode = "휴학"; break;
              case "04" : recSeCode = "복학"; break;
              case "05" : recSeCode = "자퇴"; break;
            }

            $("#detail-seCode").val(recSeCode);
            $("#detail-input").val(memNm);
            $("#detail-textarea").val(data.recRsn);
            $("#detail-emp").val(data.memNm);
            $("#detail-return").val(data.recReturn);
          }
        },
        error: function() {
          console.log('에러 발생');
        }
      });
    })

    // 학적 신청 삭제 버튼
    $(document).on("click", ".recDelBtn", function () {

        Swal.fire({
          title: '정말로 학적신청을 <br>취소 하시겠습니까?',
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#dd3333',
          confirmButtonText: '확인',
          cancelButtonColor: '#a4a4a4',
          cancelButtonText: '취소',
          reverseButtons: true
        }).then((result) => {
          if (result.isConfirmed) { // 확인 버튼이 눌렸을 때만 삭제 처리 수행
            let recCode = $(this).data("rec-code");
            // console.log("삭제할 recCode 값: " + recCode);

            // Ajax 요청을 보냅니다.
            $.ajax({
              type: "DELETE",
              url: "/stu/recApply/" + recCode,
              headers: {
                "X-CSRF-TOKEN": csrf // CSRF 토큰을 헤더에 추가
              },
              dataType: "text",
              success: function(data) {
                if (data) {
                  // 삭제 요청이 성공한 경우에만 리스트를 다시 로드
                  reloadList();
                }
              },
              error: function() {
                console.log('에러 발생');
                // 에러 발생 시 수행할 작업을 여기에 추가할 수 있습니다.
              }
            });
          }
        });
    });


    // 라디오 버튼 변경 이벤트 감지
    $("input[name='inlineRadioOptions']").change(function() {
        // 선택된 라디오 버튼의 값을 가져옵니다.
        let selectedValue = $("input[name='inlineRadioOptions']:checked").val();

        let $div_card = $("#div_card");
        $div_card.empty();
        let newElement;

        // 선택된 값에 따라 다른 작업 수행
        switch (selectedValue) {
            case "02":
                newElement = `
                <div class="form-group col-5">
                  <label for="example-s-date" class="m-0">시작일</label>
                  <input class="form-control" id="example-s-date" type="date" name="starDate" required>
                </div>
                <div class="form-group">
                  <span class="text-center h4 mb-sm-1">~</span>
                </div>
                <div class="form-group col-5">
                  <label for="example-e-date" class="m-0">종료일</label>
                  <input class="form-control" id="example-e-date" type="date" name="endDate" required>
                </div>
                `;
                break;
            case "03":
            case "04":
            case "05":	
                newElement = `
                <div class="form-group col-12">
                  <label for="example-s-date" class="m-0">예정일</label>
                  <input class="form-control" id="example-s-date" type="date" name="starDate" required>
                </div>
                `;
                break;
            case "10":
                newElement = `
                <div class="form-group col-6">
                  <label for="example-s-date" class="m-0">예정일</label>
                  <input class="form-control" id="example-s-date" type="date" name="starDate" required>
                </div>
                <div class="form-group col-6">
                  <label for="recApply" class="m-0">신청학과</label>
                  <input class="form-control" id="recApply" type="text" name="recApply" required>
                </div>
                `;
                break;
        }
        $div_card.append(newElement);
    });

    // Form submit 설정
    const myForm = document.querySelector("#myForm");
    myForm.addEventListener("submit", ajaxInsert);

    function ajaxInsert() {
        event.preventDefault(); // 기본 동작 취소

        // 사용자가 선택한 라디오 버튼의 값을 가져옵니다.
        const radio = $("input[name='inlineRadioOptions']:checked").val();
        // 시작일과 종료일을 가져옵니다.
        const startDate = $("#example-s-date").val();
        const endDate = $("#example-e-date").val();
        // 신청자 이름을 가져옵니다.
        const username = $("#simpleinput").val();
        // 신청 사유를 가져옵니다.
        const reason = $("#example-textarea").val();

        console.log(startDate, endDate, username, reason);

        // Ajax 요청을 보냅니다.
        $.ajax({
            type: "POST",
            url: "/stu/recApply",
            data: {
                _csrf: csrf,
                stuMemNo: memNo,
                recSeCode: radio,
                recSde: startDate,
                recEde: endDate,
                recRsn: reason
            },
            dataType: "text",
            success: function(data) {
                if (data === "fail"){
                    Swal.fire({
                        icon: 'error',
                        title: '신청이 실패했습니다',
                        text: '신청한 날짜는 이미 승인된 날짜와 겹칩니다.',
                    })
                } else if (data) {
                  Swal.fire({
                    icon: 'success',
                    title: '정상적으로 신청되었습니다.'
                  }).then((result) => {
                    // 모달 닫기
                    $("#verticalModal").modal("hide");
                    // 리스트 로드
                    reloadList();
                  });

                }
            },
            error: function() {
                console.log('에러 발생');
                // 에러 발생 시 수행할 작업을 여기에 추가할 수 있습니다.
            }
        });
    }

  // "학적변동신청" 버튼 클릭 시 모달 창 보이기
    $("#insertBtn").click(function() {
        $("input[name='inlineRadioOptions']").prop("checked", false); // 모든 라디오 버튼 선택 해제
        $("#example-s-date").val("");
        $("#example-e-date").val("");
        $("#simpleinput").val(memNm);
        $("#example-textarea").val("")

        // console.log("로그 : " + $("#memberName").val());
        $("#verticalModal").modal("show");
    })


    $('#auto-input').click(function () {
        let selectedRadioValue = "02"; // "휴학" 라디오 버튼의 값
        $("input[name='inlineRadioOptions'][value='" + selectedRadioValue + "']").prop("checked", true);

        let startDate = "2023-10-13";
        let endDate = "2025-10-27";
        let reason = "군대 입대";

        $("#example-s-date").val(startDate);
        $("#example-e-date").val(endDate);
        $("#example-textarea").val(reason);
    });

    // 시간 기본값
    document.getElementById('example-s-date').value = new Date().toISOString().substring(0, 10);
    document.getElementById('example-e-date').value = new Date().toISOString().substring(0, 10);
  });




</script>