<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

  <!-- Favicons -->
    <link href="${path}/Dashio/css/style.css" rel="stylesheet">
  <link href="${path}/Dashio/css/style-responsive.css" rel="stylesheet">
  <link href="${path}/Dashio/img/favicon.png" rel="icon">
  <link href="${path}/Dashio/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="${path}/Dashio/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="${path}/Dashio/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />


<style type="text/css">
	.sch{width:25%;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>

		$("#regBtn").click(function(){
			if(confirm("등록합니다")){
				$(location).attr("href","${path}/task.do?method=insForm");
			}
		});
		$("#pageSize").change(function(){
			$("#curPage").val(1);

			$("form").submit();
		});
	});
	function go(no){
		$(location).attr("href","${path}/task.do?method=detail&tno="+no);
	}
	function goPage(no){
		$("#curPage").val(no);
		$("form").submit();
	}
	
</script>
</head>
<body>
<section id="container">
	<jsp:include page="top.jsp"/>

<div class="jumbotron text-left" style="margin-left:220px;">
  <h2><i class="fa fa-angle-right"></i> 업무현황 </h2>
</div>
<div class="container">
  <form:form class="form" commandName="tsch" method="post" >
  	<form:hidden path="curPage"/> <!-- 현재 클릭한 페이지 번호. -->
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  
  	<div>
  	
	    <form:input class="form-control mr-sm-2 sch" 
	    		path="tname" placeholder="업무명 검색" style="width:300px;"/>
	    <button class="btn btn-success" type="submit">Search</button>
	    </div>
	    
	    
  	</nav>
  	<br>
 	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text "> 총 : ${tsch.count}건</span>
		</div>
		
		<div class="input-group-append">
			<span class="input-group-text">페이지 크기:</span>
			<form:select path="pageSize" class="form-control">
				<form:option value="3">3</form:option >
				<form:option value="5">5</form:option >
				<form:option value="10">10</form:option >
				<form:option value="20">20</form:option >
				<form:option value="30">30</form:option >
			</form:select> 

		</div>
		
	</div> 
	<div style="text-align:right;">
			<c:if test="0"></c:if> <!-- 팀장권한이 있으면 등록버튼이 보이게 -->
			    <button class="btn btn-info" id="regBtn" type="button">등록</button>
		</div> 
  </form:form>
  <div class="col-md-12 mt">
            <div class="content-panel">
      <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="50%">
   	<col width="15%">
   	<col width="15%">
   	<col width="10%">
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
        <th>담당자</th>
        <th> </th>
        <th> </th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="task" items="${tlist}">	
      <tr class="text-center" 
      	onclick="javascript:go(${task.tno})">
        <td>${task.tno}</td>
   
        <td class="text-left">
        	 ${task.tname}</td>
        <td class="text-center"></td>
        <td><fmt:formatDate value=""/> </td>
        <td></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>   
  
  
	
	</div>
	
	<div style="text-align:center;">
	<ul class="pagination justify-content-center" style="margin:20px 0">
	    <li class="page-item">
	    <a class="page-link" href="javascript:goPage(${tsch.startBlock-1})">Previous</a></li>
	    <c:forEach var="cnt" begin="${tsch.startBlock}" end="${tsch.endBlock}">
		  <li class="page-item ${tsch.curPage==cnt?'active':''}">
		  
		  	<a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a></li>
		</c:forEach>
		<li class="page-item">
		<a class="page-link" href="javascript:goPage(${(tsch.endBlock==tsch.pageCount)?tsch.endBlock:tsch.endBlock+1})">Next</a></li>
	</ul>  
		
	</div>
  </div>

</div>
</section>

</body>
</html>