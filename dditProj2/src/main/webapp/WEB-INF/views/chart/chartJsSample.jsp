<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-12">
    <h2 class="h2 page-title">총지표</h2>
    <div class="row">
        <div class="col-md-6 mb-4">
            <div class="card shadow">
                <div class="card-header">
                    <strong class="card-title mb-0">입학 전형 유형별 선별 결과 (정시)</strong>
                </div>
                <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                    <canvas id="myChartjs3" width="425" height="300" class="chartjs-render-monitor" style="display: block; width: 425px; height: 300px;"></canvas>
                </div> <!-- /.card-body -->
            </div> <!-- /.card -->
        </div> <!-- /. col -->
        
        <div class="col-md-6 mb-4">
            <div class="card shadow">
                <div class="card-header">
                    <strong class="card-title mb-0">입학 전형 유형별 선별 결과 (수시)</strong>
                </div>
                <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                    <canvas id="myChartjs4" width="425" height="300" class="chartjs-render-monitor" style="display: block; width: 425px; height: 300px;"></canvas>
                </div> <!-- /.card-body -->
            </div> <!-- /.card -->
        </div> <!-- /. col -->
        
        <div class="col-md-6 mb-4">
            <div class="card shadow">
                <div class="card-header">
                    <strong class="card-title mb-0">남녀 성비</strong>
                </div>
                <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                    <canvas id="pieChartjs" width="425" height="300" class="chartjs-render-monitor" style="display: block; width: 425px; height: 300px;"></canvas>
                </div> <!-- /.card-body -->
            </div> <!-- /.card -->
        </div> <!-- /. col -->
        
        <div class="col-md-6 mb-4">
            <div class="card shadow">
                <div class="card-header">
                    <strong class="card-title mb-0">연도별 기숙사 학생수</strong>
                </div>
                <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                    <canvas id="areaChartjs" width="425" height="300" class="chartjs-render-monitor" style="display: block; width: 425px; height: 300px;"></canvas>
                </div> <!-- /.card-body -->
            </div> <!-- /.card -->
        </div> <!-- /. col -->
        
        <div class="col-md-6 mb-4">
            <div class="card shadow">
                <div class="card-header">
                    <strong class="card-title mb-0">취업딱대학교 단과대별 취업 현황</strong>
                </div>
                <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                    <canvas id="myChartjs1" width="425" height="300" class="chartjs-render-monitor" style="display: block; width: 425px; height: 300px;"></canvas>
                </div> <!-- /.card-body -->
            </div> <!-- /.card -->
        </div> <!-- /. col -->
        
        <div class="col-md-6 mb-4">
            <div class="card shadow">
                <div class="card-header">
                    <strong class="card-title mb-0">전공분야별 등록금</strong>
                </div>
                <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                    <canvas id="myChartjs2" width="425" height="300" class="chartjs-render-monitor" style="display: block; width: 425px; height: 300px;"></canvas>
                </div> <!-- /.card-body -->
            </div> <!-- /.card -->
        </div> <!-- /. col -->
        
    </div> <!-- end section -->
</div>

<!-- chartjs JS -->
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

// sujiChart 전역변수를 이용하여 차트 내부 정보를 읽어올 수 있음!
//console.log("체킁: ", sujiChart.data.labels); //29~34접근
//console.log("체킁2: ", sujiChart.data.datasets[1]); //35~40접근
//console.log("체킁2: ", sujiChart.data.datasets[1].data); 

// 값을 바로 줄 수 있음!
//sujiChart.data.datasets[1].data = [1,2,3,4,5,6,7];

// chart.js의 가장 중요한 메소드 update() => 다시 그려라(rendering)
//sujiChart.update();

