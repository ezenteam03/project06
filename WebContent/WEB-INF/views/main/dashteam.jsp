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
              
              <h3>내 프로젝트 현황</h3>
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
            <div class="border-head">
              <h3>세부 업무 현황</h3>
            </div>
            <div class="custom-bar-chart" style="height:800px;">
            	<div width="49%" style="float:left;margin-left:50px;"><h4>요구사항 정의서 작성</h4></div>
            	<div width="49%" style="text-align:right;float:right;"><h4></h4></div>
            	<br>            		
            	<br>
            	<br>            		
              <div class="progress progress-striped" style="margin-left:50px;margin-right:50px;">
                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                  <span class="sr-only">100% Complete (success)</span>
                </div>
              </div>
              	<div width="49%" style="float:left;margin-left:50px;"><h4>100% 완료</h4></div>
            	<div width="49%" style="text-align:right;float:right;margin-right:50px;"><h4>2020-05-08 마감</h4></div>
              <br>
              <br>
              <br>
            	<div width="49%" style="float:left;margin-left:50px;"><h4>데이터베이스 설계 및 생성</h4></div>
            	<div width="49%" style="text-align:right;float:right;"><h4></h4></div>
            	<br>            		
            	<br>
            	<br>            		
              <div class="progress progress-striped" style="margin-left:50px;margin-right:50px;">
                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                  <span class="sr-only">100% Complete (warning)</span>
                </div>
              </div>
              	<div width="49%" style="float:left;margin-left:50px;"><h4>100% 완료</h4></div>
            	<div width="49%" style="text-align:right;float:right;margin-right:50px;"><h4>2020-05-12 마감</h4></div>
              <br>
              <br>
              <br>
            	<div width="49%" style="float:left;margin-left:50px;"><h4>화면 설계</h4></div>
            	<div width="49%" style="text-align:right;float:right;"><h4></h4></div>
            	<br>            		
            	<br>
            	<br>            		
              <div class="progress progress-striped" style="margin-left:50px;margin-right:50px;">
                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
                  <span class="sr-only">50% Complete (warning)</span>
                </div>
              </div>
              	<div width="49%" style="float:left;margin-left:50px;"><h4>50% 진행중</h4></div>
            	<div width="49%" style="text-align:right;float:right;margin-right:50px;"><h4>2020-05-08 마감</h4></div>
              <br>
              <br>
              <br>
            	<div width="49%" style="float:left;margin-left:50px;"><h4>화면 구현</h4></div>
            	<div width="49%" style="text-align:right;float:right;"><h4></h4></div>
            	<br>            		
            	<br>
            	<br>            		
              <div class="progress progress-striped" style="margin-left:50px;margin-right:50px;">
                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 10%">
                  <span class="sr-only">100% Complete (warning)</span>
                </div>
              </div>
              <div width="49%" style="float:left;margin-left:50px;"><h4>10% 진행중</h4></div>
            	<div width="49%" style="text-align:right;float:right;margin-right:50px;"><h4>2020-05-22 마감</h4></div>
              <br>
              <br>
              <br>
            	<div width="49%" style="float:left;margin-left:50px;"><h4>테스트</h4></div>
            	<div width="49%" style="text-align:right;float:right;"><h4></h4></div>
            	<br>            		
            	<br>
            	<br>            		
              <div class="progress progress-striped" style="margin-left:50px;margin-right:50px;">
                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                  <span class="sr-only">100% Complete (warning)</span>
                </div>
              </div>
              	<div width="49%" style="float:left;margin-left:50px;"><h4>시작 전</h4></div>
            	<div width="49%" style="text-align:right;float:right;margin-right:50px;"><h4>2020-06-08 마감</h4></div>
              <br>
              <br>
              <br>
            </div>
            <!--custom chart end-->
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
                  <tr>
                    <td>3</td>
                    <td>bootstrap template 결정</td>
                    <td>안희정</td>
                    <td>9일전</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>프로젝트 역할 분담</td>
                    <td>추미애</td>
                    <td>10일전</td>
                  </tr>
                  <tr>
                    <td>1</td>
                    <td>프로젝트 주제 선정</td>
                    <td>김대중</td>
                    <td>10일전</td>
                  </tr>
                </tbody>
              </table><br><br><br>
              <h4><i class="fa fa-angle-right"></i> 이슈리스트 최근글</h4>
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
                  <tr>
                    <td>4</td>
                    <td>미해결</td>
                    <td>안희정</td>
                    <td>오늘</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td>해결완료</td>
                    <td>추미애</td>
                    <td>3일전</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>해결완료</td>
                    <td>오세훈</td>
                    <td>3일전</td>
                  </tr>
                </tbody>
              </table><br><br><br>
              <h4><i class="fa fa-angle-right"></i> 이슈리스트 최근 댓글</h4>
              <hr>
          	<table class="table">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>원글 작성자</th>
                    <th>댓글 작성자</th>
                    <th>작성일</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>5</td>
                    <td>안희정</td>
                    <td>김무성</td>
                    <td>오늘</td>
                  </tr>
                  <tr>
                    <td>4</td>
                    <td>안희정</td>
                    <td>이명박</td>
                    <td>오늘</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td>오세훈</td>
                    <td>안희정</td>
                    <td>어제</td>
                  </tr>
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
  <script type="text/javascript">
    $(document).ready(function() {
      var unique_id = $.gritter.add({
        // (string | mandatory) the heading of the notification
        title: 'Welcome to Dashio!',
        // (string | mandatory) the text inside the notification
        text: 'Hover me to enable the Close Button. You can hide the left sidebar clicking on the button next to the logo.',
        // (string | optional) the image to display on the left
        image: 'img/ui-sam.jpg',
        // (bool | optional) if you want it to fade out on its own or just sit there
        sticky: false,
        // (int | optional) the time you want it to be alive for before fading out
        time: 8000,
        // (string | optional) the class name you want to apply to that specific message
        class_name: 'my-sticky-class'
      });

      return false;
    });
  </script>
  <script type="application/javascript">
    $(document).ready(function() {
      $("#date-popover").popover({
        html: true,
        trigger: "manual"
      });
      $("#date-popover").hide();
      $("#date-popover").click(function(e) {
        $(this).hide();
      });

      $("#my-calendar").zabuto_calendar({
        action: function() {
          return myDateFunction(this.id, false);
        },
        action_nav: function() {
          return myNavFunction(this.id);
        },
        ajax: {
          url: "show_data.php?action=1",
          modal: true
        },
        legend: [{
            type: "text",
            label: "Special event",
            badge: "00"
          },
          {
            type: "block",
            label: "Regular event",
          }
        ]
      });
    });

    function myNavFunction(id) {
      $("#date-popover").hide();
      var nav = $("#" + id).data("navigation");
      var to = $("#" + id).data("to");
      console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }
  </script>
</body>

</html>
