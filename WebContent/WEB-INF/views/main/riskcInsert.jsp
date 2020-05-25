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
			
	});
</script>
</head>

<body>
<section id="container">
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
		<label for="cname" class="control-label col-lg-2">내 용</label>
		<div class="col-lg-10">
		<textarea name="detail" rows="10" 
			class="form-control" style="resize:none" 
			placeholder="내용입력하세요" ></textarea>	
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
</div></section></section></section>

  <!--script for this page-->
  <script type="text/javascript">
    $(document).ready(function() {
    });
  </script>

</body>
</html>









