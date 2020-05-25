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
	
		var isD= "${param.detail}";
		if(isD!=""){
			alert("등록이 되었습니다");
			opener.parent.location.reload();
			window.close();
			
		}
	});
		
</script>
</head>
<body>
<form method="post" enctype="multipart/form-data" id="cform"
	 	action="${path}/risk.do?method=ccinsert">	
	     <input name="refno" type="hidden"
			 value="${comment.refno}" />	 	
	     <input name="ino" type="hidden"
			 value="${param.ino}" />	 		  	
	  	 <input name="mno" type="hidden"
			 value="${mno}" />		  		
	<!-- 댓글 -->
	<div id="comment">
	<div class="input-group mb-3">		
	<div class="input-group-prepend">
		<span class="bg-success text-white input-group-text">제 목</span>
		</div>
		<input name="title" class="form-control" id="title"
			value="${risk.title}"  
			placeholder="제목입력하세요" />	
	</div>
	<div class="input-group mb-3">		
	<div class="input-group-prepend">
		<span class="bg-success text-white input-group-text">제 목</span>
		</div>
		<input name="title" class="form-control" id="title"
			value="${risk.title}"  
			placeholder="제목입력하세요" />	
	</div>
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="bg-info text-white input-group-text">댓글</span>
		</div>	
		<textarea  rows="5" style="resize:none; "
			class="form-control" name="detail"
			placeholder="내용입력하세요" >${comment.detail}</textarea>	
			 
	</div> 
	<div style="text-align:right;" >
			<button class="btn bg-warning" id="cmtBtn">입력</button>
	</div>	
	</div></form>
</body>
<script type="text/javascript">

</script>
</html>