<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" ></script>

<style>
	#myContent {
	    min-height: 250px;
	    color: #000000;
	    background-color: white;
	}
</style>

		<div class="w-75">
				<div class="card-body p-5 bg-white" style="border: 1px solid #dbdbdb;">
				
                  <div class="row mb-5">
                  
                    <div class="col-12 text-center mb-4">
                      <p class="" style="margin-bottom: 15px;">공지사항</p>
                      <sec:csrfInput/>
                      <h2 class="mb-0 text-uppercase">${noticeVO.ntcTtl }</h2>
                      <hr class="my-4" style="border : 1px solid #dbdbdb;">
                    </div>
                    
                   
                    <div class="col-md-12" style="font-size:15px;">
                      <p class="mb-4">
                        <strong>작성일</strong>&nbsp;&nbsp;&nbsp;<fmt:formatDate value='${noticeVO.ntcDt}' pattern='yyyy-MM-dd' />
                      </p>
                      <p class="mb-4">
                        <strong>작성자</strong>&nbsp;&nbsp;&nbsp;${noticeVO.memNm }
                      </p>
                      <hr class="my-4" style="border : 1px solid #dbdbdb;">
                    </div>
                    
                    <div class="col-md-12" style="font-size:15px;">
                      	<c:if test="${noticeVO.filePath != null }">						         
				        <div> 
	 				        	<strong><label for="fileId">첨부 파일</label></strong> 
<%-- 	  				        	<label>${noticeVO.fileOriNm }</label>  --%>
	 				            <a href='${noticeVO.filePath}' download="${noticeVO.filePath.split("/")[2]}" >${noticeVO.fileOriNm}</a> 
	 			        </div> 
 			        	</c:if>
	 			        <c:if test="${noticeVO.filePath == null }">						         
	 			        <div>
	 						<p>첨부파일 없음</p> 
	 			        </div> 
				        </c:if>
				        <hr class="my-4" style="border : 1px solid #dbdbdb;">
                    </div>
                    
                  
                  <div class="col-md-12" id="myContent" style="font-size:15px;">
                    	<p class="mb-2">${noticeVO.ntcCon }</p>
                  </div>
                  
                  </div> <!-- /.row -->
                  
                </div> <!-- /.card-body -->
                
                  <div class="col-md-12" style="font-size:15px; margin-top:20px;">
                  	<div class="d-flex justify-content-center">
                  		<button type="button" class="btn btn-my" style="width:115px; height:37px; font-size: 18px;" onclick="list()">목록</button>
                  	</div>
                  </div>
		</div>

<!--       <main role="main" style="width:100%; margin:0 auto;"> -->
<!--         <div class="container" > -->
<!--           <div class="row justify-content-center"> -->
<!--             <div class="col-12 col-lg-10 col-xl-12"> -->
<!--               <h2 class="h3 mb-4 page-title" style="margin-top:30px;">공지사항</h2> -->
<!--               <div class="my-4"> -->
              
<!--                 <form> -->
<%--                 <sec:csrfInput/> --%>
<!-- 				  <hr class="my-4" style="border : 1px solid #999;"> -->
<%-- 				  <h3 class="h3 mb-4 page-title text-center">${noticeVO.ntcTtl }</h3> --%>
					
<!--                   <hr class="my-4" style="border : 1px dashed #bdbdbd;"> -->
                  
<!--                   <div class="form-group col-md-6"> -->
<!-- 					  <ul class="small text-muted pl-4 mb-0"> -->
<%--                         <li>작성일&nbsp;&nbsp;&nbsp;<fmt:formatDate value='${noticeVO.ntcDt}' pattern='yyyy-MM-dd' /></li> --%>
<%--                         <li>작성자&nbsp;&nbsp;&nbsp;${noticeVO.memNm }</li> --%>
<!--                         <li>조회수&nbsp;&nbsp;&nbsp;0</li> -->
<!--                       </ul> -->
<!--                   </div> -->
                  
<!--                   <hr class="my-4" style="border : 1px dashed #bdbdbd;"> -->
                  
<%-- 			        <c:if test="${noticeVO.filePath != null }">						         --%>
<!-- 			        <div class="form-group" > -->
<!-- 				        	<label for="fileId">첨부 파일</label> -->
<%--  				        	<label>${noticeVO.fileOriNm }</label> --%>
<%-- 				            <a href='${noticeVO.filePath}' download="${noticeVO.filePath.split("/")[2]}" >첨부 파일 다운로드</a> --%>
<!-- 			        </div> -->
<%-- 			        </c:if> --%>
<%-- 			        <c:if test="${noticeVO.filePath == null }">						         --%>
<!-- 			        <div class="form-group" > -->
<!-- 						<p>첨부파일 없음</p> -->
<!-- 			        </div> -->
<%-- 			        </c:if> --%>
                  
<!--                   <hr class="my-4" style="border : 1px dashed #bdbdbd;"> -->
                  
<!--                   <div class="col-md-12 fs-24" id="content"> -->
<%--                     <p class="mb-2">${noticeVO.ntcCon }</p> --%>
<!--                   </div> -->
                  
<!--                   <hr class="my-4" style="border : 1px solid #999;"> -->
                  
<!--                   <div class="col-md-6 text-right" style="margin-top:10px; margin-left: 570px;"> -->
<!--                   	<button type="button" class="btn btn-my" style="width:130px; height:50px; font-size: 20px;" onclick="list()">목록</button> -->
<!--                   </div> -->
<!--                 </form> -->
                
<!--               </div> /.card-body -->
<!--             </div> /.col-12 -->
<!--           </div> .row -->
<!--         </div> .container-fluid -->
<!--       </main> main -->
    
    <script src="js/jquery.min.js"></script>
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
      window.dataLayer = window.dataLayer || [];

      function gtag()
      {
        dataLayer.push(arguments);
      }
      gtag('js', new Date());
      gtag('config', 'UA-56159088-1');
      
      function list() {
    	  location.href="/common/notice";
      }
    </script>
