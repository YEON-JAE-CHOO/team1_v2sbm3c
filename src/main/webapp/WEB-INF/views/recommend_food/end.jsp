<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>관심분야 등록</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script type="text/JavaScript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>



<script type="text/javascript">
	$(function() {
		send(); // Django ajax 호출
		$('#btn_previous').on('click', function() {
			history.back();
		}); // 이전
		$('#btn_close').on('click', function() {
			location.href = '/index.do';
		}); // 윈도우 닫기
	});

	function send() {
		var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
		// alert('params: ' + params);  // 수신 데이터 확인
		$.ajax({
			url : 'http://localhost:8000/recommend_food/end_ajax/', // Spring Boot -> Django 호출
			type : 'get', // get or post
			cache : false, // 응답 결과 임시 저장 취소
			async : true, // true: 비동기 통신
			dataType : 'json', // 응답 형식: json, html, xml...
			data : params, // 데이터
			success : function(rdata) { // 응답이 온경우
				
			
				alert(rdata.index);
				console.log(rdata.index);
				ajax_update(rdata.index);
/* 				if (rdata.index == 0) { // 한식 추천 필요
					$('#kor').css('display', '');
				} else if (rdata.index == 1) { // 중식 추천 필요
					$('#chn').css('display', '');
				} else if (rdata.index == 2) { // 일식 추천 필요
					$('#jpn').css('display', '');
				} else if (rdata.index == 3) { // 분식 추천 필요
					$('#wes').css('display', '');
				} else { // 양식 추천 필요
					$('#fod').css('display', '');
				} */
				//				$('#panel').html(""); // animation gif 삭제
				//				$('#panel').css('display', 'none'); // 숨겨진 태그의 출력

				// --------------------------------------------------
				// 분류 정보에 따른 상품 이미지 SELECT
				//  --------------------------------------------------
			},
			// Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우
			error : function(request, status, error) { // callback 함수
				console.log(error);
			}
		});

	function ajax_update(reco_num) {
		console.log(" index-"+reco_num)
		var params = "";
		params += 'reco_num=' + reco_num;
		$.ajax({
			url : '/tensorflow/ajax_update.do',
			type : 'post', // get, post
			cache : false, // 응답 결과 임시 저장 취소
			async : true, // true: 비동기 통신
			dataType : 'json', // 응답 형식: json, html, xml 
			data : params, // 데이터
			success : function(rdata) { // 응답이 온경우
				
				if (rdata.cnt >= 1) {
					alert('추천 음식 카테고리가 설정되었습니다.');
				} else {
					alert('추천 음식 카테고리 설정에 실패하였습니다.');
				}
			},
			// Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
			error : function(request, status, error) { // callback 함수
				console.log(error);
			}
		}); //  $.ajax END
	}
	}
</script>
<style>
* {
	text-align: center;
}

.td_image {
	vertical-align: middle;
	padding: 5px;
	cursor: pointer;
}

img {
	width: 200px;
}
</style>

