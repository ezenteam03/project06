<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
  <style type="text/css">
  .chart {float: left; width: 30%; height: 230px; text-align: center;}
.chart span.title{position: relative; display: block; width: 100%; text-align: center; top: 110px;}
  </style>




</head>
<script type="text/javascript">
function goNoti(num) {
	$("[name=pno]").val(num);
	$("[name=proc]").val(4);
	$("#pnoForm").attr("action","${path}/DashTeam.do?method=go");
	$("#pnoForm").submit();
}
function goMeet(num) {
	$("[name=pno]").val(num);
	$("[name=proc]").val(3);
	$("#pnoForm").attr("action","${path}/DashTeam.do?method=go");
	$("#pnoForm").submit();
}
function goIssue(num) {
	$("[name=pno]").val(num);
	$("[name=proc]").val(2);
	$("#pnoForm").attr("action","${path}/DashTeam.do?method=go");
	$("#pnoForm").submit();
}
function goGant(num) {
	$("[name=pno]").val(num);
	$("[name=proc]").val(1);
	$("#pnoForm").attr("action","${path}/DashTeam.do?method=go");
	$("#pnoForm").submit();
}
function newPro() {
	$(location).attr("href","${path}/project.do?method=insert");
}

</script>
<body>
  <section id="container">
	<jsp:include page="top.jsp"/>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper" style="margin-top:0;">
        <div class="row">
          <div class="col-lg-9 main-chart" style="background-color:white;width:100%;">
            <!--CUSTOM CHART START -->
            <div class="border-head" style="margin-top:20px;">
              <h3>프로젝트 현황</h3>
            </div>
            <script src="${path}/Dashio/lib/jquery/jquery.min.js"></script>
            <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
			<script src="${path}/Dashio/lib/rendro-easy-pie-chart-97b5824/dist/jquery.easypiechart.min.js"></script>
			<script>
$(function() {
	$('.chart').easyPieChart({
		barColor: '#f16529', //차트가 그려질 색 
    	trackColor: '#ccc', // 차트가 그려지는 트랙의 기본 배경색(chart1 의 회색부분) 
    	scaleColor: '#fff', // 차트 테두리에 그려지는 기준선 (chart2 의 테두리 선) 
    	lineCap: 'butt', // 차트 선의 모양 chart1 butt / chart2 round / chart3 square 
    	lineWidth: 30, // 차트 선의 두께 
    	size: 200, // 차트크기
    	animate: 1000, // 그려지는 시간 
    	onStart: $.noop, 
    	onStop: $.noop
	});
});
</script>
            <form id="pnoForm" method="post"><input type="hidden" name="pno"/><input type="hidden" name="proc"/></form>
            <c:forEach var="ceo" items="${clist}">
            <div class="custom-bar-chart" style="height:130px;margin-top:10px;">
            	<div width="49%" style="float:left;margin-left:50px;"><h4>${ceo.pro.pname}</h4></div>
            	<div width="49%" style="text-align:right;float:right;margin-right:50px;"><h4>PM ${ceo.pro.pm }</h4></div>
            	<br>            		
            	<br>
            	<br>            		
              <c:choose>
					<c:when test="${ceo.pro.grade==0 }">
						<div class="progress progress-striped" style="margin-left:50px;margin-right:50px;">
			                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${ceo.pro.prog}%">
			                  <span class="sr-only">40% Complete (success)</span>
			                </div>
			              </div>
					</c:when>
					<c:when test="${ceo.pro.grade==1 }">
						<div class="progress progress-striped" style="margin-left:50px;margin-right:50px;">
			                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${ceo.pro.prog}%">
			                  <span class="sr-only">40% Complete (success)</span>
			                </div>
			              </div>
					</c:when>
					<c:otherwise>
						<div class="progress progress-striped" style="margin-left:50px;margin-right:50px;">
			                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${ceo.pro.prog}%">
			                  <span class="sr-only">40% Complete (success)</span>
			                </div>
			              </div>
					</c:otherwise>
				</c:choose>       
            	<div width="49%" style="float:left;margin-left:50px"><h4>${ceo.pro.prog} %</h4></div>
            	<div width="49%" style="text-align:right;float:right;margin-right:50px;"><h4><fmt:formatDate value="${ceo.pro.edate}"/> 마감</h4></div>
            </div>
            <div style="float:right;margin-right:50px;margin-top:20px;">
            <button style="margin-right:200px;" onclick="goGant(${ceo.pno })" type="button" class="btn btn-theme"> 간트차트 보기 </button>
            <button style="margin-right:200px;" onclick="goNoti(${ceo.pno })" type="button" class="btn btn-theme"> 공지사항 보기 </button>
            <button style="margin-right:200px;" onclick="goMeet(${ceo.pno })" type="button" class="btn btn-theme"> 회의록 보기 </button>
            <button style="margin-right:130px;" onclick="goIssue(${ceo.pno })" type="button" class="btn btn-theme"> 이슈리스트 보기 </button>
            </div>
            <div style="clear:both; height:10px; overflow:hidden;"></div>	
            <div class="chart" data-percent="${ceo.cp }" style="float: left; width: 30%; height: 230px; text-align: center;margin-left:50px;"><br><span class="title">총업무 : ${ceo.total }</span><span class="title">완료업무 : ${ceo.ccnt }</span><span class="title">${ceo.cp } %</span></div>	
            <div class="chart" data-percent="${ceo.dp }" style="float: left; width: 30%; height: 230px; text-align: center;"><br><span class="title">미완료업무 : ${ceo.total-ceo.ccnt }</span><span class="title">진행중 업무 : ${ceo.dcnt }</span><span class="title">${ceo.dp } %</span></div>	
            <div class="chart" data-percent="${ceo.op }" style="float: left; width: 30%; height: 230px; text-align: center;"><br><span class="title">완료업무 : ${ceo.ccnt }</span><span class="title">기한초과업무 : ${ceo.ocnt }</span><span class="title">${ceo.op } %</span></div>
            <div style="clear:both; height:10px; overflow:hidden;"></div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <hr>
            </c:forEach>
            <div style="float:right;margin-right:50px;margin-top:50px;"><button onclick="newPro()" type="button" class="btn btn-theme"> 프로젝트 추가 </button></div>            
            <!--custom chart end-->
            <div style="clear:both; height:10px; overflow:hidden;"></div>
            <br>
            <br>
            <br>
            <hr>
          </div>
			
        
          <!-- /col-lg-9 END SECTION MIDDLE -->
          <!-- **********************************************************************************************************************************************************
              RIGHT SIDEBAR CONTENT
              *********************************************************************************************************************************************************** -->
          
          <!-- /col-lg-3 -->
        </div>
        <!-- /row -->
      </section>
    </section>
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
        <a href="${path}/Dashio/index.jsp#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
    <!--footer end-->
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
  

  <script src="${path}/Dashio/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="${path}/Dashio/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${path}/Dashio/lib/jquery.scrollTo.min.js"></script>
  <script src="${path}/Dashio/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <script src="${path}/Dashio/lib/jquery.sparkline.js"></script>
  <!--common script for all pages-->
  <script src="${path}/Dashio/lib/common-scripts.js"></script>
  <script type="text/javascript" src="${path}/Dashio/lib/gritter/js/jquery.gritter.js"></script>
  <script type="text/javascript" src="${path}/Dashio/lib/gritter-conf.js"></script>
  <!--script for this page-->
  <script src="${path}/Dashio/lib/sparkline-chart.js"></script>
  <script src="${path}/Dashio/lib/zabuto_calendar.js"></script>
  <script type="text/javascript">
  
  </script>
</body>

</html>
