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
<link rel="stylesheet" href="${path}/a00_com/bootstrap.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#goMain").click(function(){
			$(location).attr("href","${path}/meet.do?method=list");			
		});	
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				$("#form").attr("action","${path}/meet.do?method=update");
				$("#form").submit();
			}
		});
		
	
		$(".custom-file-input").on("change",function(){
			$(this).next(".custom-file-label").text($(this).val());
		});	
		$(".fileInfo").click(function(){
			var fname=$(this).val();
			if(confirm("다운로드하시겠습니까?")){
				$(location).attr("href",
					"${path}/meet.do?method=download&fname="+fname);	
			}
			
		});
		
				
		$("#cmtBtn").click(function(){		
			alert("등록이 되었습니다");
			$("#cform").submit();
												
		});	

		
		
</script>
</head>
<body>
<section id="container">
	<jsp:include page="top.jsp"/>

<div class="container">
	<form method="post"  enctype="multipart/form-data" id="form"
	action="${path}/meet.do?method=comment">
	<input name="mnno" type="hidden" value="${meet.mnno }"/>
<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="input-group-text">작성자</span>
		</div>
		<input class="form-control" disabled="disabled"  style="background-color: #ffffff;"
			value="${meet.name }" placeholder="작성자입력하세요"/>	
			
		<div class="input-group-prepend">
			<span class="input-group-text">작 성 일</span>
		</div>
		<input  class="form-control" disabled="disabled"  style="background-color: #ffffff;"
			value="<fmt:formatDate type='both' value='${meet.wdate }'/>" 
			 />	
	
	</div>		
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">제 목</span>
		</div>
		<input name="topic" class="form-control"
			value="${meet.topic}"  
			placeholder="제목입력하세요" />	
		<div class="input-group-prepend">
			<span class="input-group-text">수정일</span>
		</div>
		<input class="form-control" disabled="disabled"  style="background-color: #ffffff;"
			value="<fmt:formatDate type='both' value='${meet.chdate}'/>" />	
		 
	</div>  	
		
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">내 용</span>
		</div>
		<textarea name="detail" rows="10" style="resize:none"
			class="form-control" 
			placeholder="내용입력하세요" >${meet.detail}</textarea>		 
	</div> 

	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">첨부 파일</span>
		</div>
		<input class="form-control fileInfo" name="fnames"
			value="${meet.filenames[0]}" />	
		<div class="custom-file">
			<input type="file" name="report" 
				class="custom-file-input" id="file01"/>
			<label class="custom-file-label" for="file01">
			변경할려면 파일을 선택하세요!</label>
		</div>			
		 
	</div> 	
	


 

	<div style="text-align:right;">
		<input type="button" class="btn btn-info"
			value="뒤로가기" id="goMain"/>		
		<input type="button" class="btn btn-warning"
			value="수정" id="uptBtn"/>					
		
	</div>
	
	<br>
	</form>
	
	


	</div>
	</section>
</body>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<link rel="stylesheet" href="${path}/a00_com/bootstrap.css" >

<style type="text/css">
	.input-group-text{width:100%;}
	.input-group-prepend{width:20%;}
	.input-group-append{width:20%;}
.num2{width: 12%}
.num{width: 10%}
.txt{width: 48%}

</style>
<script type="text/javascript">
var regBtn = document.querySelector("#regBtn");
var close = document.querySelector("#close");
function go(ino){
	cdetail.style.visibility="visible";
}
close.onclick=function(){
	regDiv.style.visibility="hidden";
}	
	
</script>
</html>