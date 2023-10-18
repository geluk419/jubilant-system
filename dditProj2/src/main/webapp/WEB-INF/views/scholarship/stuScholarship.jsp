<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
          <h2 class="h4 mb-1" style="text-align:center;">장학금 수여 내역</h2>
          
          
          
<!-- 		  <div style="text-align:right;"> -->
<!--           </div> -->

	          <!-- Small table -->
	          <div class="row my-3">
	            <div class="col-md-12">
	              <div class="card shadow" >
	                <div class="card-body">
	                
	                  <!-- table -->
	                  <table class="table datatables text-center" id="dataTable-1" >
	                    <thead class="bg-my text-black">
	                    <h5></h5>
	                    <tr>
	                      <th>년도</th>
	                      <th>학기</th>
	                      <th>금액</th>
	                      <th>장학금명</th>
	                      <th>장학금내역출력</th>
	                      <th></th>
	                      
	                      
	                    </tr>
	                    </thead>
	                    <tbody>
	                    <tr>
	                      <td>${getScholarStu.sclYr}</td>
	                      <td>${getScholarStu.sclSemCode}</td>
	                      <td><fmt:formatNumber value="${getScholarStu.sclLpay/1}" type="number" pattern="#,###,###"/></td>
	                      <td>${getScholarStu.sclName}</td>
	                      <td>
	                      	<button type="button" id="detail" class="btn btn-my" style="color:white; height:40px;" onclick="generatePdf()">출력</button>
	                      </td>
	                    </tr>
	                    </tbody>
	                  </table>
	                  
	                </div>
	              </div>
	      		</div> 
	   	 	  </div>

    
    	</div>
      </div>
    </div>

  </main> <!-- main -->
</div>

<script>
	function generatePdf() {
        location.href = '/stu/printScholarship';
    }
	
</script>