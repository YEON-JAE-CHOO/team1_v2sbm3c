<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>

<c:set var="restaurantVO" value="${restaurantVO }" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>가게 수정</title>
<!-- Favicon-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script type="text/javascript">
	$(function() { // 자동 실행
		$('#btn_DaumPostcode').on('click', DaumPostcode); // 다음 우편 번호
	});
</script>
<style>
#center_a {
	border: 1px solid;
	width: 50%;
	text-align: center;
}
</style>
</head>

<Body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<jsp:include page="./../menu/top.jsp" flush='false' />
	</nav>
	<!-- Header-->
	<header class="py-4" style="background-color: #ef9578;">
		<div class="container px-4 px-lg-5 my-5"
			style="background-color: #ef9578;">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">Shop in style</h1>
				<p class="lead fw-normal text-white-50 mb-0">With this shop
					hompeage template</p>
			</div>
		</div>
	</header>
	<!-- Section-->
	<section class="py-5">
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

		<div class="row">

			<div class="col-xs-12 col-sm-12">
				<h2>&nbsp;</h2>
				<h2 class="text-center">가게 수정</h2>
			</div>

			<div class="col-xs-3 col-sm-3"></div>
			<div class="col-xs-8 col-sm-8">

				<div>
					<p>&nbsp;</p>

					<form class="form-horizontal" action="./update.do" method="post">
						<div class="form-group">

							<div class="col-sm-2 control-label">
								<label for="id">가게 이름</label>
							</div>
							<div class="col-sm-6 text-left">
								<input type="text" class="form-control" name="name" id="name"
									value="${restaurantVO.name}">
							</div>
						</div>


						<div class="form-group">
							<div class="col-sm-2 control-label">
								<label id="text">가게 소개</label>
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="explanation"
									id="explanation" value="${restaurantVO.explanation}">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-2 control-label">
								<label id="name">최소 주문 금액</label>
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="leastprice"
									id="leastprice" value="${restaurantVO.leastprice}">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-2 control-label">
								<label id="email">가게 연락처</label>
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="call" id="call"
									placeholder="ex) 010-0000-0000" value="${restaurantVO.call}">
							</div>
						</div>

						<div class="form-group">
							<label for="code" class="col-md-2 control-label"
								style='font-size: 0.9em;'>우편번호</label>
							<div class="col-md-10">
								<input type='text' class="form-control" name='code' id='code'
									value="${restaurantVO.code}" style='width: 30%;'
									placeholder="우편번호">
								<button type="button" id="btn_DaumPostcode"
									class="btn btn-info btn-md">우편번호 찾기</button>
							</div>
						</div>

						<div class="form-group">
							<label for="address1" class="col-md-2 control-label"
								style='font-size: 0.9em;'>주소</label>
							<div class="col-md-10">
								<input type='text' class="form-control" name='address1'
									id='address1' value='${restaurantVO.address1}'
									style='width: 80%;' placeholder="주소">
							</div>
						</div>

						<div class="form-group">
							<label for="address2" class="col-md-2 control-label"
								style='font-size: 0.9em;'>상세 주소</label>
							<div class="col-md-10">
								<input type='text' class="form-control" name='address2'
									id='address2' value='${restaurantVO.address2}'
									style='width: 80%;' placeholder="상세 주소">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">

								<!-- ------------------------------ DAUM 우편번호 API 시작 ------------------------------ -->
								<div id="wrap"
									style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 110px; position: relative">
									<img
										src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
										id="btnFoldWrap"
										style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
										onclick="foldDaumPostcode()" alt="접기 버튼">
								</div>

								<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
								<script>
									// 우편번호 찾기 화면을 넣을 element
									var element_wrap = document
											.getElementById('wrap');

									function foldDaumPostcode() {
										// iframe을 넣은 element를 안보이게 한다.
										element_wrap.style.display = 'none';
									}

									function DaumPostcode() {
										// 현재 scroll 위치를 저장해놓는다.
										var currentScroll = Math
												.max(
														document.body.scrollTop,
														document.documentElement.scrollTop);
										new daum.Postcode(
												{
													oncomplete : function(data) {
														// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

														// 각 주소의 노출 규칙에 따라 주소를 조합한다.
														// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
														var fullAddr = data.address; // 최종 주소 변수
														var extraAddr = ''; // 조합형 주소 변수

														// 기본 주소가 도로명 타입일때 조합한다.
														if (data.addressType === 'R') {
															//법정동명이 있을 경우 추가한다.
															if (data.bname !== '') {
																extraAddr += data.bname;
															}
															// 건물명이 있을 경우 추가한다.
															if (data.buildingName !== '') {
																extraAddr += (extraAddr !== '' ? ', '
																		+ data.buildingName
																		: data.buildingName);
															}
															// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
															fullAddr += (extraAddr !== '' ? ' ('
																	+ extraAddr
																	+ ')'
																	: '');
														}

														// 우편번호와 주소 정보를 해당 필드에 넣는다.
														$('#code').val(
																data.zonecode); // 5자리 새우편번호 사용 ★
														$('#address1').val(
																fullAddr); // 주소 ★

														// iframe을 넣은 element를 안보이게 한다.
														// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
														element_wrap.style.display = 'none';

														// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
														document.body.scrollTop = currentScroll;

														$('#address2').focus();
													},
													// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
													onresize : function(size) {
														element_wrap.style.height = size.height
																+ 'px';
													},
													width : '100%',
													height : '100%'
												}).embed(element_wrap);

										// iframe을 넣은 element를 보이게 한다.
										element_wrap.style.display = 'block';
									}
								</script>
								<!-- ------------------------------ DAUM 우편번호 API 종료 ------------------------------ -->

							</div>
						</div>
						<input type="hidden" name="rno" id="rno"
							value="${restaurantVO.rno }"> <input type="hidden"
							value="${GetIpAddress.getIp()}">
						<div class="form-group">
							<div class="col-sm-12 text-center">
								<input type="submit" value="수정하기" class="btn btn-success">
								<input type="reset" value="취소" class="btn btn-warning">
							</div>
						</div>


					</form>
				</div>
			</div>

		</div>

	</section>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<jsp:include page="./../menu/bottom.jsp" flush='false' />
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</Body>
</html>