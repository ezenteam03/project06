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

<body>
  <section id="container">
    <jsp:include page="top.jsp"/>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> Chartjs Charts</h3>
        <!-- page start-->
        <div class="tab-pane" id="chartjs">
          <div class="row mt">
            <div class="col-lg-6">
              <div class="content-panel">
                <h4><i class="fa fa-angle-right"></i> Doughnut</h4>
                <div class="panel-body text-center">
                  <canvas id="doughnut" height="300" width="400"></canvas>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="content-panel">
                <h4><i class="fa fa-angle-right"></i> Line</h4>
                <div class="panel-body text-center">
                  <canvas id="line" height="300" width="400"></canvas>
                </div>
              </div>
            </div>
          </div>
          <div class="row mt">
            <div class="col-lg-6">
              <div class="content-panel">
                <h4><i class="fa fa-angle-right"></i> Radar</h4>
                <div class="panel-body text-center">
                  <canvas id="radar" height="300" width="400"></canvas>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="content-panel">
                <h4><i class="fa fa-angle-right"></i> Polar Area</h4>
                <div class="panel-body text-center">
                  <canvas id="polarArea" height="300" width="400"></canvas>
                </div>
              </div>
            </div>
          </div>
          <div class="row mt">
            <div class="col-lg-6">
              <div class="content-panel">
                <h4><i class="fa fa-angle-right"></i> Bar</h4>
                <div class="panel-body text-center">
                  <canvas id="bar" height="300" width="400"></canvas>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="content-panel">
                <h4><i class="fa fa-angle-right"></i> Pie</h4>
                <div class="panel-body text-center">
                  <canvas id="pie" height="300" width="400"></canvas>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- page end-->
      </section>
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
        <a href="${path}/Dashio/chartjs.jsp#" class="go-top">
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
  <!--common script for all pages-->
  <script src="${path}/Dashio/lib/common-scripts.js"></script>
  <!--script for this page-->
  <script src="${path}/Dashio/lib/chart-master/Chart.js"></script>
  <script type="text/javascript">
var Script = function () {


    var doughnutData = [
        {
            value: 30,
            color:"#1abc9c"
        },
        {
            value : 50,
            color : "#2ecc71"
        },
        {
            value : 100,
            color : "#3498db"
        },
        {
            value : 40,
            color : "#9b59b6"
        },
        {
            value : 120,
            color : "#34495e"
        }

    ];
    var lineChartData = {
        labels : ["1","2","3","4","5","6","7","8"],
        datasets : [
            {
                fillColor : "rgba(220,220,220,0.5)",
                strokeColor : "rgba(220,220,220,1)",
                pointColor : "rgba(220,220,220,1)",
                pointStrokeColor : "#fff",
                data : [65,59,90,81,56,55,40,10]
            },
            {
                fillColor : "rgba(151,187,205,0.5)",
                strokeColor : "rgba(151,187,205,1)",
                pointColor : "rgba(151,187,205,1)",
                pointStrokeColor : "#fff",
                data : [28,48,40,19,96,27,100,10]
            }
        ]

    };
    var pieData = [
        {
            value: 30,
            color:"#1abc9c"
        },
        {
            value : 50,
            color : "#16a085"
        },
        {
            value : 100,
            color : "#27ae60"
        }

    ];
    var barChartData = {
        labels : ["January","February","March","April","May","June","July"],
        datasets : [
            {
                fillColor : "rgba(220,220,220,0.5)",
                strokeColor : "rgba(220,220,220,1)",
                data : [65,59,90,81,56,55,40]
            },
            {
                fillColor : "rgba(151,187,205,0.5)",
                strokeColor : "rgba(151,187,205,1)",
                data : [28,48,40,19,96,27,100]
            }
        ]

    };
    var chartData = [
        {
            value : Math.random(),
            color: "#D97041"
        },
        {
            value : Math.random(),
            color: "#C7604C"
        },
        {
            value : Math.random(),
            color: "#21323D"
        },
        {
            value : Math.random(),
            color: "#9D9B7F"
        },
        {
            value : Math.random(),
            color: "#7D4F6D"
        },
        {
            value : Math.random(),
            color: "#584A5E"
        }
    ];
    var radarChartData = {
        labels : ["","","","","","",""],
        datasets : [
            {
                fillColor : "rgba(220,220,220,0.5)",
                strokeColor : "rgba(220,220,220,1)",
                pointColor : "rgba(220,220,220,1)",
                pointStrokeColor : "#fff",
                data : [65,59,90,81,56,55,40]
            },
            {
                fillColor : "rgba(151,187,205,0.5)",
                strokeColor : "rgba(151,187,205,1)",
                pointColor : "rgba(151,187,205,1)",
                pointStrokeColor : "#fff",
                data : [28,48,40,19,96,27,100]
            }
        ]

    };
    new Chart(document.getElementById("doughnut").getContext("2d")).Doughnut(doughnutData);
    new Chart(document.getElementById("line").getContext("2d")).Line(lineChartData);
    new Chart(document.getElementById("radar").getContext("2d")).Radar(radarChartData);
    new Chart(document.getElementById("polarArea").getContext("2d")).PolarArea(chartData);
    new Chart(document.getElementById("bar").getContext("2d")).Bar(barChartData);
    new Chart(document.getElementById("pie").getContext("2d")).Pie(pieData);


}();
</script>

</body>

</html>
