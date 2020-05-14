<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
  
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
  <script src="${path}/Dashio/lib/jquery/jquery.min.js"></script>
  
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#findBtn").click(function(){
			if($("#name").val() == ""){
				Swal.fire(
					'이름',
					'이름을 입력하세요',
					'error'
				);
	    	}else if($("#email").val() == ""){
	    		Swal.fire(
					'이메일',
					'이메일을 입력하세요',
					'error'
				);
	    	}else{
	    		$("#findEnoForm").submit();
	    	}
			
		});
		
		var ck = "${ck}";
		if(ck==1){
			alert("이름/이메일 확인");
		}


	});
	


</script>
</head>

<body>

<div id="login-page">
	<div class="container">
		<form class="form-login" id="findEnoForm" action="${path}/PMSemp.do?method=findEno" method="post" style="margin-top:25%;background-color:#e0e0e0;;">
		
			<h2 class="form-login-heading">FIND EMPNO</h2>
			
			<div class="login-wrap">
				<label>이름</label>
				<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요" autofocus>
				
				<br>
				
				<label>이메일</label>
				<input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요">
				
				<button class="btn btn-theme btn-block" type="button" id="findBtn" style="margin-top:10%;"><i class="fa fa-search"></i>&nbsp;FIND</button>
			</div>
		</form>
	</div>
</div>


<script src="${path}/Dashio/lib/jquery/jquery.min.js"></script>
<script src="${path}/Dashio/lib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/Dashio/lib/jquery.backstretch.min.js"></script>
<script>

//$.backstretch("${path}/Jin/img/bye.jpg");

$.backstretch(["${path}/Jin/img/back1.png", "${path}/Jin/img/back2.png", "${path}/Jin/img/back3.png", "${path}/Jin/img/back4.png"], {
	duration: 3000, fade: 10
});

</script>
  
</body>

</html>

