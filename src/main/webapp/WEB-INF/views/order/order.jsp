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
	//$(function() {
	//$('#btn_DaumPostcode').on('click', DaumPostcode); // 다음 우편 번호
	//$('#btn_order').on('click', send); // 다음 우편 번호
	//$('#btn_bringaddress').on('click', function() {ajax_address(mid)});
	//});

	$(function() {
		$('#btn_bringaddress').on('click', function() {
			ajax_address(mid)
		});
		$('#btn_order').on('click', send); // 다음 우편 번호

	});

	function ajax_address(mid) {
		var params = "";
		params += 'mid=' + mid;

		$.ajax({
			url : '/order/members_address.do',
			type : 'post', // get, post
			cache : false, // 응답 결과 임시 저장 취소
			async : true, // true: 비동기 통신
			dataType : 'json', // 응답 형식: json, html, xml 
			data : params, // 데이터
			success : function(rdata) { // 응답이 온경우
				var str = '';
				console.log('-> delete_all cnt: ' + rdata.cnt);
				if (rdata.membersvo != null) {
					$('#oname').val(rdata.mname);
					$('#phone').val(rdata.mphone);
					$('#housecode').val(rdata.mhousecode);
					$('#address1').val(rdata.maddress1);
					$('#address2').val(rdata.maddress2);
				} else {
					alert('test');
				}
			},
			// Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
			error : function(request, status, error) { // callback 함수
				console.log(error);
			}
		}); //  $.ajax END

	}

	function check_null(str) {
		var sw = false;
		if (str == "" || str.trim().length == 0 || str == null
				|| str == undefined || typeof str == "object") {
			sw = true; // 값이 없는 경우  
		}
		return sw;
	}

	function send() {
		if (check_null($('#oname').val())) {
			alert('수취인 성명을 입력해주세요.');
			$('#oname').focus();
			return;
		}

		if (check_null($('#phone').val())) {
			alert('수취인 전화번호를 입력해주세요.');
			$('#phone').focus();
			return;
		}

		if (check_null($('#housecode').val())) {
			alert('우편번호를 입력해주세요.');
			$('#housecode').focus();
			return;
		}

		if (check_null($('#address1').val())) {
			alert('주소를 입력해주세요.');
			$('#address1').focus();
			return;
		}

		if (check_null($('#address2').val())) {
			alert('상세 주소를 입력해주세요. 내용이 없으면 수취인 성명을 입력주세요.');
			$('#address2').focus();
			return;
		}

		frm_post.submit();
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
	<DIV class='title_line'>주문 결제</DIV>

	<form name='frm_post' id='frm_post' style='margin-top: 50px;'
		action="/order/create.do" method='post'>
		<input type="hidden" name="${ _csrf.parameterName }"
			value="${ _csrf.token }"> <input type="hidden" name="amount"
			value="test">

		<div class="content_body">
			<DIV class='title_line' style="width: 80%">주문 상품</DIV>

			<table class="table table-striped"
				style='width: 80%; margin-left: auto; margin-right: auto;'>
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
								<c:set var="title"
									value="${Menu_Memeber_Shoppingcart_VO.title }" />
								<c:set var="spiciness"
									value="${Menu_Memeber_Shoppingcart_VO.spiciness }" />
								<c:set var="scno" value="${Menu_Memeber_Shoppingcart_VO.scno }" />
								<c:set var="file1"
									value="${Menu_Memeber_Shoppingcart_VO.file1 }" />
								<c:set var="thumb"
									value="${Menu_Memeber_Shoppingcart_VO.thumb }" />
								<c:set var="price"
									value="${Menu_Memeber_Shoppingcart_VO.price }" />
								<c:set var="rdate"
									value="${Menu_Memeber_Shoppingcart_VO.rdate }" />


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

			<br> <BR> <input type="hidden"
				class="form-control onlyAlphabetAndNumber" value=${mno } id="mno"
				data-rule-required="true" name="mno" maxlength="15"> <input
				type="hidden" class="form-control onlyAlphabetAndNumber"
				value=${rno } id="rno" data-rule-required="true" name="rno"
				maxlength="15"> <input type="hidden"
				class="form-control onlyAlphabetAndNumber" value=${cart_sum }
				id=price data-rule-required="true" name="price" maxlength="15"><input
				type="hidden" class="form-control onlyAlphabetAndNumber"
				value=${total_sum } id='totalprice' data-rule-required="true"
				name="totalprice" maxlength="15"> <input type="hidden"
				class="form-control onlyAlphabetAndNumber"
				value="${sessionScope.id }" id="mid" data-rule-required="true"
				name="mid" maxlength="15">

			<DIV class='title_line' style="width: 80%">
				배송 정보(필수입력)
				<button type="button" class="btn btn-secondary"
					id="btn_bringaddress" name="btn_bringaddress"
					onclick="ajax_address('${sessionScope.id }')">내 정보 가져오기</button>
			</DIV>

			<DIV class="content_body"
				style="width: 80%; margin-left: auto; margin-right: auto;">

				<div class="form-group">
					<label for="name" class="col-md-2 control-label"
						style='font-size: 0.9em;'>수취인 성명</label>
					<div class="col-md-10">
						<input type='text' class="form-control" name='oname' id='oname'
							value='' required="required" style='width: 30%;'
							placeholder="수취인 성명">
					</div>
				</div>

				<div class="form-group">
					<label for="orderer_phone" class="col-md-2 control-label"
						style='font-size: 0.9em;'>수취인 전화번호</label>
					<div class="col-md-10">
						<input type='text' class="form-control" name='phone' id='phone'
							value='' required="required" style='width: 30%;'
							placeholder="전화번호">예) 010-0000-0000
					</div>
				</div>

				<div class="form-group">
					<label for="orderer_housecode" class="col-md-2 control-label"
						style='font-size: 0.9em;'>우편번호</label>
					<div class="col-md-10">
						<input type='text' class="form-control" name='housecode'
							id='housecode' value='' style='width: 30%;' placeholder="우편번호">
						<button type="button" id="btn_DaumPostcode"
							class="btn btn-info btn-md">우편번호 찾기</button>
					</div>
				</div>

				<div class="form-group">
					<label for="orderer_address1" class="col-md-2 control-label"
						style='font-size: 0.9em;'>배달 주소</label>
					<div class="col-md-10">
						<input type='text' class="form-control" name='address1'
							id='address1' value='' style='width: 80%;' placeholder="주소">
					</div>
				</div>

				<div class="form-group">
					<label for="orderer_address2" class="col-md-2 control-label"
						style='font-size: 0.9em;'>배달 상세주소</label>
					<div class="col-md-10">
						<input type='text' class="form-control" name='address2'
							id='address2' value='' style='width: 80%;' placeholder="상세 주소">
					</div>
				</div>

				<div class="form-group">
					<label for="orderer_request" class="col-md-2 control-label"
						style='font-size: 0.9em;'>배달 요청사항</label>
					<div class="col-md-10">
						<textarea class="form-control" name='request' maxlength="100"
							id='request' style='width: 80%;' placeholder="요청사항">
							</textarea>
					</div>
				</div>
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
					var element_wrap = document.getElementById('wrap');

					function foldDaumPostcode() {
						// iframe을 넣은 element를 안보이게 한다.
						element_wrap.style.display = 'none';
					}

					function DaumPostcode() {
						// 현재 scroll 위치를 저장해놓는다.
						var currentScroll = Math.max(document.body.scrollTop,
								document.documentElement.scrollTop);
						new daum.Postcode({
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
											+ extraAddr + ')' : '');
								}

								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								$('#orderer_housecode').val(data.zonecode); // 5자리 새우편번호 사용 ★
								$('#address2').val(fullAddr); // 주소 ★

								// iframe을 넣은 element를 안보이게 한다.
								// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
								element_wrap.style.display = 'none';

								// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
								document.body.scrollTop = currentScroll;

								$('#address2').focus();
							},
							// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
							onresize : function(size) {
								element_wrap.style.height = size.height + 'px';
							},
							width : '100%',
							height : '100%'
						}).embed(element_wrap);

						// iframe을 넣은 element를 보이게 한다.
						element_wrap.style.display = 'block';
					}
				</script>
				<!-- ------------------------------ DAUM 우편번호 API 종료 ------------------------------ -->

			</DIV>

			<br> <BR>
			<DIV class='title_line' style="width: 80%">결제 정보</DIV>
			<DIV class="content_body"
				style="width: 80%; margin-left: auto; margin-right: auto;">
				<input type="radio" id="method" name="method" value="현장결제 - 현금" />현금
				<input type="radio" id="method" name="method" value="현장결제 - 카드" />카드
				<input type="radio" id="method" name="method" value="토스" />토스 <input
					type="radio" name="method" id="method" value="카카오페이" />카카오페이
			</DIV>

			<table class="table table-striped"
				style='margin-top: 40px; margin-bottom: 50px; text-align: center; width: 90%; margin-left: auto; margin-right: auto;'>
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

							<button type='button' id='btn_order' class='btn btn-info'
								style='font-size: 1.5em;'>결재하기</button>
						<td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>


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
