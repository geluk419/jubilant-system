<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  // 현재 인증된 사용자 정보를 가져옴
  Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

  // 사용자 정보에서 memNo를 추출
  String memNo = authentication.getName();
%>

<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<style>
    /* FullCalendar의 이벤트 요소에 대한 스타일을 지정합니다. */
    .fc-event {
        background-color: #007bff; /* 일정 배경색 */
        color: #fff; /* 글꼴 색상 */
    }
    /* 일요일 날짜 빨간색 */
    .fc-day-sun a {
        color: red;
        text-decoration: none;
    }
    /* 토요일 날짜 파란색 */
    .fc-day-sat a {
        color: blue;
        text-decoration: none;
    }
    th > .fc-scrollgrid-sync-inner {
        color: #000000;
        padding: 0.5em 0;
    }

    /* 이벤트 호버 시 스타일 변경 */
    .fc-event:hover {
        background-color: #0056b3; /* 호버 시 배경색 변경 */
    }
    /* 사용자 지정 이벤트 클래스에 대한 스타일을 지정합니다. */
    .my-custom-event {
        background-color: green; /* 일정 배경색 */
        color: #fff; /* 글꼴 색상 */
    }

    .table thead th, .table tbody tr th {
        color: var(--white-color);
        white-space:nowrap;
    }



    .fc-button.fc-button-primary {
        color: #ffffff;
        border-radius: 0.5em;
        border: 1px solid transparent;
    }
    .fc .fc-button-primary:disabled {
        background-color: #000000;
    }

    .fc .fc-button-primary:not(:disabled).fc-button-active, .fc .fc-button-primary:not(:disabled):active,
    .fc-button.fc-button-primary:hover{
        background-color: rgb(182, 26, 63);;
        color: #ffffff;
        border: 1px solid transparent;
    }

    /* 테이블 높이 제한 */
    #table-content {
        max-height: 350px;
        overflow-y: auto;
        margin-bottom: 100px;
    }

    /* 체크 박스 */
    .form-check-inline .form-check-input {
        width: 20px;
        height: 20px;
    }
</style>

