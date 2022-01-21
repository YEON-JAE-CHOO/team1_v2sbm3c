<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>

<c:set var="name" value="${restaurantVO.name }" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
    content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>리뷰 보기</title>
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
</head>
<body>
    <!-- Navigation-->
    <jsp:include page="../menu/top.jsp" flush='false' />
    <!-- Header-->
    <header class="py-4" style="background-color: #ef9578;"> </header>

    <!-- Section-->
    <section class="py-5"></section>

    <div style="text-align: center;">
        <h3>☞${restaurantVO.name }☜에 작성된 리뷰보기</h3>

     <div style="align-content: right:;">

            <TABLE class='table table-striped'
                style="text-align: center; vertical-align: middle;">
                <colgroup>
                    <col style='width: 20%;' />
                    <col style='width: 25%;' />
                    <col style='width: 15%;' />
                    <col style='width: 20%;' />
                    <col style='width: 20%;' />
                </colgroup>

                <thead>
                    <TR>
                        <th class="th_bs">제목</th>
                        <th class="th_bs">내용</th>
                        <TH class="th_bs">점수(10점)</TH>
                        <TH class="th_bs">등록날짜</TH>
                        <TH class="th_bs">삭제</TH>
                        

                    </TR>
                </thead>
                <tbody>
                    <c:forEach var="reviewVO" items="${list }">
                        <c:set var="title" value="${reviewVO.title }" />
                        <c:set var="content" value="${reviewVO.content }" />
                        <c:set var="score" value="${reviewVO.score }" />
                        <c:set var="rdate" value="${reviewVO.rdate.substring(0, 16) }" />

                        <TR>
                        <TD class="td_bs">${title }</TD>
                        <TD class="td_bs">${content }</TD>
                        <TD class="td_bs">${score }점</TD>
                        <TD class="td_bs">${rdate }</TD>
                        <TD class="td_bs"><A href="/review/delete.do?reviewno=${reviewVO.reviewno }" title="삭제">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
          <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
          <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
         </svg>    </A>
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
</body>
</html>
