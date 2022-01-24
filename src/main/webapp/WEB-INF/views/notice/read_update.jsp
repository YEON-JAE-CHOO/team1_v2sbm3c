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
        <script type="text/javascript" src="/ckeditor/ckeditor.js"></script> <!-- /static 기준 -->
 
<script type="text/JavaScript">
   window.onload=function(){
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
   };

  //$(function() {
   // CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  //});
</script>

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
 
<DIV class='title_line'>
  <A href="../notice/list.do" class='title_link'>공지사항 </A>
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 
  

  
  <DIV class='menu_line'></DIV>
  
  <FORM name='frm_update_read' method='POST' action='./update_read.do' class="form-horizontal"
             enctype="multipart/form-data">
      <input type='hidden' name='noticeno' id='noticeno' value='${noticeVO.noticeno }'>
    
    <div class="form-group">
       <label class="control-label col-md-2">제목</label>
       <div class="col-md-10">
         <input type='text' name='title' value='${noticeVO.title }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">내용</label>
       <div class="col-md-10">
         <textarea name='content' required="required"  value='${noticeVO.content }' 
                        class="form-control" rows="12" style='width: 100%;'></textarea>
       </div>
    </div> 
        <div class="form-group">
       <label class="control-label col-md-2">출력 순서</label>
       <div class="col-md-10">
         <input type='number' name='seqno' value='${noticeVO.seqno }' required="required" 
                   placeholder="출력 순서" min="1" max="1000" step="1" 
                   style='width: 30%;' class="form-control" >
       </div>
    </div>  
  
            <div class="form-group">
       <label class="control-label col-md-2">출력 유뮤</label>
       <div class="col-md-10">
          <select name='visible' class="form-control" style='width: 20%;'>
            <option value='Y' selected="selected">Y</option>
            <option value='N'>N</option>
          </select>
       </div>
    </div>  
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-primary">등록</button>
      <button type="button" onclick="location.href='./list.do'" class="btn btn-primary">목록</button>
    </div>

  
  </FORM>
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