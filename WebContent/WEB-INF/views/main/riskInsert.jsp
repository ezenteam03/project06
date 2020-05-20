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
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >

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

<link rel="stylesheet" type="text/css" href="${path}/Dashio/lib/bootstrap-fileupload/bootstrap-fileupload.css" />
<link rel="stylesheet" type="text/css" href="${path}/Dashio/lib/bootstrap-datepicker/css/datepicker.css" />
<link rel="stylesheet" type="text/css" href="${path}/Dashio/lib/bootstrap-daterangepicker/daterangepicker.css" />
<link rel="stylesheet" type="text/css" href="${path}/Dashio/lib/bootstrap-timepicker/compiled/timepicker.css" />
<!-- Custom styles for this template -->
<link href="${path}/Dashio/css/style.css" rel="stylesheet">
<link href="${path}/Dashio/css/style-responsive.css" rel="stylesheet">

<style type="text/css">
	/* 글작성 */

</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>


<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>		
		var isT= "${param.title}";
		var isD= "${param.detail}";
		if(isT!=""){
			alert("등록이 되었습니다");
			$(location).attr("href","${path}/risk.do?method=list");	
			
		}
		
		
		$("#regBtn").click(function(){		
				if(confirm("등록합니다.")){
					$("form").submit();				
				}			
		});	
		$("#goMain").click(function(){
			if(confirm("조회 화면 이동 합니다.")){
				$(location).attr("href","${path}/risk.do?method=list");			
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

 <section id="main-content">
      <section class="wrapper">	
         <!-- FORM VALIDATION -->
        <div class="row mt">
          <div class="col-lg-12">
            <h4><i class="fa fa-angle-right"></i>게시판 등록</h4>
            <div class="form-panel">
              <div class=" form">	
	<form method="post" enctype="multipart/form-data"
	 	action="${path}/risk.do?method=insert">
	 	<input name="mno" type="hidden" value="${mno}"  />			
	 	<input name="pno" type="hidden" value="${infor_M.pno}"  />			
	 	
	<div class="form-group">
		
		<label for="cname" class="control-label col-lg-2">제 목</label>
		<div class="col-lg-10">
		<input name="title" class="form-control" value="${risk.title}" 
			placeholder="제목입력하세요" />	
		  </div>
	</div>  				
	<div class="form-group">
		<label for="cname" class="control-label col-lg-2">내 용</label>
		<div class="col-lg-10">
		<textarea name="detail" rows="10" 
			class="form-control" style="resize:none" 
			placeholder="내용입력하세요" ></textarea>	
			</div>	 
	</div> 
 
	<div class="form-group">
		
		<label for="cname" class="control-label col-lg-2">첨부 파일</label>
		<div class="col-lg-10">
		<div class="custom-file">
			<input type="file" name="report" class="custom-file-input" id="file01"/>
			<label class="custom-file-label" for="file01">
				파일을 선택하세요
			</label>
		</div>	 
		</div>
	</div> 

	<div style="text-align:right;">
		<input type="button" class="btn btn-success"
			value="뒤로가기" id="goMain"/>
		<input type="button" class="btn btn-info"
			value="등록" id="regBtn"/>
		
	</div>
	
	
	</form>
</div>
</div>	
</div>
</div></section></section>

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
        <a href="${path}/Dashio/advanced_form_components.jsp#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
    <!--footer end-->
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="${path}/Dashio/lib/jquery/jquery.min.js"></script>
  <script src="${path}/Dashio/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="${path}/Dashio/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${path}/Dashio/lib/jquery.scrollTo.min.js"></script>
  <script src="${path}/Dashio/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <!--script for this page-->
  <script src="${path}/Dashio/lib/jquery-ui-1.9.2.custom.min.js"></script>
  <script type="text/javascript" src="${path}/Dashio/lib/bootstrap-fileupload/bootstrap-fileupload.js"></script>
  <script type="text/javascript" src="${path}/Dashio/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
  <script type="text/javascript" src="${path}/Dashio/lib/bootstrap-daterangepicker/date.js"></script>
  <script type="text/javascript" src="${path}/Dashio/lib/bootstrap-daterangepicker/daterangepicker.js"></script>
  <script type="text/javascript" src="${path}/Dashio/lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
  <script type="text/javascript" src="${path}/Dashio/lib/bootstrap-daterangepicker/moment.min.js"></script>
  <script type="text/javascript" src="${path}/Dashio/lib/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
  <script src="${path}/Dashio/lib/advanced-form-components.js"></script>
  <!--common script for all pages-->
  <script src="${path}/Dashio/lib/common-scripts.js"></script>
  <!--script for this page-->
  <script type="text/javascript">
    $(document).ready(function() {
    });
  </script>

</body>
</html>









