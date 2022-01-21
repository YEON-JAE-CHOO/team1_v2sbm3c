<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091</title>
<script type="text/javascript">
	function recommend_food() {
		var url = './recommend_food/start.do';
		var win = window.open(url, 'AI 서비스', 'width=1500px, height=1060px');

		var x = (screen.width - 700) / 2;
		var y = (screen.height - 560) / 2;

		win.moveTo(x, y); // 화면 중앙으로 이동
	}
</script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
		data-bs-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="/index.do">Home</a></li>
			<li class="nav-item"><a class="nav-link" href='/cate/list.do'>카테고리
					목록</a></li>

			<c:choose>
				<c:when test="${sessionScope.id != null}">
					<%-- 로그인 한 경우 --%>
                ${sessionScope.id } <li class="nav-item"><a
						class="nav-link" href="/members/logout.do">Logout</a></li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a class="nav-link"
						href="/members/login.do">Login</a></li>
				</c:otherwise>
			</c:choose>

			<li class="nav-item"><a class="nav-link"
				href="/members/create.do">회원가입</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/menu/list.do?rno=12">식당/메뉴</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/shoppingcart/openshoppingcart.do">쇼핑카트</a></li>
			<li class="nav-item"><a class="nav-link" href="daum_map.jsp">쇼핑카트</a></li>

			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href=""
				role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="/restaurant/create.do">가게
							등록</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="/restaurant/list.do">가게
							리스트</a></li>
					<li><a class="dropdown-item"
						href="javascript: recommend_food()">카테고리 추천</a></li>
				</ul></li>
		</ul>
		<c:choose>
			<c:when test="${sessionScope.id != null}">
				<a href="/shoppingcart/openshoppingcart.do?mid=${sessionScope.id }"
					class="bi-cart-fill me-1"> Cart <span
					class="badge bg-dark text-white ms-1 rounded-pill">0</span>
				</a>
			</c:when>
		</c:choose>


	</div>

</nav>
</body>
</html>