<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>


<c:set var="list" value="${list }" />
<c:set var="restaurantVO" value="${restaurantVO }" />
<c:set var="thumb" value="${restaurantVO.thumb }" />

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

	});
	function ajax_receipt(ono) {
	    var params = "";
	    params += 'ono=' + ono;
	    $.ajax({
	        url : '/order/ajax_receipt.do',
	        type : 'post', // get, post
	        cache : false, // 응답 결과 임시 저장 취소
	        async : true, // true: 비동기 통신
	        dataType : 'json', // 응답 형식: json, html, xml 
	        data : params, // 데이터
	        success : function(rdata) { // 응답이 온경우
	           var str = '';
	           if(rdata.cnt >= 1){
	   			alert('주문을 접수하였습니다.');
	           }else{
	   			alert('주문 접수를 실패하였습니다.');
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
	<%-- 전체 주문 금액 --%>

	<!-- Navigation-->
	<jsp:include page="../menu/top.jsp" flush='false' />
	<!-- Header-->
	<header class="py-4" style="background-color: #ef9578;"> </header>

	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-4">
					<c:choose>
						<c:when
							test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
							<IMG src="/team1/storage/${thumb }"
								class="card-img-top mb-5 mb-md-0"">

						</c:when>
						<c:otherwise>
							<!-- 기본 이미지 출력 -->
							<IMG src="/storage/images/rice.jpg"
								style="width: 300px; height: 200px;">
						</c:otherwise>
					</c:choose>

				</div>
				<div class="col-md-4">
					<div class="small mb-1">${restaurantVO.type}</div>
					<h1 class="display-5 fw-bolder">${restaurantVO.name}</h1>
					<div class="fs-5 mb-2">
						<span class="text-decoration-line-through">배달 팁 - </span> <span>${restaurantVO.deliverytip}
							원</span>
					</div>
					<div class="fs-5 mb-2">
						<span class="text-decoration-line-through">최소 주문 금액 - </span> <span>${restaurantVO.leastprice}
							원</span>
					</div>
					<div class="fs-5 mb-2">
						<span class="text-decoration-line-through">가게 번호 - </span> <span>${restaurantVO.call}</span>
					</div>

					<p class="fs-5 mb-5">주소 - ${restaurantVO.address1}
						${restaurantVO.address2}</p>
					<p class="lead">${restaurantVO.explanation}</p>

				</div>
				<div class="col-md-4" id="map"
					style='width: 640px; height: 380px; margin: 0px auto;'></div>
			</div>
		</div>
		<DIV class='title_line' style="width: 60%">주문 상품</DIV>
		<TABLE class='table table-striped'
			style='width: 60%; margin-left: auto; margin-right: auto; text-align: center; vertical-align: middle;'>
			<colgroup>
				<col style='width: 15%;' />
				<col style='width: 3%;' />
				<col style='width: 3%;' />
				<col style='width: 5%;' />
				<col style='width: 9%;' />
				<col style='width: 15%;' />
				<col style='width: 20%;' />
				<col style='width: 10%;' />
				<col style='width: 20%;' />
			</colgroup>
			<thead>
				<TR>
					<th class="th_bs">주문일</th>
					<th class="th_bs">주문 번호</th>
					<th class="th_bs">고객명</th>
					<TH class="th_bs">고객 번호</TH>
					<TH class="th_bs">금액</TH>
					<TH class="th_bs">요청사항</TH>
					<TH class="th_bs">주소</TH>
					<TH class="th_bs">요청 상태</TH>
					<TH class="th_bs">기타</TH>
				</TR>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list }">
					<tr>
						<c:set var="rdate" value="${list.rdate }" />
						<c:set var="address1" value="${list.address1 }" />
						<c:set var="address2" value="${list.address2 }" />
						<c:set var="totalprice" value="${list.totalprice }" />
						<c:set var="ono" value="${list.ono }" />
						<c:set var="oname" value="${list.oname }" />
						<c:set var="phone" value="${list.phone }" />
						<c:set var="request" value="${list.request }" />
						<c:set var="state" value="${list.state }" />
						<c:set var="rno" value="${list.rno }" />

						<TD class="td_bs">${rdate }</TD>
						<TD class="td_bs">${rno }</TD>
						<TD class="td_bs">${oname }</TD>
						<TD class="td_bs">${phone }</TD>
						<TD class="td_bs"><fmt:formatNumber value="${totalprice }"
								pattern="#,###" /> 원</TD>
						<TD class="td_bs">${request }</TD>
						<TD class="td_bs">${address1 }${address1 }</TD>
						<TD class="td_bs" id="state_img_${ono }"><c:choose>
								<c:when test="${state == 0}">
									<IMG id="state" src="/team1/storage/close.png"
										style='width: 18px;'>
								</c:when>
								<c:otherwise>
									<IMG id="state" src="/team1/storage/open.png"
										style='width: 18px;'>
								</c:otherwise>
							</c:choose></TD>
						<TD class="td_bs">
							<button class="btn btn-outline-dark" type="button"
								id="btn_receipt" name="ajax_receipt"
								onclick="ajax_receipt(${ono })">접수</button>
						</TD>
						</TD>
					</TR>
					</A>
				</c:forEach>
			</tbody>
		</TABLE>




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
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=36e8c607903bf248b39eabfa9d81368a&libraries=services"></script>
		<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				// 주소로 좌표를 검색합니다
				geocoder
						.addressSearch(
								'${restaurantVO.address1	}',
								function(result, status) {

									// 정상적으로 검색이 완료됐으면 
									if (status === kakao.maps.services.Status.OK) {

										var coords = new kakao.maps.LatLng(
												result[0].y, result[0].x);

										// 결과값으로 받은 위치를 마커로 표시합니다
										var marker = new kakao.maps.Marker({
											map : map,
											position : coords
										});

										// 인포윈도우로 장소에 대한 설명을 표시합니다
										var infowindow = new kakao.maps.InfoWindow(
												{
													content : '<div style="width:150px;text-align:center;padding:6px 0;">${restaurantVO.name}</div>'
												});
										infowindow.open(map, marker);

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);
									}
								});
			</script>
</body>
</html>
