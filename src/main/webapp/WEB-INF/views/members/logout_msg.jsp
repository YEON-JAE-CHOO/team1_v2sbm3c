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
                <div class="container px-2 px-lg-5 my-5"
                        style="background-color: #ef9578;">
                <div class="text-center text-white">
                        <h1 class="display-4 fw-bolder">Logout</h1>
                        <p class="lead fw-normal text-white-50 mb-0">Please Sign Up</p>
               </div>
              </div>
           </header>
      <!-- Section-->

<script type="text/javascript">
  $(function(){ 
    $('#btn_home').on('click', function() {  // click 이벤트와 함께 처리 함수를 동시 등록
      location.href="/index.do";
    });
  });
</script>
 
</head> 
<body>
 
<DIV class='title_line'>알림</DIV>
  <DIV class='message'>
    <fieldset class='fieldset_basic'>
      <ul>
        <li class='li_none'>이용해 주셔서감사합니다.</li>
        <li class='li_none'>
          <button type="button" id="btn_home" class="btn btn-primary btn-md">확인</button>
        </li>
        
      </ul>
    </fieldset>    
  </DIV>
</body>
 
</html>

