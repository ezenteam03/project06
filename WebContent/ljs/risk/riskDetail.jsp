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
<style type="text/css">
	.input-group-text{width:100%;}
	.input-group-prepend{width:20%;}
	.input-group-append{width:20%;}

</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goMain").click(function(){
			$(location).attr("href","${path}/risk.do?method=list");			
		});	
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				$("form").attr("action","${path}/risk.do?method=update");
				$("form").submit();
			}
		});
	});
		
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h1>게시판 상세화면.</h1>
</div>
<div class="container">
	<form method="post"  enctype="multipart/form-data" >
<input name="rno" value="${risk.rno }" type="hidden" />		
<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="input-group-text">작성자</span>
		</div>
		<input name="title" class="form-control" disabled="disabled"  style="background-color: #ffffff;"
			value="${risk.title}" placeholder="작성자입력하세요"/>	
			
		<div class="input-group-prepend">
			<span class="input-group-text">작 성 일</span>
		</div>
		<input name="ndate" class="form-control" disabled="disabled"  style="background-color: #ffffff;"
			value="<fmt:formatDate type='both' value='${risk.ndate }'/>" 
			 />	
	
	</div>		
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">제 목</span>
		</div>
		<input name="title" class="form-control"
			value="${risk.title}"  
			placeholder="제목입력하세요" />	
		<div class="input-group-prepend">
			<span class="input-group-text">수정일</span>
		</div>
		<input class="form-control" disabled="disabled"  style="background-color: #ffffff;"
			value="<fmt:formatDate type='both' value='${risk.r_update}'/>" />	
		 
	</div>  	
		
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">내 용</span>
		</div>
		<textarea name="detail" rows="10" style="resize:none"
			class="form-control" 
			placeholder="내용입력하세요" >${risk.detail}</textarea>		 
	</div> 
<!-- 
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">첨부 파일</span>
		</div>
		<input class="form-control fileInfo" name="fnames"
			value="${risk.filenames[sts.index-1]}" />	
		<div class="custom-file">
			<input type="file" name="report" 
				class="custom-file-input" id="file01"/>
			<label class="custom-file-label" for="file01">
			변경할려면 파일을 선택하세요!</label>
		</div>			
		 
	</div> 	
 -->	
	<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="input-group-text">코멘트 작성자</span>
		</div>
		<input name="title" class="form-control" 
			value="${risk.title}" placeholder="작성자입력하세요"/>	
			
		<div class="input-group-prepend">
			<span class="input-group-text">코멘트 작성일</span>
		</div>
		<input name="ndate" class="form-control" 
			value="<fmt:formatDate type='both' value='${risk.cdate }'/>" 
			 />	
	</div>	
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">코멘트</span>
		</div>
		<textarea name="detail" rows="5" style="resize:none"
			class="form-control" 
			placeholder="내용입력하세요" >${risk.r_comment}</textarea>		 
	</div> 

	<div style="text-align:right;">
		<input type="button" class="btn btn-info"
			value="뒤로가기" id="goMain"/>		
		<input type="button" class="btn btn-warning"
			value="수정" id="uptBtn"/>					
		<input type="button" class="btn btn-success"
			value="코멘트 저장" id="cuptBt"/>
	</div>
	
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">댓글</span>
		</div>
		
		<textarea name="detail" rows="5" style="resize:none; "
			class="form-control" 
			placeholder="내용입력하세요" >${risk.detail}</textarea>	
		<div class="input-group-append">
			<button style="width:50%;">입력</button>
		</div>		 
	</div> 
	</form>
	</div>
</body>
<script type="text/javascript">

</script>
</html>