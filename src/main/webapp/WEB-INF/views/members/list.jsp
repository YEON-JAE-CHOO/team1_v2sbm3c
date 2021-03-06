<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
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
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
    <body>
        <jsp:include page="../menu/top.jsp" flush='false' />
           <!-- Header-->
           <header class="py-4" style="background-color: #ef9578;">
                <div class="container px-2 px-lg-5 my-5"
                        style="background-color: #ef9578;">
                <div class="text-center text-white">
                        <h1 class="display-4 fw-bolder">회원 목록</h1>
                        <p class="lead fw-normal text-white-50 mb-0">관리자 전용 페이지 </p>
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

  <DIV class='content_body'>

    <ASIDE class="aside_right">
      <A href="javascript:location.reload();">새로고침</A>
      <span class='menu_divide' >│</span> 
      <A href='./create.do'>회원 가입</A>
      <span class='menu_divide' >│</span> 
      <A href='./list.do'>목록</A>
    </ASIDE> 
   
    <div class='menu_line'></div>
    
   
    <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style='width: 5%;'/>
      <col style='width: 10%;'/>
      <col style='width: 15%;'/>
      <col style='width: 15%;'/>
      <col style='width: 30%;'/>
      <col style='width: 15%;'/>
      <col style='width: 10%;'/>
    </colgroup>
    <TR>
      <TH class='th_bs'>번호</TH>
      <TH class='th_bs'>ID</TH>
      <TH class='th_bs'>성명</TH>
      <TH class='th_bs'>전화번호</TH>
      <TH class='th_bs'>주소</TH>
      <TH class='th_bs'>등록일</TH>
       <TH class='th_bs'>기타</TH>
    </TR>
   
    <c:forEach var="membersVO" items="${list }">
      <c:set var="mno" value ="${membersVO.mno}" />
      <c:set var="id" value ="${membersVO.id}" />
      <c:set var="name" value ="${membersVO.name}" />
      <c:set var="phone" value ="${membersVO.phone}" />
      <c:set var="address1" value ="${membersVO.address1}" />
      <c:set var="rdate" value ="${membersVO.rdate}" />
       
    <TR>
      <TD class=td_basic>${mno}</TD>
      <TD class='td_left'><A href="./read.do?mno=${mno}">${id}</A></TD>
      <TD class='td_left'><A href="./read.do?mno=${mno}">${name}</A></TD>
      <TD class='td_basic'>${phone}</TD>
      <TD class='td_left'>
        <c:choose>
          <c:when test="${address1.length() > 15 }"> <!-- 긴 주소 처리 -->
            ${address1.substring(0, 15) }...
          </c:when>
          <c:otherwise>
            ${address1}
          </c:otherwise>
        </c:choose>
      </TD>
      <TD class='td_basic'>${rdate.substring(0, 10)}</TD> <!-- 년월일 -->
      <TD class='td_basic'>
        <A href="./pw_update.do?mno=${mno}"><IMG src='/members/images/passwd.png' title='패스워드 변경'></A>
        <A href="./read.do?mno=${mno}"><IMG src='/members/images/update.png' title='수정'></A>
        <A href="./delete.do?mno=${mno}"><IMG src='/members/images/delete.png' title='삭제'></A>
      </TD>
      
    </TR>
    </c:forEach>
    
  </TABLE>
   
  <DIV class='bottom_menu'>
    <button type='button' onclick="location.href='./create.do'" class="btn btn-primary">등록</button>
    <button type='button' onclick="location.reload();" class="btn btn-primary">새로 고침</button>
  </DIV>
</DIV>
</body>
 
</html>


