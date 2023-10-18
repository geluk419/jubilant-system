<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>

/* 모달 css */
.modal {
	display: none;
	position:fixed;
	top: 10%;
	left: 37%;
	z-index: 1;
	justify-content: center;
	align-items: center;
}

.modal-content {
	width: 300px;
	height:400px;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.75);
}

.close {
	position: absolute;
	top: 10px;
	right: 10px;
	font-size: 20px;
	cursor: pointer;
}
#nav-link{
	rgb(182, 26, 63)
}
/* 모달 css */
</style>

<!doctype html>
<html lang="en">
  
      <main role="main" class="main-content" style="width: 70%; margin: auto;">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <div class="row">
                <!-- Small table -->
                <div class="col-md-12 my-4">
                  <h2 class="h4 mb-1">과제게시판</h2>
                  <p class="mb-3">과목이름${SubjectVO.subNm}</p>
                  <div class="card shadow">
                    <div class="card-body">
                      <div class="toolbar">
                        <form class="form">
                          <div class="form-row">
                            <div class="form-group col-auto mr-auto">
                              <label class="my-1 mr-2 sr-only" for="inlineFormCustomSelectPref1">Show</label>
                              
                            </div>
                            
                          </div>
                        </form>
                      </div>
                      <!-- table -->
                      <table class="table table-borderless table-hover">
                        <thead>
                          <tr>
                            <th></th>
                            <th>제목</th>
                            <th>내용</th>
                            <th>작성일자</th>
                            <th>수정일자</th>
                            <th></th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            
                            <td>
                              
                            </td>
                            <td>
                              <p class="mb-0 text-muted"><strong>${LecNoticeVO.lecnTtl}</strong></p>
<!--                               <small class="mb-0 text-muted">2474</small> -->
                            </td>
                            <td> 
						        <p class="mb-0 text-muted"><strong>${LecNoticeVO.lecnTtl}</strong></p>
						    </td>
                            <td>
                              <p class="mb-0 text-muted"><strong>${LecNoticeVO.lecnTtl}</strong></p>
                            </td>
                            <td>
                              <p class="mb-0 text-muted"><strong>${LecNoticeVO.lecnTtl}</strong></p>
                            </td>
                            <td>
                              <p class="mb-0 text-muted"><button type="button" onclick="openModal()" class="btn mb-2 bg-my text-white">제출</button></p>
									
                            </td>
                            
<!--                             <td><button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="openModal()"> -->
<!--                                 <span class="text-muted sr-only">Action</span> -->
<!--                               </button> -->
<!--                               <div class="dropdown-menu dropdown-menu-right"> -->
<!--                                 <a class="dropdown-item" href="">첨부파일</a> -->
                                
                                
                                <!-- 모달 -->
								<div id="myModal" class="modal">
									<div class="modal-content">
										<span class="close" onclick="closeModal()">&times;</span>
									<!-- 모달내용 -->
										<div class="card-body">
										  <h5>제목</h5>
										  <p>과제내용입니다. 제출하시기 바랍니다.</p>
										  <br/>
										  <br/>
										  <br/>
										  <p><input type="file" id="inputFile" name="pictures" /></p>
										  <button type="button" onclick="openModal()" class="btn mb-2 bg-my text-white">제출하기</button>
										</div>
									
									</div>
								</div>
								
								<script>
									//모달열기
									function openModal(){
										const modal = document.getElementById('myModal');
										modal.style.display='block';
									}
									
									//모달닫기
									function closeModal(){
										const modal = document.getElementById('myModal');
										modal.style.display='none';
									}
								</script>
							
                              </div>
                            </td>
                          </tr>
                          <!-- table -->
                          
                       <!-- table -->
                      <table class="table table-borderless table-hover">
                        
                        <tbody>
                          <tr>
                            
                            <td>
                              
                            </td>
                            <td>
                              <p class="mb-0 text-muted"><strong>${LecNoticeVO.lecnTtl}</strong></p>
<!--                               <small class="mb-0 text-muted">2474</small> -->
                            </td>
                            <td> 
						        <p class="mb-0 text-muted"><strong>${LecNoticeVO.lecnTtl}</strong></p>
						    </td>
                            <td>
                              <p class="mb-0 text-muted"><strong>${LecNoticeVO.lecnTtl}</strong></p>
                            </td>
                            <td>
                              <p class="mb-0 text-muted"><strong>${LecNoticeVO.lecnTtl}</strong></p>
                            </td>
                          
                       <!-- table -->
                      <table class="table table-borderless table-hover">
                        
                        <tbody>
                          <tr>
                            
                            <td>
                              
                            </td>
                            <td>
                              <p class="mb-0 text-muted"><strong>${LecNoticeVO.lecnTtl}</strong></p>
<!--                               <small class="mb-0 text-muted">2474</small> -->
                            </td>
                            <td> 
						        <p class="mb-0 text-muted"><strong>${LecNoticeVO.lecnTtl}</strong></p>
						    </td>
                            <td>
                              <p class="mb-0 text-muted"><strong>${LecNoticeVO.lecnTtl}</strong></p>
                            </td>
                            <td>
                              <p class="mb-0 text-muted"><strong>${LecNoticeVO.lecnTtl}</strong></p>
                            </td>
                           <!-- table -->
                      <table class="table table-borderless table-hover">
                        
                        <tbody>
                          <tr>
                            
                            <td>
                              
                            </td>
                            <td>
                              <p class="mb-0 text-muted"><strong>${LecNoticeVO.lecnTtl}</strong></p>
<!--                               <small class="mb-0 text-muted">2474</small> -->
                            </td>
                            <td> 
						        <p class="mb-0 text-muted"><strong>${LecNoticeVO.lecnTtl}</strong></p>
						    </td>
                            <td>
                              <p class="mb-0 text-muted"><strong>${LecNoticeVO.lecnTtl}</strong></p>
                            </td>
                            <td>
                              <p class="mb-0 text-muted"><strong>${LecNoticeVO.lecnTtl}</strong></p>
                            </td>
                          </tr>
                          <!-- table -->
                          
              
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/moment.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/simplebar.min.js"></script>
    <script src='js/daterangepicker.js'></script>
    <script src='js/jquery.stickOnScroll.js'></script>
    <script src="js/tinycolor-min.js"></script>
    <script src="js/config.js"></script>
    <script src='js/jquery.dataTables.min.js'></script>
    <script src='js/dataTables.bootstrap4.min.js'></script>
    <script>
      $('#dataTable-1').DataTable(
      {
        autoWidth: true,
        "lengthMenu": [
          [16, 32, 64, -1],
          [16, 32, 64, "All"]
        ]
      });
    </script>
    <script src="js/apps.js"></script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];

      function gtag()
      {
        dataLayer.push(arguments);
      }
      gtag('js', new Date());
      gtag('config', 'UA-56159088-1');
    </script>
  </body>
</html>