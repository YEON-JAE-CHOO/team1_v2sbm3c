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
<title>배달통</title>
<!-- Favicon-->
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
crossorigin="anonymous">
</head>
    <body>
        <jsp:include page="../menu/top.jsp" flush='false' />
           <!-- Header-->
           <header class="py-4" style="background-color: #ef9578;">
                <div class="container px-4 px-lg-5 my-5"
                        style="background-color: #ef9578;">
                <div class="text-center text-white">
                        <h1 class="display-4 fw-bolder">카테고리 생성</h1>
               </div>
              </div>
           </header>
           
<DIV class='content_body'>

     <section class="py-5"></section>
     
    <div class="col-sm-12">
    <h2>메뉴 카테고리 추가</h2>
    <form method='POST' action='./create.do' enctype="multipart/form-data" >
         <div class="form-group">
       <label class="control-label col-md-4">카테고리 그룹 이름</label>
       <div class="col-md-8">
         <input type='text' name='name' value='' required="required" placeholder="이름"
                    autofocus="autofocus" class="form-control" style='width: 50%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-4">출력 순서</label>
       <div class="col-md-8">
         <input type='number' name='seq' value='1' required="required" 
                   placeholder="출력 순서" min="1" max="1000" step="1" 
                   style='width: 30%;' class="form-control" >
       </div>
    </div>  
    <div class="form-group">
       <label class="control-label col-md-4">출력 형식</label>
       <div class="col-md-8">
               <input type='file' class="form-control" name='file1MF' id='file1MF' 
                    value='' placeholder="파일 선택">
       </div>
       
    </div>   
     <input type="submit" class="btn btn-primary" value="추가하기">
    </form>
      


    </div>
     
    </div>
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
