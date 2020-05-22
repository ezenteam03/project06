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
	/* 글작성 */
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
	<div class="jumbotron text-left" style="margin-left:200px;">  
    	<h4><i class="fa fa-th"></i>&ensp;게시판 등록</h4>
    </div>
	<div class="container">
		<form method="post" enctype="multipart/form-data"
		 	action="${path}/risk.do?method=insert">
		 	<input name="mno" type="hidden" value="${mno}"  />			
		 	<input name="pno" type="hidden" value="${infor_M.pno}"  />				 	
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="bg-success text-white input-group-text">제 목</span>
		</div>		
		<input name="title" class="form-control" value="${risk.title}" 
			placeholder="제목입력하세요" />	
		
	</div>  
	<div class="input-group mb-3">				
		<div class="input-group-prepend">
			<span class="bg-info text-white input-group-text">내 용</span>
		</div>		
		<textarea name="detail" rows="10" 
				class="form-control" style="resize:none" 
				placeholder="내용입력하세요" ></textarea>	
	</div>		
	<div class="input-group mb-3"> 
		<div class="input-group-prepend">
			<span class="bg-warning text-white input-group-text">첨부 파일</span>
		</div>			
			<div class="custom-file" >
				<input type="file" name="report" class="custom-file-input" id="file01"/>
				<label class="custom-file-label" for="file01">
					파일을 선택하세요
				</label>
			</div>	 
	</div>	


	<div style="text-align:right;margin-top: 5px">
		<input type="button" class="btn btn-info"
			value="등록" id="regBtn"/>
		<input type="button" class="btn btn-success"
			value="조회화면으로" id="goMain"/>
		
		
	</div>
	</form>
	</div>
	


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









