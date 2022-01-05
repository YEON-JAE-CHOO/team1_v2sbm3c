<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>배달통</title>
<!-- Favicon-->
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
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
  function loadDefault() {
    $('#id').val('user1');
    $('#pw').val('1234');
  }  
</script> 

</head> 
 
<body>

 
<DIV class='title_line'>로그인</DIV>

<DIV class='content_body'>  
  <DIV style='width: 80%; margin: 0px auto;'>
    <FORM name='frm' method='POST' action='./login.do' class="form-horizontal">
      <%-- 로그인 후 자동으로 이동할 페이지 전달 ★ --%>
      <input type="hidden" name="return_url" value="${return_url}">
      
      <div class="form-group">
        <label class="col-md-4 control-label" style='font-size: 0.8em;'>아이디</label>    
        <div class="col-md-8">
          <input type='text' class="form-control" name='id' id='id' 
                     value='${ck_id }' required="required" 
                     style='width: 30%;' placeholder="아이디" autofocus="autofocus">
          <Label>   
            <input type='checkbox' name='id_save' value='Y' 
                      ${ck_id_save == 'Y' ? "checked='checked'" : "" }> 저장
          </Label>                   
        </div>
   
      </div>   
   
      <div class="form-group">
        <label class="col-md-4 control-label" style='font-size: 0.8em;'>패스워드</label>    
        <div class="col-md-8">
          <input type='pw' class="form-control" name='pw' id='pw' 
                    value='${ck_pw }' required="required" style='width: 30%;' placeholder="패스워드">
          <Label>
            <input type='checkbox' name='pw_save' value='Y' 
                      ${ck_pw_save == 'Y' ? "checked='checked'" : "" }> 저장
          </Label>
        </div>
      </div>   
   
      <div class="form-group">
        <div class="col-md-offset-4 col-md-8">
          <button type="submit" class="btn btn-primary btn-md">로그인</button>
          <button type='button' onclick="location.href='./create.do'" class="btn btn-primary btn-md">회원가입</button>
          <button type='button' onclick="loadDefault();" class="btn btn-primary btn-md">테스트 계정</button>
        </div>
      </div>   
      
    </FORM>
  </DIV>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

