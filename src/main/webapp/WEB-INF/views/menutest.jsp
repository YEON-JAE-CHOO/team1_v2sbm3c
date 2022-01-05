<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="list" value="${list }" />
<c:set var="rno" value="${rno }" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>메뉴 등록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<script type="text/javascript">

	$(function() {
		$('#add_shoppingcart').on('click', function() {cart_ajax_add(rno,menuno)});
	});
		
    
    
<%-- 장바구니 추가 모달 --%>
	


	function cart_ajax_add(rno,menuno){
		var mno = 10;
		
		var params = "";
		params += 'rno=' + rno;
		params += '&menuno=' + menuno;

		<%-- alert("-> params: " + params); --%>

		// return;

		$.ajax({
			url : '/shoppingcart/add.do',
			type : 'post', // get, post
			cache : false, // 응답 결과 임시 저장 취소
			async : true, // true: 비동기 통신
			dataType : 'json', // 응답 형식: json, html, xml 
			data : params, // 데이터
			success : function(rdata) { // 응답이 온경우
				var str = '';
				console.log('-> cart_ajax_add cnt: ' + rdata.cnt); // 1: 쇼핑카트 등록 성공
				if (rdata.cnt == 1) {
					var sw = confirm('선택한 상품이 장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?');
					if (sw == true) {
						// 쇼핑카트로 이동
						// location.href='/cart/list.do';
					}
				} else {
					alert('선택한 상품을 장바구니에 담지못했습니다.<br>잠시후 다시 시도해주세요.');
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
	<!-- Navigation-->
	<jsp:include page="./menu/top.jsp" flush='false' />
	<!-- Header-->
	<header class="py-4" style="background-color: #ef9578;"> </header>

	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." />
				</div>
				<div class="col-md-6">
					<div class="small mb-1">SKU: BST-498</div>
					<h1 class="display-5 fw-bolder">가게 이름</h1>
					<div class="fs-5 mb-5">
						<span class="text-decoration-line-through">$45.00</span> <span>$40.00</span>
					</div>
					<p class="lead">Lorem ipsum dolor sit amet consectetur
						adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi
						consequatur obcaecati excepturi alias magni, accusamus eius
						blanditiis delectus ipsam minima ea iste laborum vero?</p>
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
					<col style="width: 10%;" />
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
							href="/menu/update.do?menuno=${menuno }&rno=${rno }" title="수정"><span
								class="glyphicon glyphicon-pencil"></span>수정</A> <A
							href="/menu/delete.do?menuno=${menuno }&rno=${rno }" title="삭제"><span
								class="glyphicon glyphicon-trash"></span>삭제</A>


							<button class="btn btn-outline-dark" type="button"
								id="add_shoppingcart" name="add_shoppingcart"
								onclick="cart_ajax_add(${rno },${menuno })">장바구니</button></TD>
						</TR>
					</c:forEach>
				</tbody>


			</TABLE>
		</div>

		<!-- ******************** Modal 알림창 시작 ******************** -->
		<div id="modal_panel" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">×</button>
						<h4 class="modal-title" id='modal_title'></h4>
						<!-- 제목 -->
					</div>
					<div class="modal-body">
						<p id='modal_content'></p>
						<!-- 내용 -->
					</div>
					<div class="modal-footer">
						<button type="button" id="btn_close" data-focus=""
							class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- ******************** Modal 알림창 종료 ******************** -->
	</div>
	<!-- Footer-->
	<footer class="py-5 bg-dark footer">
		<jsp:include page="./menu/bottom.jsp" flush='false' />
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
