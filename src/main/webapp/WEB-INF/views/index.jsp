<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>배달통</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous"/>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />

<script type="text/JavaScript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

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
	<jsp:include page="./menu/top.jsp" flush='false' />
	<!-- Header-->
	<header class="py-4" style="background-color: #ef9578;">
		<div class="container px-4 px-lg-5 my-5"
			style="background-color: #ef9578;">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-bs-ride="carousel" data-width="500" data-ratio="3/4"
				data-max-width="80%" style='margin: 0px auto; width: 40%; '>
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="3" aria-label="Slide 4"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="4" aria-label="Slide 5"></button>
				</div>
				<div class="carousel-inner" style='height: 300px'>
					<div class="carousel-item active">
						<img src="/main/한식.jpg" class="d-block w-100" style='height: 300px' alt="...">
					</div>
					<div class="carousel-item">
						<img src="/main/중식.jpg" class="d-block w-100" style='height: 300px' alt="...">
					</div>
					<div class="carousel-item">
						<img src="/main/일식.jpg" class="d-block w-100" style='height: 300px' alt="...">
					</div>
                    <div class="carousel-item">
                        <img src="/main/양식.jpg" class="d-block w-100" style='height: 300px' alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="/main/분식.jpg" class="d-block w-100" style='height: 300px' alt="...">
                    </div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>

		</div>
	</header>
	<!-- Section-->
	<section class="py-5">
		<DIV class="container">
			<H1 style="text-align: center; font-size: 30px;">관심분야 등록</H1>

			<DIV style="text-align: center; margin: 50px auto;">
				관심 분야를 등록하시면 최적의 음식 추천 서비스를 이용하실수 있습니다.<br> <br> 등록은 관심
				분야의 상품을 선택하며, 몇번의 클릭만으로 바로 종료됩니다.
			</DIV>

			<DIV style="text-align: center; margin: 50px auto;">
				<button type='button' id='btn_forward' class="btn btn-success">관심분야
					등록하기</button>
			</DIV>

		</DIV>
	</section>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<jsp:include page="./menu/bottom.jsp" flush='false' />
	</footer>
	<!-- Bootstrap core JS-->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>