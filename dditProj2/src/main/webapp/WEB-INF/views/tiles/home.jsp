<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style>
 p { margin: 0}
 #weather-card {
	 background-color: #ebebeb;
	 color: var(--my-color);
 }
 #weatherIcon {
	 vertical-align: middle;
 }
 #name {
	 font-size: 30px;
	 line-height: 1;
 }
 .card-header {
	 padding: 0.75rem 1.25rem 0.5rem;
 }

 .nav-link {
	 padding: 0.5rem 0.5rem 0.35rem;
 }

 .nav-pills .nav-link.active, .nav-pills .show > .nav-link {
	 background-color: var(--my-color);
 }
 .nav-item a.nav-link {
	 color: var(--my-color);
 }

 /* 공지 테이블 시작 */
 #noticeTable thead th {
	 color: #001a4e;
 }
 /* 공지 테이블 끝 */

</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
$(function(){
	const ctx = document.querySelector('#myChartjs1');

	//bar와 line은 mix될 수 있음. (딴 건 안됨!, 생각해보면 안되는 이유 추측가능)
	//chart.js가 잘 만들어진 이유는 생성자 리턴값에 설정옵션들이 거의 다 
	//포함되어서 리턴되고, 그것으로 모든 걸 제어할 수 있음!(아주 훌륭!)
	const sujiChart = new Chart(ctx, { //여기가 핵심
	    type: 'bar', // bar, line, doughnut, pie, radar 기본타입
	    data: {
	        //labels 갯수가 맞아야만 해당 데이터가 화면에 나옴!
	        labels: ['경영대학', '공과대학', '사회과학대학', '생명과학대학', '예술대학', '인문대학', '자연과학대학'],
	        datasets: [ //배열이라 s를 붙여넣음. s가 중요함.
	            {   
	                type:"bar",
	                label: '작년',
	                data: [85, 98, 70.1, 75.8, 65.3, 68.5, 77.9],
	                borderWidth: 1
	            },
	            {   
	                type : "bar",
	                label: '올해',
	                data: [88.9, 99.5, 75.8, 79.6, 70.5, 70.6, 80.4],
	                borderWidth: 1
	            }
	        ]
	    },
	    // 필요한 옵션은 구글 검색을 통해 해결!
	    options: {
	        scales: {
	            y: {
	                beginAtZero: true
	            }
	        }
	    }
	});
});

const myLastVal = document.querySelector("#lastVal"); 
const myThisVal = document.querySelector("#thisVal"); 

// sujiChart 전역변수를 이용하여 차트 내부 정보를 읽어올 수 있음!
//console.log("체킁: ", sujiChart.data.labels); //29~34접근
//console.log("체킁2: ", sujiChart.data.datasets[1]); //35~40접근
//console.log("체킁2: ", sujiChart.data.datasets[1].data); 

// 값을 바로 줄 수 있음!
//sujiChart.data.datasets[1].data = [1,2,3,4,5,6,7];

// chart.js의 가장 중요한 메소드 update() => 다시 그려라(rendering)
//sujiChart.update();

</script>
<div class="col-12">
<!-- <div class="row align-items-center mb-2"> -->
<!-- 	<div class="col"> -->
<!-- 		<h2 class="h5 page-title">Welcome!</h2> -->
<!-- 	</div> -->
<!-- </div> -->
<div class="mb-2 align-items-center">
	<div class="col-md-12 mb-4">
            <div class="card shadow">
                <div class="card-header">
                    <strong class="card-title mb-0">취업딱대학교 단과대별 취업 현황</strong>
                </div>
                <div class="col-md-12 mb-4">
                    <canvas id="myChartjs1" width="425" height="100" class="chartjs-render-monitor" style="display: block; width: 425px; height: 100px;"></canvas>
                </div> <!-- /.card-body -->
            </div> <!-- /.card -->
        </div> <!-- /. col -->
