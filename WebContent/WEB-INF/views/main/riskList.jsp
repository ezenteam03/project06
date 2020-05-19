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
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
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
	function go(ino){
		$(location).attr("href","${path}/risk.do?method=detail&ino="+ino);		
		
	}
	function goPage(no){
		$("#curPage").val(no);
		$("form").submit();
	}
</script>
<style>
.jumbotron{background-color:#22D6B2; }
.pagination{margin-left:1%;float:left; }
#regBtn{margin: 20px; }
.Rtable{margin-top: 20%}
/*#F3969A*/

#num{width:10%}
#title{width:40%}
#name{width:20%}
#date{width:20%}
#views{width:10%}
#all{padding: 2px}
</style>
</head>
<body>
  <section id="container">
	<jsp:include page="top.jsp"/>
	 <section id="main-content">
      <section class="wrapper">
<div id="all">
        <div class="row">
         <!-- /col-md-12 -->
          <div class="col-md-12 mt">
            <div class="content-panel">
             <h4><i class="fa fa-th"></i>&ensp;  이슈리스트 </h4>

				 <form:form class="form" commandName="rsch" method="post" >
				 <form:hidden path="curPage"/>   

	 			<div style="float:left; height:34px">
				<span style="height:34px" class="input-group-text">페이지 크기:</span>
				</div>
				 <div style="float:left; margin-right: 5px">
				<form:select  path="pageSize" class="form-control" style="width:100px;float:left; ">
		
				<form:option value="5">5</form:option>
				<form:option value="10">10</form:option>
				<form:option value="20">20</form:option>		
				 </form:select>	
				 </div>
				 <div style="float:left;"> 
				<span class="input-group-text" style="height:34px">프로젝트 번호:</span>
				</div>
				 <div style="float:left; margin-right: 5px">
				<form:select path="pno" class="form-control" style="width:100px;float:left; ">
		
				<form:option value="1001">1001</form:option>
				<form:option value="1002">1002</form:option>	
				 </form:select>	
				 </div>
			  <div style="float:left;">
			 <button class="btn btn-success" type="submit">선택</button>	
			 </div>	
		
			<div style="float:right;">
			 			 <button  class="btn btn-success" type="submit" >검색</button>
			 		</div>
			 		<div  style="float:right;">
				  <form:input style="width: 200px" class="form-control mr-sm-2" path="name" placeholder="작성자"/>
				  
				  </div>
				  <div  style="float:right;">
				  <form:input style="width: 200px" class="form-control mr-sm-2"  path="title" placeholder="제목"/>
				  </div>
				   
			 		
			 		
			 
		     
   <table class="table table-hover" >
    <thead>
      <tr class="text-left">
        <th id="num">번호</th>
        <th id="title">제목</th>
        <th id="name">작성자</th>
        <th id="date">작성일</th>
        <th id="views">조회수</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="risk" items="${rlist}">	
      <tr class="text-left" onclick="go(${risk.ino})">
        <td class="text-left">${risk.cnt}</td>
        <td class="text-left">${risk.title}</td>
        <td class="text-left">${risk.name}</td>
        <td class="text-left"><fmt:formatDate value="${risk.wdate}"/> </td>
        <td>${risk.views}</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>  

<!-- 페이징 -->
	
	 <ul class="pagination" >
	  <li class="page-item"><a class="page-link"href="javascript:goPage(${rsch.startBlock-1});">&laquo;</a></li>
	  <c:forEach var="cnt" begin="${rsch.startBlock }" end="${rsch.endBlock}">
	  <li class="page-item ${rsch.curPage==cnt?'active':''}">
	  	<a class="page-link" href="javascript:goPage(${cnt })">${cnt }</a></li>
	  </c:forEach>
	  <li class="page-item"><a class="page-link" href="javascript:goPage(${(rsch.endBlock==rsch.pageCount)?
							rsch.endBlock:rsch.endBlock+1});">&raquo;</a></li>
	</ul>
	<div align="right">
    <button  class="btn btn-info" id="regBtn" type="button">작성</button>
	</div>

  </form:form>
  </div>
  </div>   
   </div>   
   </div>
 </section>
 </section></section>
</body>
<script type="text/javascript">

</script>
</html>