<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<body class="vertical  light  ">
	<div class="wrapper w-100">
		<main role="main" class="main-content mx-auto">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12 col-lg-10 col-xl-10">
						<h2 class="fe fe-24 fe-map-pin"> 오시는 길</h2>
						<p class="text-muted">오시는 길 안내입니다.</p>
						<div class="row">
							<div class="col-12 mb-4">
								<div class="card shadow">
									<div class="card-body mt-n3">
										<h6 class="card-title my-3">취업딱대학교 오시는 길</h6>
										<div id="map" style="width: 100%; height: 500px;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br/>
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12 col-lg-10 col-xl-10">
						<h2 class="fe fe-24 fe-navigation"> 교통 안내</h2>
						<p class="text-muted">교통 안내입니다.</p>
						<div class="row">
							<div class="col-12 mb-4">
								<div class="card shadow">
									<div class="card-body mt-n3">
										<h6 class="card-title my-3">취업딱대학교 교통 안내</h6><br/>
										<p class="mb-0" style="font-size: 20px;">주소 안내</p>
										<br/>
										<div class="col-md-5">
						                  <p class="h5 mb-3">주소</p>
						                  <p class="small text-muted text-uppercase mb-2">대전광역시 중구 계룡로 846 3층</p>
						                  <br/>
						                  <p class="h5 mb-3">전화</p>
						                    <p class="small text-muted text-uppercase mb-2">042-222-8201</p>
						                </div>
										<hr/>
										<p class="mb-0" style="font-size: 20px;">교통 안내</p>
										<br/>
										<div class="col-md-5">
						                  <p class="h5 mb-3">주변 버스 정류장</p>
						                  <p class="fe fe-18 fe-compass"> 서대전네거리역4번출구  101번, 103번, 315번, 614번, 618번</p>
						                  <p class="fe fe-18 fe-compass"> 중도일보  103번, 603번, 618번</p>
						                  <br/><br/>
						                  <p class="h6 mb-3">최종 수정일</p>
						                  <p class="small text-muted text-uppercase mb-2">2023.10.01</p>
						                </div>
										<hr/>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- .container-fluid -->
		</main>
		<!-- main -->
	</div>
	<!-- .wrapper -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2292715adebd630cba65f607837e8c0b"></script>
	<script type="text/javascript">
		var container = document.getElementById('map'); // 지도를 담을 영역의 DOM 참조
		var options = { // 지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(36.32515361521084, 127.40899925404597), // 지도의 중심 좌표
			level : 1
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(container, options); // 지도를 생성하고 객체 반환

		// 마커 추가
		var markerPosition = new kakao.maps.LatLng(36.32515361521084, 127.40899925404597);
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});
		marker.setMap(map);

		// 마커 클릭 시 정보창 표시
		var infowindow = new kakao.maps.InfoWindow({
			content : '<div style="padding:10px;">취업딱대학교</div>'
		});

		// 마커를 클릭 시 정보창 오픈
		kakao.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});

		// 지도 스타일링
		var mapStyles = [ {
			featureType : 'landscape',
			elementType : 'all',
			stylers : [ {
				hue : '#ffbb00'
			}, {
				saturation : 50
			} ]
		}, {
			featureType : 'poi',
			elementType : 'all',
			stylers : [ {
				hue : '#00ff6a'
			}, {
				saturation : 50
			} ]
		} ];

		var mapTypeControl = new kakao.maps.MapTypeControl();
		var zoomControl = new kakao.maps.ZoomControl();

		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		map.setStyles(mapStyles);
	</script>
</body>
</html>