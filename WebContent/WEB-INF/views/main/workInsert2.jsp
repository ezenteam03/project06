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
  <!-- Favicons -->
  <link href="${path}/Dashio/img/favicon.png" rel="icon">
  <link href="${path}/Dashio/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="${path}/Dashio/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="${path}/Dashio/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="${path}/Dashio/lib/bootstrap-fileupload/bootstrap-fileupload.css" />
  <link rel="stylesheet" type="text/css" href="${path}/Dashio/lib/bootstrap-datepicker/css/datepicker.css" />
  <link rel="stylesheet" type="text/css" href="${path}/Dashio/lib/bootstrap-daterangepicker/daterangepicker.css" />
  <link rel="stylesheet" type="text/css" href="${path}/Dashio/lib/bootstrap-timepicker/compiled/timepicker.css" />
  <link rel="stylesheet" type="text/css" href="${path}/Dashio/lib/bootstrap-datetimepicker/datertimepicker.css" />
  <!-- Custom styles for this template -->
  <link href="${path}/Dashio/css/style.css" rel="stylesheet">
  <link href="${path}/Dashio/css/style-responsive.css" rel="stylesheet">
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


<!-- 

 -->
 
<script type="text/javascript">


	$(document).ready(function(){
		<%-- 
		
		--%>
		
		//var pno = "${pno}";
		//console.log("dd"+pno);
		var mdiv = "${mdiv}";
		//console.log("mdiv : "+mdiv);
		
		if(mdiv == 6){
			$("#selecPno").attr('onFocus',true);
			$("#selecPno").attr('onChange',true);
			
			//$("#selecPno").css('background','white');
		}
		
		$("#regBtn").click(function(){
			var pno = $("[name=pno]").val();
			var refno = $("[name=refno]").val();
			var tname = $("[name=tname]").val();
			var sdate = $("[name=sdate]").val();
			var edate = $("[name=edate]").val();
			var detail = $("[name=detail]").val();
			var mno = $("[name=mno]").val();
			
			console.log("mno : "+mno);
			console.log(pno);
			console.log(refno);
			console.log(tname);
			console.log(detail);
			console.log(sdate);
			console.log(edate);
			
			if(confirm("등록합니다.")){
				$("#fileForm").submit();				
			}
		});	
		$("#goMain").click(function(){
			//if(confirm("조회 화면 이동 합니다.")){
			$(location).attr("href","${path}/task.do?method=list");			
			//}
		});	
		
		$(".custom-file-input").on("change",function(){
			$(this).next(".custom-file-label").text($(this).val());
		});
		
		//var refno = "${task.refno}";
		//var isReg= "${param.tname}";
		//&&refno==""
		//if(isReg!=""){
		//	if(!confirm("등록 완료하였습니다\n계속 등록하시겠습니까?")){
		//		$(location).attr("href","${path}/task.do?method=list");	
		//	}
		//}
		
		//var is = $("[name=sdate]").val();
		
		
		
		/*$(".custom-file-input").on("change",function(){
			$(this).next(".custom-file-label").text($(this).val());
		});*/
	});
</script>
</head>

<body>
<section id="container">
	<jsp:include page="top.jsp"/>
	
	<section id="main-content">
      <section class="wrapper">


<div class="container">
	<!-- 파일을 업로드 할 수 있는 type으로 변경 -->
	<form method="post" enctype="multipart/form-data" id="fileForm"
		action="${path}/task.do?method=insert">
		
	<div class="input-group mb-3">
		<div class="input-group-prepend"> 
			<span class="bg-info text-white input-group-text">프로젝트번호</span>
		</div>
		<div id="adminPno">
			<select class="form-control" style="width:300px; float:left;" name="pno" id="selecPno" 
			onFocus='this.initialSelect = this.selectedIndex;'
			onChange='this.selectedIndex = this.initialSelect;'>
					<c:forEach items="${pnolist}" var="pno" varStatus="sts" >
						<option value="${pno}">${pno}</option>									
					</c:forEach>				
			</select>	
		</div>

	</div>  
	<div class="input-group mb-3">
		<div class="input-group-prepend"> 
			<span class="bg-info text-white input-group-text">상위업무번호</span>
		</div>
		
		<select class="form-control" style="width:300px;float:left; " name="refno">
					<c:forEach items="${refnolist}" var="ref" varStatus="sts" >
						<option value="${ref.refno}">${ref.tname} ${ref.tno}</option>									
					</c:forEach>				
			</select>	

	</div>  
	<div class="input-group mb-3">
		<div class="input-group-prepend"> 
			<span class="bg-info text-white input-group-text">업무명</span>
		</div>
		<input name="tname" class="form-control" 
			value="" placeholder="입력하세요" />	
	</div>

	<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="bg-warning text-white input-group-text">시작일</span>
		</div>
				  <div style="width:350px;"data-date-viewmode="years" data-date-format="yyyy-mm-dd" data-date="" class="input-append date dpYears">
				
					 <input type="text" name="sdate" readonly size="16" class="form-control" style="background:white; width:350px;">
					<span class="input-group-btn add-on">
					 <button class="btn btn-theme" type="button"><i class="fa fa-calendar"></i></button>
				 </span>
			
			</div>

			<!-- value="<fmt:formatDate type='both' value='${board.credte }'/>"/> -->

		<div class="input-group-prepend">
			<span class="bg-warning text-white input-group-text">마감일</span>
		</div>

				  <div style="width:350px;" data-date-viewmode="years" data-date-format="yyyy-mm-dd" data-date="" class="input-append date dpYears">
					 <input type="text" name="edate" readonly size="16" class="form-control" style="background:white;
					 width:350px; ">
					<span class="input-group-btn add-on">
					 <button class="btn btn-theme" type="button"><i class="fa fa-calendar"></i></button>
				 </span>
			</div>
		<br>
	</div>		
	<div class="input-group-prepend" style="width:363px;">
			<span class="bg-info text-white input-group-text">담당자</span>
			<select class="sel-grade" name="mno" style="padding:10px; font-size:1.2em; margin-left:15px; outline:none;">
			
                    <c:forEach var="pm" items="${pmsElist}">
						<option value="${pm.eno}">${pm.name} ${pm.grade}</option>               		
                    </c:forEach>
            </select>
	</div>
		<br>
		
			
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">업무 내용</span>
		</div>
		<textarea name="detail" rows="10" 
			class="form-control" 
			placeholder="내 맘은 덤더러덤더러덤" ></textarea>		 
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
	
			
	<div style="text-align:right;">
		<input type="button" class="btn btn-info"
			value="등록" id="regBtn"/>
		<input type="button" class="btn btn-success"
			value="조회 화면으로" id="goMain"/>
	</div>
 	
	</form>
</div>
</section></section>

</section>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="${path}/Dashio/lib/jquery/jquery.min.js"></script>
  <script src="${path}/Dashio/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="${path}/Dashio/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${path}/Dashio/lib/jquery.scrollTo.min.js"></script>
  <script src="${path}/Dashio/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="${path}/Dashio/lib/common-scripts.js"></script>
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

</body>
</html>