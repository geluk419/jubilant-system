<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
table.datatables th {
    background-color: #B61A53;
    text-align: center;
}

table.datatables td {
	text-align: center;

}
</style>
<body class="vertical  light">
	<div class="wrapper w-75">
		<main role="main" class="main-content mx-auto">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12">
						<div class="d-flex justify-content-between align-items-center mb-4">
                            <h2 class="mb-2 page-title">등록내역/고지서</h2>
                            <button type="button" id="bill" class="btn btn-my" style="color:white;" onclick="generateBill()">등록금 고지서</button>
                        </div>
						
						<div class="row my-4">
							<!-- Small table -->
							<div class="col-md-12">
							
								<div class="card shadow">
									<div class="card-body">
										<!-- table -->
										<table class="table datatables" id="dataTable-1">
											<thead>
												<tr>
													<th>No.</th>
													<th>년도</th>
													<th>학기</th>
													<th>입학금</th>
													<th>수업료</th>
													<th>장학수업료</th>
													<th>납부총액</th>
													<th>납부일자</th>
													<th>출력</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>2023</td>
													<td>2</td>
													<td>0</td>
													<td>4,150,550</td>
													<td>0</td>
													<td>4,150,550</td>
													<td>2023/08/22</td>
													<td>
														<button type="button" id="detail" class="btn btn-my" style="color:white; height:40px;" onclick="generatePdf()">납부 확인서</button>
													</td>
												</tr>
												<tr>
													<td>2</td>
													<td>2023</td>
													<td>1</td>
													<td>0</td>
													<td>4,150,550</td>
													<td>100,000</td>
													<td>3,150,550</td>
													<td>2023/02/19</td>
													<td>
														<button type="button" id="detail" class="btn btn-my" style="color:white; height:40px;" onclick="generatePdf()">납부 확인서</button>
													</td>
												</tr>
												<tr>
													<td>3</td>
													<td>2022</td>
													<td>2</td>
													<td>0</td>
													<td>4,150,550</td>
													<td>500,000</td>
													<td>3,650,550</td>
													<td>2022/08/24</td>
													<td>
														<button type="button" id="detail" class="btn btn-my" style="color:white; height:40px;" onclick="generatePdf()">납부 확인서</button>
													</td>
												</tr>
												<tr>
													<td>4</td>
													<td>2022</td>
													<td>1</td>
													<td>0</td>
													<td>4,150,550</td>
													<td>500,000</td>
													<td>3,650,550</td>
													<td>2022/08/24</td>
													<td>
														<button type="button" id="detail" class="btn btn-my" style="color:white; height:40px;" onclick="generatePdf()">납부 확인서</button>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- simple table -->
						</div>
						<!-- end section -->
					</div>
					<!-- .col-12 -->
				</div>
				<!-- .row -->
			</div>
			<!-- .container-fluid -->
		</main>
		<!-- main -->
	</div>
	<!-- .wrapper -->

	<script>
		function generatePdf() {
	        location.href = '/stu/print';
	    }
		function generateBill() {
			location.href = '/stu/printBill';
		}
	</script>
	
</body>