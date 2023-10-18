<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
  // 현재 인증된 사용자 정보를 가져옴
  Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

  // 사용자 정보에서 memNo를 추출
  String memNo = authentication.getName();
%>
<style>
    .card-body {
        padding: 1.0rem;
    }
    /* 시간표 테이블  */
    .table {
        border-radius: 10px;
        border-style: hidden;
        box-shadow: 0 0 0 1px #b3b3b3;
    }
    .table thead th {
        color: #0a0c0d;
        width: 100px; /* 원하는 폭으로 조절하세요. */
    }
    .table-bordered th, .table-bordered td, .table thead th {
        border:1px solid #b9b9b9;
    }
    .table td {
        padding: 25px 0.75rem;
        vertical-align: top !important;
        color: #000000;
    }
    .my-cell {
        font-weight: bold;
    }
    /* 시간표 테이블 끝 */
    .lecCard {
        color: #0a0c0d;
        text-decoration-line: none;
    }
    .lecCard:hover {
        color: #0a0c0d;
        text-decoration-line: none;
    }
</style>

<main role="main" class="main-content w-100" style="margin: auto;">
  <div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-12">
        <div class="row align-items-center my-4">
          <div class="col">
            <h2 class="h3 mb-0 page-title">수강목록</h2>
          </div>
        </div>
        <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />


        <div class="row justify-content-center">
          <div class="col-5 row" id="cardContainer"></div> <!-- card 들어감 -->

          <div class="col-7">
            <table class="table table-bordered bg-white" id="schedule">
              <thead>
              <tr class="text-center">
                <th>시간</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
              </tr>
              </thead>
              <tbody id="timetable">
              <!-- 시간표 내용은 JavaScript에서 동적으로 추가됩니다. -->
              </tbody>
            </table>
          </div>
        </div>


      </div> <!-- .col-12 -->
    </div> <!-- .row -->
  </div> <!-- .container-fluid -->

</main> <!-- main -->


