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
  <script src="${path}/Dashio/lib/jquery/jquery.min.js"></script>
  <script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>
	});
  </script>
</head>

<body>
  <section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
    
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <!--logo start-->
      <a href="${path}/Dashio/index.jsp" class="logo"><img src="${path}/Jin/img/logo1-1.png" style="width:35px;height:35px;margin-top:-5px;">&nbsp;&nbsp;&nbsp;<b>Project<span>&nbsp;&nbsp;&nbsp;프로젝트 명</span></b></a>
      <!--logo end-->
      
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li><a class="logout" href="${path}/Dashio/login.jsp">Logout</a></li>
        </ul>
      </div>
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="${path}/Dashio/profile.jsp"><img src="${path}/Dashio/img/ui-sam.jpg" class="img-circle" width="80"></a></p>
          <h5 class="centered">Sam Soffes</h5>
          <li class="mt">
            <a class="active" href="${path}/Dashio/index.jsp">
              <i class="fa fa-dashboard"></i>
              <span>Dashboard</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="#">
              <i class="fa fa-desktop"></i>
              <span>UI Elements</span>
              </a>
            <ul class="sub">
              <li><a href="${path}/Dashio/general.jsp">테스트01</a></li>
              <li><a href="${path}/Dashio/buttons.jsp">테스트02</a></li>
              <li><a href="${path}/Dashio/panels.jsp">테스트03</a></li>
              <li><a href="${path}/Dashio/font_awesome.jsp">Font Awesome</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="#">
              <i class="fa fa-cogs"></i>
              <span>Components</span>
              </a>
            <ul class="sub">
              <li><a href="${path}/Dashio/grids.jsp">Grids</a></li>
              <li><a href="${path}/Dashio/calendar.jsp">Calendar</a></li>
              <li><a href="${path}/Dashio/gallery.jsp">Gallery</a></li>
              <li><a href="${path}/Dashio/todo_list.jsp">Todo List</a></li>
              <li><a href="${path}/Dashio/dropzone.jsp">Dropzone File Upload</a></li>
              <li><a href="${path}/Dashio/inline_editor.jsp">Inline Editor</a></li>
              <li><a href="${path}/Dashio/file_upload.jsp">Multiple File Upload</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="#">
              <i class="fa fa-book"></i>
              <span>Extra Pages</span>
              </a>
            <ul class="sub">
              <li><a href="${path}/Dashio/blank.jsp">Blank Page</a></li>
              <li><a href="${path}/Dashio/login.jsp">Login</a></li>
              <li><a href="${path}/Dashio/lock_screen.jsp">Lock Screen</a></li>
              <li><a href="${path}/Dashio/profile.jsp">Profile</a></li>
              <li><a href="${path}/Dashio/invoice.jsp">Invoice</a></li>
              <li><a href="${path}/Dashio/pricing_table.jsp">Pricing Table</a></li>
              <li><a href="${path}/Dashio/faq.jsp">FAQ</a></li>
              <li><a href="${path}/Dashio/404.jsp">404 Error</a></li>
              <li><a href="${path}/Dashio/500.jsp">500 Error</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="#">
              <i class="fa fa-tasks"></i>
              <span>Forms</span>
              </a>
            <ul class="sub">
              <li><a href="${path}/Dashio/form_component.jsp">Form Components</a></li>
              <li><a href="${path}/Dashio/advanced_form_components.jsp">Advanced Components</a></li>
              <li><a href="${path}/Dashio/form_validation.jsp">Form Validation</a></li>
              <li><a href="${path}/Dashio/contactform.jsp">Contact Form</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="#">
              <i class="fa fa-th"></i>
              <span>Data Tables</span>
              </a>
            <ul class="sub">
              <li><a href="${path}/Dashio/basic_table.jsp">Basic Table</a></li>
              <li><a href="${path}/Dashio/responsive_table.jsp">Responsive Table</a></li>
              <li><a href="${path}/Dashio/advanced_table.jsp">Advanced Table</a></li>
            </ul>
          </li>
          <li>
            <a href="${path}/Dashio/inbox.jsp">
              <i class="fa fa-envelope"></i>
              <span>Mail </span>
              <span class="label label-theme pull-right mail-info">2</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="#">
              <i class=" fa fa-bar-chart-o"></i>
              <span>Charts</span>
              </a>
            <ul class="sub">
              <li><a href="${path}/Dashio/morris.jsp">Morris</a></li>
              <li><a href="${path}/Dashio/chartjs.jsp">Chartjs</a></li>
              <li><a href="${path}/Dashio/flot_chart.jsp">Flot Charts</a></li>
              <li><a href="${path}/Dashio/xchart.jsp">xChart</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="#">
              <i class="fa fa-comments-o"></i>
              <span>Chat Room</span>
              </a>
            <ul class="sub">
              <li><a href="${path}/Dashio/lobby.jsp">Lobby</a></li>
              <li><a href="${path}/Dashio/chat_room.jsp"> Chat Room</a></li>
            </ul>
          </li>
          <li>
            <a href="${path}/Dashio/google_maps.jsp">
              <i class="fa fa-map-marker"></i>
              <span>Google Maps </span>
              </a>
          </li>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->
  </section>
</body>

</html>