</div>
<div class="row items-align-baseline">
	<div class="col-md-12 col-lg-4">
		<div class="card shadow eq-card mb-4">
			<div class="card-body mb-n3">

				<div class="row align-items-center">
					<div class="col-6 text-center">
						<button class="squircle bg-danger-lighter justify-content-center btn" data-url="/common/road">
							<i class="fe fe-compass fe-32 align-self-center text-white"></i>
						</button>
						<p>오시는 길</p>
					</div>
					<div class="col-6 text-center">
						<button class="squircle bg-danger-light justify-content-center btn" data-url="/common/map">
							<i class="fe fe-map fe-32 align-self-center text-white"></i>
						</button>
						<p>캠퍼스 맵</p>
					</div>
					<div class="col-6 text-center">
						<button class="squircle bg-danger-dark justify-content-center btn" data-url="/security/login">
							<i class="fe fe-log-in fe-32 align-self-center text-white"></i>
						</button>
						<p>로그인</p>
					</div>
					<div class="col-6 text-center">
						<button class="squircle bg-danger justify-content-center btn" data-url="/home/chart">
							<i class="fe fe-pie-chart fe-32 align-self-center text-white"></i>
						</button>
						<p>총지표</p>
					</div>

				</div>
				<!-- .col -->
			</div>
			<!-- .card-body -->
		</div>
		<!-- .card -->
	</div>
	<!-- .col -->
	<div class="col-md-12 col-lg-4">
		<div class="card shadow eq-card mb-4">
			<div class="card-body">
				<div class="chart-widget mb-2">
					<div id="radialbar"></div>
				</div>
				<div class="row items-align-center">
					<div class="col-4 text-center">
						<p class="text-muted mb-1">2020</p>
						<h6 class="mb-1">3.42</h6>
						<p class="text-muted mb-0">4.5</p>
					</div>
					<div class="col-4 text-center">
						<p class="text-muted mb-1">2021</p>
						<h6 class="mb-1">3.56</h6>
						<p class="text-muted mb-0">4.5</p>
					</div>
					<div class="col-4 text-center">
						<p class="text-muted mb-1">2022</p>
						<h6 class="mb-1">3.40</h6>
						<p class="text-muted mb-0">4.5</p>
					</div>
				</div>
			</div>
			<!-- .card-body -->
		</div>
		<!-- .card -->
	</div>
	<!-- .col -->
	<div class="col-md-12 col-lg-4">
		<div class="card shadow eq-card mb-4">
			<div class="card-header">
				<strong class="card-title">오늘의 학식</strong>
			</div>

			<div class="card-body">
				<div class="row">
					<div class="col-12">
						<ul class="nav nav-pills nav-fill mb-3" id="pills-tab" role="tablist">
							<li class="nav-item">
								<a class="nav-link " id="pills-home-tab" data-toggle="pill" href="#pills-breakfast" role="tab" aria-controls="pills-home" aria-selected="false">조식</a>
							</li>
							<li class="nav-item">
								<a class="nav-link active" id="pills-profile-tab" data-toggle="pill" href="#pills-lunch" role="tab" aria-controls="pills-profile" aria-selected="false">중식</a>
							</li>
							<li class="nav-item">
								<a class="nav-link " id="pills-contact-tab" data-toggle="pill" href="#pills-dinner" role="tab" aria-controls="pills-contact" aria-selected="true">석식</a>
							</li>
						</ul>
					</div>
				</div>

				<div class="tab-content mb-1 " id="pills-tabContent">
					<div class="tab-pane fade row " id="pills-breakfast" role="tabpanel" aria-labelledby="pills-home-tab">
						<div class="col-12">
							<span class="h5 pl-3">조식 메뉴</span>
							<ul id="breakfast-menu"></ul>
						</div>
					</div>
					<div class="tab-pane fade row active show" id="pills-lunch" role="tabpanel" aria-labelledby="pills-profile-tab">
						<div class="col-12">
							<span class="h5 pl-3">중식 메뉴</span>
							<ul id="lunch-menu"></ul>
						</div>
					</div>
					<div class="tab-pane fade row" id="pills-dinner" role="tabpanel" aria-labelledby="pills-contact-tab">
						<div class="col-12">
							<span class="h5 pl-3">석식 메뉴</span>
							<ul id="dinner-menu"></ul>
						</div>
					</div>
				</div>

				<!-- .row -->
			</div>
			<!-- .card-body -->
		</div>
		<!-- .card -->
	</div>
	<!-- .col-md -->
