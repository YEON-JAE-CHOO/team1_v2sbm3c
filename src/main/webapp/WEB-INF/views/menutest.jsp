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
	position: absolute;
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
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<jsp:include page="./menu/top.jsp" flush='false' />
	</nav>
	<!-- Header-->
	<header class="py-4" style="background-color: #ef9578;"> </header>
	<!-- Section-->
	<section class="py-5"></section>

	<div style="text-align: center;">
		<h3>메뉴 추가하기</h3>
		<DIV>
			<button type="button" class="btn btn-light"
				onclick="location.href='/restaurant/openaddmenupage.do?rno=${12 }'">메뉴
				추가하기</button>
		</DIV>

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
						<th class="th_bs">식당번호</th>
						<th class="th_bs">메뉴번호</th>
						<TH class="th_bs">음식 종류</TH>
						<TH class="th_bs">음식</TH>
						<TH class="th_bs">사진</TH>
						<TH class="th_bs">매움 정도</TH>
						<TH class="th_bs">음식 설명</TH>
						<TH class="th_bs">기타</TH>
					</TR>
				</thead>
				<tbody>
					<c:forEach var="menuVO" items="${list }">
						<c:set var="rno" value="${menuVO.rno }" />
						<c:set var="menuno" value="${menuVO.menuno }" />
						<c:set var="menutype" value="${menuVO.menutype }" />
						<c:set var="title" value="${menuVO.title }" />
						<c:set var="thumb" value="${menuVO.file1saved }" />
						<c:set var="spiciness" value="${menuVO.spiciness }" />
						<c:set var="explanation" value="${menuVO.explanation }" />

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
