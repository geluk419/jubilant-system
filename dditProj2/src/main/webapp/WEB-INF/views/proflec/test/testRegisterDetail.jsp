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
                          <input class="form-check-input" type="radio" name="gridRadios" id="steType1" value="option1">
                          <label class="form-check-label" for="gridRadios1"><strong>1</strong></label>
                          <input type="text" class="form-control" id="steSelect1" name="steSelect"
                            value="">
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="gridRadios" id="steType2" value="option2">
                          <label class="form-check-label" for="gridRadios1"><strong>2</strong></label>
                          <input type="text" class="form-control" id="steSelect2" name="steSelect"
                            value="">
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="gridRadios" id="steType3" value="option3">
                          <label class="form-check-label" for="gridRadios1"><strong>3</strong></label>
                          <input type="text" class="form-control" id="steSelect3" name="steSelect"
                            value="">
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="gridRadios" id="steType4" value="option4">
                          <label class="form-check-label" for="gridRadios1"><strong>4</strong></label>
                          <input type="text" class="form-control" id="steSelect4" name="steSelect"
                            value="">
                        </div>
                      </div>
                    </div>
                    
                    
                    <button type="submit" class="btn btn-my" id="save">저장</button>
                    <button type="button" class="btn btn-primary" id="autoFill">자동 완성</button>
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
	  const plusBtn = document.querySelector("#plus")
	  questions = [
		  	{q : "GDP란 무엇 인가요?", s: ["국가의 정치체제", "국내 생산물의 총 가치", "금리의 변동성", "세금 수입과 지출의 차이"], a: 1},
		  	{q : "수요와 공급의 균형이란 무엇인가요?", s: ["가격이 상승하는 상황", "가격이 하락하는 상황", "구매자와 판매자의 만족점", "수요가 공급을 넘어서는 상황"], a: 2},
		  	{q : "인플레이션의 의미는 무엇인가요?", s: ["물가 상승", "물가 하락", "생산력 증가", "소비 증가"], a: 3},
		  	{q : "경제적 기회 비용이란 무엇인가요?", s: ["투자한 자금의 수익률", "다른 기회를 통한 잃어버린 수익", "시장 가격의 변동", "소비자의 지출"], a: 4},
		  	{q : "자본주의 경제 체계에서 생산 수단은 누구의 소유인가요?", s: ["개인 소유", "정부 소유", "공동 소유", "외국 투자자 소유"], a: 3},
		  	{q : "경제학에서 수요는 무엇을 나타낼까요?", s: ["상품의 생산량", "구매하려는 물건의 양", "가격의 변동성", "소비자의 소득"], a: 1},
		  	{q : "어떤 경제 체계에서 생산 수단이 개인 소유보다 공동 소유로 운영됩니까?", s: ["자본주의", "사회주의", "공산주의", "혼합경제"], a: 4},
		  	{q : "고령화 인구와 관련하여 어떤 경제적 도전이 발생하고 있습니까?", s: ["식량 부족", "실업률 증가", "사회보장 비용 증가", "수출 감소"], a: 2},
		  	{q : "경제적 외부성이란 무엇이며, 이것이 시장에서 어떻게 영향을 미칠 수 있나요?", s: ["소비자의 추가 비용", "제조업 생산량의 증가", "외부 환경에 대한 부정적 영향", "시장 가격의 하락"], a: 3},
		  	{q : "경제학에서 경기 순환이란 무엇인가요?", s: ["경제 성장 지속", "단기적 수요 변동", "기술 혁신", "소득 분배"], a: 1},
		  ]
	  
      
      let problemCount = 2; // 문제 번호 2번부터 시작
      $(plusBtn).click(function () {
        // 새로운 문제 추가
        addQuestion(problemCount++, false)  // 문제 개수 증가
        window.scrollTo(0, document.body.scrollHeight)
      });
      function addQuestion(index, flag) {
          let newTestExamDiv = testExamDiv.cloneNode(true);  // 부모만 복사

          let ckBoxes =newTestExamDiv.querySelectorAll("[type=radio]");
          let labels = newTestExamDiv.querySelectorAll(".form-check-label");
          for(let i=0; i<ckBoxes.length; i++){
            console.log("메롱!",ckBoxes[i]);
            ckBoxes[i].setAttribute("name",`option\${index}`);
            labels[i].setAttribute("for",`option\${index}`);
          }
          if (flag) {
        	  question = questions[index-1]
	          newTestExamDiv.querySelector("#steQue").value = question.q
        	  newTestExamDiv.querySelector("#steSelect1").value = question.s[0]
        	  newTestExamDiv.querySelector("#steSelect2").value = question.s[1]
        	  newTestExamDiv.querySelector("#steSelect3").value = question.s[2]
        	  newTestExamDiv.querySelector("#steSelect4").value = question.s[3]
	          $(newTestExamDiv).find("#steType" + question.a).attr("checked", true)
          }
          newTestExamDiv.querySelector("#testCnt").innerHTML = `<strong>* 시험 문제  \${index}</strong>`;

          testExamDivPar.appendChild(newTestExamDiv);
          $(newTestExamDiv).before($(plusBtn))
      }
      $("#autoFill").on("click", function() {
    	  //시험 정보 입력
    	  $("#testDe").val("2023-10-17")
    	  $("#testLimit").val("30")
    	  $("#testSt").val("14:00")
    	  $("#testEt").val("14:30")
    	  $("#testNm").val("경제학개론 쪽지시험")
    	  
    	  
    	  // 모든 시험 정보 삭제
    	  $(testExamDivPar).empty()
    	  // 시험 삭제 된 후에 다시 자동입력할 데이터 반복문으로 추가
    	  for (var i = 1; i <= 10; i++) {
    		  addQuestion(i, true)
		  }
    	  problemCount = i + 1
      })



      $("#yerinForm").on("submit", () => {
        event.preventDefault();  // built-in event 막기

        let testExamList = [];

        //시험 문제1... 자체의 div 영역(시험카드 1개)
        let yerinProDivs = document.querySelectorAll("#problem");

        //9회 반복
        for(let i=0; i<yerinProDivs.length; i++){
            console.log("체크된 라디오버튼의 값 : " + yerinProDivs[i].querySelectorAll("[type=radio]:checked")[0].value);
            //steQue : 문제 내용
            //steRightAnswer : 답 값
            let testExamVO = {
              steNo: (i+1), 
              testCode: 999,
              steType: 200,
              steQue: yerinProDivs[i].querySelector("#steQue").value,	
              steRightAnswer: yerinProDivs[i].querySelectorAll("[type=radio]:checked")[0].value,
              testChoiceList: []
            }

            let options = new Array(4);
            let options1 = yerinProDivs[i].querySelector("#steSelect1");
//             console.log("yerinProDivs[i] : ", yerinProDivs[i]);
//             console.log("steSelect1 : " + options1.value);
            let options2 = yerinProDivs[i].querySelector("#steSelect2");
            let options3 = yerinProDivs[i].querySelector("#steSelect3");
            let options4 = yerinProDivs[i].querySelector("#steSelect4");
            console.log("options의 길이 : " + options.length);
            let tmp = 1;
            for(let i=0; i<options.length; i++){
            	
            	if(i==0){
            		tmp = options1.value;
            	}else if(i==1){
            		tmp = options2.value;
            	}else if(i==2){
            		tmp = options3.value;
            	}else if(i==3){
            		tmp = options3.value;
            	}
            	
              let testChoiceVO = {
                testCode: 999,
	              steNo: testExamVO.steNo,
	              steSelectNo: (i+1),
	              steSelect: tmp
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
          testExamList: testExamList,
          lecCode:'${lecCode}'
        }

        console.log("testVO : ", testVO);
//         console.log("testExamVO : ", testExamVO);


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
	   		    		location.href = "/prof/test/?lecCode="+'${lecCode}';	
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
        });//end ajax
      });
        

    </script>
    </body>

    </html>