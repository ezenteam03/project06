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
		$("#delbt").click(function(){
			if(confirm("삭제하시겠습니까?")){
				var rno = $("input[name=rno]").val();
				$(location).attr("href","${path}/risk.do?method=delete&rno="+rno);	
				opener.parent.location.reload();
				window.close();
			}
		});
		$("#insbt").click(function(){		
			if(confirm("수정합니다.")){
				$("form").submit();	
				opener.parent.location.reload();
				window.close();
		}	
	});
});
		
</script>
</head>
<body>
<div class="overlay">
	<div >
			
		<form method="post"  enctype="multipart/form-data" action="${path}/risk.do?method=cupdate">
			<input name="rno" type="hidden" value="${comment.rno}"/>	
		<h2 class="form-login-heading">댓글 수정</h2>
		<div class="login-wrap">
			<label>작성자</label>
			<input type="text" class="form-control" value="${comment.name}" readonly="readonly"/>
			
			<br>
			<label>작성일</label><br>
			<fmt:formatDate type='both'  value='${comment.wdate}'/>
			
			<br>
			
			<label>댓글 내용</label>
				<textarea  rows="2" style="resize:none" 
					class="form-control" name="detail"
					placeholder="내용입력하세요" >${comment.detail}</textarea>	
			<input type="button" id="insbt" value="수정"/>					
			<input type="button" id="delbt" value="삭제"/>					
		</div>
			
		</form>
	</div>
</div>
</body>
<script type="text/javascript">

</script>
</html>