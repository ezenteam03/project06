<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style type="text/css">
	.input-group-text{width:100%;}
	.input-group-prepend{width:20%;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>
		
		var isReg= "${param.title}";
		if(isReg!=""){
			alert("등록이 되었습니다")
			$(location).attr("href","${path}/risk.do?method=list");	
			
		}
		
		
		$("#regBtn").click(function(){
			if(confirm("등록합니다.")){
				$("form").submit();				
			}
		});	
		$("#goMain").click(function(){
			if(confirm("조회 화면 이동 합니다.")){
				$(location).attr("href","${path}/risk.do?method=list");			
			}
		});	
		$(".custom-file-input").on("change",function(){
			$(this).next(".custom-file-label").text($(this).val());
		});
		
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h1>게시판 등록</h1>
</div>
<div class="container">
	<!-- 파일을 업로드 할 수 있는 type으로 변경 -->
	<form method="post" enctype="multipart/form-data"
	 	action="${path}/risk.do?method=insert">
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">제 목</span>
		</div>
		<input name="title" class="form-control" value="${risk.title }" 
			placeholder="제목입력하세요" />	
		 
	</div>  				
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">내 용</span>
		</div>
		<textarea name="detail" rows="10" 
			class="form-control" style="resize:none"
			placeholder="내용입력하세요" ></textarea>		 
	</div> 
<!--  
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">첨부 파일</span>
		</div>
		<div class="custom-file">
			<input type="file" name="report" class="custom-file-input" id="file01"/>
			<label class="custom-file-label" for="file01">
				파일을 선택하세요
			</label>
		</div>	 
	</div> 
-->	
	<div style="text-align:right;">
		<input type="button" class="btn btn-success"
			value="뒤로가기" id="goMain"/>
		<input type="button" class="btn btn-info"
			value="등록" id="regBtn"/>
		
	</div>
	
	
	</form>
</div>

</body>
</html>









