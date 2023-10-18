<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>
  .row {
      align-items: flex-end;
  }
 
 
  .modal-dialog modal-dialog-centered{
  	width : 100%;
  	height : 100%;
  }
</style>



<div class="wrapper" style="width: 100%; margin: auto;">
  <main role="main" class="main-content mx-auto" >
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-12">
          <h2 class="h4 mb-1" style="text-align:center;">강의평가</h2>
          <p class="mb-3" style="text-align:center;">경제학개론</p>
          <div class="alert alert-secondary" role="alert">
            <strong>
            	이 설문은 보다 좋은 교육을 여러분에게 제공하고자 실시되는 것입니다.<br/>
				익명으로 작성되는 여러분의 응답은 성적평가 후 정리되어 담당교수의 다음 학기 강의 준비를 위한 참고자료 및 교육여건 개선을 위한 기초자료로 
				활용되오니 성실하게 답변해주시기 바랍니다.<br/><br/>
            
            	📢 각 문항별로 여러분이 동의하는 정도에 따라 1 ~ 5 중 하나를 기재하여 주십시오.<br/>
      		</strong> 
            </div><br/>
          

	
          <!-- Small table -->
          <div class="row my-3">
            <div class="col-md-12">
              <div class="card shadow" >
                <div class="card-body">
                
                  <!-- table -->
                  
<%--                    <p>나와바${getScoreStuLec}</p>  --%>
                  
                  
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memberVO" var="memberVO"/>
</sec:authorize>
                  <table class="table datatables text-center" id="dataTable-1" >
                    
                    <thead class="bg-my text-black">
                    <p></p>
                    <tr>
                      <th>순번</th>
                      <th style="text-align:left;">평가문항</th>
                      <th>5</th>
                      <th>4</th>
                      <th>3</th>
                      <th>2</th>
                      <th>1</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                      <td>1</td>
                      <td style="text-align:left;">강의는 수업계획서 대로 (혹은 더 나은 방향으로) 진행 되었다.</td>
                      <td><input type="radio" name="list1"  value="5"></td>
				      <td><input type="radio" name="list1"  value="4"></td>
				      <td><input type="radio" name="list1"  value="3"></td>
				      <td><input type="radio" name="list1"  value="2"></td>
				      <td><input type="radio" name="list1"  value="1"></td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td style="text-align:left;">교수는 수업준비 (교재, 학습자료 등)을 철저히 하였다.</td>
                      <td><input type="radio" name="list2"  value="5"></td>
				      <td><input type="radio" name="list2"  value="4"></td>
				      <td><input type="radio" name="list2"  value="3"></td>
				      <td><input type="radio" name="list2"  value="2"></td>
				      <td><input type="radio" name="list2"  value="1"></td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td style="text-align:left;">과제물이나 시험은 적절하며 공정하게 시행,평가되었다.</td>
                      <td><input type="radio" name="list3"  value="5"></td>
				      <td><input type="radio" name="list3"  value="4"></td>
				      <td><input type="radio" name="list3"  value="3"></td>
				      <td><input type="radio" name="list3"  value="2"></td>
				      <td><input type="radio" name="list3"  value="1"></td>
                    </tr>
                    <tr>
                      <td>4</td>
                      <td style="text-align:left;">강의내용은 산만하지 않고 체계적이었다. </td>
                      <td><input type="radio" name="list4" value="5"></td>
				      <td><input type="radio" name="list4" value="4"></td>
				      <td><input type="radio" name="list4" value="3"></td>
				      <td><input type="radio" name="list4" value="2"></td>
				      <td><input type="radio" name="list4" value="1"></td>
                    </tr>
                    <tr>
                      <td>5</td>
                      <td style="text-align:left;">강의내용은 학생들의 이해 수준이 고려되었다.</td>
                      <td><input type="radio" name="list5"  value="5"></td>
				      <td><input type="radio" name="list5"  value="4"></td>
				      <td><input type="radio" name="list5"  value="3"></td>
				      <td><input type="radio" name="list5"  value="2"></td>
				      <td><input type="radio" name="list5"  value="1"></td>
                    </tr>

                    </tbody>
                    	<button type="button" class="btn btn-primary" id="autoFill">자동 완성</button>
                   		<c:choose>
				            <c:when test="${param.flag}">
				                <button class="btn btn-primary" type="button" style="float: right; margin-bottom:1%;">평가완료</button>
				            </c:when>
				            <c:otherwise>
				                <button class="btn btn-my" type="button" id="lecApply" style="float: right; margin-bottom:1%;">평가</button>
				            </c:otherwise>
						</c:choose>
						
						
						
						
						
						
                  </table>
                  
                  
                  
                  
                  
                </div>
              </div>
              
              
              
              
              
               <!-- Small table -->
	          
      </div> <!-- .row -->
    </div> <!-- .container-fluid -->

    
      
    </div>

  </main> <!-- main -->
</div>



					
            		
            		
            		
            		
            		
            		





<!-- JavaScript 코드 추가 -->
<script>
$(document).ready(function () {
    function randomRadioValue(groupName) {
        const values = [1, 2, 3, 4, 5];
        const randomIndex = Math.floor(Math.random() * values.length);
        const selectedValue = values[randomIndex];
        $("input[name="+ groupName+ "][value="+selectedValue+"]").prop('checked', true);
    }

    $("#autoFill").on("click", function () {
        randomRadioValue("list1");
        randomRadioValue("list2");
        randomRadioValue("list3");
        randomRadioValue("list4");
        randomRadioValue("list5");
    });

//     $("input[type='radio']").on("click", function (e) {
//         e.preventDefault();
//     });



});
</script>








<script>
	const header = '${_csrf.headerName}';
	const token = '${_csrf.token}';
	
	$("#lecApply").on("click", () => {
		
	 var radioVal1 = $('input[name="list1"]:checked').val();
     console.log("radioVal1",radioVal1);
	 var radioVal2 = $('input[name="list2"]:checked').val();
     console.log("radioVal2",radioVal2);
	 var radioVal3 = $('input[name="list3"]:checked').val();
     console.log("radioVal3",radioVal3);
	 var radioVal4 = $('input[name="list4"]:checked').val();
     console.log("radioVal4",radioVal4);
	 var radioVal5 = $('input[name="list5"]:checked').val();
     console.log("radioVal5",radioVal5);
		
		let lecCode = "${lecCode}";
		let memNo = "${memberVO.memNo}";
		
		
		let evaluationVO = {
			"evalCon1Code":radioVal1,
			"evalCon2Code":radioVal2,
			"evalCon3Code":radioVal3,
			"evalCon4Code":radioVal4,
			"evalCon5Code":radioVal5,
			"memNo":memNo,
			"lecCode":lecCode
		}
		console.log("evaluationVO:" + JSON.stringify(evaluationVO));
		
		
		$.ajax({
			type: "post",
			url: "/stu/lecEvaluation",
			data: JSON.stringify(evaluationVO),
			contentType: "application/json;charset=utf-8",
			dataType: "text",
			beforeSend: function (xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function (rslt) {
				console.log(rslt);

				if (rslt == 1) {
		   			Swal.fire({
			   		      icon: 'success',
			   		      title: "강의평가가 완료되었습니다"
			   		    }).then(() => {
		   		    		window.location.href = "/stu/stuLecEvaluation?lecCode="+lecCode + "&flag=true";	
			   		    })
		   			 	
		   					
		   			} else {
		   				Swal.fire("강의평가실패");	
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