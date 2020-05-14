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
			
		var key = getCookie("key");
	    $("#empno").val(key);
	     
	    if($("#empno").val() != ""){ 
	        $("#ckSave").attr("checked", true); 
	    }
	     
	    $("#ckSave").change(function(){ 	
	        if($("#ckSave").is(":checked")){ 	
	            setCookie("key", $("#empno").val(), 1);
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("key");			
	        }
	    });
	     
	    $("#empno").keyup(function(){ 
	        if($("#ckSave").is(":checked")){ 
	            setCookie("key", $("#empno").val(), 1); 
	        }
	    });
	    

	});
		
	function setCookie(cookieName, value, exdays){		// 쿠키 설정
	    var exdate = new Date();						// 날짜 데이터
	    exdate.setDate(exdate.getDate() + exdays);		// 보관 날짜 +
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){					// 쿠키 삭제
	    var expireDate = new Date();					// 날짜 데이터
	    expireDate.setDate(expireDate.getDate() - 1);	
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {					// 쿠키 가져오기
	    cookieName = cookieName + '=';					
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}

</script>
</head>

<body>

<div id="login-page">
	<div class="container">
		<form class="form-login" action="#" style="margin-top:25%;background-color:#e0e0e0;">
		
			<h2 class="form-login-heading">LOGIN</h2>
			
			<div class="login-wrap">
				<input type="text" class="form-control" id="empno" placeholder="사원번호를 입력하세요" autofocus>
				
				<br>
				
				<input type="password" class="form-control" placeholder="비밀번호를 입력하세요.">
				
				<label class="checkbox">
					<input type="checkbox" value="remember-me" id="ckSave" style="margin-left:1%;"><label>사원번호 저장</label>
				</label>
				
					<span class="pull-left">
						<a data-toggle="modal" href="#">사원번호 찾기</a>
					</span>
					<span class="pull-right">
						<a data-toggle="modal" href="#">비밀번호 찾기</a>
					</span>
				
				<button class="btn btn-theme btn-block" type="submit" style="margin-top:15%;"><i class="fa fa-lock"></i>&nbsp;LOGIN</button>
							
			</div>
			
		</form>
	</div>
</div>


<script src="${path}/Dashio/lib/jquery/jquery.min.js"></script>
<script src="${path}/Dashio/lib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/Dashio/lib/jquery.backstretch.min.js"></script>
<script>

 $.backstretch("${path}/Jin/img/bye.jpg");

//	$.backstretch(["${path}/Jin/img/back1.png", "${path}/Jin/img/back2.png", "${path}/Jin/img/back3.png", "${path}/Jin/img/back4.png"], {
//		duration: 3000, fade: 10
//	});

</script>
  
</body>

</html>