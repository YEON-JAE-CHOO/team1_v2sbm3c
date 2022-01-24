<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="dev.mvc.notice.NoticeVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
<meta charset="utf-8" />
<meta name="viewport"
    content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>메뉴 등록</title>
<style type="text/css">
</style>
<!-- Favicon-->
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
    crossorigin="anonymous">
    <link href="/css/style.css" rel="Stylesheet" type="text/css">
    </head>
    <body>
        <jsp:include page="../menu/top.jsp" flush='false' />
           <!-- Header-->
           <header class="py-4" style="background-color: #ef9578;">
                <div class="container px-4 px-lg-5 my-5"
                        style="background-color: #ef9578;">
                <div class="text-center text-white">
                        <h1 class="display-4 fw-bolder">배달통</h1>
                        <p class="lead fw-normal text-white-50 mb-0">배달통에 오신것을 환영합니다.</p>
               </div>
              </div>
           </header>
      <!-- Section-->
    <section class="py-5">
 
<DIV class='title_line'>공지사항</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./read_update.do?noticeno=${noticeVO.noticeno }">수정</A>
    <span class='menu_divide' >│</span>
    <A href="./read_delete.do?noticeno=${noticeVO.noticeno }">삭제</A>
        <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 
  </DIV>
    
   <table class="table table-striped" style="text-align: center"; border:1px solid #dddddd">

      <thead>
        <TR>
        <th colspan="3" style="background-color: #eeeeee; text-align:center;">게시판 글보기</th>
        </TR>
      </thead>
    <tbody>
      <c:set var="noticeno" value="${noticeVO.noticeno }" />
      <c:set var="seqno" value="${noticeVO.seqno }" />
      <c:set var="title" value="${noticeVO.title }" />
      <c:set var="content" value="${noticeVO.content }" />
      <c:set var="rdate" value="${noticeVO.rdate.substring(0, 10) }" />
        <tr>
            <td style = "width:20%;">글제목</td>
            <td colspan="2">${title }</td>
        </tr>
        <tr>
            <td>작성번호</td>
            <td colspan="2">${seqno }</td>
        </tr>
        <tr>
            <td>작성일자</td>
            <td colspan="2">${rdate }</td>
        </tr>
            <tr>
            <td>내용</td>
            <td colspan="2" style="min-height:200px; text-align:left;">${content }</td>
        </tr> 
        </tbody>
        </table>
        </DIV>
        
 </section>
    <!-- Footer-->
    <footer class="py-5 bg-dark">
        <jsp:include page="../menu/bottom.jsp" flush='false' />
    </footer>
    <!-- Bootstrap core JS-->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/scripts.js"></script>
</body>
</html>