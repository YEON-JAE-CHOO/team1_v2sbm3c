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
		$('#img1').on('click', function() {
			$('#step1').prop('checked', true)
		}); // 첫번째 이미지를 클릭하면 첫번째 라디오 체크됨.
		$('#img2').on('click', function() {
			$('#step2').prop('checked', true)
		});
		$('#img3').on('click', function() {
			$('#step3').prop('checked', true)
		});
		$('#img4').on('click', function() {
			$('#step4').prop('checked', true)
		});
		$('#img5').on('click', function() {
			$('#step5').prop('checked', true)
		});

		$('#btn_previous').on('click', function() {
			history.back();
		}); // 이전
		$('#btn_next').on(
				'click',
				function() { // 다음
					if ($('#step1').prop('checked') == true
							| $('#step2').prop('checked') == true
							| $('#step3').prop('checked') == true
							| $('#step4').prop('checked') == true
							| $('#step5').prop('checked') == true) {
						// alert('submit 진행');
						frm.submit();
					} else {
						alert('관심 분야의 이미지를 선택해주세요.');
					}
				});
		$('#btn_close').on('click', function() {
			window.close();
		}); // 윈도우 닫기
	});
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

.td_radio {
 vertical-align: middle;
 padding: 5px;
}

.td_radio_select {
 cursor: pointer;
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
	<DIV class="container">
		<H2>4/5 단계입니다. 거의 다 왔습니다.</H2>

		<DIV id='panel' style='display: none; margin: 10px auto; width: 90%;'></DIV>

		<form id='frm' name='frm' action='/recommend_food/form5.do' method='GET'>
			<input type='hidden' name='step1' value='${param.step1 }'> <input
				type='hidden' name='step2' value='${param.step2 }'> <input
				type='hidden' name='step3' value='${param.step3 }'> <br>
			<TABLE style='margin: 0px auto;'>
				<TR>
					<TD class='td_image'><img id='img1'
						src="/recommend_food/images/v14.jpeg"
						style='float: left; width: 200px; height: 200px'></TD>
					<TD class='td_image'><img id='img2'
						src="/recommend_food/images/v24.jpeg"
						style='float: left; width: 200px; height: 200px'></TD>
					<TD class='td_image'><img id='img3'
						src="/recommend_food/images/v34.jpeg"
						style='float: left; width: 200px; height: 200px'></TD>
					<TD class='td_image'><img id='img4'
						src="/recommend_food/images/v44.jpeg"
						style='float: left; width: 200px; height: 200px'></TD>
					<TD class='td_image'><img id='img5'
						src="/recommend_food/images/v54.jpeg"
						style='float: left; width: 200px; height: 200px'></TD>
				</TR>
				<TR>
					<TD class='td_radio'><input type='radio' name='step4'
						id='step1' value='1' class='td_radio_select'></TD>
					<TD class='td_radio'><input type='radio' name='step4'
						id='step2' value='2' class='td_radio_select'></TD>
					<TD class='td_radio'><input type='radio' name='step4'
						id='step3' value='3' class='td_radio_select'></TD>
					<TD class='td_radio'><input type='radio' name='step4'
						id='step4' value='4' class='td_radio_select'></TD>
					<TD class='td_radio'><input type='radio' name='step4'
						id='step5' value='5' class='td_radio_select'></TD>

				</TR>
			</TABLE>

			<br>
			<DIV style="text-align: center;">
				<button type='button' id='btn_previous' class="btn btn-primary">이전</button>
				<button type='button' id='btn_next' class="btn btn-primary">다음</button>
				<button type='button' id='btn_close' class="btn btn-primary">취소</button>
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

