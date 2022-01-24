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

<DIV class='title_line'>공지사항 등록 > 알림</DIV>

<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${code == 'create_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">새로운 공지사항 [${noticeVO.noticename }] 등록했습니다.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${code == 'create_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">새로운 공지사항 [${noticeVO.noticename }] 등록에 실패했습니다.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${code == 'update_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">공지사항 수정 성공</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${code == 'delete_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">[${noticeVO.title }] 삭제하였습니다.</span>
          </LI>                                                                      
        </c:when>        
        <c:when test="${code == 'delete_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">[${categrpVO.name }] 카테고리 그룹 삭제에 실패했습니다.</span>
          </LI>                                                                      
        </c:when> 
        <c:otherwise>
          <LI class='li_none_left'>
            <span class="span_fail">알 수 없는 에러로 작업에 실패했습니다.</span>
          </LI>
          <LI class='li_none_left'>
            <span class="span_fail">다시 시도해주세요.</span>
          </LI>
        </c:otherwise>
      </c:choose>
      <LI class='li_none'>
        <br>
        <c:choose>
            <c:when test="${cnt == 0 }">
                <button type='button' onclick="history.back()" class="btn">다시 시도</button>    
            </c:when>
        </c:choose>
        
        <button type='button' onclick="location.href='./list.do'" class="btn">목록</button>
      </LI>
    </UL>
  </fieldset>

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