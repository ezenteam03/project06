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
  <link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
  <link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
  <style type="text/css">
	.sch{width:25%;}
  </style>
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
  <link href="${path}/Dashio/lib/advanced-datatable/css/demo_page.css" rel="stylesheet" />
  <link href="${path}/Dashio/lib/advanced-datatable/css/demo_table.css" rel="stylesheet" />
  <link rel="stylesheet" href="${path}/Dashio/lib/advanced-datatable/css/DT_bootstrap.css" />
  <!-- Custom styles for this template -->
  <link href="${path}/Dashio/css/style.css" rel="stylesheet">
  <link href="${path}/Dashio/css/style-responsive.css" rel="stylesheet">

  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>
<style>
#all{
	padding:2%;
}

.num {width:10%;}
.title {width:65%;}
.date {width:15%;}
.cnt {width:10%;}


</style>
<script type="text/javascript">

function goPage(no){
	alert("이동 번호:"+no);
	$("#curPage").val(no);
	$("form").submit();
}
</script>
<body>
  <section id="container">
	<jsp:include page="top.jsp"/>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <div class="jumbotron text-center">
  <h1>답변형 게시판</h1>
</div>
<div class="container">
  <form:form class="form" commandName="bsch" method="post" >
  	<form:hidden path="curPage"/> <!-- 현재 클릭한 페이지 번호. -->
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  
	    <form:input class="form-control mr-sm-2 sch" 
	    		path="title" placeholder="제목" />
	    <form:input class="form-control mr-sm-2 sch" 
	    		path="writer" placeholder="작성자"  />
	    <button class="btn btn-success" type="submit">Search</button>&nbsp;
	    <button class="btn btn-info" id="regBtn" type="button">Registe</button>
  	</nav>
  	<br>
 	<div class="input-group lb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text "> 총 : ${bsch.count} 건</span>
		</div>
		<input class="form-control" />	
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
  </form:form>
  
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
        <th>작성자</th>
        <th>작성일</th>
        <th>조회</th>
      </tr>
    </thead>
    <jsp:useBean id="today" class="java.util.Date"/>
    <fmt:parseNumber value="${today.time / (1000*60*60*24)}" 
    	integerOnly="true" var="toFmt"/>
    <tbody>
      <c:forEach var="board" items="${blist}">	
      <tr class="text-center" 
      	ondblclick="javascript:go(${board.no})">
        <td>${board.cnt}</td>
        <!-- 답글의 레벨만큼 들여 쓰기 설정.. -->
        <td class="text-left">
        	<c:forEach varStatus="sts" 
        		begin="2" end="${board.level}">&nbsp;&nbsp;<c:if test="${board.level>1 and sts.last}">☞</c:if>	
        	</c:forEach> ${board.title}
  	    	<fmt:parseNumber value="${board.credte.time / (1000*60*60*24)}" 
	    		integerOnly="true" var="toFmt2"/>
	    		
	    	<c:if test="${toFmt==toFmt2}">
	    		<span class="badge badge-danger">New</span>
	    	</c:if>	      	
        	</td>
        <td class="text-center">${board.writer}</td>
        <td><fmt:formatDate value="${board.credte}"/> 
        <br>
        </td>
        <td>${board.readcnt}</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>  
	<ul class="pagination justify-content-center" style="margin:20px 0">
	    <li class="page-item">
	    <a class="page-link" href="javascript:goPage(${bsch.startBlock-1});">Previous</a></li>
	    <c:forEach var="cnt" begin="${bsch.startBlock }" 
	    					  end="${bsch.endBlock}">
		  <li class="page-item ${bsch.curPage==cnt?'active':''}">
		  
		  	<a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a></li>
		</c:forEach>
		<li class="page-item">
		<a class="page-link" 
		href="javascript:goPage(${(bsch.endBlock==bsch.pageCount)?
							bsch.endBlock:bsch.endBlock+1});">Next</a></li>
	</ul>  

</div>


    
    
    
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
      <div class="text-center">
        <p>
          &copy; Copyrights <strong>Dashio</strong>. All Rights Reserved
        </p>
        <div class="credits">
          <!--
            You are NOT allowed to delete the credit link to TemplateMag with free version.
            You can delete the credit link only if you bought the pro version.
            Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/dashio-bootstrap-admin-template/
            Licensing information: https://templatemag.com/license/
          -->
          Created with Dashio template by <a href="${path}/Dashio/https://templatemag.com/">TemplateMag</a>
        </div>
        <a href="${path}/Dashio/panels.jsp#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
    <!--footer end-->
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="${path}/Dashio/lib/jquery/jquery.min.js"></script>
  <script type="text/javascript" language="javascript" src="${path}/Dashio/lib/advanced-datatable/js/jquery.js"></script>
  <script src="${path}/Dashio/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="${path}/Dashio/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${path}/Dashio/lib/jquery.scrollTo.min.js"></script>
  <script src="${path}/Dashio/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <script type="text/javascript" language="javascript" src="${path}/Dashio/lib/advanced-datatable/js/jquery.dataTables.js"></script>
  <script type="text/javascript" src="${path}/Dashio/lib/advanced-datatable/js/DT_bootstrap.js"></script>
  <!--common script for all pages-->
  <script src="${path}/Dashio/lib/common-scripts.js"></script>
  <!--script for this page-->
  <script type="text/javascript">
    /* Formating function for row details */
    function fnFormatDetails(oTable, nTr) {
      var aData = oTable.fnGetData(nTr);
      var sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
      sOut += '<tr><td>Rendering engine:</td><td>' + aData[1] + ' ' + aData[4] + '</td></tr>';
      sOut += '<tr><td>Link to source:</td><td>Could provide a link here</td></tr>';
      sOut += '<tr><td>Extra info:</td><td>And any further details here (images etc)</td></tr>';
      sOut += '</table>';

      return sOut;
    }

    $(document).ready(function() {
      /*
       * Insert a 'details' column to the table
       */
      var nCloneTh = document.createElement('th');
      var nCloneTd = document.createElement('td');
      nCloneTd.innerHTML = '<img src="${path}/Dashio/lib/advanced-datatable/images/details_open.png">';
      nCloneTd.className = "center";

      $('#hidden-table-info thead tr').each(function() {
        this.insertBefore(nCloneTh, this.childNodes[0]);
      });

      $('#hidden-table-info tbody tr').each(function() {
        this.insertBefore(nCloneTd.cloneNode(true), this.childNodes[0]);
      });

      /*
       * Initialse DataTables, with no sorting on the 'details' column
       */
      var oTable = $('#hidden-table-info').dataTable({
        "aoColumnDefs": [{
          "bSortable": false,
          "aTargets": [0]
        }],
        "aaSorting": [
          [1, 'asc']
        ]
      });

      /* Add event listener for opening and closing details
       * Note that the indicator for showing which row is open is not controlled by DataTables,
       * rather it is done here
       */
      $('#hidden-table-info tbody td img').live('click', function() {
        var nTr = $(this).parents('tr')[0];
        if (oTable.fnIsOpen(nTr)) {
          /* This row is already open - close it */
          this.src = "lib/advanced-datatable/media/images/details_open.png";
          oTable.fnClose(nTr);
        } else {
          /* Open this row */
          this.src = "lib/advanced-datatable/images/details_close.png";
          oTable.fnOpen(nTr, fnFormatDetails(oTable, nTr), 'details');
        }
      });
    });
  </script>
</body>

</html>