</script>
<script>
$(function(){
	//alert("ppp");
	const ctx = document.querySelector('#myChartjs2');

	//bar와 line은 mix될 수 있음. (딴 건 안됨!, 생각해보면 안되는 이유 추측가능)
	//chart.js가 잘 만들어진 이유는 생성자 리턴값에 설정옵션들이 거의 다 
	//포함되어서 리턴되고, 그것으로 모든 걸 제어할 수 있음!(아주 훌륭!)
	const sujiChart = new Chart(ctx, { //여기가 핵심
	    type: 'bar', // bar, line, doughnut, pie, radar 기본타입
	    data: {
	        //labels 갯수가 맞아야만 해당 데이터가 화면에 나옴!
	        labels: ['경영', '공학', '사회과학', '생명과학', '예체능', '인문', '자연과학'],
	        datasets: [ //배열이라 s를 붙여넣음. s가 중요함.
	            {   
	                type:"bar",
	                label: '올해',
	                data: [300, 450, 300, 415, 350, 300, 450],
	                borderWidth: 1
	            },
// 	            {   
// 	                type : "bar",
// 	                label: '올해',
// 	                data: [88.9, 99.5, 75.8, 79.6, 70.5, 70.6, 80.4],
// 	                borderWidth: 1
// 	            }
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

// sujiChart 전역변수를 이용하여 차트 내부 정보를 읽어올 수 있음!
//console.log("체킁: ", sujiChart.data.labels); //29~34접근
//console.log("체킁2: ", sujiChart.data.datasets[1]); //35~40접근
//console.log("체킁2: ", sujiChart.data.datasets[1].data); 

// 값을 바로 줄 수 있음!
//sujiChart.data.datasets[1].data = [1,2,3,4,5,6,7];

// chart.js의 가장 중요한 메소드 update() => 다시 그려라(rendering)
//sujiChart.update();

</script><script>
$(function(){
	//alert("ppp");
	const ctx = document.querySelector('#myChartjs2');

	//bar와 line은 mix될 수 있음. (딴 건 안됨!, 생각해보면 안되는 이유 추측가능)
	//chart.js가 잘 만들어진 이유는 생성자 리턴값에 설정옵션들이 거의 다 
	//포함되어서 리턴되고, 그것으로 모든 걸 제어할 수 있음!(아주 훌륭!)
	const sujiChart = new Chart(ctx, { //여기가 핵심
	    type: 'bar', // bar, line, doughnut, pie, radar 기본타입
	    data: {
	        //labels 갯수가 맞아야만 해당 데이터가 화면에 나옴!
	        labels: ['경영', '공학', '사회과학', '생명과학', '예체능', '인문', '자연과학'],
	        datasets: [ //배열이라 s를 붙여넣음. s가 중요함.
	            {   
	                type:"bar",
	                label: '올해',
	                data: [300, 450, 300, 415, 350, 300, 450],
	                borderWidth: 1
	            },
// 	            {   
// 	                type : "bar",
// 	                label: '올해',
// 	                data: [88.9, 99.5, 75.8, 79.6, 70.5, 70.6, 80.4],
// 	                borderWidth: 1
// 	            }
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

// sujiChart 전역변수를 이용하여 차트 내부 정보를 읽어올 수 있음!
//console.log("체킁: ", sujiChart.data.labels); //29~34접근
//console.log("체킁2: ", sujiChart.data.datasets[1]); //35~40접근
//console.log("체킁2: ", sujiChart.data.datasets[1].data); 

// 값을 바로 줄 수 있음!
//sujiChart.data.datasets[1].data = [1,2,3,4,5,6,7];

// chart.js의 가장 중요한 메소드 update() => 다시 그려라(rendering)
//sujiChart.update();

</script>
<script>
$(function(){
	//alert("ppp");
	const ctx = document.querySelector('#myChartjs3');

	//bar와 line은 mix될 수 있음. (딴 건 안됨!, 생각해보면 안되는 이유 추측가능)
	//chart.js가 잘 만들어진 이유는 생성자 리턴값에 설정옵션들이 거의 다 
	//포함되어서 리턴되고, 그것으로 모든 걸 제어할 수 있음!(아주 훌륭!)
	const sujiChart = new Chart(ctx, { //여기가 핵심
	    type: 'bar', // bar, line, doughnut, pie, radar 기본타입
	    data: {
	        //labels 갯수가 맞아야만 해당 데이터가 화면에 나옴!
	        labels: ['2017', '2018', '2019', '2020', '2021', '2022'],
	        datasets: [ //배열이라 s를 붙여넣음. s가 중요함.
	            {   
	                type:"bar",
	                label: '모집',
	                data: [393, 402, 309, 352, 360, 377],
	                backgroundColor: ['#FFF56E'],
	                borderWidth: 1
	            },
	            {   
	                type : "bar",
	                label: '등록',
	                data: [350, 385, 300, 340, 333, 350],
	                backgroundColor: ['#FF8C0A'],
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

// sujiChart 전역변수를 이용하여 차트 내부 정보를 읽어올 수 있음!
//console.log("체킁: ", sujiChart.data.labels); //29~34접근
//console.log("체킁2: ", sujiChart.data.datasets[1]); //35~40접근
//console.log("체킁2: ", sujiChart.data.datasets[1].data); 

// 값을 바로 줄 수 있음!
//sujiChart.data.datasets[1].data = [1,2,3,4,5,6,7];

// chart.js의 가장 중요한 메소드 update() => 다시 그려라(rendering)
//sujiChart.update();

</script>
<script>
$(function(){
	//alert("ppp");
	const ctx = document.querySelector('#myChartjs4');

	//bar와 line은 mix될 수 있음. (딴 건 안됨!, 생각해보면 안되는 이유 추측가능)
	//chart.js가 잘 만들어진 이유는 생성자 리턴값에 설정옵션들이 거의 다 
	//포함되어서 리턴되고, 그것으로 모든 걸 제어할 수 있음!(아주 훌륭!)
	const sujiChart = new Chart(ctx, { //여기가 핵심
	    type: 'bar', // bar, line, doughnut, pie, radar 기본타입
	    data: {
	        //labels 갯수가 맞아야만 해당 데이터가 화면에 나옴!
	        labels: ['2017', '2018', '2019', '2020', '2021', '2022'],
	        datasets: [ //배열이라 s를 붙여넣음. s가 중요함.
	            {   
	                type:"bar",
	                label: '모집',
	                data: [1927, 1945, 1950, 1935, 1940, 1939],
	                backgroundColor: ['#3CA0E1'],
	                borderWidth: 1
	            },
	            {   
	                type : "bar",
	                label: '등록',
	                data: [1819, 1715, 1758, 1856, 1801, 1794],
	                backgroundColor: ['#C8C8FF'],
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

// sujiChart 전역변수를 이용하여 차트 내부 정보를 읽어올 수 있음!
//console.log("체킁: ", sujiChart.data.labels); //29~34접근
//console.log("체킁2: ", sujiChart.data.datasets[1]); //35~40접근
//console.log("체킁2: ", sujiChart.data.datasets[1].data); 

// 값을 바로 줄 수 있음!
//sujiChart.data.datasets[1].data = [1,2,3,4,5,6,7];

// chart.js의 가장 중요한 메소드 update() => 다시 그려라(rendering)
//sujiChart.update();
</script>
<script>
$(function(){
	
	/* 차트 */
	$("#SvgjsText1020").html("3.38");
	
}
</script>