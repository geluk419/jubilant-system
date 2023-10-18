<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
   td{
       padding: 10px;
       text-align: center;
    }
    
    th {
        font-weight: bold;
        font-size: 14px;
        background-color: rgb(182, 26, 63); 
        color: black;
        padding: 10px;
        text-align: center;
    }
</style>


<body class="vertical light">
   <div class="wrapper w-100">
      <main role="main" class="main-content mx-auto">
         <div class="container-fluid">
            <div class="row justify-content-center">
               <div class="col-12">
                  <h2 class="page-title">등록금 관리</h2>
                  
                  <div class="alert alert-light bg-white text-dark border-0" role="alert" style="font-size: 0.9em; padding: 15px 30px 15px; 20 px; border: 1px solid #eee;">
                      <p style="display: block; text-align: center; font-size: 1.1em; color:#B61A53; font-weight: bold;">안내</p>
                      <hr/>
                      <p>
                          등록금은 현재 재학 중인 학생에게만 부여된다.
                      </p>
                      <p>
                          등록금은 장학금이 자동적으로 차감된 금액이 부과되며, 만약 장학금액이 등록금액을 초과할 경우 등록금은 0원으로 처리된다.
                      </p>
                  </div>

                  
                  <p style="display: block; font-size: 1.1em; color:#B61A53; font-weight: bold;">등록금 납부 대상자 조회</p>
                  <!-- Striped rows -->
                  <div class="col-md-12 my-4">
                     <div class="card shadow">
                        <div class="card-body">
                           <table class="table table-striped table-hover">
                              <thead>
                                 <tr>
                                    <th>단과대학</th>
                                    <th>학과</th>
                                    <th>학번</th>
                                    <th>등록금</th>
		                            <th>장학금(원)</th>
		                            <th>납부총액(원)</th>
                                    <th>이름</th>
                                    <th>부과</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <tr>
                                    <td>공과대학</td>
                                    <td>컴퓨터공학과</td>
                                    <td>202308S002</td>
                                    <td>3,150,550</td>
                                    <td>1,000,000</td>
                                    <td>3,150,550</td>
                                    <td>김채현</td>
                                    <td>
                                       <button id="button" class="btn btn-my">등록금 부과</button>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>사회과학대학</td>
                                    <td>행정학과</td>
                                    <td>202308S004</td>
                                    <td>4,150,550</td>
                                    <td>100,000</td>
                                    <td>4,050,550</td>
                                    <td>이경진</td>
                                    <td>
                                       <button id="button" class="btn btn-my">등록금 부과</button>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>자연과학대학</td>
                                    <td>수학과</td>
                                    <td>202308S005</td>
                                    <td>4,150,550</td>
                                    <td>0</td>
                                    <td>4,150,550</td>
                                    <td>서예린</td>
                                    <td>
                                       <button id="button" class="btn btn-my">등록금 부과</button>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>경영대학</td>
                                    <td>경제학과</td>
                                    <td>202308S001</td>
                                    <td>4,150,550</td>
                                    <td>0</td>
                                    <td>4,150,550</td>
                                    <td>정범진</td>
                                    <td>
                                       <button id="button" class="btn btn-my">등록금 부과</button>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>예술대학</td>
                                    <td>연극영화과</td>
                                    <td>202308S006</td>
                                    <td>4,150,550</td>
                                    <td>0</td>
                                    <td>4,150,550</td>
                                    <td>이철희</td>
                                    <td>
                                       <button id="button" class="btn btn-my">등록금 부과</button>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                     </div>
                  </div>
                  <!-- Striped rows -->
               </div>
               <!-- .col-12 -->
            </div>
            <!-- .row -->
         </div>
         <!-- .container-fluid -->

         <!-- Add a horizontal line here -->
         <hr class="my-4">
         
         <p style="display: block; font-size: 1.1em; color:#B61A53; font-weight: bold;">등록금 납부 현황</p>
         <!-- Bordered table -->
         <div class="col-md-12 my-4">
            <div class="card shadow">
               <div class="card-body">
                  <table id="tbl2" class="table table-hover">
                     <thead>
                        <tr>
                           <th>단과대학</th>
                           <th>학번</th>
                           <th>이름</th>
                           <th>등록금</th>
                           <th>장학금(원)</th>
                           <th>납부총액(원)</th>
                           <th>납부일</th>
                           <th>납부상태</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <td>경영대학</td>
                           <td>202108S002</td>
                           <td>윤강혁</td>
                           <td>4,150,550</td>
                           <td>100,000</td>
                           <td>4,050,550</td>
                           <td>2023/08/16</td>
                           <td>납부</td>
                        </tr>
                        <tr>
                           <td>공과대학</td>
                           <td>202005S005</td>
                           <td>임민우</td>
                           <td>4,150,550</td>
                           <td>0</td>
                           <td>4,150,550</td>
                           <td>2023/08/22</td>
                           <td>납부</td>
                        </tr>
                        <tr>
                           <td>예술대학</td>
                           <td>202308S006</td>
                           <td>신진수</td>
                           <td>4,150,550</td>
                           <td>200,000</td>
                           <td>3,950,550</td>
                           <td>2023/08/22</td>
                           <td>납부</td>
                        </tr>
                        <tr>
                           <td>자연과학대학</td>
                           <td>202307S010</td>
                           <td>임석일</td>
                           <td>4,150,550</td>
                           <td>500,000</td>
                           <td>3,650,550</td>
                           <td>2023/08/22</td>
                           <td>납부</td>
                        </tr>
                        <tr>
                           <td>생명과학대학</td>
                           <td>202108S009</td>
                           <td>이미지</td>
                           <td>4,150,550</td>
                           <td>0</td>
                           <td>4,150,550</td>
                           <td>2023/08/22</td>
                           <td>납부</td>
                        </tr>
                        <tr>
                           <td>경영대학</td>
                           <td>202008S002</td>
                           <td>김승종</td>
                           <td>4,150,550</td>
                           <td>0</td>
                           <td>4,150,550</td>
                           <td>2023/08/22</td>
                           <td>납부</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
         <!-- Bordered table -->
      </main>
      <!-- main -->
   </div>
   <!-- .wrapper -->
</body>
<script>
let chTable = document.querySelector("#tbl2");
$(document).ready(function() {
    // 문서가 로드된 후 실행할 코드
	$(".btn-my").click(function() {
        let mvTR = event.currentTarget.parentElement.parentElement;

        let department = mvTR.children[1].textContent; // 학과 값 가져오기
        let studentId = mvTR.children[2].textContent;  // 학번 값 가져오기
        let name = mvTR.children[6].textContent;	   // 이름 값 가져오기

        mvTR.children[2].textContent = name;
        mvTR.children[1].textContent = studentId;
        

        // 부과 버튼을 삭제하고 "-" 로 바뀌게 하기
        event.currentTarget.classList.remove("btn-my");
        event.currentTarget.textContent = "-";

        mvTR.removeChild(mvTR.children[6]);

        let newTD = document.createElement("td");
        newTD.innerHTML = "미납";
        mvTR.appendChild(newTD);

        chTable.querySelector("tbody").appendChild(mvTR);

        Swal.fire({
            icon: 'success',
            title: "등록금 부과가 완료되었습니다."
        }).then((result) => {
            // location.href = "/stu/mypage";
        });
    });
});


</script>