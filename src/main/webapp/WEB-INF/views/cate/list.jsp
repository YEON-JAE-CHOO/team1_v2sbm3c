<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>메뉴 등록</title>
<style type="text/css">
</style>
<!-- Favicon-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../menu/top.jsp" flush='false' />
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
		<ASIDE class="aside_right">
			<c:choose>
				<c:when test="${sessionScope.id != null}">
					<c:set var="name" value="qnaadmin" />
					<c:if test="${name eq 'qnaadmin'}">
						<A href="./create.do?">등록</A>
						<span class='menu_divide'>│</span>
						<A href="javascript:location.reload();">새로고침</A>
						<span class='menu_divide'>│</span>
						<A href="./list_update.do">수정/삭제하기</A>
						<span class='menu_divide'>│</span>
					</c:if>
				</c:when>
			</c:choose>

		</ASIDE>
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

					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<c:choose>
								<c:when
									test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif') || thumb1.endsWith('jpeg')}">
									<a href="/restaurant/list_by_cateno.do?cateno=${cateno}"><img
										class="card-img-top" height="200px" src="/main/${file1}"
										alt="..." /></a>
								</c:when>
								<c:otherwise>
									<a href="/restaurant/list_by_cateno.do?cateno=${cateno}"><img
										class="card-img-top" height="200px" src="/main/전체보기.jpg"
										alt="..." /></a>
								</c:otherwise>
							</c:choose>

							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="/restaurant/list_by_cateno.do?cateno=${cateno}"><h5
											class="fw-bolder">${name}</h5></a>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center"></div>
							</div>
						</div>
					</div>

				</c:forEach>

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
	<script src="js/scripts.js"></script>
</body>
</html>
