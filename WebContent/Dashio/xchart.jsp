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
  <link rel="stylesheet" href="${path}/Dashio/lib/xchart/xcharts.css">
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
      <section class="wrapper site-min-height">
        <h3><i class="fa fa-angle-right"></i>  XChart</h3>
        <!-- page start-->
        <div class="content-panel">
          <h4><i class="fa fa-angle-right"></i>  XChart Example</h4>
          <div class="panel-body">
            <figure class="demo-xchart" id="chart"></figure>
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
        <a href="${path}/Dashio/xchart.jsp#" class="go-top">
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
  <script src="${path}/Dashio/lib/xchart/d3.v3.min.js"></script>
  <script src="${path}/Dashio/lib/xchart/xcharts.min.js"></script>
  <script>
    (function() {
      var data = [{
        "xScale": "ordinal",
        "comp": [],
        "main": [{
          "className": ".main.l1",
          "data": [{
            "y": 15,
            "x": "2012-11-19T00:00:00"
          }, {
            "y": 11,
            "x": "2012-11-20T00:00:00"
          }, {
            "y": 8,
            "x": "2012-11-21T00:00:00"
          }, {
            "y": 10,
            "x": "2012-11-22T00:00:00"
          }, {
            "y": 1,
            "x": "2012-11-23T00:00:00"
          }, {
            "y": 6,
            "x": "2012-11-24T00:00:00"
          }, {
            "y": 8,
            "x": "2012-11-25T00:00:00"
          }]
        }, {
          "className": ".main.l2",
          "data": [{
            "y": 29,
            "x": "2012-11-19T00:00:00"
          }, {
            "y": 33,
            "x": "2012-11-20T00:00:00"
          }, {
            "y": 13,
            "x": "2012-11-21T00:00:00"
          }, {
            "y": 16,
            "x": "2012-11-22T00:00:00"
          }, {
            "y": 7,
            "x": "2012-11-23T00:00:00"
          }, {
            "y": 18,
            "x": "2012-11-24T00:00:00"
          }, {
            "y": 8,
            "x": "2012-11-25T00:00:00"
          }]
        }],
        "type": "line-dotted",
        "yScale": "linear"
      }, {
        "xScale": "ordinal",
        "comp": [],
        "main": [{
          "className": ".main.l1",
          "data": [{
            "y": 12,
            "x": "2012-11-19T00:00:00"
          }, {
            "y": 18,
            "x": "2012-11-20T00:00:00"
          }, {
            "y": 8,
            "x": "2012-11-21T00:00:00"
          }, {
            "y": 7,
            "x": "2012-11-22T00:00:00"
          }, {
            "y": 6,
            "x": "2012-11-23T00:00:00"
          }, {
            "y": 12,
            "x": "2012-11-24T00:00:00"
          }, {
            "y": 8,
            "x": "2012-11-25T00:00:00"
          }]
        }, {
          "className": ".main.l2",
          "data": [{
            "y": 29,
            "x": "2012-11-19T00:00:00"
          }, {
            "y": 33,
            "x": "2012-11-20T00:00:00"
          }, {
            "y": 13,
            "x": "2012-11-21T00:00:00"
          }, {
            "y": 16,
            "x": "2012-11-22T00:00:00"
          }, {
            "y": 7,
            "x": "2012-11-23T00:00:00"
          }, {
            "y": 18,
            "x": "2012-11-24T00:00:00"
          }, {
            "y": 8,
            "x": "2012-11-25T00:00:00"
          }]
        }],
        "type": "cumulative",
        "yScale": "linear"
      }, {
        "xScale": "ordinal",
        "comp": [],
        "main": [{
          "className": ".main.l1",
          "data": [{
            "y": 12,
            "x": "2012-11-19T00:00:00"
          }, {
            "y": 18,
            "x": "2012-11-20T00:00:00"
          }, {
            "y": 8,
            "x": "2012-11-21T00:00:00"
          }, {
            "y": 7,
            "x": "2012-11-22T00:00:00"
          }, {
            "y": 6,
            "x": "2012-11-23T00:00:00"
          }, {
            "y": 12,
            "x": "2012-11-24T00:00:00"
          }, {
            "y": 8,
            "x": "2012-11-25T00:00:00"
          }]
        }, {
          "className": ".main.l2",
          "data": [{
            "y": 29,
            "x": "2012-11-19T00:00:00"
          }, {
            "y": 33,
            "x": "2012-11-20T00:00:00"
          }, {
            "y": 13,
            "x": "2012-11-21T00:00:00"
          }, {
            "y": 16,
            "x": "2012-11-22T00:00:00"
          }, {
            "y": 7,
            "x": "2012-11-23T00:00:00"
          }, {
            "y": 18,
            "x": "2012-11-24T00:00:00"
          }, {
            "y": 8,
            "x": "2012-11-25T00:00:00"
          }]
        }],
        "type": "bar",
        "yScale": "linear"
      }];
      var order = [0, 1, 0, 2],
        i = 0,
        xFormat = d3.time.format('%A'),
        chart = new xChart('line-dotted', data[order[i]], '#chart', {
          axisPaddingTop: 5,
          dataFormatX: function(x) {
            return new Date(x);
          },
          tickFormatX: function(x) {
            return xFormat(x);
          },
          timing: 1250
        }),
        rotateTimer,
        toggles = d3.selectAll('.multi button'),
        t = 3500;

      function updateChart(i) {
        var d = data[i];
        chart.setData(d);
        toggles.classed('toggled', function() {
          return (d3.select(this).attr('data-type') === d.type);
        });
        return d;
      }

      toggles.on('click', function(d, i) {
        clearTimeout(rotateTimer);
        updateChart(i);
      });

      function rotateChart() {
        i += 1;
        i = (i >= order.length) ? 0 : i;
        var d = updateChart(order[i]);
        rotateTimer = setTimeout(rotateChart, t);
      }
      rotateTimer = setTimeout(rotateChart, t);
    }());
  </script>
</body>

</html>
