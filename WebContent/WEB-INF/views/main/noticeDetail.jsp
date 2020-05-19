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
$(document).ready(function(){
	<%-- 
	
	--%>
	$("#goMain").click(function(){
		$(location).attr("href","${path}/notice.do?method=list");			
	});	
	
	$("#uptBtn").click(function(){
		if(confirm("수정하시겠습니까?")){
			$("form").attr("action","${path}/notice.do?method=update");
			$("form").submit();
		}
	});
	$(".custom-file-input").on("change",function(){
		$(this).next(".custom-file-label").text($(this).val());
	});	
	$("#delBtn").click(function(){
		if(confirm("삭제하시겠습니까?")){
			var nno = $("input[name=nno]").val();
			$(location).attr("href","${path}/notice.do?method=delete&nno="+nno);					
		}
	});
	
});

</script>
<body>
  <section id="container">
	<jsp:include page="top.jsp"/>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        
       
     <h4 style="margin-left:12%;"><i class="fa fa-bullhorn"></i>&ensp;  공지사항 </h4>
                <br><br>

<div class="container">
	<form method="post"  enctype="multipart/form-data" >
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text ">글번호</span>
		</div>
		<input name="nno" class="form-control" readonly="readonly"
			value="${notice.nno}"/>	
		
	</div>	
	<div class="input-group mb-3">	
		
		
		<div class="input-group-prepend">
			<span  style="width:10%; padding:7px;" class="bg-warning ">조회수 </span>
		</div>
		<input  class="form-control" readonly="readonly" style="background:white;"
			 value="${notice.views}" />	
	</div>		
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">제 목</span>
		</div>
		<input name="title" class="form-control"
			value="${notice.title}"  
			placeholder="제목입력하세요" />	
		 
	</div>  	
	<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="input-group-text">등록일</span>
		</div>
		<input class="form-control" readonly="readonly"
			value="<fmt:formatDate type='both' value='${notice.wdate }'/>"/>	
		<div class="input-group-prepend">
			<span class="input-group-text">수정일</span>
		</div>
		<input class="form-control" readonly="readonly"
			value="<fmt:formatDate type='both' value='${notice.chdate }'/>" />	
	</div>			
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">내 용</span>
		</div>
		<textarea name="detail" rows="10" 
			class="form-control" 
			placeholder="내용입력하세요" >${notice.detail}</textarea>		 
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
      <!-- /wrapper -->
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
