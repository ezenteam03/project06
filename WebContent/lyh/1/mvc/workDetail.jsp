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
<meta name="viewport" content="width=device-width, initial-scale=1">
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
		var login = 0;
		$("#goMain").click(function(){
			$(location).attr("href","${path}/work.do?method=list");			
		});	
		$(".fileInfo").click(function(){
			var fname=$(this).val();
			if(confirm("다운로드하시겠습니까?")){
				$(location).attr("href",
					"${path}/work.do?method=download&fname="+fname);	
			}
			
		});
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				$("form").attr("action","${path}/work.do?method=update");
				$("form").submit();
			}
		});
		$(".custom-file-input").on("change",function(){
			$(this).next(".custom-file-label").text($(this).val());
		});	
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				var no = $("input[name=no]").val();
				$(location).attr("href","${path}/work.do?method=delete&no="+no);					
			}
		});
		$("#reBtn").click(function(){
			if(confirm("답글을 달겠습니다!")){
				$("form").attr("action",
						"${path}/work.do?method=reply");
				$("form").submit();
			}
		});
		$("#comment").click(function(){
			if(confirm("코멘트 다시겠습니까?")){
				$("form").attr("action","${path}/work.do?method=comt");
				$("form").submit();
			}
		});
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h1>업무 상세</h1>
</div>
<c:if test="${board.no == 51}"> <!-- 팀원권한일때 수정불가.. -->
<div class="container">
	<form method="post"  enctype="multipart/form-data" >
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text ">글번호</span>
		</div>
		<input name="no" class="form-control" readonly style="background:white;"
			value="${board.no}"/>	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="input-group-text">작 성 자</span>
		</div>
		<input name="writer" class="form-control" readonly style="background:white;"
			value="${board.writer}" 
			placeholder="작성자입력하세요" />	
		<div class="input-group-prepend">
			<span class="input-group-text">조회수</span>
		</div>
		<input  class="form-control" readonly style="background:white;"
			 value="${board.readcnt}" />
	</div>		
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">제 목</span>
		</div>
		<input name="title" class="form-control"
			value="${board.title}"  
			placeholder="제목입력하세요" />	
		 
	</div>  	
	<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="bg-info text-white input-group-text">등록일</span>
		</div>
		<input class="form-control" readonly style="background:white;"
			value="<fmt:formatDate type='both' value='${board.credte }'/>"/>	
		<div class="input-group-prepend">
			<span class="bg-info text-white input-group-text">수정일</span>
		</div>
		<input class="form-control" readonly style="background:white;"
			value="<fmt:formatDate type='both' value='${board.uptdte }'/>" />	
			
			
	</div>		
	<div class="input-group mb-3">	
	<div class="input-group-prepend">
			<span class="bg-warning text-white input-group-text">시작일</span>
		</div>
		<input class="form-control" readonly style="background:white;"
			value="지금당ㅈ"/>
			<!-- <fmt:formatDate type='both' value='${board.credte }'/> -->
		<div class="input-group-prepend">
			<span class="bg-warning text-white input-group-text">마감일</span>
		</div>
		<input class="form-control"  readonly style="background:white;"
			value="빨리 ㅋㅋ"/>
			<!-- <fmt:formatDate type='both' value='${board.credte }'/> -->
	</div>
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">업 무 내 용</span>
		</div>
		<textarea name="content" rows="10" 
			class="form-control" 
			placeholder="내용입력하세요" >${board.content}</textarea>		 
	</div> 
	<c:forEach var="fname"  begin="1" end="2"
		 varStatus="sts">
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">첨부 파일( ${sts.count} / 2 )</span>
		</div>
		<input class="form-control fileInfo" name="fnames"
			value="${board.filenames[sts.index-1]}" />	
		<div class="custom-file">
			<input type="file" name="report" 
				class="custom-file-input" id="file01"/>
			<label class="custom-file-label" for="file01">
			변경할려면 파일을 선택하세요!</label>
		</div>			
		 
		
	</div> 	
	</c:forEach>
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">반려 코멘트</span>
		</div>
		<textarea name="rcomment" rows="2" 
			class="form-control" 
			placeholder="코멘트를 입력하세요" >${board.rcomment}</textarea>
			<input type="button" class="btn btn-success"
			value="코멘트 등록" id="comment"/>		 
	</div> 
	<div style="text-align:left;">
	
	</div>
	<div style="text-align:right;">
		<input type="button" class="btn btn-info"
			value="수정" id="uptBtn"/>
		<input type="button" class="btn btn-danger"
			value="삭제" id="delBtn"/>		
		<input type="button" class="btn btn-warning"
			value="답글" id="reBtn"/>					
		<input type="button" class="btn btn-success"
			value="조회 화면으로" id="goMain"/>
	</div>
	</form>
</div>	
</c:if>
</body>
</html>