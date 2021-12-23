<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>메뉴 리스트 확인</title>

<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<script type="text/javascript">
	$(function() {

	});
</script>
<Body>
	<jsp:include page="./menu/top.jsp" flush='false' />

	<H3>메뉴 테스트 확인 -> 콘솔 확인</H3>

	<DIV class='content_body'>
		<H3>----------------------------</H3>
		<button class="w-100 btn btn-lg btn-primary" type="button"
			onclick="location.href='/member/create.do'">메뉴 등록</button>
	</DIV>

	<jsp:include page="./menu/bottom.jsp" flush='false' />
</Body>