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
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/bootstrap.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Dashio - Bootstrap Admin Template</title>

  <!-- Favicons -->
  <link href="${path}/Dashio/img/favicon.png" rel="icon">
  <link href="${path}/Dashio/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="${path}/Dashio/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="${path}/Dashio/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="${path}/Dashio/css/style.css" rel="stylesheet">
  <link href="${path}/Dashio/css/style-responsive.css" rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#regBtn").click(function(){
			
				$(location).attr("href","${path}/risk.do?method=insForm");
			
		});
	});
	function go(rno){
		$(location).attr("href","${path}/risk.do?method=detail&rno="+rno);
	}
	function goPage(no){
		$("#curPage").val(no);
		$("form").submit();
	}
</script>
<style>
.jumbotron{background-color:#22D6B2; }
.pagination{margin-left:70%;float:left; }
</style>
</head>

<body>
<div class="jumbotron text-center">
  <h1>공지사항</h1>
</div>
<div class="container">
 <form:form class="form" commandName="rsch" method="post" >
 <form:hidden path="curPage"/>
 
 <div class="input-group mb-3">
	
		<div class="input-group-append">
			<span class="input-group-text">페이지 크기:</span>
			<form:select path="pageSize" class="form-control">
	
			<form:option value="5">5</form:option>
			<form:option value="10">10</form:option>
			<form:option value="20">20</form:option>		
			 </form:select>			
		</div>
		
		     <button class="btn btn-success" type="submit">Search</button>
	</div>  
<div class="col-md-12 mt">
            <div class="content-panel">
   <table class="table table-hover">
    <thead>
      <tr class="table-secondary text-center">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
      </tr>
    </thead>
    <tbody>
     
      <tr class="text-center">
        <td>ㅁㅁ</td>
        <td class="text-left">ㅁㅁ</td>
        <td class="text-center">ㅁㅁ</td>
        <td>ㅁㅁ</td>
      </tr>
     
    </tbody>
  </table>  
</div></div>
<!-- 페이징 -->
	<div align="center">
	 <ul class="pagination" >
	  <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
	  <c:forEach var="cnt" begin="1" end="${rsch.pageCount }">
	  <li class="page-item ${rsch.curPage==cnt?'active':''}">
	  	<a class="page-link" href="javascript:goPage(${cnt })">${cnt }</a></li>
	  </c:forEach>
	  <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
	</ul>
    <button  class="btn btn-info" id="regBtn" type="button">작성</button>
	</div>

  
<div>
 
</div>
  
  
   </form:form>
</div>
</body>
<script type="text/javascript">

</script>
</html>