<!-- //////////////////// 추가 JS코드 시작 //////////////////// -->
<script type="text/javascript">
  $(document).ready(function () {
      const csrf = $("#csrf").val();
      const memNo = "<%=memNo%>";
      // console.log("맴버 ID :  " + memNo);
      // 색상 배열
      const colors = ["lightcoral", "yellowgreen", "lightblue", "yellow", "lightseagreen", "rgb(100, 78, 224)", "rgb(228, 92, 198)", "rgb(233, 175, 16)"];
      const lectureColor = getRandomColor(); // 랜덤으로 색상 선택
      const lectureColors = {};


    callTimetable();

      // 수강취소 버튼 - 이벤트 위임 방식
      $("#cardContainer").on("click", ".lecDel", function() {
        // 클릭된 버튼의 data-lec-code 속성 값을 가져옵니다
        let lecCode = $(this).data("lec-code");
        console.log("lecCode: " + lecCode);

        Swal.fire({
          title: '정말로 수강을 취소 하시겠습니까?',
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#d33',
          confirmButtonText: '확인',
          cancelButtonColor: '#949494',
          cancelButtonText: '취소',
          reverseButtons: true
        }).then((result) => {
          if (result.isConfirmed) { // 확인 버튼이 눌렸을 때만 삭제 처리 수행
            $.ajax({
              type: "DELETE",
              url: "/stu/deleteLecList",
              headers: {
                "X-CSRF-TOKEN": csrf // CSRF 토큰을 헤더에 추가
              },
              data: JSON.stringify({
                lecCode: lecCode,
                memNo: memNo
              }),
              contentType: "application/json",
              dataType: "text",
              success: function(data) {
                if (data) {
                  console.log(data);

                  $("#cardContainer").empty();
                  $("#timetable").empty();
                  callTimetable();
                }
              },
              error: function(xhr, status, error) {
                console.log("code: "+ xhr);
                console.log("message: "+status);
                console.log("error: "+error);
              }
            });
          }
        })

      });

      function callTimetable() {

        $.ajax({
            type: "GET",
            url: "/stu/getStuLecList/" + memNo,
            headers: {
                "X-CSRF-TOKEN": csrf // CSRF 토큰을 헤더에 추가
            },
            dataType: "json",
            success: function(data) {
                if (data) {
                    createLecCard(data, lectureColors);

                    data.forEach(function(item){
                      // console.log("요일" + item.lecdWeek + "시작 : " + item.lecdSt + "끝 : " + item.lecdEt);
                    });

                    // 시간표 생성 함수 호출
                    createTimetable(data, lectureColors);
                }
            },
            error: function(xhr, status, error) {
                console.log("code: "+ xhr);
                console.log("message: "+status);
                console.log("error: "+error);
            }
        });
      }


      // 시간표 생성 함수
      function createTimetable(data, lectureColors) {
          // console.log(data);
          // 시간표 요소를 찾기
          const timetable = document.getElementById("timetable");
          if (!timetable) {
              console.error("시간표 요소를 찾을 수 없습니다.");
              return;
          }
          // 시간대 배열
          const times = [
              "1교시", "2교시", "3교시", "4교시",
              "5교시", "6교시", "7교시", "8교시", "9교시",
          ];

          // 시간대를 기반으로 행(시간)과 열(요일)을 생성
          for (const time of times) {
              const row = document.createElement("tr");
              const timeCell = document.createElement("td");
              timeCell.textContent = time;
              row.appendChild(timeCell);

              for (let day = 0; day < 5; day++) { // 월~금까지 5일
                  const cell = document.createElement("td");
                  row.appendChild(cell);
              }

              timetable.appendChild(row);
          }


          // 요일과 교시에 해당하는 데이터를 반복해서 처리
          data.forEach(function (item, index) {
              // item.lecdWeek 값을 기반으로 요일을 결정
              let dayIndex = -1;
              switch (item.lecdWeek) {
                  case "월요일":
                      dayIndex = 1;
                      break;
                  case "화요일":
                      dayIndex = 2;
                      break;
                  case "수요일":
                      dayIndex = 3;
                      break;
                  case "목요일":
                      dayIndex = 4;
                      break;
                  case "금요일":
                      dayIndex = 5;
                      break;
              }

              // 강의의 교시만큼 rowspan 부여
              let startTime = item.lecdSt.substring(0, 1);
              let endTime = item.lecdEt.substring(0, 1);

              // console.log(item.lecdWeek + " 시간: " + startTime + " ~ " + endTime);
              let colNum = Number(endTime) - Number(startTime) + 1;

              // dayIndex와 rowIndex가 유효한지 확인
              if (dayIndex !== -1) {
                  let rowIndex = times.indexOf(item.lecdSt);
                  let cell = null; // cell 변수 미리 초기화

                  // rowIndex와 dayIndex가 유효한 경우에만 데이터를 시간표에 반영
                  if (rowIndex !== -1 && timetable.rows[rowIndex].cells[dayIndex]) {
                      cell = timetable.rows[rowIndex].cells[dayIndex];
                      cell.textContent = item.lecaNm;

                      // 강의별로 다른 색상 선택
                      cell.style.backgroundColor = lectureColors[item.lecCode];
                      cell.classList.add("fs-12");
                      cell.classList.add("my-cell");
                  }

                  // colNum 값이 2 이상일 때만 rowspan 속성을 설정
                  if (cell && colNum >= 2) {
                      // cell이 유효한 경우에만 rowspan 설정
                      cell.setAttribute("rowspan", colNum);
                      // console.log("Cell : " + (rowIndex+1) + " ~ " + (rowIndex+colNum))
                      // 나머지 셀 삭제
                      for (let i = rowIndex + 1; i < rowIndex + colNum; i++) {
                          const nextRow = timetable.rows[i];
                          
                      	  // nextRow.cells의 마지막을 지워야 td가 테이블을 삐져나오지 않음
                          const nextCell = nextRow.cells[nextRow.cells.length-1]; 
                          if (nextCell) { // nextCell이 유효한 경우에만 제거l
                              nextRow.removeChild(nextCell);
                          }
                      }
                  }
              }
          });
      }

      // 수강한 강의의 데이터를 받아서 컨테이너를 만드는 함수
      function createLecCard(data, lectureColors) {
          // 중복된 강의 코드(lecCode)를 제외한 목록 추출
          let uniqueLecCodes = [...new Set(data.map(item => item.lecCode))];

          uniqueLecCodes.forEach(function (lecCode, index) {
              // 중복된 강의 코드를 가진 데이터 필터링
              let lectures = data.filter(item => item.lecCode === lecCode);

              // 중복된 강의 데이터 중 첫 번째 데이터를 사용하여 강의 정보를 만듭니다.
              let firstLecture = lectures[0];

              // 필요한 정보 가져오기
              let lecaNm = firstLecture.lecaNm;
              let lecaYr = firstLecture.lecaYr;
              let lecaSem = firstLecture.lecaSem;

              let lecaSeCode = firstLecture.lecaSeCode;
              let lecaCrd = firstLecture.lecaCrd;

              let lectureColor = colors[index % colors.length];
              lectureColors[lecCode] = lectureColor;

              // 카드를 생성하고 카드 컨테이너에 추가
              let cardHtml = `
                    <a href="/stu/taskList?lecCode=\${lecCode}" class="lecCard">
                        <div class="col-md-6">
                            <div class="card shadow mb-4" style="background-color: \${lectureColor};">
                                <div class="card-body text-center">
                                    <div class="avatar avatar-lg mt-4">
                                        <span>\${lecaYr}년 \${lecaSem}학기</span>
                                    </div>
                                    <div class="card-text my-2">
                                        <strong class="card-title my-0">\${lecaNm}</strong>
                                        <p class="small text-muted mb-0"></p>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="row align-items-center">
                                        <div class="col">
                                            <small>
                                                <span class="dot dot-lg bg-success mr-1"></span>
                                                <a href="/stu/lecNotice?lecCode=\${lecCode}" style="color:#6c757d;">\${lecaNm}</a>
                                            </small>
                                        </div>
                                        <div class="text-right">
                                            <button class="btn btn-sm btn-danger bg-danger-light lecDel" data-lec-code="\${lecCode}">취소</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                `;

              // 카드를 카드 컨테이너에 추가
              $("#cardContainer").append(cardHtml);
          });
      }

      // 랜덤 색상을 생성하는 함수
      function getRandomColor() {
          const colors = ["lightcoral", "yellowgreen", "lightblue", "yellow", "lightseagreen", "rgb(100, 78, 224)", "rgb(228, 92, 198)", "rgb(233, 175, 16)"];
          const randomIndex = Math.floor(Math.random() * colors.length);
          return colors[randomIndex];
      }

  });
</script>
<!-- //////////////////// 추가 JS코드 끝 //////////////////// -->
