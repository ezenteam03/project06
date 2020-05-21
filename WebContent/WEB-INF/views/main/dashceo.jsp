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
  <script src="${path}/Dashio/lib/chart-master/Chart.js"></script>

  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>
<script type="text/javascript">
function goNoti() {
	$(location).attr("href","${path}/notice.do?method=list");
}
function goMeet() {
	$(location).attr("href","${path}/meet.do?method=list");
}
function goIssue() {
	$(location).attr("href","${path}/risk.do?method=list");
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
          <div class="col-lg-9 main-chart">
            <!--CUSTOM CHART START -->
            <div class="border-head">
              <h3>프로젝트 현황</h3>
            </div>
            
            <div class="custom-bar-chart" style="height:180px;">
            	<div width="49%" style="float:left;margin-left:50px;"><h4>PMS 시스템 개발</h4></div>
            	<div width="49%" style="text-align:right;float:right;margin-right:50px;"><h4>PM 김대중</h4></div>
            	<br>            		
            	<br>
            	<br>            		
              <div class="progress progress-striped" style="margin-left:50px;margin-right:50px;">
                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                  <span class="sr-only">40% Complete (success)</span>
                </div>
              </div>
            	<div width="49%" style="float:left;margin-left:50px"><h4>40% 진행중</h4></div>
            	<div width="49%" style="text-align:right;float:right;margin-right:50px;"><h4>2020-06-08 마감</h4></div>
            </div>
              
            <!--custom chart end-->
            <div style="float:right;margin-right:50px;"><button id="regBtn" type="button" class="btn btn-theme"> 프로젝트 추가 </button></div>
          </div>

        
          <!-- /col-lg-9 END SECTION MIDDLE -->
          <!-- **********************************************************************************************************************************************************
              RIGHT SIDEBAR CONTENT
              *********************************************************************************************************************************************************** -->
          <div class="col-lg-3 ds">
          	<h4 onclick="goNoti()"><i class="fa fa-angle-right"></i> 공지사항 최근글</h4>
              <hr>
          	<table class="table">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>제목</th>
                    <th style="width:70px;">작성자</th>
                    <th style="width:70px;">작성일</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="notice" items="${nlist}">
                  <tr>
                    <td>${notice.nno }</td>
                    <td>${notice.title }</td>
                    <td>${notice.writer }</td>
                    <td>${notice.wdate }일전</td>
                  </tr>
                </c:forEach>
                </tbody>
              </table><br><br><br>
              <h4 onclick="goMeet()"><i class="fa fa-angle-right"></i> 회의록 최근글</h4>
              <hr>
          	<table class="table">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>제목</th>
                    <th style="width:70px;">작성자</th>
                    <th style="width:70px;">작성일</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="meet" items="${mlist}">
                  <tr>
                    <td>${meet.mnno }</td>
                    <td>${meet.topic }</td>
                    <td>${meet.writer }</td>
                    <td>${meet.wdate }일전</td>
                  </tr>
                </c:forEach>
                </tbody>
              </table><br><br><br>
              <h4 onclick="goIssue()"><i class="fa fa-angle-right"></i> 이슈리스트 최근글</h4>
              <hr>
          	<table class="table">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>해결여부</th>
                    <th>작성자</th>
                    <th>작성일</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="issue" items="${ilist}">
                  <tr>
                    <td>${issue.ino }</td>
                    <td>${issue.solve==1?"해결완료":"미해결" }</td>
                    <td>${issue.writer }</td>
                    <td>${issue.wdate }일전</td>
                  </tr>
                </c:forEach>
                </tbody>
              </table><br><br><br>
              <h4><i class="fa fa-angle-right"></i> 이슈리스트 최근 댓글</h4>
              <hr>
          	<table class="table">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>이슈번호</th>
                    <th>댓글 작성자</th>
                    <th>작성일</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="re" items="${rlist}">
                  <tr>
                    <td>${re.rno }</td>
                    <td>${re.ino }</td>
                    <td>${re.writer }</td>
                    <td>${re.wdate }일전</td>
                  </tr>
                </c:forEach>
                </tbody>
              </table><br>
          
          </div>
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
  <script src="${path}/Dashio/lib/jquery/jquery.min.js"></script>

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
  
</body>

</html>
