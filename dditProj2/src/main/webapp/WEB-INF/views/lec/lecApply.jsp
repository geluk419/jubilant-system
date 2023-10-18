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
  #modalTable1 tr th {
      color: #000000;
      white-space:nowrap;
  }
  .row {
      align-items: flex-end;
  }
  div:where(.swal2-icon).swal2-question.swal2-icon-show .swal2-icon-content {
      padding-top: 10px;
  }

  .form-control:disabled, .form-control[readonly] {
      background-color: #ffffff;
  }

  #stuNow {
      border-radius: 10px;
      margin-bottom: 3rem;
      border: 2px solid #000000;
  }

/* 수강 신청 계획서 테이블 */
  .table {
      color: #000000;
  }

  .table-col {
      background-color: #f3b7bd;
  }

  .table-bordered th, .table-bordered td {
      border: 1px solid #000000;
  }

  .td-my {
      text-align: left;
  }
  
  .w-15 {
      width: 15%;
  }
  .w-20 {
      width: 20%;
  }
</style>

<div class="wrapper w-75">
  <main role="main" class="main-content mx-auto">
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-12">
          <h2 class="mb-2 page-title text-center">수강신청</h2>

          <h4 class="h4 text-my">수강 현황</h4>
          <div class="card-body bg-danger-lighter" id="stuNow">
            <form>

              <div class="form-group row mb-0 text-black">
                <div class="form-group col-3 mb-0">
                  <div class="form-group">
                    <label for="inputDep" class="form-label">재학 학과</label>
                    <input class="form-control" id="inputDep" type="text" readonly>
                  </div>
                </div>

                <div class="form-group col-3 mb-0">
                  <div class="form-group">
                    <label for="inputSem" class="form-label">재학 학기</label>
                    <input class="form-control" id="inputSem" type="text" readonly>
                  </div>
                </div>

                <div class="form-group col-3 mb-0">
                  <div class="form-group">
                    <label for="inputApplySem" class="form-label">현재 신청 학점</label>
                    <input type="text" class="form-control" id="inputApplySem" readonly>
                  </div>
                </div>

                <div class="form-group col-3 mb-0">
                  <div class="form-group">
                    <label for="inputApplyMax" class="form-label">신청 가능 학점</label>
                    <input class="form-control" id="inputApplyMax" type="text" value="18" readonly>
                  </div>
                </div>

              </div>

            </form>
          </div>

          <div class="row justify-content-end">
            <div class="form-group col-md-3 text-left">
              <h4 class="h4 text-my">강의 리스트</h4>
            </div>

            <div class="form-group input-group col-md-9 mb-0 justify-content-end">
              <div class="form-group mx-2">
                <label for="inputClass"></label>
                <select id="inputClass" class="form-control"></select>
              </div>
              <div class="form-group mx-2">
                <label for="inputYear"></label>
                <select id="inputYear" class="form-control">
                  <option value="" selected>학년</option>
                  <option value="1">1학년</option>
                  <option value="2">2학년</option>
                  <option value="3">3학년</option>
                  <option value="4">4학년</option>
                  <option value="5">5학년</option>
                </select>
              </div>
              <div class="form-group mx-2">
                <label for="inputSe"></label>
                <select id="inputSe" class="form-control">
                  <option value="" selected>이수구분</option>
                  <option value="전필">전공필수</option>
                  <option value="전선">전공선택</option>
                  <option value="교필">교양필수</option>
                  <option value="교선">교양선택</option>
                </select>
              </div>

              <div class="form-group mx-2">
                <label for="inputPro"></label>
                <select id="inputPro" class="form-control">
                </select>
              </div>
              <div class="form-group mx-2">
                <label for="inputWord"></label>
                <input type="text" class="form-control" id="inputWord" placeholder="강의명">
              </div>
              <div class="form-group mx-2 pt-4">
                <button type="button" class="btn btn-my" id="selectBtn">검색</button>
              </div>
            </div>

          </div>


          <!-- Small table -->
          <div class="row my-1 justify-content-center">
            <div class="col-md-12">
              <div class="card shadow">
                <div class="card-body">


                  <!-- table -->
                  <table class="table datatables text-center" id="dataTable-1">
                    <thead class="bg-my">
                    <tr>
                      <th>No.</th>
                      <th class="w-15">개설학과</th>
                      <th>학년</th>
                      <th>이수구분</th>
                      <th class="w-20">강의명</th>
                      <th>학점</th>
                      <th>최대인원</th>
                      <th>교수명</th>
                      <th>강의계획서</th>
                      <th>신청</th>
                    </tr>
                    </thead>
                    <tbody class="tbody">
                    </tbody>
                  </table>

                  <div id="loading-spinner" class="text-center">
                    <div id="" class="spinner-grow mr-3 text-danger" role="status">
                      <span class="sr-only">Loading...</span>
                      <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </div>
                  </div>

                </div>
              </div>
            </div> <!-- simple table -->

            <!-- 페이징 -->
            <nav aria-label="Table Paging" class="mt-3 mb-0 text-muted" id="paging">
            </nav>


            <!-- 모달 -->
            <div class="modal fade show" id="verticalModal" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" style="padding-right: 19px;" aria-modal="true">
              <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h4 class="modal-title" id="verticalModalTitle">강의 계획서</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">×</span>
                    </button>
                  </div>
                  <div class="modal-body">

                    <div class="form-group">
                      <div class="">
                        <table class="table table-bordered text-center border-0" id="modalTable1">
                          <thead></thead>
                          <tbody>
                            <tr><th class="border-0 text-left p-0 pt-3" colspan="6"><h6 class="mb-0">[수업관련]</h6></th></tr>
                            <tr>
                              <th class="table-col">교과목명</th>
                              <td class="td-my" colspan="3" id="subNm"></td>
                              <th class="table-col">강의실</th>
                              <td class="td-my" colspan="3" id="adress"></td>
                            </tr>
                            <tr>
                              <th class="table-col">개설학과</th>
                              <td class="td-my" colspan="3" id="depNm"></td>
                              <th class="table-col" rowspan="2">강의시간</th>
                              <td class="td-my" colspan="3" rowspan="2" id="schedule"></td>
                            </tr>
                            <tr>
                              <th class="table-col">이수구분</th>
                              <td class="td-my"  colspan="1" id="lecaSeCode"></td>
                              <th class="table-col">학점</th>
                              <td colspan="1" id="lecaCrd"></td>
                            </tr>
                            <tr>
                              <th class="table-col">학년</th>
                              <td class="td-my" colspan="3" id="lecaTrg"></td>
                              <th class="table-col">학기</th>
                              <td class="td-my" colspan="3" id="lecaDate"></td>
                            </tr>
                            <tr>
                              <th class="table-col">최대정원</th>
                              <td class="td-my" colspan="3" id="lecaCap"></td>
                              <th class="table-col">총수업일수</th>
                              <td class="td-my" colspan="3" id="lecaCount"></td>
                            </tr>


                            <tr><th class="border-0 text-left p-0 pt-3" colspan="6"><h6 class="mb-0">[교수관련]</h6></th></tr>
                            <tr>
                              <th class="table-col">교수명</th>
                              <td class="td-my" colspan="3" id="proNm"></td>
                              <th class="table-col">연락처</th>
                              <td class="td-my" colspan="3" id="proTel"></td>
                            </tr>
                            <tr>
                              <th class="table-col">소속학과</th>
                              <td class="td-my" colspan="3" id="memDepNm"></td>
                              <th class="table-col">이메일</th>
                              <td class="td-my" colspan="3" id="memMl"></td>
                            </tr>

                            <tr><th class="border-0 text-left p-0 pt-3" colspan="6"><h6 class="mb-0">[평가관련]</h6></th></tr>
                            <tr>
                              <th class="table-col" rowspan="1">평가비율</th>
                              <td class="td-my" colspan="7">중간 30% / 기말 40% / 출결 10% / 과제 20%</td>
                            </tr>
                            <tr>
                              <th class="table-col">평가비율</th>
                              <td class="td-my" colspan="7">
                                <div class="progress rounded my-3" style="height:14px">
                                  <div class="progress-bar bg-danger" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">30%</div>
                                  <div class="progress-bar bg-warning" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">40%</div>
                                  <div class="progress-bar bg-success" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">10%</div>
                                  <div class="progress-bar bg-info" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">20%</div>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <th class="table-col">평가기준</th>
                              <td class="td-my" colspan="7" id="codeNm"></td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>

                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">닫기</button>
                  </div>
                </div>
              </div>
            </div><!-- 모달 -->

          </div> <!-- end section -->
        </div> <!-- .col-12 -->
      </div> <!-- .row -->
    </div> <!-- .container-fluid -->


  </main> <!-- main -->
