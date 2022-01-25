<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>

<c:set var="list" value="${list }" />
<c:set var="rno" value="${rno }" />
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

$(function() {
   $('#add_shoppingcart').on('click', function() {cart_ajax_add(rno,menuno,mid)});
   $('#btn_cart_test').on('click', function() {cart_test(rno,menuno,mid)});
   //cart_ajax_add(12,39,"${sessionScope.id }");
});
<%-- 장바구니 추가 모달 --%>
function cart_test(rno,menuno,mid){
   if(mid!=""){
       cart_ajax_add(rno,menuno,mid)
   }else{
       alert("로그인이 필요합니다. "); 
   }
}

function cart_ajax_add(rno,menuno,mid){
    var mno = 10;
    var params = "";
    params += 'rno=' + rno;
    params += '&menuno=' + menuno;
    params += '&mid=' + mid;

    alert("-> params: " + params); 

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
                 location.href='/shoppingcart/openshoppingcart.do?mid=${sessionScope.id}';
             }
          } else {
             alert('이미 쇼핑카트에 담긴 식당이 있습니다.<br>장바구니를 비우고 다시 시도해주세요.');
          }
       },
       // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
       error : function(request, status, error) { // callback 함수
          console.log(error);
       }
    }); //  $.ajax END

}




function recom_ajax(rno, status_count) {
    console.log("-> recom_" + status_count + ": " + $('#recom_' + status_count).html());  // A tag body      
    var params = "";
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params = 'rno=' + rno; // 공백이 값으로 있으면 안됨.
    $.ajax(
      {
        url: '/restaurant/update_recom_ajax.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          var str = '';
          if (rdata.cnt == 1) {
            // $('#span_animation_' + status_count).hide();   // SPAN 태그에 animation 출력
            console.log("rdata -> "+rdata.cnt);
            $('#recom_' + status_count).html('♥('+rdata.recom+')');     // A 태그에 animation 출력
          } else {
            // $('#span_animation_' + status_count).html("X");
            $('#recom_' + status_count).html('♥(X)');
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

    // $('#recom_' + status_count).html("<img src='/contents/images/ani04.gif' style='width: 10%;'>");
    // $('#span_animation_' + status_count).css('text-align', 'center');
    // $('#span_animation_' + status_count).html("<img src='/contents/images/ani04.gif' style='width: 10%;'>");
    // $('#span_animation_' + status_count).show(); // 숨겨진 태그의 출력
      
  }  

</script>
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
                       
                       <div class="fs-5 mb-2">
                       <a class="text-decoration-line-through" href='../review/list_rno_asc.do?rno=${restaurantVO.rno }'>리뷰 보러 가기</a>
                    </div>
                    <c:choose>
                <c:when test="${sessionScope.id != null}"><%-- 비회원 메뉴 목록 --%>
                <div class="fs-5 mb-2">
                       <a class="text-decoration-line-through" href='../review/create.do?rno=${restaurantVO.rno }&mno=${mno}'>리뷰 달러 가기</a>
                    </div>
                </c:when>
                <c:otherwise>
                     
                </c:otherwise>
                </c:choose>
                 
					<p class="lead">${restaurantVO.explanation}</p>
					<div class="d-flex">
						<c:choose>
							<c:when test="${sessionScope.id != null}">
								<c:set var="name" value="qnaadmin" />
								<c:if test="${name eq 'qnaadmin'}">
									<button class="btn btn-outline-dark flex-shrink-0"
										type="button"
										onclick="location.href='/restaurant/modification.do?rno=${rno }'">
										수정</button>
									<button class="btn btn-outline-dark flex-shrink-0"
										type="button"
										onclick="location.href='/restaurant/order_request.do?rno=${rno }'">
										주문 목록</button>
									<button class="btn btn-outline-dark flex-shrink-0"
										type="button"
										onclick="location.href='/restaurant/open_sales.do?rno=${rno }'">
										가게 매출</button>
								</c:if>
							</c:when>
						</c:choose>
						<button class="btn btn-outline-dark flex-shrink-0" type="button"
							id="recom_${restaurantVO.recocnt }"
							onclick="javascript:recom_ajax(${rno }, ${restaurantVO.recocnt })">
							♥(${restaurantVO.recocnt })</button>
					</div>
				</div>
				<div class="col-md-4" id="map"
					style='width: 640px; height: 380px; margin: 0px auto;'></div>
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
						<c:set var="thumb" value="${menuVO.thumb }" />
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
									<IMG src="/team1/storage/${thumb }"
										style="width: 120px; height: 80px;">
									</a>
								</c:when>
								<c:otherwise>
									<!-- 기본 이미지 출력 -->
									<IMG src="/team1/storage/rice.jpg"
										style="width: 120px; height: 80px;">
								</c:otherwise>
							</c:choose></TD>
						<TD class="td_bs">${price }</TD>
						<TD class="td_bs">${spiciness }</TD>
						<TD class="td_bs">${explanation }</TD>
						<TD class="td_bs"><c:choose>
								<c:when test="${sessionScope.id != null}">
									<c:set var="name" value="qnaadmin" />
									<c:if test="${name eq 'qnaadmin'}">
										<A href="/menu/update.do?menuno=${menuno }&rno=${rno }"
											title="수정"><span class="glyphicon glyphicon-pencil"></span>수정</A>
										<A href="/menu/delete.do?menuno=${menuno }&rno=${rno }"
											title="삭제"><span class="glyphicon glyphicon-trash"></span>삭제</A>
									</c:if>
								</c:when>
							</c:choose>
							<button class="btn btn-outline-dark" type="button"
								id="add_shoppingcart" name="add_shoppingcart"
								onclick="cart_test(${rno },${menuno },'${sessionScope.id }')">장바구니</button></TD>
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
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=36e8c607903bf248b39eabfa9d81368a&libraries=services"></script>
	<script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
              center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
              level: 3 // 지도의 확대 레벨
          };  
      
      // 지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption); 
      
      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();
      
      // 주소로 좌표를 검색합니다
      geocoder.addressSearch('${restaurantVO.address1   }', function(result, status) {
      
          // 정상적으로 검색이 완료됐으면 
           if (status === kakao.maps.services.Status.OK) {
      
              var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
      
              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new kakao.maps.Marker({
                  map: map,
                  position: coords
              });
      
              // 인포윈도우로 장소에 대한 설명을 표시합니다
              var infowindow = new kakao.maps.InfoWindow({
                  content: '<div style="width:150px;text-align:center;padding:6px 0;">${restaurantVO.name}</div>'
              });
              infowindow.open(map, marker);
      
              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
              map.setCenter(coords);
          } 
      });    
   </script>
</body>

</html>