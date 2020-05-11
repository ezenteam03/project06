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
        <h3><i class="fa fa-angle-right"></i> Grid: Stacked Horizontal</h3>
        <div class="row show-grid mt">
          <div class="col-md-1">.col-md-1</div>
          <div class="col-md-1">.col-md-1</div>
          <div class="col-md-1">.col-md-1</div>
          <div class="col-md-1">.col-md-1</div>
          <div class="col-md-1">.col-md-1</div>
          <div class="col-md-1">.col-md-1</div>
          <div class="col-md-1">.col-md-1</div>
          <div class="col-md-1">.col-md-1</div>
          <div class="col-md-1">.col-md-1</div>
          <div class="col-md-1">.col-md-1</div>
          <div class="col-md-1">.col-md-1</div>
          <div class="col-md-1">.col-md-1</div>
        </div>
        <div class="row show-grid">
          <div class="col-md-8">.col-md-8</div>
          <div class="col-md-4">.col-md-4</div>
        </div>
        <div class="row show-grid">
          <div class="col-md-4">.col-md-4</div>
          <div class="col-md-4">.col-md-4</div>
          <div class="col-md-4">.col-md-4</div>
        </div>
        <div class="row show-grid">
          <div class="col-md-6">.col-md-6</div>
          <div class="col-md-6">.col-md-6</div>
        </div>
        <h3><i class="fa fa-angle-right"></i> Example: Mobile and Desktop</h3>
        <!-- Stack the columns on mobile by making one full-width and the other half-width -->
        <div class="row show-grid mt">
          <div class="col-xs-12 col-md-8">.col-xs-12 .col-md-8</div>
          <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
        </div>
        <!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop -->
        <div class="row show-grid">
          <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
          <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
          <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
        </div>
        <!-- Columns are always 50% wide, on mobile and desktop -->
        <div class="row show-grid">
          <div class="col-xs-6">.col-xs-6</div>
          <div class="col-xs-6">.col-xs-6</div>
        </div>
        <h3><i class="fa fa-angle-right"></i> Example: Mobile, Tablets & Desktop</h3>
        <div class="row show-grid mt">
          <div class="col-xs-12 col-sm-6 col-md-8">.col-xs-12 .col-sm-6 .col-md-8</div>
          <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
        </div>
        <div class="row show-grid">
          <div class="col-xs-6 col-sm-4">.col-xs-6 .col-sm-4</div>
          <div class="col-xs-6 col-sm-4">.col-xs-6 .col-sm-4</div>
          <!-- Optional: clear the XS cols if their content doesn't match in height -->
          <div class="clearfix visible-xs"></div>
          <div class="col-xs-6 col-sm-4">.col-xs-6 .col-sm-4</div>
        </div>
        <h3><i class="fa fa-angle-right"></i> Example: Offsetting Columns</h3>
        <div class="row show-grid mt">
          <div class="col-md-4">.col-md-4</div>
          <div class="col-md-4 col-md-offset-4">.col-md-4 .col-md-offset-4</div>
        </div>
        <div class="row show-grid">
          <div class="col-md-3 col-md-offset-3">.col-md-3 .col-md-offset-3</div>
          <div class="col-md-3 col-md-offset-3">.col-md-3 .col-md-offset-3</div>
        </div>
        <div class="row show-grid">
          <div class="col-md-6 col-md-offset-3">.col-md-6 .col-md-offset-3</div>
        </div>
      </section>
      <!-- /wrapper -->
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
        <a href="${path}/Dashio/grid.jsp#" class="go-top">
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

</body>

</html>
