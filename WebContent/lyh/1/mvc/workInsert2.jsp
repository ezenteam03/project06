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

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
<script type="text/javascript">


	$(document).ready(function(){
		<%-- 
		
		--%>
		
		$("#regBtn").click(function(){
			alert("클릭");
			if(confirm("등록합니다.")){
				$("form").submit();				
			}
		});	
		$("#goMain").click(function(){
			//if(confirm("조회 화면 이동 합니다.")){
			$(location).attr("href","${path}/task.do?method=list");			
			//}
		});	
		$( "#datepicker" ).datepicker({
	    	minDate: 1,
	    	dateFormat: 'yy-mm-dd',    	  
	    	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	   		,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
	    	,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
	    	,yearSuffix: "년"
	    	,showMonthAfterYear:true 
	    	,showOtherMonths: true
    	});
		//var refno = "${task.refno}";
		var isReg= "${param.tname}";
		//&&refno==""
		//if(isReg!=""){
		//	if(!confirm("등록 완료하였습니다\n계속 등록하시겠습니까?")){
		//		$(location).attr("href","${path}/task.do?method=list");	
		//	}
		//}
		
		var is = $("[name=sdate]").val();
		
		
		
		$(".custom-file-input").on("change",function(){
			$(this).next(".custom-file-label").text($(this).val());
		});
	});
</script>
</head>

<body>
<section id="container">
	<jsp:include page="top.jsp"/>

<div class="jumbotron text-left" style="margin-left:200px;">
  <h2><i class="fa fa-angle-right"></i> 업무등록 </h2>
</div>
<div class="container">
	<!-- 파일을 업로드 할 수 있는 type으로 변경 -->
	<form method="post" enctype="multipart/form-data" 
		action="${path}/task.do?method=insert">
	<div class="input-group mb-3">
		<div class="input-group-prepend"> 
			<span class="bg-info text-white input-group-text">업무명</span>
		</div>
		<input name="tname" class="form-control" 
			value="" placeholder="입력하세요" />	
	</div>  
	<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="bg-warning text-white input-group-text">시작일</span>
		</div>
		<input name="sdate" class="form-control" id="datepicker" 
			placeholder="시작일"/>
			<!-- value="<fmt:formatDate type='both' value='${board.credte }'/>"/> -->
		<div class="input-group-prepend">
			<span class="bg-warning text-white input-group-text">마감일</span>
		</div>
		<input name="edate" class="form-control" id="datepicker" 
			placeholder="마감일" value="" />	
		
		
	</div>		
	<div class="input-group-prepend" style="width:555px;">
			<span class="bg-info text-white input-group-text">담당자</span>
			<input name="" class="form-control" style="width:845px; "
			placeholder="" value=""/>	
	</div>
		<br>
		
			
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">업무 내용</span>
		</div>
		<textarea name="detail" rows="10" 
			class="form-control" 
			placeholder="내 맘은 덤더러덤더러덤" ></textarea>		 
	</div> 
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="bg-warning text-white input-group-text">첨부 파일</span>
		</div>
		<div class="custom-file">
			<input type="file" name="" 
				class="custom-file-input" id="file01"/>
			<label class="custom-file-label" for="file01">
			파일 선택</label>
		</div>		
	</div> 	
	
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="bg-warning text-white input-group-text">첨부 파일</span>
		</div>
		<div class="custom-file">
			<input type="file" name="" 
				class="custom-file-input" id="file01"/>
			<label class="custom-file-label" for="file01">
			파일 선택</label>
		</div>		
	</div> 				
	<div style="text-align:right;">
		<input type="button" class="btn btn-info"
			value="등록" id="regBtn"/>
		<input type="button" class="btn btn-success"
			value="조회 화면으로" id="goMain"/>
	</div>
 	
	</form>
</div>

</section>

</body>
</html>