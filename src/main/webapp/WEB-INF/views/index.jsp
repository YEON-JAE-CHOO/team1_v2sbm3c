<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>배달통</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="./menu/top.jsp" flush='false' />
	<!-- Header-->
	<header class="py-4" style="background-color: #ef9578;">
		<div class="container px-4 px-lg-5 my-5"
			style="background-color: #ef9578;">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">배달통</h1>
				<p class="lead fw-normal text-white-50 mb-0">배달통에 오신것을 환영합니다.</p>
			</div>
		</div>
	</header>
	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach var="cateVO" items="${list }" varStatus="status">
					<c:set var="cateno" value="${cateVO.cateno }" />
					<c:set var="name" value="${cateVO.name }" />
					<c:set var="seq" value="${cateVO.seq }" />
					<c:set var="thumb1" value="${cateVO.thumb1 }" />
					<c:set var="file1" value="${cateVO.file1 }" />
					<c:set var="size1" value="${cateVO.size1 }" />

					<div class="col mb-5"><a href="./restaurant/cate_list.do?cateno=${cateno}">
					
						<div class="card h-100">
							<!-- Product image-->
							<c:choose>
								<c:when
									test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
									<img class="card-img-top" src="/cate/storage/${file1}"
										alt="..." />
								</c:when>
								<c:otherwise>
									<img class="card-img-top" src="/main/전체보기.jpg" alt="..." />
								</c:otherwise>
							</c:choose>

							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${name}</h5>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center"></div>
							</div>
						</div>
						</a>
					</div>

				</c:forEach>

			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<jsp:include page="./menu/bottom.jsp" flush='false' />
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
