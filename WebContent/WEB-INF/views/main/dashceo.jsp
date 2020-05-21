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
            <div class="grey-panel pn donut-chart">
                  <div class="grey-header">
                    <h5>총 업무수 : 43 개</h5>
                  </div>
                  <canvas id="serverstatus01" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [{
                        value: 53,
                        color: "#FF6B6B"
                      },
                      {
                        value: 47,
                        color: "#fdfdfd"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus01").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <div class="row">
                    <div class="col-sm-6 col-xs-6 goleft">
                      <p>완료<br/>업무수 :</p>
                    </div>
                    <div class="col-sm-6 col-xs-6">
                      <h2>53%</h2>
                    </div>
                  </div>
                </div>
                <!-- /grey-panel -->
              </div>
              <div class="grey-panel pn donut-chart">
                  <div class="grey-header">
                    <h5>미완료 업무수 : 20 개</h5>
                  </div>
                  <canvas id="serverstatus01" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [{
                        value: 20,
                        color: "#FF6B6B"
                      },
                      {
                        value: 80,
                        color: "#fdfdfd"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus01").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <div class="row">
                    <div class="col-sm-6 col-xs-6 goleft">
                      <p>진행중<br/>업무수 :</p>
                    </div>
                    <div class="col-sm-6 col-xs-6">
                      <h2>20%</h2>
                    </div>
                  </div>
                </div>
                <!-- /grey-panel -->
              </div>  
              <div id="morris">
              	<div class="col-lg-6">
              <div class="content-panel">
                <h4><i class="fa fa-angle-right"></i> Chart Example 4</h4>
                <div class="panel-body">
                  <div id="hero-donut" class="graph"></div>
                </div>
              </div>
            </div>
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
  <script type="text/javascript">
  var Script = function () {

      //morris chart

      $(function () {
        // data stolen from http://howmanyleft.co.uk/vehicle/jaguar_'e'_type
        var tax_data = [
             {"period": "2011 Q3", "licensed": 3407, "sorned": 660},
             {"period": "2011 Q2", "licensed": 3351, "sorned": 629},
             {"period": "2011 Q1", "licensed": 3269, "sorned": 618},
             {"period": "2010 Q4", "licensed": 3246, "sorned": 661},
             {"period": "2009 Q4", "licensed": 3171, "sorned": 676},
             {"period": "2008 Q4", "licensed": 3155, "sorned": 681},
             {"period": "2007 Q4", "licensed": 3226, "sorned": 620},
             {"period": "2006 Q4", "licensed": 3245, "sorned": null},
             {"period": "2005 Q4", "licensed": 3289, "sorned": null}
        ];
        Morris.Line({
          element: 'hero-graph',
          data: tax_data,
          xkey: 'period',
          ykeys: ['licensed', 'sorned'],
          labels: ['Licensed', 'Off the road'],
          lineColors:['#4ECDC4','#ed5565']
        });

        Morris.Donut({
          element: 'hero-donut',
          data: [
            {label: '기한내완료', value: 50 },
            {label: '기한초과', value: 20 },
            {label: '기한미도달', value: 30 }
          ],
            colors: ['#3498db', '#2980b9', '#34495e'],
          formatter: function (y) { return y + "%" }
        });

        Morris.Area({
          element: 'hero-area',
          data: [
            {period: '2010 Q1', iphone: 2666, ipad: null, itouch: 2647},
            {period: '2010 Q2', iphone: 2778, ipad: 2294, itouch: 2441},
            {period: '2010 Q3', iphone: 4912, ipad: 1969, itouch: 2501},
            {period: '2010 Q4', iphone: 3767, ipad: 3597, itouch: 5689},
            {period: '2011 Q1', iphone: 6810, ipad: 1914, itouch: 2293},
            {period: '2011 Q2', iphone: 5670, ipad: 4293, itouch: 1881},
            {period: '2011 Q3', iphone: 4820, ipad: 3795, itouch: 1588},
            {period: '2011 Q4', iphone: 15073, ipad: 5967, itouch: 5175},
            {period: '2012 Q1', iphone: 10687, ipad: 4460, itouch: 2028},
            {period: '2012 Q2', iphone: 8432, ipad: 5713, itouch: 1791}
          ],

            xkey: 'period',
            ykeys: ['iphone', 'ipad', 'itouch'],
            labels: ['iPhone', 'iPad', 'iPod Touch'],
            hideHover: 'auto',
            lineWidth: 1,
            pointSize: 5,
            lineColors: ['#4a8bc2', '#ff6c60', '#a9d86e'],
            fillOpacity: 0.5,
            smooth: true
        });

        Morris.Bar({
          element: 'hero-bar',
          data: [
            {device: 'iPhone', geekbench: 136},
            {device: 'iPhone 3G', geekbench: 137},
            {device: 'iPhone 3GS', geekbench: 275},
            {device: 'iPhone 4', geekbench: 380},
            {device: 'iPhone 4S', geekbench: 655},
            {device: 'iPhone 5', geekbench: 1571}
          ],
          xkey: 'device',
          ykeys: ['geekbench'],
          labels: ['Geekbench'],
          barRatio: 0.4,
          xLabelAngle: 35,
          hideHover: 'auto',
          barColors: ['#ac92ec']
        });

        new Morris.Line({
          element: 'examplefirst',
          xkey: 'year',
          ykeys: ['value'],
          labels: ['Value'],
          data: [
            {year: '2008', value: 20},
            {year: '2009', value: 10},
            {year: '2010', value: 5},
            {year: '2011', value: 5},
            {year: '2012', value: 20}
          ]
        });

        $('.code-example').each(function (index, el) {
          eval($(el).text());
        });
      });

  }();
  </script>
</body>

</html>
