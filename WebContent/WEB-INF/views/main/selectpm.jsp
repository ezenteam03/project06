<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>

<head>
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
  <link rel="stylesheet" type="text/css" href="${path}/Dashio/css/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="${path}/Dashio/lib/gritter/css/jquery.gritter.css" />
  <!-- Custom styles for this template -->
  <link href="${path}/Dashio/css/style.css" rel="stylesheet">
  <link href="${path}/Dashio/css/style-responsive.css" rel="stylesheet">
  <script src="${path}/Dashio/lib/chart-master/Chart.js"></script>
  
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
  <script src="${path}/Dashio/lib/jquery/jquery.min.js"></script>
 <style>
 th{text-align:center;}
.name{width:20%}
.post{width:15%}
.contact{width:40%}
.status{width:25%}
 </style>
<script type="text/javascript">
	$(document).ready(function(){
		
		
		$("#listSchBtn").click(function(){
			$("#curPage").val(0);
			$("#selecpmForm").submit();
		});

	});
	
	
	function goPageLog(no){
		$("#curPage").val(no);
		$("#selecpmForm").submit();
	}
	
	function selpm(no){
		var eno = $('#pm_eno'+no).val();
		var ename = $('#pmname_grade'+no).val();
		$('[name=pro_mno]',opener.document).val(eno);
		$('[name=pro_mname]',opener.document).val(ename);
		self.close();
	}
</script>
</head>

<body>

<div id="pop03" class="overlay">
	<div class="popup03">
				
		<h2 align="center">SELECT PM</h2>
		
		<div style="width:700px; margin-left:40px;">

			<form:form class="form-login01" commandName="pmsempSch" id="selecpmForm" action="${path}/project.do?method=selectpm" method="post" style="background-color:#e0e0e0;margin-top:0%">
 				<form:hidden path="curPage" />
 				<form:hidden path="pageSize" />
				<form:hidden path="mdiv" value="${infor_M.mdiv }"/>	
			
				<div align="right" style="margin-right:20px;">
					<div class="form-inline">
						<form:input class="form-control" path="name" placeholder="사원 이름"/>
						&nbsp;
						<button type="button" id="listSchBtn" class="btn btn-theme">Search</button>
					</div>
				</div>

			</form:form>
				
			<div class="row">
			<div class="col-md-12 mt">
			<div class="content-panel">
			
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="name">이름</th>
						<th class="post">직책</th>
						<th class="contact">희망 연락처</th><!-- 희망연락처 = null이면 전화번호${emp.phone} 출력 -->
						<th class="status">상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="log" items="${loglist }">
						<tr>
							<td align="center" style="vertical-align: middle;">${log.name }</td>
							<td align="center" style="vertical-align: middle;">${log.grade }</td>
							<c:choose>
							<c:when test="${not empty log.wcon }">
							<td align="center" style="vertical-align: middle;">${log.wcon }</td>
							</c:when>
							<c:otherwise>
							<td align="center" style="vertical-align: middle;">${log.phone }</td>
							</c:otherwise>
							</c:choose>
							<td align="center">
							<input type="hidden" id="pm_eno${log.eno}" value="${log.eno}" />
							<input type="hidden" id="pmname_grade${log.eno}" value="${log.name} ${log.grade}" />
							<input type="button" class="btn btn-info" value="선택" id="selPm${log.eno}" 
							onclick="javascript:selpm(${log.eno})" style="padding:3px 5px 3px 5px;"/>
							</td>
						</tr>
					</c:forEach>
				</tbody>	
			</table>
	
			<div align="center">
			<ul class="pagination justify-content-center" style="margin:20px">
				<li class="page-item"><a class="page-link" href="javascript:goPageLog(${pmsempSch.startBlock-1 });">Previous</a></li>
					<c:forEach var="cnt" begin="${pmsempSch.startBlock }" end="${pmsempSch.endBlock }">
						<li class="page-item ${pmsempSch.curPage == cnt?'active':'' }">
						<a class="page-link" href="javascript:goPageLog(${cnt});">${cnt }</a></li>
					</c:forEach>
				<li class="page-item"><a class="page-link" href="javascript:goPageLog(${(pmsempSch.endBlock==pmsempSch.pageCount)?pmsempSch.endBlock:pmsempSch.endBlock+1 });">Next</a></li>
			</ul>
			</div>
			
			</div>	
			</div>
			</div>

		</div>	
	</div>
</div>



</body>

</html>





