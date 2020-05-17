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
			$(location).attr("href","${path}/task.do?method=list");			
		});	
		$(".fileInfo").click(function(){
			var fname=$(this).val();
			if(confirm("다운로드하시겠습니까?")){
				$(location).attr("href",
					"${path}/task.do?method=download&fname="+fname);	
			}
			
		});
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				$("form").attr("action","${path}/task.do?method=update");
				$("form").submit();
			}
		});
		$(".custom-file-input").on("change",function(){
			$(this).next(".custom-file-label").text($(this).val());
		});	
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				var no = $("input[name=tno]").val();
				$(location).attr("href","${path}/task.do?method=delete&tno="+no);					
			}
		});

		$("#coment").click(function(){
			if(confirm("사유 다시겠습니까?")){
				$("form").attr("action","${path}/task.do?method=coment");
				$("form").submit();
			}
		});
	});
</script>
</head>

<body>
<section id="container">
	<jsp:include page="top.jsp"/>

<div class="jumbotron text-left" style="margin-left:200px;">
  <h2><i class="fa fa-angle-right"></i> 업무상세 </h2>
</div>

<div class="container">
	<form method="post"  enctype="multipart/form-data" >
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text ">글번호</span>
		</div>
		<input name="tno" class="form-control" readonly style="background:white;"
			value="${task.tno}"/>	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="input-group-text">담 당 자</span>
		</div>
		<input name="writer" class="form-control" readonly style="background:white;"
			value="${task.mno}" 
			placeholder="" />	
		
	</div>		
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">업무명</span>
		</div>
		<input name="tname" class="form-control"
			value="${task.tname}"  
			placeholder="제목입력하세요" />	
		 
	</div>  	
	<div class="input-group mb-3">	
		
			
			
	</div>		
	<div class="input-group mb-3">	
	<div class="input-group-prepend">
			<span class="bg-warning text-white input-group-text">시작일</span>
		</div>
		<input class="form-control" readonly style="background:white;"
			value="${task.sdate}"/>	
			<!--  -->
		<div class="input-group-prepend">
			<span class="bg-warning text-white input-group-text">마감일</span>
		</div>
		<input class="form-control"  readonly style="background:white;"
			value="${task.edate}"/>	
			<!-- <fmt:formatDate type='both' value='${board.credte }'/> -->
	</div>
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">업 무 내 용</span>
		</div>
		<textarea name="detail" rows="10" 
			class="form-control" 
			placeholder="내용입력하세요" >${task.detail}</textarea>		 
	</div> 
	<!-- 
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
	</c:forEach>	 -->
	<div class="input-group mb-3">
			<span class="bg-warning text-white input-group-text" style="width:220px;">결재 여부</span>
			<c:choose>
				<c:when test="${task.tdiv==21}">
				<span class="input-group-text" style="width:330px; background:white;">업무수행중</span>
				</c:when>
				<c:when test="${task.tdiv==22}">
				<span class="input-group-text" style="width:330px; background:white;">결재신청</span>
				</c:when>
				<c:when test="${task.tdiv==23}">
				반려
				</c:when>
				<c:when test="${task.tdiv==24}">
				결재완료
				</c:when>
			</c:choose>
			
			<div class="input-group-prepend">
				<span class="bg-warning text-white input-group-text" style="width:220px;">진행률</span>
				<span class="= input-group-text" style="width:330px; background:white;">${task.prog }</span>
			</div>
		</div>
		
		<br>
		
		
		
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">반려 사유</span>
		</div>
		<textarea name="coment" rows="2" 
			class="form-control" 
			placeholder="사유를 입력하세요" >${task.coment}</textarea>
			<input type="button" class="btn btn-success"
			value="사유 등록" id="coment"/>		 
	</div> 
	<div style="text-align:left;">
	
	</div>
	<div style="text-align:right;">
		<input type="button" class="btn btn-info"
			value="수정" id="uptBtn"/>
		<input type="button" class="btn btn-danger"
			value="삭제" id="delBtn"/>		
			
		<input type="button" class="btn btn-success"
			value="조회 화면으로" id="goMain"/>
	</div>
	</form>
</div>	
</section>

</body>
</html>