<%@ page language="java" contentType="text/html; charset=UTF-8"%>

    
        <main role="main" class="main-content">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <h2 class="page-title">기숙사</h2>
                        <p class="text-muted"></p>
                        <div class="card shadow mb-4">

                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label for="example-palaceholder" style="font-weight: bold;">* 외박신청</label><br/>
                                            <label for="example-palaceholder">&nbsp;외박일정</label>
                                            <input type="date" id="example-palaceholder" class="form-control"
                                                placeholder="외박일정">
                                                <label for="example-palaceholder">&nbsp;귀가일정</label>
                                            <input type="date" id="example-palaceholder" class="form-control"
                                                placeholder="귀가일정">
                                        </div>
                                        <div class="form-group">
                                            <label for="example-palaceholder">외박사유</label>
                                            <label for="exampleFormControlTextarea1" class="sr-only">Your Message</label>
                                            <textarea class="form-control bg-light" id="exampleFormControlTextarea1" rows="2"></textarea>
                                        </div>
                                        <button type="submit" class="btn mb-2 bg-my text-white">외박신청</button> <br/><br/>


                                        <div class="form-group mb-3">
                                            <label for="example-palaceholder" style="font-weight: bold;">* 승인여부</label><br/>
                                            <label for="example-palaceholder">결과</label>
                                            <input type="text" id="example-palaceholder" class="form-control"
                                                placeholder="">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="example-palaceholder">반려사유</label>
                                            <input type="text" id="example-palaceholder" class="form-control"
                                                placeholder="">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="example-palaceholder" style="font-weight: bold;">* 상벌점현황</label><br/>
                                            <label for="example-palaceholder">상점</label>
                                            <input type="text" id="example-palaceholder" class="form-control"
                                                placeholder="">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="example-palaceholder">벌점</label>
                                            <input type="text" id="example-palaceholder" class="form-control"
                                                placeholder="">
                                        </div>
                                        
                                    </div> <!-- /.col -->
                                    <div class="col-md-6">
                                        
                                        <div class="form-group mb-3">
                                            <label for="example-palaceholder" style="font-weight: bold;">* 사생정보</label><br/>
                                            <label for="example-palaceholder">이름</label>
                                            <input type="text" class="form-control" id="example-disable" disabled=""
                                                value="">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="example-palaceholder">학번</label>
                                            <input type="text" class="form-control" id="example-disable" disabled=""
                                                value="">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="example-disable">기숙사명</label>
                                            <input type="text" class="form-control" id="example-disable" disabled=""
                                                value="">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="example-disable">연락처</label>
                                            <input type="text" class="form-control" id="example-disable" disabled=""
                                                value="">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="example-disable">성별</label>
                                            <input type="text" class="form-control" id="example-disable" disabled=""
                                                value="">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="example-disable">학과</label>
                                            <input type="text" class="form-control" id="example-disable" disabled=""
                                                value="">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="example-disable">호수</label>
                                            <input type="text" class="form-control" id="example-disable" disabled=""
                                                value="">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="example-disable">비상연락처</label>
                                            <input type="text" class="form-control" id="example-disable" disabled=""
                                                value="">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="example-disable">기숙사 생활기관</label>
                                            <input type="text" class="form-control" id="example-disable" disabled=""
                                                value="">
                                        </div>
                                        
                                        <div class="d-flex justify-content-end">
                                            <button type="submit" class="btn mb-2 bg-my text-white">저장</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- / .card -->


                        
                           
                            
    </div> <!-- .wrapper -->
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

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());
        gtag('config', 'UA-56159088-1');
    </script>
