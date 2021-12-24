<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <!-- Section-->
    <section class="py-5">
         <div class="container">
    <div class="row">
    <div class="col-sm-12 text-center" >
    <div class="col-sm-5"></div>
     
    <div class="col-sm-12">
    <h2>메뉴 카테고리 추가</h2>
    <form method='POST' action='./create.do' >
        <table class="table table-boardered">
            <tr>
                <th>카테고리</th>
                <td><input type='text' name='name' class="form-control" placeholder="추가할 카테고리를 넣어주세요"></td>        
            </tr>
            <tr>
                <th>순서</th>
                <td><input type='number' name='seq' value='1'class="form-control" ></td>      
            </tr>
            <tr>
                <td colspan="2">
                <input type="submit" class="btn btn-primary" value="전송">
                </td>
            </tr>
        </table>
    </form>
    </div>
     
    </div>
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
