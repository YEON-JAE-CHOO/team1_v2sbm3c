<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
 <c:set var="reviewno" value="${reviewVO.reviewno }" />
<c:set var="title" value="${reviewVO.title }" />

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
                        <h1 class="display-4 fw-bolder">Shop in style</h1>
                        <p class="lead fw-normal text-white-50 mb-0">With this shop
                        hompeage template</p>
               </div>
              </div>
           </header>
           
<DIV class='content_body'>

    <section class="py-5">

        <div class="row">

            <div class="col-xs-12 col-sm-12">
                <h2>&nbsp;</h2>
                <h2 class="text-center"></h2>
            </div>

            <div class="col-xs-3 col-sm-3"></div>
            <div class="col-xs-8 col-sm-8">

                <div>
                    <p>&nbsp;</p>

                    <form class="form-horizontal" action="./delete.do"
                        method="post">
                         <input type="hidden" value="${reviewVO.reviewno}">
                         
                        <div class="form-group">
                            <div class="col-sm-2 control-label">
                                <label for="id">리뷰 제목</label>
                            </div>
                            <div class="col-sm-6 text-left">
                                  <input type="text" class="form-control" name="title" value="${reviewVO.title }"
                                    id="explanation">
                            </div>
                        </div>

    
                        <div class="form-group">
                            <div class="col-sm-2 control-label">
                                <label id="text">내용</label>
                            </div>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="content" value = "${reviewVO.content }"
                                    id="explanation">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12 text-center">
                                <input type="submit" value="삭제" class="btn btn-success">
                                <input type="reset" value="취소" class="btn btn-warning">
                            </div>
                        </div>


                    </form>
                </div>
            </div>

        </div>
        
    </section>
     
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
