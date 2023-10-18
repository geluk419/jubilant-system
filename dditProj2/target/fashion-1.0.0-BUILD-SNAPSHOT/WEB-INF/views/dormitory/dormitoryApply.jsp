<%@ page language="java" contentType="text/html; charset=UTF-8"%>

    <div class="wrapper">
       
        
        <main role="main" class="main-content">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <h2 class="page-title">기숙사 신청</h2>
                        <p class="text-muted">2023학년도 2학기 기숙사 신청</p>
                        <div class="card shadow mb-4">

                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label for="example-palaceholder">이름</label>
                                            <input type="text" id="example-palaceholder" class="form-control"
                                                placeholder="이름">
                                        </div>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="customCheck1">
                                                <label class="custom-control-label" for="customCheck1">남자</label>
                                            </div>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="customCheck1">
                                                <label class="custom-control-label" for="customCheck1">여자</label>
                                            </div><br/>
                                        <div class="form-group mb-3">
                                            <label for="example-palaceholder">생년월일</label>
                                            <input type="date" id="example-palaceholder" class="form-control"
                                                placeholder="생년월일">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="example-palaceholder">학번</label>
                                            <input type="text" id="example-palaceholder" class="form-control"
                                                placeholder="학번">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="example-palaceholder">학과</label>
                                            <input type="text" id="example-palaceholder" class="form-control"
                                                placeholder="학과">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="example-palaceholder">단과대학</label>
                                            <select class="custom-select" id="custom-select">
                                                <option>단과대학 선택</option>
                                                <option value="1">경영대학</option>
                                                <option value="2">인문대학</option>
                                                <option value="3">생명과학대학</option>
                                                <option value="4">공과대학</option>
                                                <option value="5">사회과학대학</option>
                                                <option value="6">자연과학대학</option>
                                                <option value="7">예술대학	</option>
                                            </select>
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="example-palaceholder">학점</label>
                                            <input type="text" id="example-palaceholder" class="form-control"
                                                placeholder="학점">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="example-palaceholder">거주지역</label>
                                            <input type="text" id="example-palaceholder" class="form-control"
                                                placeholder="거주지역">
                                        </div>
                                    </div> <!-- /.col -->
                                    <div class="col-md-6">
                                        
                                        <div class="form-group mb-3">
                                            <label for="example-readonly">신청연도</label>
                                            <input type="text" id="example-readonly" class="form-control" readonly=""
                                                value="신청연도">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="example-disable">신청학기</label>
                                            <input type="text" class="form-control" id="example-disable" disabled=""
                                                value="신청학기">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="custom-select">신청 기숙사명</label>
                                            <select class="custom-select" id="custom-select">
                                                <option>신관/구관 선택</option>
                                                <option value="1">신관(여자)</option>
                                                <option value="2">신관(여자)</option>
                                                <option value="3">구관(남자)</option>
                                                <option value="4">구관(남자)</option>
                                            </select>
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="custom-select">희망호수</label>
                                            <p class="text-muted">신관(101호~120호),구관(101호~120호)</p>
                                            <input type="text" id="example-palaceholder" class="form-control">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="example-palaceholder">연락처</label>
                                            <input type="text" id="example-palaceholder" class="form-control"
                                                placeholder="연락처">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="example-palaceholder">비상연락처</label>
                                            <input type="text" id="example-palaceholder" class="form-control"
                                                placeholder="비상연락처">
                                        </div>
                                        <div class="form-group">
                                            <label for="example-palaceholder">신청사유</label>
                                            <label for="exampleFormControlTextarea1" class="sr-only">Your Message</label>
                                            <textarea class="form-control bg-light" id="exampleFormControlTextarea1" rows="2"></textarea>
                                        </div>
                                        <div class="d-flex justify-content-end">
                                            <button type="submit" class="btn mb-2 bg-my text-white">신청</button>
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
