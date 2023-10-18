<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



    <!doctype html>
    <html lang="en">
    <main role="main" class="main-content" style="width: 100%; margin: auto;">
      <div class="container-fluid">
        <div class="row justify-content-center">
          <div class="col-12">
            <h2 class="h4 mb-1" style="text-align:center;">시험 등록</h2><br/>
            <div class="alert alert-secondary" role="alert">
            <strong>
            	📢 시험제출 안내 사항<br/><br/>

				(1) 반드시 기간을 설정한 후, 시험을 등록하는 것을 권장합니다.<br/>
      				- 시험 기간 미설정시, 등록 직후 바로 시험에 응시가능합니다.
      		</strong> 
            </div>
            <div class="card-deck">
              <div class="card shadow mb-4">
                
                <div class="card-body">
                  <form id="yerinForm">
                    <sec:csrfInput />
                    <div class="form-row">
                      <div class="form-group col-md-6">
                        <label for="inputEmail4" ><strong>* 시험일자</strong></label>
                        <input type="date" class="form-control" id="testDe" name="testDe" value="">
                      </div>
                      <div class="form-group col-md-6">
                        <label for="inputPassword4"><strong>* 제한시간</strong></label>
                        <input type="text" class="form-control" id="testLimit" name="testLimit" value="">
                      </div>
                      <div class="form-group col-md-6">
                        <label for="inputEmail4"><strong>* 시작시간</strong></label>
                        <input type="time" class="form-control" id="testSt" name="testSt" value="">
                      </div>
                      <div class="form-group col-md-6">
                        <label for="inputPassword4"><strong>* 종료시간</strong></label>
                        <input type="time" class="form-control" id="testEt" name="testEt" value="">
                      </div>
                    </div>

                    <div class="form-group">
                      <label for="testNm"><strong>* 시험이름</strong></label>
                      <input type="text" class="form-control" id="testNm" name="testNm" value="">
                    </div><br />

                    <br />

                    <div id="problems">
	                    <button type="button" class="btn btn-my" id="plus" style="float: right;">+</button>
                      <div class="form-group" id="problem" style="border: 1px solid #ccc; border-radius: 10px; padding: 10px;">
                        <label for="steQue" id="testCnt" ><strong>* 시험문제 1</strong></label>
                        <input type="text" class="form-control" id="steQue" name="steQue"
                          value=""><br />

                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="gridRadios" id="steType" value="option1">
                          <label class="form-check-label" for="gridRadios1"><strong>1</strong></label>
                          <input type="text" class="form-control" id="steSelect" name="steSelect"
                            value="">
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="gridRadios" id="steType" value="option2">
                          <label class="form-check-label" for="gridRadios1"><strong>2</strong></label>
                          <input type="text" class="form-control" id="steSelect" name="steSelect"
                            value="">
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="gridRadios" id="steType" value="option3">
                          <label class="form-check-label" for="gridRadios1"><strong>3</strong></label>
                          <input type="text" class="form-control" id="steSelect" name="steSelect"
                            value="">
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="gridRadios" id="steType" value="option4">
                          <label class="form-check-label" for="gridRadios1"><strong>4</strong></label>
                          <input type="text" class="form-control" id="steSelect" name="steSelect"
                            value="">
                        </div>
                      </div>
                    </div>
                    
                    
                    <button type="submit" class="btn btn-my" id="save">저장</button>
                  </form>
                </div>
              </div>


    </main> <!-- main -->
    </div> <!-- .wrapper -->
    <script src="/resources/js/jquery.min.js"></script>
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
    

    <script>
	   
    
    
      const header = '${_csrf.headerName}';
      const token = '${_csrf.token}';

      // 문제추가 
      const testExamDivPar = document.querySelector("#problems");
      const testExamDiv = document.querySelector("#problem");

      
      let problemCount = 1; // 초기 문제 개수
      $("#plus").click(function () {
        // 새로운 문제 추가
        problemCount++; // 문제 개수 증가
        let newTestExamDiv = testExamDiv.cloneNode(true);  // 부모만 복사

        let ckBoxes =newTestExamDiv.querySelectorAll("[type=radio]");
        let labels = newTestExamDiv.querySelectorAll(".form-check-label");
        for(let i=0; i<ckBoxes.length; i++){
          console.log("메롱!",ckBoxes[i]);
          ckBoxes[i].setAttribute("name",`option\${problemCount}`);
          labels[i].setAttribute("for",`option\${problemCount}`);
        }

        newTestExamDiv.querySelector("#testCnt").innerHTML = `<strong>* 시험 문제  \${problemCount}</strong>`;

        testExamDivPar.appendChild(newTestExamDiv);
        $(newTestExamDiv).before($("#plus"))
        window.scrollTo(0, document.body.scrollHeight)
      });



      $("#yerinForm").on("submit", () => {
        event.preventDefault();  // built-in event 막기

        let testExamList = [];

        let yerinProDivs = document.querySelectorAll("#problem");

        for(let i=0; i<yerinProDivs.length; i++){
            console.log(yerinProDivs[i].querySelectorAll("[type=radio]:checked")[0].value);
            let testExamVO = {
              steNo: (i+1), 
              testCode: 999,
              steType: 200,
              steQue: yerinProDivs[i].querySelector("#steQue").value,	
              steRightAnswer: yerinProDivs[i].querySelectorAll("[type=radio]:checked")[0].value,
              testChoiceList: []
            }

            let options = yerinProDivs[i].querySelectorAll("#steSelect");
            for(let i=0; i<options.length; i++){
              let testChoiceVO = {
                testCode: 999,
	              steNo: testExamVO.steNo,
	              steSelectNo: (i+1),
	              steSelect: options[i].value
              }
              testExamVO.testChoiceList.push(testChoiceVO);
            }
            testExamList.push(testExamVO);  
        }
          
        let testVO = {
          testDe: $("#testDe").val(),
          testLimit: $("#testLimit").val(),
          testSt: $("#testSt").val(),
          testEt: $("#testEt").val(),
          testNm: $("#testNm").val(),
          testExamList: testExamList
        }

        console.log("testVO : ", testVO);
        // console.log("testExamVO : ", testExamVO);


        $.ajax({
          type: "post",
          url: "/prof/testRegisterDetail",
          data: JSON.stringify(testVO),
          contentType: "application/json;charset=utf-8",
          dataType: "text",
          beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
          },
          success: function (rslt) {
            console.log(rslt);

            if (rslt) {
	   			Swal.fire({
		   		      icon: 'success',
		   		      title: "시험 등록되었습니다"
		   		    }).then((result) => {
	   		    		window.location.href = "/prof/test";	
		   		    })
	   			} else {
	   				Swal.fire("시험등록실패");	
	   			}
          },
          error: function (xhr, status, error) {
            console.log("code: " + xhr.status)
            console.log("message: " + xhr.responseText)
            console.log("error: " + error);
          }
        })
      });
        

    </script>
    </body>

    </html>