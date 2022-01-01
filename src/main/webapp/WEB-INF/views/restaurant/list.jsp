<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>

<c:set var="list" value="${list }" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>메뉴 등록</title>
<!-- Favicon-->
<style type="text/css">
.footer {
	width: 100%;
	height: 100px;
	position: relative;
	bottom: 0;
	background: #5eaeff;
	text-align: center;
	bottom: 0;
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>
	<!-- Navigation-->
	<jsp:include page="./menu/top.jsp" flush='false' />
	<!-- Header-->
	<header class="py-4" style="background-color: #ef9578;"> </header>

	<!-- Section-->
	<section class="py-5"></section>

	<div style="text-align: center;">
		<h3>식당 리스트</h3>

		<div style="align-content: right:;">

			<TABLE class='table table-striped'
				style="text-align: center; vertical-align: middle;">
				<colgroup>
					<col style='width: 5%;' />
					<col style='width: 5%;' />
					<col style='width: 10%;' />
					<col style='width: 15%;' />
					<col style='width: 15%;' />
					<col style="width: 15%;" />
					<col style='width: 15%;' />
					<col style='width: 20%;' />
				</colgroup>

				<thead>
					<TR>
						<th class="th_bs">가게 이름</th>
						<th class="th_bs">사진</th>
						<TH class="th_bs">음식 종류</TH>
						<TH class="th_bs">가게 주소</TH>
						<TH class="th_bs">가게 설명</TH>
						<TH class="th_bs">최소 주문 금액</TH>
					</TR>
				</thead>
				<tbody>
					<c:forEach var="restaurantVO" items="${list }">
						<c:set var="name" value="${restaurantVO.name }" />
						<c:set var="type" value="${restaurantVO.type }" />
						<c:set var="address1" value="${restaurantVO.address1 }" />
						<c:set var="explanation" value="${restaurantVO.explanation }" />
						<c:set var="leastprice" value="${restaurantVO.leastprice }" />

						<TD class="td_bs"><a
							href="/stadium/stadium_read.do?s_no=${rno }">${rno }</a></TD>
						<TD class="td_bs">${menuno }</TD>
						<TD class="td_bs">${menutype }</TD>
						<TD class="td_bs">${title }</TD>
						<TD style='vertical-align: middle; text-align: center;'><c:choose>
								<c:when
									test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
									<IMG src="/storage/images/${thumb }"
										style="width: 120px; height: 80px;">
									</a>
								</c:when>
								<c:otherwise>
									<!-- 기본 이미지 출력 -->
									<IMG src="/storage/images/rice.jpg"
										style="width: 120px; height: 80px;">
								</c:otherwise>
							</c:choose></TD>
						<TD class="td_bs">${spiciness }</TD>
						<TD class="td_bs">${explanation }</TD>
						<TD class="td_bs"><A
							href="./read_update.do?cateno=${categrpno }" title="수정"><span
								class="glyphicon glyphicon-pencil"></span>수정</A> <A
							href="./menu/delete.do?menuno=${menuno }" title="삭제"><span
								class="glyphicon glyphicon-trash"></span>삭제</A></TD>
						</TR>
					</c:forEach>
				</tbody>


			</TABLE>
		</div>
	</div>
	<!-- Footer-->
	<footer class="py-5 bg-dark footer">
		<jsp:include page="./menu/bottom.jsp" flush='false' />
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