<div class="wrapper w-75 mt-4">
  <main role="main" class="main-content w-75 mx-auto p-1">
    <!-- ////////// 캘린더를 감싸는 div 시작 ////////// -->
    <div id='calendar' class="w-100 m-auto"></div>
    <!-- ////////// 캘린더를 감싸는 div 끝 ////////// -->

    <div class="row mt-4">
      <div class="col-3">
        <button type="button" class="btn btn-my ml-1" id="addEventBtn">일정 추가</button>
      </div>

      <div class="input-group mb-3 col-9 justify-content-end">
        <div class="mr-2">
          <label for="inputSeleteYear" class="d-none"></label>
          <select id="inputSeleteYear" class="form-control px-2">
            <option value="2023">2023년</option>
            <option value="2022">2022년</option>
            <option value="2021">2021년</option>
            <option value="2020">2020년</option>
          </select>
        </div>

        <div class="mr-2">
          <label for="inputSeleteMonth" class="d-none"></label>
          <select id="inputSeleteMonth" class="form-control px-2">
            <option value="">월별</option>
            <option value="01">1월</option>
            <option value="02">2월</option>
            <option value="03">3월</option>
            <option value="04">4월</option>
            <option value="05">5월</option>
            <option value="06">6월</option>
            <option value="07">7월</option>
            <option value="08">8월</option>
            <option value="09">9월</option>
            <option value="10">10월</option>
            <option value="11">11월</option>
            <option value="12">12월</option>
          </select>
        </div>
        <div class="mr-2">
          <label for="inputSelete1" class="d-none"></label>
          <select id="inputSelete1" class="form-control px-2"></select>
        </div>

        <div class="">
          <button class="btn btn-my"
                  type="button" id="selectBtn">검색</button>
        </div>
      </div>
    </div>

    <div id="loading-spinner" class="text-center d-none">
      <div id="" class="spinner-grow mr-3 text-danger" role="status">
        <span class="sr-only">Loading...</span>
      </div>
    </div>
    <!-- table -->
    <div id="table-content"></div>



    <!-- 모달 대화상자 추가 -->
    <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

          <!-- 일정 입력 폼 -->
          <form id="sch_insert_form">

            <div class="modal-header">
              <h5 class="modal-title " id="exampleModalLabel">일정 추가</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              <div class="form-group">
                <label for="calendar_class">일정 분류</label>
                <select id="calendar_class" class="form-control" required></select>
              </div>
              <div class="form-group p-1">
                <label for="">대상</label>
                <div class="form-control fs-18 border-0 p-0">
                  <div class="form-check form-check-inline mr-4">
                    <input class="form-check-input " type="checkbox" id="inlineCheckbox1" value="학생">
                    <label class="form-check-label" for="inlineCheckbox1">학생</label>
                  </div>
                  <div class="form-check form-check-inline mr-4">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="교수">
                    <label class="form-check-label" for="inlineCheckbox2">교수</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="교직원">
                    <label class="form-check-label" for="inlineCheckbox3">교직원</label>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label for="calendar_content">일정 제목</label>
                <input type="text" class="form-control" id="calendar_content" name="calendar_content" required>
              </div>
              <div class="form-group row">
                <div class="form-group col-6">
                  <label for="calendar_start_date">시작 날짜</label>
                  <input type="date" class="form-control" id="calendar_start_date" name="calendar_start_date" required>
                </div>
                <div class="form-group col-6">
                  <label for="calendar_end_date">종료 날짜</label>
                  <input type="date" class="form-control" id="calendar_end_date" name="calendar_end_date" required>
                </div>
              </div>

            </div>
            <div class="modal-footer">
              <button type="button" class="btn mb-2 btn-info" id="auto-input">자동입력</button>
              <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
              <button type="submit" class="btn btn-my" id="addCalendar">추가</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <!-- 모달 끝 -->

    <!-- 모달 대화상자 상세보기 삭제, 수정 -->
    <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel"
         aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <!-- 일정 수정 폼 -->
          <form id="sch_update_form">

            <div class="modal-header">
              <h5 class="modal-title " id="detailModalLabel">일정 상세</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              <input type="hidden" name="schCode" id="schCode" />
              <div class="form-group">
                <label for="update_class">일정 분류</label>
                <select id="update_class" class="form-control" required></select>
              </div>
              <div class="form-group p-1">
                <label for="">대상</label>
                <div class="form-control fs-18 border-0 p-0">
                  <div class="form-check form-check-inline mr-4">
                    <input class="form-check-input" type="checkbox" id="updatCheckbox1" value="학생">
                    <label class="form-check-label" for="updatCheckbox1">학생</label>
                  </div>
                  <div class="form-check form-check-inline mr-4">
                    <input class="form-check-input" type="checkbox" id="updatCheckbox2" value="교수">
                    <label class="form-check-label" for="updatCheckbox2">교수</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="updatCheckbox3" value="교직원">
                    <label class="form-check-label" for="updatCheckbox3">교직원</label>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label for="update_content">일정 내용</label>
                <input type="text" class="form-control" id="update_content" name="calendar_content" required>
              </div>

              <div class="form-group row">
                <div class="form-group col-6">
                  <label for="update_start_date">시작 날짜</label>
                  <input type="date" class="form-control" id="update_start_date" name="calendar_start_date" required>
                </div>
                <div class="form-group col-6">
                  <label for="update_end_date">종료 날짜</label>
                  <input type="date" class="form-control" id="update_end_date" name="calendar_end_date" required>
                </div>
              </div>

            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-info" id="auto-update">자동입력</button>
              <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
              <button type="button" class="btn btn-danger" id="deleteCalendar">삭제</button>
              <button type="submit" class="btn btn-primary" id="updateCalendar">수정</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <!-- 모달 끝 -->

  </main>
</div>


