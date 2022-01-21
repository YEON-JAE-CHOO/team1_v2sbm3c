<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>

<c:set var="mno" value="${membersVO.mno }" />
<c:set var="nickname" value="${membersVO.nickname }" />
<c:set var="rno" value="${restaurantVO.rno }" />
<c:set var="name" value="${restaurantVO.name }" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
    content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>리뷰 등록</title>
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
    <!-- Header-->
    <header class="py-4" style="background-color: #ef9578;">
         <div class="container px-4 px-lg-5 my-5"
                 style="background-color: #ef9578;">
         <div class="text-center text-white">
                 <h1 class="display-4 fw-bolder">리뷰 등록</h1>
                 <p class="lead fw-normal text-white-50 mb-0">${name }</p>
        </div>
       </div>
    </header>
    <!-- Section-->
    <section class="py-5">

        <div class="row">

            <div class="col-xs-12 col-sm-12">
                <h2>&nbsp;</h2>
                <h2 class="text-center">리뷰 등록</h2>
            </div>

            <div class="col-xs-3 col-sm-3"></div>
            <div class="col-xs-8 col-sm-8">

                <div>
                    <p>&nbsp;</p>

                    <form class="form-horizontal" action="./create.do"method="post">
                        <div class="form-group">
                            <input type="hidden" name="mno" value="${param.mno }"> 
                            <input type="hidden" name="rno" value="${param.rno}">
                            <div class="col-sm-10 control-label">
                                <label for="id"><h4>☞${name}☜에 대하여 식사는 맛있게 하셨나요? 리뷰등록 부탁드릴게요 !</h4></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2 control-label">
                                <label id="title">제목</label>
                            </div>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="title" id="title">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-2 control-label">
                                <label id="content">평가</label>
                            </div>
                            <div class="col-sm-6">
                                    <textarea rows="5" cols="40" class="form-control" name="content" id="content"
                                    placeholder="평가를 해주세요."></textarea>
                            </div>
                        </div>
                  
              <div class="form-group">
           <label class="control-label col-md-3">점수를 평가해주세요</label>
       <div class="col-md-12">
            <select name = "score">      
              <option value='1' selected="selected">1</option>  
              <option value='2'>2</option>
              <option value='3'>3</option>
              <option value='4'>4</option>
              <option value='5'>5</option>
              <option value='6'>6</option>
              <option value='7'>7</option>
              <option value='8'>8</option>
              <option value='9'>9</option>
              </select>
       </div>
       </div>

                       

                



                        <input type="hidden" value="${GetIpAddress.getIp()}">
                        <div class="form-group">
                            <div class="col-sm-12 text-center">
                                <input type="submit" value="리뷰 등록" class="btn btn-success">
                                <input type="reset" value="취소" class="btn btn-warning">
                            </div>
                        </div>


                    </form>
                </div>
            </div>

        </div>
        
    </section>
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