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
	$(function() { // 자동 실행
		$('#btn_forward').on('click', function() {
			location.href = '/recommend_food/form1.do';
		});
		$('#btn_close').on('click', function() {
			location.href = '/index.do';
		}); // 윈도우 닫기
	});
</script>
</head>
<body>
	<DIV class="container">
		<H1 style="text-align: center; font-size: 30px;">관심분야 등록</H1>

		<DIV style="text-align: center; margin: 50px auto;">
			관심 분야를 등록하시면 최적의 음식 추천 서비스를 이용하실수 있습니다.<br> <br> 등록은 관심 분야의
			상품을 선택하며, 몇번의 클릭만으로 바로 종료됩니다.
		</DIV>

		<DIV style="text-align: center; margin: 50px auto;">
			<button type='button' id='btn_forward' class="btn btn-success">관심분야 등록하기</button>
			<button type='button' id='btn_close' class="btn btn-warning">취소</button>
		</DIV>

	</DIV>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>

