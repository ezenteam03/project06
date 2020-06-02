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
	
		 $("#cmtBtn").click(function(){
		    	if($("#detxt").val() == ""){
		    		alert("입력된 내용이 없습니다.");
		    	}else{
					$("#cform").submit();	
		    	}
		  });
		
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
			<span class="bg-info text-white input-group-text">댓글</span>
		</div>	
		<textarea  rows="5" style="resize:none; "
			class="form-control" name="detail" id="detxt"
			placeholder="내용입력하세요" >${comment.detail}</textarea>	
			 
	</div> 
	<div style="text-align:right;" >
			<input type="button" class="btn btn-info"
			value="입력" id="cmtBtn"/>
	</div>	
	</div></form>
</body>
<script type="text/javascript">

</script>
</html>