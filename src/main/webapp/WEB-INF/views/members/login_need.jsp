<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>배달통</title>
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Favicon-->
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
    <body>
        <jsp:include page="../menu/top.jsp" flush='false' />
           <!-- Header-->
           <header class="py-4" style="background-color: #ef9578;">
                <div class="container px-4 px-lg-5 my-5"
                        style="background-color: #ef9578;">
                <div class="text-center text-white">
                        <h1 class="display-4 fw-bolder">login</h1>
                        <p class="lead fw-normal text-white-50 mb-0">Please Sign up</p>
               </div>
              </div>
           </header>
      <!-- Section-->
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
<body>
 
  <DIV class='message'>
    <H3>로그인이 필요한 페이지입니다.</H3>
    <BR><BR>
    <button type='button' 
                 onclick="location.href='/members/login.do'" 
                 class="btn btn-info">로그인</button>       
    <button type='button' 
                 onclick="location.href='/members/create.do'" 
                 class="btn btn-info">회원 가입</button>       

  </DIV>
 
</body>
 
</html>

        