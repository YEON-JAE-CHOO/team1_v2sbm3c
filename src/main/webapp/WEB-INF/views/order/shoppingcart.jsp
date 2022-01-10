<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>

<c:set var="list" value="${list }" />
<c:set var="rno" value="${rno }" />
<c:set var="leastprice" value="${leastprice }" />
<c:set var="deliverytip" value="${deliverytip }" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>장바구니</title>
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

	<!-- Section-->
	<section class="py-5"></section>

	<div class="contents" style="text-align: center;">
		<h3>주문 목록</h3>

		<table class="table table-striped" style='width: 100%;'>
			<colgroup>
				<col style="width: 10%;"></col>
				<col style="width: 40%;"></col>
				<col style="width: 20%;"></col>
				<col style="width: 10%;"></col>
				<%-- 수량 --%>
				<col style="width: 10%;"></col>
				<%-- 합계 --%>
				<col style="width: 10%;"></col>
			</colgroup>
			<%-- table 컬럼 --%>

			<%-- table 내용 --%>
			<tbody>
				<c:choose>
					<c:when test="${list.size() > 0 }">
						<c:forEach var="Menu_Memeber_Shoppingcart_VO" items="${list }">
							<c:set var="rno" value="${Menu_Memeber_Shoppingcart_VO.rno }" />
							<c:set var="menuno"
								value="${Menu_Memeber_Shoppingcart_VO.menuno }" />
							<c:set var="title" value="${Menu_Memeber_Shoppingcart_VO.title }" />
							<c:set var="spiciness"
								value="${Menu_Memeber_Shoppingcart_VO.spiciness }" />
							<c:set var="file1" value="${Menu_Memeber_Shoppingcart_VO.file1 }" />
							<c:set var="thumb" value="${Menu_Memeber_Shoppingcart_VO.thumb }" />
							<c:set var="price" value="${Menu_Memeber_Shoppingcart_VO.price }" />
							<c:set var="rdate" value="${Menu_Memeber_Shoppingcart_VO.rdate }" />


							<tr>
								<td style='vertical-align: middle; text-align: center;'><c:choose>
										<c:when
											test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
											<%-- /static/contents/storage/ --%>
											<IMG src="/storage/images/${thumb }"
												style="width: 120px; height: 80px;">

										</c:when>
										<c:otherwise>
											<!-- 이미지가 아닌 일반 파일 -->
											<IMG src="/storage/images/rice.jpg"
												style="width: 120px; height: 80px;">
										</c:otherwise>
									</c:choose></td>
								<td style='vertical-align: middle;'><a
									href="/contents/read.do?contentsno=${contentsno}"><strong>${title}</strong></a>
								</td>
								<td style='vertical-align: middle; text-align: center;'><del>
										<fmt:formatNumber value="${price }" pattern="#,###" />
									</del><br>
								<br> </td>
								<td style='vertical-align: middle; text-align: center;'><input
									type='number' id='${menuno }' min='1' max='100' step='1'
									value="${menuno }" style='width: 52px;'><br>
									<button type='button' onclick="update_cnt(${cartno})"
										class='btn' style='margin-top: 5px;'>변경</button></td>
								<td style='vertical-align: middle; text-align: center;'><fmt:formatNumber
										value="${tot}" pattern="#,###" /></td>
								<td style='vertical-align: middle; text-align: center;'><A
									href="javascript: delete_func(${cartno })"><IMG
										src="/storage/images/rice.jpg"></A></td>
							</tr>
						</c:forEach>

					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6" style="text-align: center; font-size: 1.3em;">쇼핑
								카트에 상품이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>


			</tbody>
		</table>


		<table class="table table-striped"
			style='margin-top: 50px; margin-bottom: 50px; width: 100%;'>
			<tbody>
				<tr>
					<td style='width: 50%;'><br>
						<div class='cart_label'>상품 금액</div>
						<div class='cart_price'>
							<fmt:formatNumber value="" pattern="#,###" />
							원
						</div> <br>
						<div class='cart_label'>배송비</div>
						<div class='cart_price'>
							<fmt:formatNumber value="${deliverytip }" pattern="#,###" />
							원
						</div></td>
					<td style='width: 50%;'>
						<div class='cart_label' style='font-size: 2.0em;'>전체 주문 금액</div>
						<div class='cart_price' style='font-size: 2.0em; color: #FF0000;'>
							<fmt:formatNumber value="" pattern="#,###" />
							원
						</div>

						<form name='frm' id='frm' style='margin-top: 50px;'
							action="/order_pay/create.do" method='get'>
							<input type="hidden" name="${ _csrf.parameterName }"
								value="${ _csrf.token }">
							<button type='submit' id='btn_order' class='btn btn-info'
								style='font-size: 1.5em;'>주문하기</button>
						</form>
					<td>
				</tr>
			</tbody>
		</table>
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
