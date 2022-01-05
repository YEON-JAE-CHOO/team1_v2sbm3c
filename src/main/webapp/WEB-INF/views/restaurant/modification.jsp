<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>

<c:set var="rno" value="${rno }" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>가게 수정</title>
<!-- Favicon-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script type="text/javascript">
	$(function() {

	});
</script>
<style>
#center_a {
	border: 1px solid;
	width: 50%;
	text-align: center;
}
</style>
</head>

<Body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<jsp:include page="./../menu/top.jsp" flush='false' />
	</nav>
    <!-- Header-->
    <header class="py-4" style="background-color: #ef9578;">
         <div class="container px-4 px-lg-5 my-5"
                 style="background-color: #ef9578;">
         <div class="text-center text-white">
                 <h1 class="display-4 fw-bolder">Shop in style</h1>
                 <p class="lead fw-normal text-white-50 mb-0">With this shop
                 hompeage template</p>
        </div>
       </div>
    </header>
	<!-- Section-->
	<section class="py-5">

		<div class="row">

			<div class="col-xs-12 col-sm-12">
				<h2>&nbsp;</h2>
				<h2 class="text-center">가게 수정</h2>
			</div>

			<div class="col-xs-3 col-sm-3"></div>
			<div class="col-xs-8 col-sm-8">

				<div>
					<p>&nbsp;</p>

					<form class="form-horizontal" action="./create.do"
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
									name="code" class="form-control" value="">
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
									value="">
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
		<jsp:include page="./../menu/bottom.jsp" flush='false' />
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</Body>