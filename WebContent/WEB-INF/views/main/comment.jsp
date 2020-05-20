<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>
</script>
</head>
<body>
<div id="popup" class="overlay">
	<div class="popup">
		<a href="#none" class="close">&times;</a>
	
		<form class="form-login" id="inforCheckForm" method="post" style="background-color:#e0e0e0;margin-top:0%">

		<h2 class="form-login-heading">댓글 수정</h2>
		<div class="login-wrap">
			<label>작성자</label>
			<input type="text" class="form-control" value="${emp.name}" readonly="readonly"/>
			
			<br>
			<label>작성일</label><br>
			<fmt:formatDate type='both' value='${comment.wdate}'/>
			
			<br>
			
			<label>댓글 내용</label>
				<input type="text" class="form-control" value="${param.cdetail}" name="cdetail"/>
		
			<button class="btn btn-theme btn-block" type="button" id="inforBtn" style="margin-top:10%;"><i class="fa fa-lock"></i>&nbsp;CHECK</button>
								
		</div>
			
		</form>
	</div>
</div>
</body>
<script type="text/javascript">

</script>
</html>