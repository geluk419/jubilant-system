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
  .btn-group .btn {
      background: #e5e5e5;
  }

  .btn-group .btn.active {
      background-color: #007bff; /* 원하는 배경색으로 변경 */
      color: #fff; /* 텍스트 색상을 흰색 또는 원하는 색상으로 변경 */
      border-color: #007bff; /* 테두리 색상을 원하는 색상으로 변경 */
  }

</style>

<div class="wrapper w-75">
  <main role="main" class="main-content mx-auto p-0">
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-12">
          <h2 class="my-2 page-title text-center">상담</h2>

          <h4 class="mt-2 page-title text-center text-my">상담 신청</h4>
          <div class="mb-4">
            <div class="alert alert-warning" role="alert">
              <h4 class="alert-heading my-4">📢안내사항</h4>
              <p>1️⃣ 해당 상담의 제목을 누르면 답변 확인 및 상세보기가 가능합니다.</p>
              <p>2️⃣ 하단의 신규 버튼을 눌러 상담 신청을 할 수 있습니다.</p>
              <p>3️⃣ 승인여부가 계속 대기 중일 경우, 과사에 연락 바랍니다.</p>
            </div>
          </div>

          <h5 class="text-my">상담 신청 내역</h5>

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
          <button type="button" class="btn btn-my mr-3" data-toggle="modal" data-target="#Modal_1" id="apllyBtn">상담 신청</button>
        </div>
      </div>


      <!-- 모달 -->
      <div class="modal fade show" id="Modal_1" tabindex="-1" role="dialog" aria-labelledby="modalTitle" style="padding-right: 19px;" aria-modal="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">

            <form id="myForm" >

              <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              <div class="modal-header bg-warning-light">
                <h4 class="modal-title text-white" id="modalTitle ">상담 신청서 작성</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="card-body py-1" id="div_card">

                  <div class="form-group mb-3 d-none">
                    <label for="username">신청자</label>
                    <input type="hidden" id="username" name="username" class="form-control" value="신청자" readonly>
                  </div>

                  <div class="form-group row">
                    <div class="form-group col-6">
                      <label for="selectPro">상담 교수</label>
                      <select id="selectPro" class="form-control" required>
                        <option value="">교수선택</option>
                        <option value="200901P004">김대명</option>
                        <option value="200901P005">전미도</option>
                        <option value="201201P012">은수민</option>
                        <option value="201903P001">이미지</option>
                        <option value="202104P002">추가을</option>
                        <option value="201201P008">김재빈</option>
                        <option value="201601P018">박우진</option>
                      </select>
                    </div>
                    <div class="form-group col-6">
                      <label for="starDate" class="m-0">상담 요청일</label>
                      <input class="form-control" id="starDate" type="date" name="starDate" required>
                    </div>
                  </div>

                  <div class="form-group mb-3">
                    <label for="title">상담 제목</label>
                    <input type="text" id="title" name="title" class="form-control" placeholder="제목을 입력해주세요" required>
                  </div>

                  <div class="form-group mb-3">
                    <label for="con_textarea">상담 내용</label>
                    <textarea class="form-control" name="textarea" id="con_textarea" rows="4" style="height: 230px; " placeholder="사유를 입력하여 주세요." required></textarea>
                  </div>
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
      <div class="modal fade show" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="modalDetailTitle" style="padding-right: 19px;" aria-modal="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">

            <form id="myFormDetail" >

              <div class="modal-header bg-warning-light">
                <h4 class="modal-title text-white" id="modalDetailTitle ">상담 신청서 결과</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="card-body py-1" id="div_cardDetail">

                  <div class="form-group mb-3">
                    <label for="titleDtail">상담 제목</label>
                    <input type="text" id="titleDtail" name="title" class="form-control" readonly>
                  </div>

                  <div class="form-group mb-3">
                    <label for="con_textareaDetail">상담 내용</label>
                    <textarea class="form-control" name="textarea" id="con_textareaDetail" rows="4" style="height: 200px; " readonly></textarea>
                  </div>

                  <div class="form-group row">
                    <div class="form-group col-6">
                      <label for="selectProDetail">상담 교수</label>
                      <input type="text" class="form-control" id="selectProDetail" readonly />
                    </div>
                    <div class="form-group col-6">
                      <label for="counselDateDetail" class="m-0">상담 요청일</label>
                      <input class="form-control" id="counselDateDetail" type="date" name="starDate" readonly>
                    </div>
                  </div>

                  <div class="form-group mb-3">
                    <label for="returnDetail">상담 결과</label>
                    <textarea class="form-control" name="textarea" id="returnDetail" rows="4" style="height: 200px; " readonly></textarea>
                  </div>
                </div>

              </div>
              <div class="modal-footer">
                <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">취소</button>
              </div>
            </form>

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
      const memNo = "<%=memNo%>";


      // 상세 버튼 이벤트 (상세, 삭제)
      function handleEventDetails(data) {
          // console.log("data +   " + data);

          $.ajax({
              type: "GET",
              url: "/stu/counselSelect/" + data,
              dataType: "json",
              success: function(data) {
                  // console.log("data = " + data);
                  // console.log("Date = " + data.cnslDe);

                  $("#titleDtail").val(data.cnslTtl);
                  $("#con_textareaDetail").val(data.cnslCon);
                  $("#selectProDetail").val(data.memNm);
                  $("#counselDateDetail").val(data.cnslDe);
                  if (data.cnslRpl) {
                    $("#returnDetail").val(data.cnslRpl);
                  } else if (data.cnslReturn) {
                    $("#returnDetail").val(data.cnslReturn);
                  }
                  // 모달을 열기
                  $("#detailModal").modal("show");
              },
              error: function(xhr, status, error) {
                  console.log("code: " + xhr);
                  console.log("message: " + status);
                  console.log("error: " + error);
              }
          });

      }

      // 초기 로딩 스피너 표시
      $("#loading-spinner").show();
      // 초기 리스트 로딩
      reloadList();

      // 리스트를 다시 로드하는 비동기 함수
      function reloadList() {
          $.ajax({
              type: "GET",
              url: "/stu/counselList",
              dataType: "json",
              data: {
                  memNo: memNo
              },
              success: function(data) {
                  // 받은 JSON 데이터를 사용하여 HTML 생성
                  let html = "";
                  html += `
                  <table class="table datatables text-center mb-0" id="dataTable-1">
                    <thead class="bg-secondary-light">
                    <tr>
                      <th>No.</th>
                      <th>상담제목</th>
                      <th>상담요청일</th>
                      <th>승인여부</th>
                      <th>보기</th>
                    </tr>
                    </thead>
                    <tbody>
                  `;
                  $.each(data, function(index, item) {
                      html +=  `
                          <tr>
                            <td>\${index+1}</td>
                            <td class='cnslCode d-none'>\${item.cnslCode}</td>
                            <td class="text-left">\${item.cnslTtl}</td>
                            <td>\${item.cnslDe}</td>
                            <td>
                      `;

                      // 상태에 따른 badge 표시
                      // 조건에 따른 삭제 버튼 표시
                      if (item.cnslReturn != null) {
                          html += `
                            <span class='badge badge-pill badge-danger pt-sm-2'>반려</span></td>
                            <td>
                              <button class='btn btn-sm btn-danger bg-danger-light pb-0 couReturnBtn' data-rec-code=\${item.recCode}>사유보기</button>
                          `;
                      } else if (item.cnslYn === 'N') {
                          html += `
                            <span class='badge badge-pill badge-warning pt-sm-2'>대기</span></td>
                            <td>
                              <button class='btn btn-sm btn-warning bg-warning-lighter pb-0 couDelBtn' data-rec-code=\${item.recCode}>신청취소</button>
                          `;
                      } else {
                          html += `
                            <span class='badge badge-pill badge-success pt-sm-2'>승인</span></td>
                            <td>
                              <button class='btn btn-sm btn-success bg-success-lighter pb-0 couViewBtn' data-rec-code=\${item.recCode}>답변보기</button>
                          `;
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

      // 답변, 반려 보기 버튼 클릭 핸들러
      $(document).on("click", ".couReturnBtn, .couViewBtn", function () {
          // 클릭된 버튼이 속한 행에서 .cnslCode 값을 가져옴
          let code = $(this).closest("tr").find(".cnslCode").text();
          if (code) {
              handleEventDetails(code);
          }
      });

      // Delete 처리 = 신청 취소 버튼 클릭
      $(document).on("click", ".couDelBtn", function () {

          // 클릭된 버튼이 속한 행에서 .cnslCode 값을 가져옴
          let code = $(this).closest("tr").find(".cnslCode").text();
          if (code) {
              Swal.fire({
                  title: '정말로 상담을 <br>취소 하시겠습니까?',
                  icon: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#337ddd',
                  confirmButtonText: '확인',
                  cancelButtonColor: '#a4a4a4',
                  cancelButtonText: '취소',
                  reverseButtons: true
              }).then((result) => {
                  if (result.isConfirmed) { // 확인 버튼이 눌렸을 때만 삭제 처리 수행
                    $.ajax({
                        type: "DELETE",
                        url: "/stu/counselDelete",
                        headers: {
                            "X-CSRF-TOKEN": csrf // CSRF 토큰을 헤더에 추가
                        },
                        data: JSON.stringify({
                            cnslCode: code,
                        }),
                        contentType: "application/json",
                        dataType: "text",
                        success: function(data) {
                            if (data) {
                                console.log("로그 : " + data);
                                reloadList(); // 리스트 리로드
                            }
                        },
                        error: function(xhr, status, error) {
                            console.log("code: "+xhr);
                            console.log("message: "+status);
                            console.log("error: "+error);
                        }
                    });
                  }
              });
          }
      });




      // Insert 폼 = 상담 신청
      const myForm = document.querySelector("#myForm");
      myForm.addEventListener("submit", ajaxInsert);

      function ajaxInsert() {
          event.preventDefault(); // 기본 동작 취소

          // 사용자가 선택한 라디오 버튼의 값을 가져옵니다.
          const radio = $("input[name='options']:checked").val();

          const selectPro = $('#selectPro').val();
          const starDate = $('#starDate').val();
          const title = $('#title').val();
          const conTextarea = $('#con_textarea').val();

          // console.log("보낼 데이터" + selectPro, starDate, title, conTextarea);

          // Ajax 요청을 보냅니다.
          $.ajax({
              type: "POST",
              url: "/stu/counselInsert",
              headers: {
                  "X-CSRF-TOKEN": csrf // CSRF 토큰을 헤더에 추가
              },
              data: JSON.stringify({
                  stuMemNo: memNo,
                  proMemNo: selectPro,
                  cnslDe: starDate,
                  cnslTtl: title,
                  cnslCon: conTextarea
              }),
              contentType: "application/json",
              dataType: "text",
              success: function(data) {
                  if (data) {
                    Swal.fire({
                      icon: 'success',
                      title: '성공적으로 상담을 신청했습니다.'
                    }).then((result) => {
                      // console.log("돌아온 Data : "+data)
                      $("#Modal_1").modal("hide");
                      reloadList();
                    });
                  }
              },
              error: function(xhr, status, error) {	
                  console.log("code: "+xhr);
                  console.log("message: "+status);
                  console.log("error: "+error);
              }
          });
      }


      let $option1 = $('#option1');
      let $option2 = $('#option2');

      // 상담 신청 버튼 클릭 시
      $("#apllyBtn").click(function() {
          $('#option1').prop('checked', true); // 라디오 버튼 선택
          $option1.parent('label').addClass('active');
          $option2.parent('label').removeClass('active');
          $('#selectPro').val("");
          $('#starDate').val("");
          $('#title').val("");
          $('#con_textarea').val("");
      })

      // 자동입력
      $('#auto-input').click(function () {

          $option2.prop('checked', true); // 라디오 버튼 선택
          $option1.parent('label').removeClass('active');
          $option2.parent('label').addClass('active');

          let selectedProf = "200901P004"; // 선택한 교수
          let requestDate = "2023-10-17"; // 상담 요청일
          let counselTitle = "진로 및 학업 상담 신청"; // 상담 제목
          let counselContent = `안녕하세요, 교수님!\n저는 학업 및 진로에 대해 조언을 구하고자 상담을 신청합니다. 현재 제 학업 및 진로 방향에 대한 고민이 많이 되고 있어서 교수님의 조언을 듣고 싶습니다.\n특히 IT분야에 대해서 어떻게 해야 할지에 대한 지침과 조언을 부탁드립니다.\n교수님의 소중한 조언을 기다리고 있겠습니다. 감사합니다.`;

          // 필드에 값을 설정
          $('#selectPro').val(selectedProf);
          $('#starDate').val(requestDate);
          $('#title').val(counselTitle);
          $('#con_textarea').val(counselContent);
      });

  });




</script>