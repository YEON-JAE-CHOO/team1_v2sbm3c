<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>


<c:set var="ol" value="${ol }" />
<c:set var="ordersvo" value="${ordersvo }" />
<c:set var="totalprice" value="${ordersvo.totalprice }" />
<c:set var="product_price" value="${ordersvo.price }" />
<c:set var="leastprice" value="${leastprice }" />
<c:set var="deliverytip" value="${deliverytip }" />
<c:set var="method" value="${ordersvo.method }" />


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>주문 확인</title>
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
		 //페이지 열리는 동시에 주문 접수 상태 표시
			check_request(${ordersvo.ono})
	});

	function check_request(ono) {

		var params = "";
		params += 'ono=' + ono;

		$.ajax({
			url : '/order/check_request.do',
			type : 'post', // get, post
			cache : false, // 응답 결과 임시 저장 취소
			async : true, // true: 비동기 통신
			dataType : 'json', // 응답 형식: json, html, xml 
			data : params, // 데이터
			success : function(rdata) { // 응답이 온경우
				var str = rdata.msg;
				alert("state= " + rdata.state + "    str= " + str);
				$('#order_state').html(str);
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
	<%-- 전체 주문 금액 --%>

	<!-- Navigation-->
	<jsp:include page="../menu/top.jsp" flush='false' />
	<!-- Header-->
	<header class="py-4" style="background-color: #ef9578;"> </header>

	<!-- Section-->
	<section class="py-5"></section>
	<div class="content_body">
		<DIV class='title_line'>주문 내역 확인</DIV>
		<br>
		<DIV class='title_line' style="width: 60%">주문상태</DIV>
		<DIV
			style="width: 60%; background-color: #ef9578; text-align: center; margin-left: auto; margin-right: auto;">
			<h3 id="order_state">처리중입니다</h3>
		</DIV>

		<br>
		<DIV class='title_line' style="width: 60%">주문 상품</DIV>

		<TABLE class='table table-striped'
			style='width: 60%; margin-left: auto; margin-right: auto;'>
			<colgroup>
				<col style='width: 40%;' />
				<col style='width: 15%;' />
				<col style='width: 15%;' />
				<col style='width: 15%;' />
				<col style='width: 15%;' />

			</colgroup>

			<thead>
				<TR>
					<th class="th_bs">음식</th>
					<th class="th_bs">이름</th>
					<TH class="th_bs">가격</TH>
					<th class="th_bs">매움 정도</th>
					<TH class="th_bs">설명</TH>

				</TR>
			</thead>
			<tbody>
				<c:forEach var="ol" items="${ol }">
					<tr>
						<c:set var="title" value="${ol.title }" />
						<c:set var="price" value="${ol.price }" />
						<c:set var="spiciness" value="${ol.spiciness }" />
						<c:set var="thumb" value="${ol.thumb }" />
						<c:set var="explanation" value="${ol.explanation }" />
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
						<TD class="td_bs">${title }</TD>
						<TD class="td_bs">${price }</TD>
						<TD class="td_bs">${spiciness }</TD>
						<TD class="td_bs">${explanation }</TD>
					</TR>
					</A>
				</c:forEach>
			</tbody>


		</TABLE>

		<br>
		<DIV class='title_line' style="width: 60%">주문자 정보</DIV>
		<DIV class="content_body"
			style="width: 60%; margin-left: auto; margin-right: auto;">
			<div>
				<label for="name" class="col-md-2 control-label"
					style='font-size: 0.9em;'>수취인 성명</label>
				<p type='text' class="form-control" name="oname" style='width: 30%;'>${ordersvo.oname }</p>
			</div>
			<div>
				<label for="name" class="col-md-2 control-label"
					style='font-size: 0.9em;'>수취인 전호번호</label>
				<p type='text' class="form-control" name="oname" style='width: 30%;'>${ordersvo.phone }</p>
			</div>
			<div>
				<label for="name" class="col-md-2 control-label"
					style='font-size: 0.9em;'>수취인 주소</label>
				<p type='text' class="form-control" name="oname" style='width: 30%;'>${ordersvo.housecode }</p>
				<br>
				<p type='text' class="form-control" name="oname" style='width: 30%;'>${ordersvo.address1 }</p>
				<br>
				<p type='text' class="form-control" name="oname" style='width: 30%;'>${ordersvo.address2 }</p>
			</div>

		</DIV>



		<table class="table table-striped"
			style='margin-top: 40px; margin-bottom: 50px; text-align: center; width: 60%; margin-left: auto; margin-right: auto;'>
			<tbody>
				<tr>
					<td style='width: 50%;'><br>
						<div class='cart_label'>상품 금액</div>
						<div class='cart_price'>
							<fmt:formatNumber value="${product_price }" pattern="#,###" />
							원
						</div>
						<div class='cart_label'>배송비</div>
						<div class='cart_price'>
							<fmt:formatNumber value="${deliverytip }" pattern="#,###" />
							원
						</div>
						<div class='cart_label'>최소 주문 비용</div>
						<div class='cart_price'>
							<fmt:formatNumber value="${leastprice }" pattern="#,###" />
							원<br>
						</div></td>
					<td style='width: 50%;'>
						<div class='cart_label' style='font-size: 2.0em;'>전체 주문 금액</div>
						<div class='cart_price' style='font-size: 2.0em; color: #FF0000;'>
							<fmt:formatNumber value="${totalprice }" pattern="#,###" />
							원
						</div>
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
