<%@ page contentType="text/html; charset=UTF-8" %>
 
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
                        <h1 class="display-4 fw-bolder">회원 정보 삭제</h1>
                        <p class="lead fw-normal text-white-50 mb-0">Delete member information</p>
               </div>
              </div>
           </header>
      <!-- Section-->

 
  <DIV class='title_line'>
    회원 삭제(관리자 전용)
  </DIV>

  <DIV class='content_body'>
    <ASIDE class="aside_right">
      <A href="javascript:location.reload();">새로고침</A>
      <span class='menu_divide' >│</span> 
      <A href='./create.do'>회원 가입</A>
      <span class='menu_divide' >│</span> 
      <A href='./list.do'>목록</A>
    </ASIDE> 
   
    <div class='menu_line'></div>
   
   
    <DIV class='message'>
      <FORM name='frm' method='POST' action='./delete.do'>
        '${membersVO.name }(${membersVO.id })' 회원을 삭제하면 복구 할 수 없습니다.<br><br>
        정말로 삭제하시겠습니까?<br><br>         
        <input type='hidden' name='mno' value='${membersVO.mno}'>     
            
        <button type="submit" class="btn btn-primary">삭제</button>
        <button type="button" onclick="location.href='./list.do'" class="btn btn-primary">취소(목록)</button>
     
      </FORM>
    </DIV>
  </DIV> <%--  <DIV class='content_body'> END --%>

<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

