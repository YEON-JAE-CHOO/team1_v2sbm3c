<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>다음 지도</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<DIV class='content'>
 
  <DIV style='width:640px; height: 380px; margin: 0px auto;'>
  <!-- ********** 지도 API 서비스 소스 시작 ********** -->
  
<!--
* 카카오맵 - 약도서비스
* 한 페이지 내에 약도를 2개 이상 넣을 경우에는
* 약도의 수 만큼 소스를 새로 생성, 삽입해야 합니다.
-->
<!-- 1. 약도 노드 -->
<div id="daumRoughmapContainer1554426285926" class="root_daum_roughmap root_daum_roughmap_landing"></div>
 
<!-- 2. 설치 스크립트 -->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
 
<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
new daum.roughmap.Lander({
"timestamp" : "1554426285926",
"key" : "sxpk",
"mapWidth" : "640",
"mapHeight" : "360"
}).render();
</script>
 
 
<!-- ********** 지도 API 서비스 소스 종료 ********** -->
 
</DIV>
 
 
</DIV> <!-- content END -->
</DIV> <!-- container END -->
 
</body>
</html>