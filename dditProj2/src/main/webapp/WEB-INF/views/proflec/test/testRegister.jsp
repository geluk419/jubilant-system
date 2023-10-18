<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>




      <style>
      

        .row {
          align-items: flex-end;
        }
      </style>

      <div class="wrapper" style="width: 100%; margin: auto;">
        <%-- <p>예린${testRegiNoticeList}</p> --%>
          <main role="main" class="main-content mx-auto" >
            <div class="container-fluid">
              <div class="row justify-content-center">
                <div class="col-12">
                  <h2 class="h4 mb-1" style="text-align:center;">시험</h2>

                  <!-- Small table -->
                  <div class="row my-3">
                    <div class="col-md-12">
                      <div class="card shadow">
                        <div class="card-body">

                          <!-- table -->
                          <div style="text-align:right;" >
                            <a href="/prof/testDetail?lecCode=${lecCode}" class="btn btn-my">등록</a>
                          </div>

                          <table class="table datatables text-center" id="dataTable-1">
                            <tbody>
                              <thead class="bg-my text-black" >

                                <tr>
                                  <th>제목</th>
                                  <th>시험시작</th>
                                  <th>시험종료</th>
                                  <th>시험일자</th>
                                  <th>평가목록</th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                </tr>
                              </thead>

                              <c:forEach items="${testRegiNoticeList}" var="TestVO">
                                <tr>
                                  <td>
                                    <p class="mb-0 text-muted">
                                      <strong>${TestVO.testNm}</strong>
                                    </p>
                                  </td>
                                  <td>
                                    <p class="mb-0 text-muted">
                                      <strong>${TestVO.testSt}</strong>
                                    </p>
                                  </td>
                                  <td>
                                    <p class="mb-0 text-muted">
                                      <strong>${TestVO.testEt}</strong>
                                    </p>
                                  </td>
                                  <td>
                                    <p class="mb-0 text-muted">
                                      <strong>
                                        <fmt:formatDate value="${TestVO.testDe}" pattern="yyyy-MM-dd" />
                                      </strong>

                                    </p>
                                  </td>
                                  <td>
                                    <a href="/prof/testStuDetail/${TestVO.testCode}" class="btn btn-my">상세보기</a>
                                  </td>
                                  <td>
                                    <button class="btn btn-outline-success"
                                      onclick="openTestDetail('${TestVO.testCode}', '${TestVO.lecCode }')">수정</button>
                                  </td>
                                  <td>
                                    <button class="btn btn-outline-danger deleteBtn" id="delete" onclick="deleteTest('${TestVO.testCode}')" type="button" data-toggle="modal"
                                      data-target="#verticalModal">삭제</button>
                                  </td>
                                </tr>

                              </c:forEach>
                            </tbody>
                          </table>
                        </div>
                      </div>


                      <!--               <div class="col-sm-12 col-md-3 my-4"> -->
                      <!-- 		        <div class="dataTables_info" id="dataTable-1_btn" > -->
                      <!-- 		          <button type="button" class="btn btn-my">등록</a></button> -->
                      <!-- 		        </div> -->
                      <!--       		  </div> -->
                    </div> <!-- simple table -->



                  </div> <!-- end section -->
                </div> <!-- .col-12 -->
              </div> <!-- .row -->
            </div> <!-- .container-fluid -->


          </main> <!-- main -->
      </div>





<script>
      /*
        $(document).ready(function () {
          $("#delete").click(function () {
            swal({
              position: 'top-end',
              icon: 'success',
              title: '삭제되었습니다',
              showConfirmButton: false,
              timer: 1500
            });
          });
        });
        */



      // 수정하기
      function openTestDetail(testCode, lecCode) {
        // 수정 페이지로 이동
        location.href = "/prof/testRegisterModify?testCode=" + testCode + "&lecCode=" + lecCode;
      }

      /////////////////////////////////////////////////////////////////////////

      
      

	
	  var testCode = "${param.testRegiNoticeList[0]}";
	
      //삭제
      function deleteTest(testCode){

    	let lecCode = "${lecCode}";
    	  
        console.log("확인:" + testCode);

        $.ajax({
          type: "PUT",
          url: "/prof/testRegister/" + testCode,
          dataType: "text",
          beforeSend: function (xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
          },
          success: function (rslt) {
	            console.log(rslt);

	            if (rslt == 1) {
		   			Swal.fire({
			   		      icon: 'success',
			   		      title: "삭제가 완료되었습니다"
			   		    }).then((result) => {
		   		    		location.href = "/prof/test/?lecCode="+lecCode;	
			   		    })
		   			 	
		   					
		   			} else {
		   				Swal.fire("삭제 실패");	
		   			}
	          },
          error: function (xhr, status, error) {
            console.log("code:" + xhr.status);
            console.log("message:" + xhr.responseText);
            console.log("error:" + xhr.error);
          }
        });
      };


</script>