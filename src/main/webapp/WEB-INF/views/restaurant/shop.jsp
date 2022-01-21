<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>

<c:set var="list" value="${list }" />
<c:set var="rno" value="${rno }" />
<c:set var="restaurantVO" value="${restaurantVO }" />

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
	<jsp:include page="../menu/top.jsp" flush='false' />
	<!-- Header-->
	<header class="py-4" style="background-color: #ef9578;"> </header>

	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-4">
					<img class="card-img-top mb-5 mb-md-0"
						src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." />
				</div>
				<div class="col-md-6">
					<div class="small mb-1">${restaurantVO.type}</div>
					<h1 class="display-5 fw-bolder">${restaurantVO.name}</h1>
					<div class="fs-5 mb-2">
						<span class="text-decoration-line-through">배달 팁 - </span> <span>${restaurantVO.deliverytip} 원</span>
					</div>
					<div class="fs-5 mb-2">
						<span class="text-decoration-line-through">최소 주문 금액 - </span> <span>${restaurantVO.leastprice} 원</span>
					</div>
					<div class="fs-5 mb-2">
						<span class="text-decoration-line-through">가게 번호 - </span> <span>${restaurantVO.call}</span>
					</div>
                    

					<p class="fs-5 mb-5">주소 - ${restaurantVO.address1}
						${restaurantVO.address2}</p>
                       
                       <div class="fs-5 mb-2">
                       <a class="text-decoration-line-through" href='../review/list_rno_asc.do?rno=${restaurantVO.rno }'>리뷰 보러 가기</a>
                    </div>
                        
					<p class="lead">${restaurantVO.explanation}</p>
					<div class="d-flex">
						<input class="form-control text-center me-3" id="inputQuantity"
							type="num" value="1" style="max-width: 3rem" />
						<button class="btn btn-outline-dark flex-shrink-0" type="button">
							<i class="bi-cart-fill me-1"></i> Add to cart
						</button>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div style="text-align: center;">
		<h3>메뉴 추가하기</h3>
		<DIV>
			<button type="button" class="btn btn-light"
				onclick="location.href='/restaurant/openaddmenupage.do?rno=${rno }'">메뉴
				추가하기</button>
		</DIV>

		<div style="align-content: right:;">

			<TABLE class='table table-striped'
				style="text-align: center; vertical-align: middle; width: 100%;">
				<colgroup>
					<col style='width: 5%;' />
					<col style='width: 5%;' />
					<col style='width: 10%;' />
					<col style='width: 15%;' />
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
						<TH class="th_bs">가격</TH>
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
						<c:set var="price" value="${menuVO.price }" />
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
						<TD class="td_bs">${price }</TD>
						<TD class="td_bs">${spiciness }</TD>
						<TD class="td_bs">${explanation }</TD>
						<TD class="td_bs"><A
							href="./read_update.do?cateno=${categrpno }" title="수정"><span
								class="glyphicon glyphicon-pencil"></span>수정</A> <A
							href="./menu/delete.do?menuno=${menuno }" title="삭제"><span
								class="glyphicon glyphicon-trash"></span>삭제</A>
							<button class="btn btn-outline-dark" type="submit"
								id="addshoppingcart" name="addshoppingcart">
								<i class="bi-cart-fill me-1"></i> 추가 <span
									class="badge bg-dark text-white ms-1 rounded-pill"></span>
							</button></TD>
						</TR>
					</c:forEach>
				</tbody>


			</TABLE>
		</div>
	</div>
	<!-- Footer-->
	<footer class="py-5 bg-dark footer">
		<jsp:include page="../menu/bottom.jsp" flush='false' />
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>

</html>