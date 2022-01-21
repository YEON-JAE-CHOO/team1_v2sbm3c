<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>

<c:set var="list" value="${list }" />
<c:set var="rno" value="${rno }" />
<c:set var="leastprice" value="${leastprice }" />
<c:set var="deliverytip" value="${deliverytip }" />
<c:set var="cart_sum" value="${cart_sum }" />
<c:set var="total_sum" value="${cart_sum + deliverytip}" />




<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>장바구니</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Favicon-->
<style type="text/css">
.footer {
	width: 100%;
	height: 100px;
	position: pixed;
	bottom: 0;
	background: #5eaeff;
	text-align: center;
	bottom: 0;
}

.title_line {
	text-align: left;
	border-bottom: solid 3px #555555;
	width: 90%;
	top: 50%;
	left: 50%;
	margin: 20px auto;
	font-size: 25px;
	margin: 20px auto;
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<script type="text/javascript">
	$(function() {
		$('#btn_delete_all').on('click', function() {
			$('#btn_cart_test').on('click', function() {
				delete_check(scno)
			});
		});
		//delete_all(10);
	});

	function delete_check(scno) {
		var sw = confirm('선택한 상품을 장바구니에서 지우시겠습니까?');
		if (sw == true) {
			delete_func(scno);
		}

	}

	function delete_func(scno) { // GET -> POST 전송, 상품 삭제
		var frm = $('#frm_post');
		frm.attr('action', '/shoppingcart/delete.do');
		$('#scno', frm).val(scno);

		frm.submit();
	}

	function delete_all(mid) {
		var params = "";
		params += 'mid=' + mid;

		alert("-> params: " + params);

		$
				.ajax({
					url : '/shoppingcart/cart_delete_all.do',
					type : 'post', // get, post
					cache : false, // 응답 결과 임시 저장 취소
					async : true, // true: 비동기 통신
					dataType : 'json', // 응답 형식: json, html, xml 
					data : params, // 데이터
					success : function(rdata) { // 응답이 온경우
						var str = '';
						console.log('-> delete_all cnt: ' + rdata.cnt); // 1: 쇼핑카트 등록 성공
						if (rdata.check == "success") {
							location.href = '/shoppingcart/openshoppingcart.do?mid=${sessionScope.id}';
						} else {
							alert('전체 삭제하지 못 했습니다.');
						}
					},
					// Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
					error : function(request, status, error) { // callback 함수
						console.log(error);
					}
				}); //  $.ajax END

	}
</script>
</head>
<body>


	<form name='frm_post' id='frm_post' action='' method='post'>
		<input type='hidden' name='scno' id='scno'> <input
			type='hidden' name='cnt' id='cnt'> <input type="hidden"
			name="${ _csrf.parameterName }" value="${ _csrf.token }">
	</form>

	<!-- Navigation-->
	<jsp:include page="../menu/top.jsp" flush='false' />
	<!-- Header-->
	<header class="py-4" style="background-color: #ef9578;"> </header>

	<!-- Section-->
	<section class="py-5"></section>
	<DIV class='title_line'>
		주문 결재
		<button type="button" class="btn btn-secondary" id="btn_delete_all"
			name="btn_delete_all" onclick="delete_all('${sessionScope.id }')"
			style="float: right;">장바구니 비우기</button>
		<br>
	</DIV>
	<div class="contents" style="text-align: center;">

		<table class="table table-striped"
			style='width: 60%; margin-left: auto; margin-right: auto;'>
			<colgroup>
				<%-- scno --%>
				<col style="width: 10%;"></col>
				<%-- 사진 --%>
				<col style="width: 30%;"></col>
				<%-- 이름 --%>
				<col style="width: 20%;"></col>
				<%-- 가격 --%>
				<col style="width: 10%;"></col>
				<%-- 기타 --%>
				<col style="width: 20%;"></col>
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
							<c:set var="scno" value="${Menu_Memeber_Shoppingcart_VO.scno }" />
							<c:set var="file1" value="${Menu_Memeber_Shoppingcart_VO.file1 }" />
							<c:set var="thumb" value="${Menu_Memeber_Shoppingcart_VO.thumb }" />
							<c:set var="price" value="${Menu_Memeber_Shoppingcart_VO.price }" />
							<c:set var="rdate" value="${Menu_Memeber_Shoppingcart_VO.rdate }" />


							<tr>
								<td style='vertical-align: middle; text-align: center;'>
									${scno }</td>

								<td style='vertical-align: middle; text-align: center;'><c:choose>
										<c:when
											test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
											<%-- /static/contents/storage/ --%>
											<IMG src="/team1/storage/${thumb }"
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
								<td style='vertical-align: middle; text-align: center;'><fmt:formatNumber
										value="${price }" pattern="#,###" />원 <br> <br></td>

								<td style='vertical-align: middle; text-align: center;'><A
									href="javascript: delete_check(${scno })"><IMG
										src="/storage/images/delete3.png"></A></td>
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
							<fmt:formatNumber value="${cart_sum }" pattern="#,###" />
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
							<fmt:formatNumber value="${total_sum }" pattern="#,###" />
							원
						</div>

						<form name='frm' id='frm' style='margin-top: 50px;'
							action="/order_pay/create.do" method='get'>
							<input type="hidden" name="${ _csrf.parameterName }"
								value="${ _csrf.token }">

						</form>
						<button type='submit' id='btn_order' class='btn btn-info'
							onclick="location.href='/order/openorder.do?mid=${sessionScope.id }'"
							style='font-size: 1.5em;'>주문하기</button>
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
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">
		
	</script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

</body>
</html>
