<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>관심분야 등록</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<script type="text/javascript">
	$(function() {
		send(); // Django ajax 호출
		$('#btn_previous').on('click', function() {
			history.back();
		}); // 이전
		$('#btn_close').on('click', function() {
			window.close();
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
				if (rdata.index == 0) { // 개발 관련 도서 추천 필요
					$('#kor').css('display', '');
				} else if (rdata.index == 1) { // 해외 여행 관련 도서 추천 필요
					$('#chn').css('display', '');
				} else if (rdata.index == 2) { // 해외 여행 관련 도서 추천 필요
					$('#jpn').css('display', '');
				} else if (rdata.index == 3) { // 해외 여행 관련 도서 추천 필요
					$('#wes').css('display', '');
				} else { // 소설 관련 도서 추천 필요
					$('#fod').css('display', '');
				}
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

		// $('#panel').html('처리중입니다....');  // 텍스트를 출력하는 경우
		//		$('#panel').html("<img src='/images/ani04.gif' style='width: 10%;'>");
		//		$('#panel').show(); // 숨겨진 태그의 출력
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
</style>

</head>
<body>
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
		<H2>참여해주셔서 감사합니다.</H2>
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
</body>
</html>

