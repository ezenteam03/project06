<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Dashio - Bootstrap Admin Template</title>

  <!-- Favicons -->
  <link href="${path}/Dashio/img/favicon.png" rel="icon">
  <link href="${path}/Dashio/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="${path}/Dashio/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="${path}/Dashio/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="${path}/Dashio/css/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="${path}/Dashio/lib/gritter/css/jquery.gritter.css" />
  <!-- Custom styles for this template -->
  <link href="${path}/Dashio/css/style.css" rel="stylesheet">
  <link href="${path}/Dashio/css/style-responsive.css" rel="stylesheet">
  <script src="${path}/Dashio/lib/chart-master/Chart.js"></script>

  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
  <script src="${path}/Dashio/lib/jquery/jquery.min.js"></script>
  
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#pass01").keyup(function(){
			var num = checkPW($(this).val());
			if(num == 1){
				$("#txtOut01").text("8~20자리로 적어주세요");
			}else if(num == 2){
				$("#txtOut01").text("공백은 사용이 불가능합니다");
			}else if(num == 3){
				$("#txtOut01").text("숫자,영문,특수문자로 조합하세요");
			}else{
				$("#txtOut01").text("사용 가능한 비밀번호입니다");
			}
			
		});
		
		$("#pass02").keyup(function(){
			if($("#pass01").val() == $(this).val()){
				$("#txtOut02").text("비밀번호가 일치합니다.");
			}else{
				$("#txtOut02").text("비밀번호가 일치하지 않습니다.");
			}
		});

	});
	
	function checkPW(pass){
		var pass01 = pass;
		var num = pass01.search(/[0-9]/g);
		var eng = pass01.search(/[a-z]/ig);
		var spe = pass01.search(/[`~!@#$%^&*;:\/?]/gi);
		
		if(pass01.length < 8 || pass01.length > 20){ // 8~20
			return 1;
		}else if(pass01.search(/\s/) != -1){	// 공백
			return 2;
		}else if(num < 0 || eng < 0 || spe < 0) {	// 숫자영문특수문자
			return 3;
		}else{
			return 0;
		}
	}

</script>
</head>

<body>

<div id="login-page">
	<div class="container">
		<form class="form-login" action="#" style="margin-top:20%;background-color:#e0e0e0;;">
		
			<h2 class="form-login-heading">FIND PASSWORD</h2>
			
			<div class="login-wrap">
				<label>새 비밀번호</label>
				<input type="password" class="form-control" id="pass01" placeholder="새 비밀번호를 입력하세요" autofocus>
				
				<div id="txtOut01"></div>
				
				<br>
			
				<label>새 비밀번호 확인</label>
				<input type="password" class="form-control" id="pass02" placeholder="새 비밀번호 재입력">
				
				<div id="txtOut02"></div>
				
				<button class="btn btn-theme btn-block" type="button" style="margin-top:10%;"><i class="fa fa-search"></i>&nbsp;CHANGE</button>
			</div>
		</form>
	</div>
</div>



<script src="${path}/Dashio/lib/jquery/jquery.min.js"></script>
<script src="${path}/Dashio/lib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/Dashio/lib/jquery.backstretch.min.js"></script>
<script>

//$.backstretch("img/back1.png");

	$.backstretch(["${path}/Jin/img/back1.png", "${path}/Jin/img/back2.png", "${path}/Jin/img/back3.png", "${path}/Jin/img/back4.png"], {
		duration: 3000, fade: 10
	});

</script>
  
</body>

</html>



=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Dashio - Bootstrap Admin Template</title>

  <!-- Favicons -->
  <link href="${path}/Dashio/img/favicon.png" rel="icon">
  <link href="${path}/Dashio/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="${path}/Dashio/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="${path}/Dashio/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="${path}/Dashio/css/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="${path}/Dashio/lib/gritter/css/jquery.gritter.css" />
  <!-- Custom styles for this template -->
  <link href="${path}/Dashio/css/style.css" rel="stylesheet">
  <link href="${path}/Dashio/css/style-responsive.css" rel="stylesheet">
  <script src="${path}/Dashio/lib/chart-master/Chart.js"></script>

  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
  <script src="${path}/Dashio/lib/jquery/jquery.min.js"></script>
  
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#pass01").keyup(function(){
			var num = checkPW($(this).val());
			if(num == 1){
				$("#txtOut01").text("8~20자리로 적어주세요");
			}else if(num == 2){
				$("#txtOut01").text("공백은 사용이 불가능합니다");
			}else if(num == 3){
				$("#txtOut01").text("숫자,영문,특수문자로 조합하세요");
			}else{
				$("#txtOut01").text("사용 가능한 비밀번호입니다");
			}
			
		});
		
		$("#pass02").keyup(function(){
			if($("#pass01").val() == $(this).val()){
				$("#txtOut02").text("비밀번호가 일치합니다.");
			}else{
				$("#txtOut02").text("비밀번호가 일치하지 않습니다.");
			}
		});

	});
	
	function checkPW(pass){
		var pass01 = pass;
		var num = pass01.search(/[0-9]/g);
		var eng = pass01.search(/[a-z]/ig);
		var spe = pass01.search(/[`~!@#$%^&*;:\/?]/gi);
		
		if(pass01.length < 8 || pass01.length > 20){ // 8~20
			return 1;
		}else if(pass01.search(/\s/) != -1){	// 공백
			return 2;
		}else if(num < 0 || eng < 0 || spe < 0) {	// 숫자영문특수문자
			return 3;
		}else{
			return 0;
		}
	}

</script>
</head>

<body>

<div id="login-page">
	<div class="container">
		<form class="form-login" action="#" style="margin-top:20%;background-color:#e0e0e0;;">
		
			<h2 class="form-login-heading">FIND PASSWORD</h2>
			
			<div class="login-wrap">
				<label>새 비밀번호</label>
				<input type="password" class="form-control" id="pass01" placeholder="새 비밀번호를 입력하세요" autofocus>
				
				<div id="txtOut01"></div>
				
				<br>
			
				<label>새 비밀번호 확인</label>
				<input type="password" class="form-control" id="pass02" placeholder="새 비밀번호 재입력">
				
				<div id="txtOut02"></div>
				
				<button class="btn btn-theme btn-block" type="button" style="margin-top:10%;"><i class="fa fa-search"></i>&nbsp;CHANGE</button>
			</div>
		</form>
	</div>
</div>



<script src="${path}/Dashio/lib/jquery/jquery.min.js"></script>
<script src="${path}/Dashio/lib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/Dashio/lib/jquery.backstretch.min.js"></script>
<script>

//$.backstretch("img/back1.png");

$.backstretch(["img/back1.png", "img/back2.png", "img/back3.png", "img/back4.png"], {
	duration: 3000, fade: 10
});

</script>
  
</body>

</html>



>>>>>>> 464e7e7c54f8dc7657aa038afd90e4a686277f3f
