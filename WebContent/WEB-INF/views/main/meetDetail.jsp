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
		$(location).attr("href","${path}/meet.do?method=list");			
	});	
	
	$("#uptBtn").click(function(){
		if(confirm("수정하시겠습니까?")){
			$("form").attr("action","${path}/meet.do?method=update");
			$("form").submit();
		}
	});
	$(".custom-file-input").on("change",function(){
		$(this).next(".custom-file-label").text($(this).val());
	});	
	
	
});

</script>
</head>
<body>
  <section id="container">
	<jsp:include page="top.jsp"/>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        
       
     <h3 style="margin-left:10%;"><i class="fa fa-book"></i>&ensp;  회의록</h3>
       
                <br><br>

<div class="container">
	<form method="post"  enctype="multipart/form-data" >

	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="bg-success text-white input-group-text">안건</span>
		</div>
		<input name="topic" class="form-control"
			value="${meet.topic}"  
			placeholder="안건을 입력하세요" />	
	</div>
	
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="bg-success text-white input-group-text">작성자</span>
		</div>
		<input name="writer" class="form-control"
			value="${meet.writer}"  
			placeholder="안건을 입력하세요" />	
	</div>
	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="bg-info text-white input-group-text">회의참석자</span>
		</div>
		<input name="people" class="form-control"
			value="${meet.people}"/>	
	</div>
	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="bg-info text-white input-group-text">회의장소</span>
		</div>
		<input name="loc" class="form-control" readonly="readonly"
			value="${meet.loc}"/>	
	</div>	
	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="bg-info text-white input-group-text">글번호</span>
		</div>
		<input name="mnno" class="form-control" readonly="readonly"
			value="${meet.mnno}"/>	
	</div>	
	
	<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="bg-info text-white input-group-text">조회수 </span>
		</div>
		<input  class="form-control" readonly="readonly" style="background:white;"
			 value="${meet.views}" />	
	</div>		
	 
	<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="bg-warning text-white input-group-text">회의일시 </span>
		</div>
		<input  class="form-control" readonly="readonly" 
				style="background:white;"
			 value="<fmt:formatDate type='both' value='${meet.mdate }'/>"/>	
	</div>
	 	
	<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="bg-warning text-white input-group-text">등록일</span>
		</div>
		<input class="form-control" readonly="readonly"
			value="<fmt:formatDate type='both' value='${meet.wdate }'/>"/>	
		<div class="input-group-prepend">
			<span class="bg-warning text-white input-group-text">수정일</span>
		</div>
		<input class="form-control" readonly="readonly"
			value="<fmt:formatDate type='both' value='${meet.chdate }'/>" />	
	</div>
				
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="bg-info text-white input-group-text">내 용</span>
		</div>
		<textarea name="detail" rows="5" 
			class="form-control" 
			placeholder="없음" >${meet.detail}</textarea>		 
	</div> 
	
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="bg-info text-white input-group-text">결정사항</span>
		</div>
		<textarea name="decision" rows="5" 
			class="form-control" 
			placeholder="없음" >${meet.decision}</textarea>		 
	</div>
	
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="bg-info text-white input-group-text">특이사항</span>
		</div>
		<textarea name="etc" rows="5" 
			class="form-control" 
			placeholder="없음" >${meet.etc}</textarea>		 
	</div> 

	
	<br>
	<div style="text-align:right;">
		<input type="button" class="btn btn-info"
			value="수정" id="uptBtn"/>
		
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