<script>


    $(document).ready(function () {
        // 시큐리티 CSRF 토큰 값을 가져옵니다.
        const csrf = $("#csrf").val();
        const memNo = "<%=memNo%>";

        // HTML 코드를 생성하는 함수 정의
        function generateHTML(data) {
            let html = "";
            html += `
              <table class="table datatables text-center" id="dataTable-1">
                <thead class="bg-secondary-light">
                  <th>No.</th>
                  <th>시작일자</th>
                  <th>종료일자</th>
                  <th>일정분류</th>
                  <th>일정명</th>
                  <th>등록자</th>
                  <th>상세</th>
                </thead>
                <tbody>
            `;

            $.each(data, function(index, item) {
                if (item.memNm == null || item.memNm === "") {
                    item.memNm = "관리자";
                }
                html += `
                  <tr>
                    <td>\${index + 1}</td>
                    <td>\${item.schSt}</td>
                    <td>\${item.schEt}</td>
                    <td>\${item.codeSchSeNm}</td>
                    <td class="text-left">\${item.schTtl}</td>
                    <td>\${item.memNm}</td>
                    <td data-sch-code="\${item.schCode}">
                        <button class='btn btn-my detailBtn'>상세</button>
                    </td>
                  </tr>
                `;
            })
            html += "</tbody></table>";

            return html;
        }

        // 학사 일정 조건별 검색
        $("#selectBtn").on("click", function(){
            // let searchStr = $("#searchInput").val();
            let selectedYear = $("#inputSeleteYear").val();
            let selectedMonth = $("#inputSeleteMonth").val();
            let selectedValue = $("#inputSelete1").val();
            let $table = $("#table-content");
            $.ajax({
                type: "GET",
                url: "/admin/scheduleSelect",
                data: {
                    // str: searchStr,
                    selectedYear: selectedYear,
                    selectedMonth: selectedMonth,
                    selectedValue: selectedValue
                },
                dataType: "json",
                success: function(data) {
                    console.log("검색 :", data);
                    // 기존 데이터 테이블 항목 삭제
                    $table.empty();
                    let html = generateHTML(data);

                    // 테이블 컨테이너 업데이트
                    $table.html(html);
                },
                error: function(xhr, status, error) {
                    console.log("code: " + xhr);
                    console.log("message: " + status);
                    console.log("error: " + error);
                }
            });
        })

        // 리스트를 다시 로드하는 비동기 함수
        function reloadList() {
            $.ajax({
                type: "GET",
                url: "/admin/scheduleList",
                dataType: "json",
                success: function(data) {

                    // 받은 JSON 데이터를 사용하여 HTML 생성 및 테이블 업데이트
                    let html = generateHTML(data);

                    // events 배열을 초기화
                    calendarOptions.events = [];

                    $.each(data, function(index, item) {

                        let backgroundColor = ""; // 배경색 변수 초기화
                        let color = "#ffffff";
                        switch (item.codeSchSe) {
                            case "11": backgroundColor = "#4eb24e"; break;
                            case "12": backgroundColor = "#4ca8f1"; break;
                            case "13": backgroundColor = "#e75d5d"; break;
                            case "14": backgroundColor = "#dd61e1"; break;
                            case "15":
                                backgroundColor = "#eeee7d";
                                color = "#000000";
                                break;
                            default: backgroundColor = "gray"; break;
                        }

                        // events 배열에 이벤트 추가
                        calendarOptions.events.push({
                            id: item.schCode
                            , title: item.schTtl
                            , start: item.schSt
                            , end: item.schEt
                            , backgroundColor: backgroundColor
                            , textColor: color
                            , borderColor : "rgba(0,0,0,0.2)"
                        });
                    });

                    // 로딩 스피너 숨김
                    $("#loading-spinner").hide();
                    // 리스트 컨테이너 업데이트
                    $("#table-content").html(html);

                    // 캘린더를 수정 불가능하도록 변경
                    calendar.setOption('editable', false);
                },
                error: function(xhr, status, error) {
                    console.log("code: "+xhr);
                    console.log("message: "+status);
                    console.log("error: "+error);
                    // 로딩 스피너 숨김
                    $("#loading-spinner").hide();
                }
            });
        }


        // 공통코드 불러오기 : 학사 일정 분류
        $.ajax({
            type: "GET",
            url: "/admin/scheduleCodeSchSe",
            dataType: "json",
            success: function(data) {
                let html;
                html = "<option value=''>일정분류</option>";
                $.each(data, function(index, item) {
                    html += `
                      <option value="\${item.codeSchSe}">\${item.codeSchSeNm}</option>
                    `;
                });
                $("#inputSelete1").html(html);
                $("#calendar_class").html(html);
                $("#update_class").html(html);
            },
            error: function(xhr, status, error) {
                console.log("code: "+xhr);
                console.log("message: "+status);
                console.log("error: "+error);
            }
        });

        // Update 자동 입력
        $('#auto-update').click(function () {
            let calendarContent = "수정된 학사일정";
            let startDate = "2023-10-25";
            let endDate = "2023-11-01";
            let calendarClass = "12";
            let calendarTarget = "1";

            $("#update_content").val(calendarContent);
            $("#update_start_date").val(startDate);
            $("#update_end_date").val(endDate);
            $("#update_class").val(calendarClass);
            $("#update_target").val(calendarTarget);
        });

        // 캘린더 수정
        const schUpdateForm = document.querySelector("#sch_update_form");
        schUpdateForm.addEventListener("submit", ajaxUpdate);
        function ajaxUpdate() {
            event.preventDefault(); // 기본 동작 취소

            let schCode = $("#schCode").val();
            let content = $("#update_content").val();
            let startDate = $("#update_start_date").val();
            let endDate = $("#update_end_date").val();
            let calendarClass = $("#update_class").val();
            let checkBox1 = $("#updatCheckbox1");
            let checkBox2 = $("#updatCheckbox2");
            let checkBox3 = $("#updatCheckbox3");
            let selectedValues = []; // 선택된 값을 저장할 배열

            // 각 체크박스의 상태를 확인하고 선택된 값을 배열에 추가합니다.
            if (checkBox1.is(":checked")) {
                selectedValues.push(checkBox1.val());
            }
            if (checkBox2.is(":checked")) {
                selectedValues.push(checkBox2.val());
            }
            if (checkBox3.is(":checked")) {
                selectedValues.push(checkBox3.val());
            }

            // console.log(content, startDate, endDate, calendarClass, target);

            // Ajax 요청을 보냅니다.
            $.ajax({
                type: "PUT",
                url: "/admin/schedule",
                headers: {
                    "X-CSRF-TOKEN": csrf // CSRF 토큰을 헤더에 추가
                },
                data: JSON.stringify({
                    schCode: schCode,
                    memNo: memNo,
                    schTtl: content,
                    schSt: startDate,
                    schEt: endDate,
                    codeSchSe: calendarClass,
                    selectedValues: selectedValues
                }),
                contentType: "application/json",
                dataType: "text",
                success: function(data) {
                    console.log(data);
                    if (data === "Update Fail") {
                        Swal.fire({
                            icon: 'error',
                            title: '수정이 실패했습니다!',
                            text: '체크박스를 확인해주세요.',
                            confirmButtonText: '확인',
                        });
                    } else {
                        Swal.fire({
                            icon: 'success',
                            title: '수정이 성공적으로 처리되었습니다!',
                            confirmButtonText: '확인',
                        }).then((result) => {
                            cloasCalendar();
                        });
                    }
                },
                error: function(xhr, status, error) {
                    console.log("code: "+xhr);
                    console.log("message: "+status);
                    console.log("error: "+error);
                    cloasCalendar();
                }
            });
        }

        // 캘린더 삭제
        $("#deleteCalendar").on("click", function () {

            Swal.fire({
                title: '정말로 삭제 하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#1485ff',
                confirmButtonText: '확인',
                cancelButtonColor: '#a8a8a8',
                cancelButtonText: '취소',
                reverseButtons: true, // 버튼 순서 거꾸로

            }).then((result) => {
                if (result.isConfirmed) {
                    let schCode = $("#schCode").val();
                    // console.log("코드 : " + schCode)

                    $.ajax({
                        type: "DELETE",
                        url: "/admin/schedule/"+schCode,
                        headers: {
                            "X-CSRF-TOKEN": csrf
                        },
                        dataType: "text",
                        success: function(data) {
                            console.log(data);
                            // 캘린더 닫기
                            cloasCalendar();
                        },
                        error: function(xhr, status, error) {
                            console.log("code: "+xhr);
                            console.log("message: "+status);
                            console.log("error: "+error);
                            cloasCalendar();
                        }
                    });
                }
            } )


        })

        // 캘린더 업데이트 (이벤트 클릭 및 상세 버튼 클릭 시)
        function handleEventDetails(schCode) {
            $.ajax({
                type: "GET",
                url: "/admin/schedule/" + schCode,
                dataType: "json",
                success: function(data) {
                    // JSON 데이터에서 필요한 값을 추출
                    let schCode = data.schCode;
                    let schTtl = data.schTtl;
                    let schSt = data.schSt;
                    let schEt = data.schEt;
                    let codeSchSe = data.codeSchSe;
                    let arrayAsString = data.codeSchMem;

                    // 문자열을 체크박스로 나오게 하는 코드
                    let selectedValues = arrayAsString.split(',');
                    let checkBox1 = document.getElementById("updatCheckbox1");
                    let checkBox2 = document.getElementById("updatCheckbox2");
                    let checkBox3 = document.getElementById("updatCheckbox3");
                    if (selectedValues.includes("학생")) {
                        checkBox1.checked = true;
                    }
                    if (selectedValues.includes("교수")) {
                        checkBox2.checked = true;
                    }
                    if (selectedValues.includes("교직원")) {
                        checkBox3.checked = true;
                    }


                    // 각 input 태그에 값을 설정
                    $("#schCode").val(schCode);
                    $("#update_content").val(schTtl);
                    $("#update_start_date").val(schSt);
                    $("#update_end_date").val(schEt);
                    $("#update_class").val(codeSchSe);

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

        // Form submit 설정
        const schInsertForm = document.querySelector("#sch_insert_form");
        schInsertForm.addEventListener("submit", ajaxInsert);

        // 학사일정 Insert
        function ajaxInsert() {
            event.preventDefault(); // 기본 동작 취소

            let content = $("#calendar_content").val();
            let startDate = $("#calendar_start_date").val();
            let endDate = $("#calendar_end_date").val();
            let calendarClass = $("#calendar_class").val();
            let target = $("#calendar_target").val();
            let checkBox1 = $("#inlineCheckbox1");
            let checkBox2 = $("#inlineCheckbox2");
            let checkBox3 = $("#inlineCheckbox3");
            let selectedValues = []; // 선택된 값을 저장할 배열

            // 각 체크박스의 상태를 확인하고 선택된 값을 배열에 추가합니다.
            if (checkBox1.is(":checked")) {
                selectedValues.push(checkBox1.val());
            }
            if (checkBox2.is(":checked")) {
                selectedValues.push(checkBox2.val());
            }
            if (checkBox3.is(":checked")) {
                selectedValues.push(checkBox3.val());
            }

            // 선택된 체크박스의 개수를 확인합니다.
            const numberOfSelectedCheckboxes = selectedValues.length;

            if (numberOfSelectedCheckboxes === 0) {
              // 선택된 체크박스가 없을 경우 경고 메시지를 표시하고 제출을 막습니다.
              Swal.fire({
                icon: 'warning',
                title: '적어도 하나의 대상을 선택해야 합니다.',
              })
              return;
            }

            // console.log("체크 박스 값들: ", selectedValues);
            // console.log(content, startDate, endDate, calendarClass, target);

            // Ajax 요청을 보냅니다.
            $.ajax({
                type: "POST",
                url: "/admin/schedule",
                headers: {
                    "X-CSRF-TOKEN": csrf // CSRF 토큰을 헤더에 추가
                },
                data: JSON.stringify({
                    memNo: memNo,
                    schTtl: content,
                    schSt: startDate,
                    schEt: endDate,
                    codeSchSe: calendarClass,
                    codeSchMem: target,
                    selectedValues: selectedValues
                }),
                contentType: "application/json",
                dataType: "text",
                success: function(data) {
                    // console.log(data);
                    Swal.fire({
                      icon: 'success',
                      title: '일정이 성공적으로 추가되었습니다!',
                      confirmButtonText: '확인',
                    }).then((result) => {
                      cloasCalendar();
                    });

                    webSocket.send( content+ " 추가되었습니다!");
                },
                error: function(xhr, status, error) {
                    console.log('리스트 로딩 중 에러 발생');
                    console.log("code: "+xhr);
                    console.log("message: "+status);
                    console.log("error: "+error);
                }
            });
        }


        // 모달에서 처리 완료 후 처리 함수
        function cloasCalendar() {
            // 리스트 update
            reloadList();
            // 캘린더 update
            calendar.render();
            // 모달 닫기
            $("#detailModal").modal("hide");
            $("#calendarModal").modal("hide");
        }

        // Insert 자동 입력
        $('#auto-input').click(function () {
            let calendarContent = " 2학기 1차 강의평가"; // "휴학" 라디오 버튼의 값
            let startDate = "2023-10-23";
            let endDate = "2023-10-28";
            let calendarClass = "12";
            let arrayAsString = "학생,교수";

            // 문자열을 체크박스로 나오게 하는 코드
            let selectedValues = arrayAsString.split(',');
            let checkBox1 = document.getElementById("inlineCheckbox1");
            let checkBox2 = document.getElementById("inlineCheckbox2");
            let checkBox3 = document.getElementById("inlineCheckbox3");
            if (selectedValues.includes("학생")) {
                checkBox1.checked = true;
            }
            if (selectedValues.includes("교수")) {
                checkBox2.checked = true;
            }
            if (selectedValues.includes("교직원")) {
                checkBox3.checked = true;
            }

            $("#calendar_content").val(calendarContent);
            $("#calendar_start_date").val(startDate);
            $("#calendar_end_date").val(endDate);
            $("#calendar_class").val(calendarClass);
        });

        // 캘린더 헤더 옵션
        const headerToolbar = {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek',
        }

        // 캘린더 옵션
        let calendarOptions = {
            height: '700px',
            expandRows: true,
            timeZone: 'UTC',
            slotMinTime: '09:00',
            slotMaxTime: '18:00',
            headerToolbar: headerToolbar,
            initialView: 'dayGridMonth',
            locale: 'kr',
            selectable: true,
            selectMirror: true,
            navLinks: true,
            dayMaxEventRows: true,
            nowIndicator: true,
            displayEventTime: false,
            editable: false,
            buttonText: {
                today: "오늘",
                month: "월별",
                week: "주별",
                day: "일별",
            },
            eventClick: function(info) {
                handleEventDetails(info.event._def.publicId)
            }
        };

        // 캘린더 초기화
        let calendarEl = document.getElementById('calendar');
        let calendar = new FullCalendar.Calendar(calendarEl,  calendarOptions);
        calendar.render();



        // 상세 버튼 클릭 핸들러
        $("#table-content").on("click", ".detailBtn", function () {
            const td = $(this).closest("td");
            const schCode = td.data("sch-code");
            // console.log("schCode: " + schCode);

            if (schCode) {
                handleEventDetails(schCode);
            }
        });

        // 초기 리스트 로딩
        reloadList();

        // 모달의 추가 버튼 클릭 시
        $("#addEventBtn").on("click", function () {
            // 입력 필드 초기화
            $("#calendar_content").val("");
            $("#calendar_start_date").val("");
            $("#calendar_end_date").val("");
            $("#calendar_class").val(11);

            // 체크박스 초기화
            $("#inlineCheckbox1").prop("checked", false);
            $("#inlineCheckbox2").prop("checked", false);
            $("#inlineCheckbox3").prop("checked", false);

            $("#calendarModal").modal("show");
        });
    });



</script>


