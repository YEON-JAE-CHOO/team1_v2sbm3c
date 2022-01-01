<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>식당 등록</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script type="text/javascript">
	$(function() {

	});
</script>
</head>
<body>
	<jsp:include page="../menu/top.jsp" flush='false' />
	<!-- Header-->
	<header class="py-4" style="background-color: #ef9578;"> </header>
	<!-- Section-->
	<section class="py-5">

		<div class="row">

			<div class="col-xs-12 col-sm-12">
				<h2>&nbsp;</h2>
				<h2 class="text-center">가게 등록</h2>
			</div>

			<div class="col-xs-3 col-sm-3"></div>
			<div class="col-xs-8 col-sm-8">

				<div>
					<p>&nbsp;</p>

					<form class="form-horizontal" action="./regist.do"
						method="post">
						<div class="form-group">
							<div class="col-sm-2 control-label">
								<label for="id">가게 이름</label>
							</div>
							<div class="col-sm-6 text-left">
								<input type="text" class="form-control" name="name" id="name">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-2 control-label">
								<label id="">카테고리</label>
							</div>
							<div class="dropdown">
								<button class="btn btn-secondary dropdown-toggle" type="button"
									id="dropdownMenu2" data-bs-toggle="dropdown"
									aria-expanded="false">Dropdown</button>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
									<li><button class="dropdown-item" type="button">Action</button></li>
									<li><button class="dropdown-item" type="button">Another
											action</button></li>
									<li><button class="dropdown-item" type="button">Something
											else here</button></li>
								</ul>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-2 control-label">
								<label id="text">가게 소개</label>
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="explanation"
									id="explanation">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-2 control-label">
								<label id="name">최소 주문 금액</label>
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="leastprice" id="leastprice">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-2 control-label">
								<label id="email">가게 연락처</label>
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="call" id="call"
									placeholder="ex) 010-0000-0000">
							</div>
						</div>


						<div class="form-group">
							<div class="col-sm-2 control-label">
								<label id="zip_num">우편번호</label>
							</div>
							<div>
							</div>
							<div class="col-sm-3">
								<input type="text" id="code" placeholder="우편번호"
									name="code" class="form-control" value="06267">
							</div>
							<div class="col-sm-3">
								<input type="button" onclick="sample6_execDaumPostcode()"
									value="우편번호 찾기" class="btn btn-primary">

							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-2 control-label">
								<label id="address1">주소</label>
							</div>
							<div class="col-sm-6">
								<input type="text" id="address1" placeholder="주소"
									name="address1" class="form-control"
									value="서울 강남구 강남대로 238 (도곡동, 스카이쏠라빌딩)">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-2 control-label">
								<label id="address1">상세주소</label>
							</div>
							<div class="col-sm-6">
								<input type="text" id="address2" placeholder="상세주소"
									name="address2" class="form-control" value="256-32">
							</div>
						</div>



						<input type="hidden" value="${GetIpAddress.getIp()}">
						<div class="form-group">
							<div class="col-sm-12 text-center">
								<input type="submit" value="가게 등록" class="btn btn-success">
								<input type="reset" value="취소" class="btn btn-warning">
							</div>
						</div>


					</form>
				</div>
			</div>

		</div>
		
	</section>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<jsp:include page="../menu/bottom.jsp" flush='false' />
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>