</head>
<body>
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
	<br>
	<DIV style='display: none;'>
		<form name='frm' id='frm'>
			<input type='hidden' name='step1' value='${param.step1 }'> <input
				type='hidden' name='step2' value='${param.step2 }'> <input
				type='hidden' name='step3' value='${param.step3 }'> <input
				type='hidden' name='step4' value='${param.step4 }'> <input
				type='hidden' name='step5' value='${param.step5 }'>
		</form>
	</DIV>

	<DIV class="container">
		<H2>추천 음식이 등록 되었습니다.</H2>
		<H2>추천 음식</H2>

		<DIV id='panel' style='margin: 30px auto; width: 90%;'>
			<DIV id='kor' style='display: none;'>
				<TABLE style='margin: 0px auto;'>
					<TR>
						<TD class='td_image'><img id='img1'
							src="/recommend_food/images/v11.jpeg"
							style='float: left; height: 200px'></TD>
						<TD class='td_image'><img id='img2'
							src="/recommend_food/images/v12.jpeg"
							style='float: left; height: 200px'></TD>
						<TD class='td_image'><img id='img3'
							src="/recommend_food/images/v13.jpeg"
							style='float: left; height: 200px'></TD>
					</TR>
					<TR>
						<TD class='td_image'><img id='img4'
							src="/recommend_food/images/v14.jpeg"
							style='float: left; height: 200px'></TD>
						<TD class='td_image'><img id='img5'
							src="/recommend_food/images/v15.jpeg"
							style='float: left; height: 200px'></TD>
					</TR>
				</TABLE>
			</DIV>
			<DIV id='chn' style='display: none;'>
				<TABLE style='margin: 0px auto;'>
					<TR>
						<TD class='td_image'><img id='img1'
							src="/recommend_food/images/v21.jpeg"
							style='float: left; height: 200px'></TD>
						<TD class='td_image'><img id='img2'
							src="/recommend_food/images/v22.jpeg"
							style='float: left; height: 200px'></TD>
						<TD class='td_image'><img id='img3'
							src="/recommend_food/images/v23.jpeg"
							style='float: left; height: 200px'></TD>
					</TR>
					<TR>
						<TD class='td_image'><img id='img4'
							src="/recommend_food/images/v24.jpeg"
							style='float: left; height: 200px'></TD>
						<TD class='td_image'><img id='img5'
							src="/recommend_food/images/v25.jpeg"
							style='float: left; height: 200px'></TD>
					</TR>
				</TABLE>
			</DIV>
			<DIV id='jpn' style='display: none;'>
				<TABLE style='margin: 0px auto;'>
					<TR>
						<TD class='td_image'><img id='img1'
							src="/recommend_food/images/v31.jpeg"
							style='float: left; height: 200px'></TD>
						<TD class='td_image'><img id='img2'
							src="/recommend_food/images/v32.jpeg"
							style='float: left; height: 200px'></TD>
						<TD class='td_image'><img id='img3'
							src="/recommend_food/images/v33.jpeg"
							style='float: left; height: 200px'></TD>
					</TR>
					<TR>
						<TD class='td_image'><img id='img4'
							src="/recommend_food/images/v34.jpeg"
							style='float: left; height: 200px'></TD>
						<TD class='td_image'><img id='img5'
							src="/recommend_food/images/v35.jpeg"
							style='float: left; height: 200px'></TD>

					</TR>
				</TABLE>
			</DIV>
			<DIV id='wes' style='display: none;'>
				<TABLE style='margin: 0px auto;'>
					<TR>
						<TD class='td_image'><img id='img1'
							src="/recommend_food/images/v41.jpeg"
							style='float: left; height: 200px'></TD>
						<TD class='td_image'><img id='img2'
							src="/recommend_food/images/v42.jpeg"
							style='float: left; height: 200px'></TD>
						<TD class='td_image'><img id='img3'
							src="/recommend_food/images/v43.jpeg"
							style='float: left; height: 200px'></TD>
						<TD class='td_image'><img id='img4'
							src="/recommend_food/images/v44.jpeg"
							style='float: left; height: 200px'></TD>
						<TD class='td_image'><img id='img5'
							src="/recommend_food/images/v45.jpeg"
							style='float: left; height: 200px'></TD>
					</TR>
				</TABLE>
			</DIV>
			<DIV id='fod' style='display: none;'>
				<TABLE style='margin: 0px auto;'>
					<TR>
						<TD class='td_image'><img id='img1'
							src="/recommend_food/images/v51.jpeg"
							style='float: left; height: 200px'></TD>
						<TD class='td_image'><img id='img2'
							src="/recommend_food/images/v52.jpeg"
							style='float: left; height: 200px'></TD>
						<TD class='td_image'><img id='img3'
							src="/recommend_food/images/v53.jpeg"
							style='float: left; height: 200px'></TD>
						<TD class='td_image'><img id='img4'
							src="/recommend_food/images/v54.jpeg"
							style='float: left; height: 200px'></TD>
						<TD class='td_image'><img id='img5'
							src="/recommend_food/images/v55.jpeg"
							style='float: left; height: 200px'></TD>
					</TR>
				</TABLE>
			</DIV>
		</DIV>

		<form id='frm' name='frm' action='' method='GET'>
			<br>
			<DIV style="text-align: center;">
				<button type='button' id='btn_previous' class="btn btn-primary">이전</button>
				<button type='button' id='btn_close' class="btn btn-primary">종료</button>
			</DIV>
		</form>
	</DIV>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<jsp:include page="./../menu/bottom.jsp" flush='false' />
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>

