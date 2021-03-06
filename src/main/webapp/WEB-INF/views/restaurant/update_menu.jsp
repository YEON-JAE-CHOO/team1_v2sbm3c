<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>

<c:set var="rno" value="${rno }" />
<c:set var="menuvo" value="${menuvo }" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>메뉴 수정</title>
<!-- Favicon-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script type="text/javascript">
	$(function() {

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

	<DIV class='container'>

		<br> <br>
		<H3>메뉴 수정</H3>
		<h2>${menuvo.title }</h2>

		<h3>${menuvo.menuno }</h3>
		<div style="height: 100px; background-color: #ef9578;"text-align:center; display:flex; >


			<H2>김밥프렌즈</H2>
		</div>


		<div>
			<form class="form-horizontal" role="form" method="post"
				action="/restaurant/updatemenu.do" enctype="multipart/form-data">

				<input type="hidden" class="form-control onlyAlphabetAndNumber"
					value='${rno }' id="rno" data-rule-required="true" name="rno"
					maxlength="15"> <input type="hidden"
					class="form-control onlyAlphabetAndNumber"
					value='${menuvo.rno }' id="menuno" data-rule-required="true"
					name="menuno" maxlength="15">


				<div class="form-group" id="divId">
					<label for="inputId" class="col-lg-2 control-label">메뉴 명</label>
					<div class="col-lg-10">
						<input type="text" class="form-control onlyAlphabetAndNumber"
							value='${menuvo.title }' id="title" data-rule-required="true"
							name="title" maxlength="15">
					</div>
				</div>

				<div class="form-group" id="divId">
					<label for="inputId" class="col-lg-2 control-label">메뉴 설명</label>
					<div class="col-lg-10">
						<input type="text" class="form-control " id="explanation"
							value='${menuvo.explanation }' data-rule-required="true"
							name="explanation" maxlength="15">
					</div>
				</div>



				<div class="form-group">
					<label class="control-label col-md-2">이미지</label>
					<div class="col-md-10">
						<input type='file' class="form-control" name='file1MF'
							id='file1MF' value='' placeholder="파일 선택">
					</div>
				</div>

				<div class="form-group" id="divId">
					<label for="inputId" class="col-lg-2 control-label">음식 종류</label>
					<div class="col-lg-10">
						<input type="text" class="form-control onlyAlphabetAndNumber"
							id="" menutype"" data-rule-required="true" name="menutype"
							value='${menuvo.menutype }' maxlength="15">
					</div>
				</div>

				<div class="form-group" id="divId">
					<label for="inputId" class="col-lg-2 control-label">매움 정도</label>
					<div class="col-lg-10">
						<input type="text" class="form-control onlyAlphabetAndNumber"
							id="spiciness" data-rule-required="true" name="spiciness"
							value='${menuvo.spiciness }' maxlength="10">
					</div>
				</div>

				<div class="form-group" id="divId">
					<label for="inputId" class="col-lg-2 control-label">가격</label>
					<div class="col-lg-10">
						<input type="text" class="form-control onlyAlphabetAndNumber"
							width="20%" id="price" data-rule-required="true" name="price"
							value='${menuvo.price }' price"" maxlength="15">원
					</div>
				</div>



				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<button type="submit" class="btn btn-success">수정</button>
					</div>
				</div>
			</form>
		</div>


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
</Body>