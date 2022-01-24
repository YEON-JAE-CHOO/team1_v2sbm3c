<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script type="text/javascript" src="/ckeditor/ckeditor.js"></script> <!-- /static 기준 -->
 
<script type="text/JavaScript">
   window.onload=function(){
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
   };

  //$(function() {
   // CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  //});
</script>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
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
    <section class="py-5">
        <!-- ******************** Modal 알림창 시작 ******************** -->
        <div id="modal_panel" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h4 class="modal-title" id='modal_title'></h4>
                        <!-- 제목 -->
                    </div>
                    <div class="modal-body">
                        <p id='modal_content'></p>
                        <!-- 내용 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="btn_close" data-focus=""
                            class="btn btn-default" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- ******************** Modal 알림창 종료 ******************** -->

        <div class="row">

            <div class="col-xs-12 col-sm-12">
                <h2>&nbsp;</h2>
                <h2 class="text-center">공지사항 등록</h2>
            </div>

            <div class="col-xs-3 col-sm-3"></div>
            <div class="col-xs-8 col-sm-8">

                <div>
                    <p>&nbsp;</p>

                    <form class="form-horizontal" action="./create.do" method="post"
                        enctype="multipart/form-data">
                        <div class="form-group">
                            <div class="col-sm-10 control-label">
                                <label for="id">제목</label>
                            </div>
                            <div class="col-sm-6 text-left">
                                <input type="text" class="form-control" name="title" id="title">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-2 control-label">
                                <label id="name">내용</label>
                            </div>
                            <div class="col-sm-10">
                                <textarea name='content'  id='content'  required="required" class="form-control" rows="12" style='width: 100%;'></textarea>
                            </div>
                        </div>

                         <div class="form-group">
                            <div class="col-sm-2 control-label">
                                <label id="name">출력 유무</label>
                            </div>
                            <div class="col-sm-10">
                                <select name='visible' class="form-control" style='width: 20%;'>
            <option value='Y' selected="selected">Y</option>
            <option value='N'>N</option>
          </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2 control-label">
                                <label id="text">출력 순서</label>
                            </div>
                            <div class="col-sm-6">
                                <input type='number' name='seqno' value='1' required="required" 
                   placeholder="출력 순서" min="1" max="1000" step="1" 
                   style='width: 30%;' class="form-control" >
                            </div>
                        </div>
                        <input type="hidden" value="${GetIpAddress.getIp()}">
                        <div class="form-group">
                            <div class="col-sm-12 text-center">
                                <input type="submit" value="공지사항 등록" class="btn btn-success">
                                <input type="reset" value="취소" class="btn btn-warning">
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>

    </section>

    </section>
    <!-- Footer-->
    <footer class="py-5 bg-dark">
        <jsp:include page="../menu/bottom.jsp" flush='false' />
    </footer>
    <!-- Bootstrap core JS-->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 
</body>
</html>