</div>
<!-- .row -->
<div class="row">
	<!-- Recent Activity -->
	<div class="col-md-12 col-lg-4 mb-3">
		<div class="card timeline shadow" id="weather-card">
			<div class="card-header">
				<strong class="card-title">오늘의 날씨</strong>
			</div>
			<div class="card-body p-3 pb-4" data-simplebar
				style="overflow-y: auto; overflow-x: hidden;">
				<div class="row align-items-start mb-4 mt-2">
					<div class="col-6">
						<div class="fs-64 text-center p-3">
							<i id="weatherIcon"></i>
						</div>
					</div>
					<div class="col-6 fs-24">
						<div class="">
							<p class="fs-18 py-2"><b id="name">대전<i class="wi wi-thermometer fs-30 pl-2"></i></b></p>
							<span class="fs-20 ">현재온도 : </span><span id="temp"></span><i class="wi wi-celsius "></i>
						</div>
						<div class="my-1">
							<p class="fs-20">체감온도 : <span class="fs-24" id="feels_like"></span><i class="wi wi-celsius fs-24"></i></p>
						</div>
					</div>
				</div>



				<div class="row align-items-start justify-content-center text-center fs-24">
					<div class="col-auto mx-2">
						<div>
							<p><i class="wi wi-humidity"></i></p>
							<p class="fs-18" id="humidity"></p>
							<p class="fs-18">습도</p>
						</div>
					</div>
					<div class="col-auto mx-2">
						<div>
							<p><i class="wi wi-cloud"></i></p>
							<p class="fs-18" id="cloudy"></p>
							<p class="fs-18">구름</p>
						</div>
					</div>
					<div class="col-auto">
						<div>
							<p><i class="wi wi-raindrops"></i></p>
							<p class="fs-18" id="rain"></p>
							<p class="fs-18">강수량</p>
						</div>
					</div>

					<div class="col-auto">
						<div>
							<p><i class="wi wi-strong-wind"></i></p>
							<p class="fs-18" id="wind"></p>
							<p class="fs-18">풍속</p>
						</div>
					</div>
					<div class="col-auto">
						<div>
							<p class="fs-26"><i class="wi wi-wind" id="degId"></i></p>
							<p class="fs-18" id="deg"></p>
							<p class="fs-18">풍향</p>
						</div>
					</div>
				</div>

			</div>
			<!-- / .card-body -->
		</div>
		<!-- / .card -->
	</div>
	<!-- / .col-md-6 -->
	<!-- Striped rows -->
	<div class="col-md-12 col-lg-8">
		<div class="card shadow">
			<div class="card-header">
				<strong class="card-title">공지사항</strong> <a
					class="float-right small text-muted" href="/common/notice">더보기</a>
			</div>
			<div class="card-body my-n2 pb-1">
				<table class="table table-striped table-hover table-borderless" id="noticeTable">
					<thead>
						<tr>
							<th>No.</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody id="mainNotice">

					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- Striped rows -->