</div>

<!-- JavaScript 코드 추가 -->
<script>
  $(document).ready(function () {
      // 시큐리티 CSRF 토큰 값을 가져옵니다.
      const csrf = $("#csrf").val();
      const memNo = "<%=memNo%>";
      const size = 10;   // 페이지에 보여줄 개수

      // 기본 실행 함수
      selectStudent();          // 현재 학생 정보


      // 수강계획서 보기 버튼 클릭 시
      $(document).on("click", ".viewBtn", function() {
          const lecaId = $(this).closest("td").data("leca-id");
          // console.log("lecaId: " + lecaId);
          $("#input_m_1").val(lecaId);

          // 강의 정보 가져오기
          $.ajax({
              type: "GET",
              url: "/stu/recApply/" + lecaId,
              headers: {
                  "X-CSRF-TOKEN": csrf // CSRF 토큰을 헤더에 추가
              },
              dataType: "json",
              success: function(data) {
                  if (data) {
                    // 강의계획서에 필요한 데이터(한 개의 강의에 여러개의 요일이 있어 data[0]으로 해줘야 함)
                      console.log("로그 : " + JSON.stringify(data[0]));
                      let subNm = data[0].subNm;
                      let adress = data[0].bldNm + " - " + data[0].roomNo + "호실";
                      let depNm = data[0].depNm;
                      let lecaSeCode = data[0].lecaSeCode;
                      let lecaCrd = data[0].lecaCrd + "점";
                      let lecaTrg = data[0].lecaTrg + "학년";
                      let lecaCap = data[0].lecaCap + "명";
                      let lecaDate = data[0].lecaYr + "년 " + data[0].lecaSem + "학기";
                      let lecaCount = data[0].lecaCount + "일";
                      let proNm = data[0].memNm;
                      let proTel = data[0].memTel;
                      let memDepNm = data[0].memDepNm;
                      let memMl = data[0].memMl;
                      let codeNm = data[0].codeNm;


                      $("#subNm").text(subNm);
                      $("#adress").text(adress);
                      $("#depNm").text(depNm);
                      $("#lecaSeCode").text(lecaSeCode);
                      $("#lecaCrd").text(lecaCrd);
                      $("#lecaTrg").text(lecaTrg);
                      $("#lecaDate").text(lecaDate);
                      $("#lecaCap").text(lecaCap);
                      $("#lecaCount").text(lecaCount);
                      $("#proNm").text(proNm);
                      $("#proTel").text(proTel);
                      $("#memDepNm").text(memDepNm);
                      $("#memMl").text(memMl);
                      $("#codeNm").text(codeNm);

                      let schedule = "";
                      $.each(data, function(index, item) {
                          if (item.lecdWeek == null){
                              schedule = "데이터가 없습니다.";
                          } else {
                              schedule += item.lecdWeek + " " + item.lecdSt + " ~ " + item.lecdEt + "<br>";
                          }
                      });
                      $("#schedule").html(schedule);
                  }
              },
              error: function(xhr, status, error) {
                  console.log("code: "+xhr);
                  console.log("message: "+status);
                  console.log("error: "+error);
              }
          });

          //  모달 창 보이기
          $("#verticalModal").modal("show");
      });

      // 페이지 로드 시 현재 학생의 정보
      function selectStudent() {
          $.ajax({
              type: "GET",
              url: "/stu/lecStuInfo",
              data: {
                  memNo: memNo
              },
              dataType: "json",
              headers: {
                  "X-CSRF-TOKEN": csrf // CSRF 토큰을 헤더에 추가
              },
              success: function(data) {
                  $("#inputDep").val(data.depNm);

                  let now = data.stuYr + "학년 " + data.stuSem + "학기";
                  // console.log("now : " + now);
                  $("#inputSem").val(now);

                  if (data.lecaCrd) {
                    $("#inputApplySem").val(data.lecaCrd)
                  } else {
                    $("#inputApplySem").val("0");
                  }

                  // data.stuSem의 값과 일치하는 학년 옵션을 선택
                  $("#inputYear option").each(function() {
                      if ($(this).val() === data.stuYr) {
                          $(this).prop("selected", true);
                      }
                  });
              },
              error: function(xhr, status, error) {
                  console.log("code: "+xhr);
                  console.log("message: "+status);
                  console.log("error: "+error);
              }
          });

          selectStuLecApplyList();  // 초기 리스트 호출
          getDepartmentList();      // 검색 리스트 전체
          getPagingNum();           // 리스트 페이징ㅇ
      }

      $("#selectBtn").on("click", conditionSelect);

      // 수강 신청 버튼 클릭 시
      $(document).on("click", ".applyBtn", function () {
          const lecCode = $(this).closest("td").data("lec-code");
          // console.log("lecCode : " + lecCode);

          const depNm = $(this).closest("tr").find("td:eq(1)").text();
          const subNm = $(this).closest("tr").find("td:eq(4)").text();

          // 학점 가져오기
          const slCrd = $(this).closest("tr").find("td:eq(5)").text();
          // 학기 가져오기
          const slSem =  $("#inputSem").val().substring(4, 5);

          // console.log("로그 : "+slCrd + "," + slSem);

          Swal.fire({
              title: depNm + "의 " + subNm,
              text: '해당 강의를 신청 하시겠습니까?',
              icon: 'question',
              showCancelButton: true,
              confirmButtonColor: '#2378e7',
              confirmButtonText: '신청',
              cancelButtonColor: '#9a9a9a',
              cancelButtonText: '취소',
              reverseButtons: true
          }).then((result) => {
            if (result.isConfirmed) { // 신청 버튼
              if (Number($("#inputApplySem").val())+Number(slCrd) > Number($("#inputApplyMax").val())) {
                  Swal.fire({
                      icon: 'error',
                      title: '수강신청 실패',
                      text: '신청 가능한 학점을 초과합니다.',
                  });
                  return;
              }
              $.ajax({
                  type: "POST",
                  url: "/stu/lecApply",
                  data: JSON.stringify({
                      memNo: memNo,
                      lecCode: lecCode,
                      lecaCrd: slCrd,
                      lecaSem: slSem
                  }),
                  contentType: "application/json",
                  dataType: "text",
                  headers: {
                      "X-CSRF-TOKEN": csrf // CSRF 토큰을 헤더에 추가
                  },
                  success: function (data) {
                      if (data === "Fail"){
                          Swal.fire({
                              icon: 'error',
                              title: '수강신청 실패',
                              text: '이미 신청하신 강의 입니다.',
                          });
                      } else if (data) {
                          // console.log(data);
                          selectStudent();
                          timeAlert();
                      }
                  },
                  error: function(xhr, status, error) {
                      console.log("code: "+xhr);
                      console.log("message: "+status);
                      console.log("error: "+error);
                  }
              });
            }
          })
      })

      function timeAlert () {
          const Toast = Swal.mixin({
              toast: true,
              position: 'center-center',
              showConfirmButton: false,
              timer: 2500,
              timerProgressBar: true,
              didOpen: (toast) => {
                  toast.addEventListener('mouseenter', Swal.stopTimer)
                  toast.addEventListener('mouseleave', Swal.resumeTimer)
              }
          });
          Toast.fire({
              icon: 'success',
              title: '수강신청이 성공 했습니다.'
          });
      }



      // HTML 코드를 생성하는 함수 정의
      function generateHTML(data) {
          let html = "";

          $.each(data, function(index, item) {
            html += `
              <tr>
                <td>\${index+1}</td>
                <td>\${item.depNm}</td>
                <td>\${item.lecaTrg}</td>
                <td>\${item.lecaSeCode}</td>
                <td class="text-left">\${item.lecaNm}</td>
                <td>\${item.lecaCrd}</td>
                <td>\${item.lecaCap}</td>
                <td>\${item.memNm}</td>
                <td data-leca-id="\${item.lecaId}">
                  <button class="btn btn-sm btn-primary viewBtn" type="button" data-toggle="modal" data-target="#verticalModal">강의계획서 보기</button>
                </td>
                <td data-lec-code="\${item.lecCode}">
                  <button class="btn btn-sm btn-my applyBtn">신청</button>
                </td>
              </tr>
            `;
          })

          return html;
      }

      // 검색옵션 검색
      function  conditionSelect() {
          let inputClass = $("#inputClass").val();
          let inputYear = $("#inputYear").val();
          let inputSe = $("#inputSe").val();
          let inputPro = $("#inputPro").val();
          let inputWord = $("#inputWord").val();

          let searchOptions = {
              inputClass: inputClass,
              inputYear: inputYear,
              inputSe: inputSe,
              inputPro: inputPro,
              inputWord : inputWord,
              currentPage: '1'
          };

          selectStuLecApplyList(searchOptions); // 리스트
          getPagingNum(searchOptions);          // 페이징
      }

      // 리스트 생성
      function selectStuLecApplyList(searchOptions){
          if (!searchOptions) {
              searchOptions = {}; // searchOptions가 정의되지 않았을 경우 빈 객체로 초기화
              searchOptions.currentPage = '1';
          }
          searchOptions.memNo = memNo;
          searchOptions.size = size;

          $.ajax({
              type: "GET",
              url: "/stu/lecApplyList",
              data: searchOptions,
              dataType: "json",
              headers: {
                  "X-CSRF-TOKEN": csrf // CSRF 토큰을 헤더에 추가
              },
              success: function(data) {
                  // console.log("로그 : " + data);

                  let html = generateHTML(data);        // HTML 테이블 생성 함수
                  generateProfessorOptions(data);       // 교수 중복 방지 함수

                  // 로딩 스피너 숨김
                  $("#loading-spinner").hide();
                  $(".tbody").html(html);

              },
              error: function(xhr, status, error) {
                  console.log("code: "+xhr);
                  console.log("message: "+status);
                  console.log("error: "+error);
              }
          });
      }


      // 페이징에 필요한 전체 페이지 변수 가져오기
      function getPagingNum(searchOptions){
          if (!searchOptions) {
              searchOptions = {}; // searchOptions가 정의되지 않았을 경우 빈 객체로 초기화
              searchOptions.currentPage = '1';
          }
          searchOptions.memNo = memNo;
          // searchOptions.lecaTrg =
          // searchOptions.lecaDate = $("#lecaDate").val();
          searchOptions.size = size;

          $.ajax({
              type: "GET",
              url: "/stu/totalStuLecApplyList",
              data: searchOptions,
              dataType: "json",
              headers: {
                  "X-CSRF-TOKEN": csrf // CSRF 토큰을 헤더에 추가
              },
              success: function(data) {
                  // console.log("로그 : " + data.totalPages);

                  let total = Number(data.totalPages);

                  // 페이지 버튼 생성
                  generatePagination(total, 1);

              },
              error: function(xhr, status, error) {
                  console.log("code: "+xhr);
                  console.log("message: "+status);
                  console.log("error: "+error);
              }
          });
      }

      // 페이지 버튼 생성 함수
      function generatePagination(totalPages, currentPage) {
          let paginationHtml = '<ul class="pagination justify-content-center mb-0">';

          // 이전 페이지 버튼
          paginationHtml += '<li class="page-item"><a class="page-link" href="#" data-page="prev">이전</a></li>';

          // 페이지 번호 버튼
          for (let i = 1; i <= totalPages; i++) {
              if (i === currentPage) {
                  paginationHtml += '<li class="page-item active"><a class="page-link" href="#" data-page="' + i + '">' + i + '</a></li>';
              } else {
                  paginationHtml += '<li class="page-item"><a class="page-link" href="#" data-page="' + i + '">' + i + '</a></li>';
              }
          }

          // 다음 페이지 버튼
          paginationHtml += '<li class="page-item"><a class="page-link" href="#" data-page="next">다음</a></li>';

          paginationHtml += '</ul>';

          // 페이지 버튼을 삽입할 요소에 추가
          $("#paging").html(paginationHtml);
      }

      // 페이지 번호 버튼 클릭 이벤트
      $(document).on("click", ".page-link", function (e) {
          e.preventDefault();

          let page = $(this).data("page"); // 클릭한 페이지 번호

          // 현재 페이지와 총 페이지 수를 가져옴
          let currentPage = parseInt($(".page-item.active").find(".page-link").data("page"));
          let totalPages = parseInt($("#paging").find(".page-item").eq(-2).find(".page-link").data("page"));

          // console.log("totalPages: " + totalPages);

          // 다른 페이지 번호 버튼에는 active 클래스 제거
          $(".page-item").removeClass("active");

          // "이전" 버튼 클릭 시
          if (page === "prev") {
              currentPage = 1;
              $(".page-item").eq(1).addClass("active"); // 1에 active 클래스 추가

              // 1 페이지에서는 이전 버튼을 비활성화
              $(".page-item:first-child").addClass("disabled");

              // 마지막 페이지에서 다음 버튼 활성화
              $(".page-item:last-child").removeClass("disabled");
          }
          // "다음" 버튼 클릭 시
          else if (page === "next") {
              currentPage = totalPages;
              $(".page-item").eq(-2).addClass("active");

              // 마지막 페이지에서는 다음 버튼을 비활성화
              $(".page-item:last-child").addClass("disabled");

              // 1 페이지에서 이전 버튼 활성화
              $(".page-item:first-child").removeClass("disabled");
          }
          // 페이지 번호 버튼 클릭 시
          else {
              currentPage = parseInt(page); // 문자열을 정수로 변환
              // 클릭한 페이지 번호 버튼에 active 클래스 추가
              $(this).parent().addClass("active");

              // 1 페이지에서는 이전 버튼을 비활성화
              if (currentPage === 1) {
                  $(".page-item:first-child").addClass("disabled");
                  $(".page-item:last-child").removeClass("disabled");
              }

              // 마지막 페이지에서는 다음 버튼을 비활성화
              if (currentPage === totalPages) {
                  $(".page-item:last-child").addClass("disabled");
                  $(".page-item:first-child").removeClass("disabled");
              }
          }

          // 페이지 번호가 변경되었으므로 해당 페이지의 데이터를 다시 불러옴
          selectStuLecApplyList({ currentPage: currentPage, size: size });
      });




      // 교수 중복 방지 함수
      function generateProfessorOptions(data) {
          let uniqueMemNms = new Set();
          $.each(data, function(index, item) {
              // memNm 값을 Set에 추가
              uniqueMemNms.add(item.memNm);
          });

          // Set을 배열로 변환하여 고유한 memNm 값을 얻음
          let uniqueMemNmArray = Array.from(uniqueMemNms);

          // 고유한 memNm 값들로 옵션을 생성
          let option = "<option value=''>교수 선택</option>";
          uniqueMemNmArray.forEach(function(memNm) {
              option += `<option value="\${memNm}">\${memNm}</option>`;     // 교수의 value값이 한글이름!!
          });

          $("#inputPro").html(option);
      }

      // 학과 정보 불러오기
      function getDepartmentList() {
          $.ajax({	
              type: "GET",
              url: "/stu/departmentList",
              dataType: "json",
              success: function(data) {
                  let html;
                  html = "<option value=''>학과선택</option>";
                  $.each(data, function(index, item) {
                    html += `<option value="\${item.depCode}">\${item.depNm}</option>`;
                  });
                  // console.log("학과 : " + html);
                  $("#inputClass").html(html);
              },
              error: function(xhr, status, error) { 
                  console.log("code: "+xhr);
                  console.log("message: "+status);
                  console.log("error: "+error);
              }
          });

      }
  });
</script>