</div>
<!-- .row-->
</div>
<!-- /////////////////////////// home.jsp 추가 JS 코드 시작 /////////////////////////// -->
<script type="text/javascript">

	$(function(){
		weatherAPI();
		fetchMenuData();
		getMainNotice();

		
		/* 차트 */
		$("#SvgjsText1020").html("3.38");
		
		
		/* 메인페이지 공지사항 시작 */
		function getMainNotice() {
			$.ajax({
				url: "/home/mainNotice",
				type: "GET",
				dataType: "json", // JSON 데이터 타입으로 요청
				success: function (data) {
					// console.log(data);
					// 데이터를 성공적으로 받아왔을 때 실행되는 콜백 함수
					if (data) {
						// console.log(data);

						let html;
						data.forEach(function(data, index) {
							html += `
							<tr>
								<td class="pl-3">\${index+1}</td>
								<th scope="col">\${data.ntcTtl}</th>
								<td>\${data.memNm}</td>
								<td>\${data.ntcDtt}</td>
							</tr>
							`;
						});
						$("#mainNotice").html(html);

					} else {
						console.error("데이터를 가져오1지 못했습니다.");
					}
				},
				error: function (xhr, status, error) {
					// AJAX 요청에 실패했을 때 실행되는 콜백 함수
					console.error("AJAX 요청에 실패했습니다.");
					console.log("code: "+xhr);
					console.log("message: "+status);
					console.log("error: "+error);
				},
			});
		}
		/* 메인페이지 공지사항 끝 */

		/* 바로가기 버튼 클릭 이벤트 처리 시작 */
		const buttons = document.querySelectorAll('.squircle.btn');

		buttons.forEach(button => {
			button.addEventListener('click', () => {
				const url = button.getAttribute('data-url');
				if (url) {
					window.location.href = url;
				}
			});
		});
		/* 바로가기 버튼 클릭 이벤트 처리 끝 */

		/* 학식메뉴 처리 시작 */
		function fetchMenuData() {
			// AJAX 요청을 보내고 서버에서 JSON 데이터를 받아옵니다.
			$.ajax({
				url: "/home/menu",
				type: "GET",
				dataType: "json", // JSON 데이터 타입으로 요청
				success: function (data) {
					// console.log(data);
					// 데이터를 성공적으로 받아왔을 때 실행되는 콜백 함수
					if (data) {
						// 서버에서 받아온 메뉴 데이터를 사용하여 HTML에 동적으로 삽입
						populateMenu("breakfast-menu", data.breakfast);
						populateMenu("lunch-menu", data.lunch);
						populateMenu("dinner-menu", data.dinner);
					} else {
						console.error("메뉴 데이터를 가져오지 못했습니다.");
					}
				},
				error: function (xhr, status, error) {
					// AJAX 요청에 실패했을 때 실행되는 콜백 함수
					console.error("AJAX 요청에 실패했습니다.");
					console.log("code: "+xhr);
					console.log("message: "+status);
					console.log("error: "+error);
				},
			});
		}

		// JSON 데이터를 사용하여 메뉴를 HTML에 동적으로 삽입
		function populateMenu(menuId, data) {
			const menuList = document.getElementById(menuId);

			data.forEach(item => {
				const listItem = document.createElement("li");
				listItem.textContent = item;
				menuList.appendChild(listItem);
			});
		}
		/* 학식메뉴 처리 끝 */

		/* 날씨 API 시작 */
		function weatherAPI() {
			const leng = 'en';
			const location = 'daejeon';
			const apiKey = '70304e4b264561a20957682a48779dce'; // API 키
			const apiUrl = `http://api.openweathermap.org/data/2.5/weather?q=\${location}&appid=\${apiKey}&lang=\${leng}&units=metric`;

			const temp = $("#temp");
			const name = $("#name");
			const feels_like = $("#feels_like");
			const humidity = $("#humidity");
			const cloudy = $("#cloudy");
			const rain = $("#rain");
			const wind = $("#wind");
			const deg = $("#deg");

			$.ajax({
				type: "GET",
				url: apiUrl,
				dataType: "json",
				success: function (data) {
					temp.html(data.main.temp) ;
					// name.html(data.name);
					feels_like.html(data.main.feels_like);
					humidity.html(data.main.humidity + "%");
					cloudy.html(data.clouds.all + "%");
					if (data.rain && data.rain['1h']) {
						rain.html(data.rain['1h'] + "mm");
					} else {
						rain.html("0mm");
					}
					wind.html(data.wind.speed + "m/s");

					const windDirection = convertWindDirection(data.wind.deg) + "풍";
					deg.html(windDirection);

					let code = data.weather[0].id;

					weatherIcons(code);
					degIcons(data.wind.deg);
				},
				error: function (xhr, status, error) {
					console.error('AJAX 오류 발생: ' + error);
				}
			});
		}

		function degIcons(data) {
			let degClass = "towards-";
			degClass += data;
			degClass += "-deg";

			// console.log("풍향 : "+data);
			$("#degId").addClass(degClass);
		}

		function convertWindDirection(data) {
			// 바람 방향을 나타내는 문자열 배열
			const windDirections = [
				"북", "북북동", "동북동", 
				"동", "동남동", "남남동", 
				"남", "남남서", "서남서", 
				"서", "서북서", "북북서"
			];

			// 각 바람 방향을 30도 간격으로 나누어 매핑
			const index = Math.round(data / 30) % 12;

			return windDirections[index];
		}

		function weatherIcons(code) {
			$.ajax({
				type: "GET",
				url: "/resources/weather-icons-master/icons.json",
				dataType: "json",
				success: function (data) {
					if (data) {
						// console.log("code : " + code);
						let icon = data[code].icon;
						// console.log(icon);

						let prefix = "wi wi-";

						let today = new Date();
						let hour = today.getHours();
						let dorn;

						if (hour > 6 && hour < 16) {
							dorn = "day-";
						} else {
							dorn = "night-";
							if (icon === "sunny") {
								icon = "clear";
							}
						}
						let iconD = prefix + dorn + icon;
						// console.log(iconD);
						$("#weatherIcon").addClass(iconD);
					}
				},
				error: function (xhr, status, error) {
					console.log("code: " + xhr);
					console.log("message: " + status);
					console.log("error: " + error);
				}
			});
		}
		/* 날씨 API 끝 */


	})
</script>
<!-- /////////////////////////// home.jsp 추가 JS 코드 끝 /////////////////////////// -->
