<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
  <title>사원 리스트 : 프로젝트 인원 추가</title>
	<style type="text/css">
		.sch-bar{width:450px; height:40px;border-radius:10px; outline:none; border-color:black;
					padding-left:10px;}
		.sch-btn{width: 100px; height: 40px; border-radius: 10px; outline: none;
    				border-color: black; background-color: black; color: white;}
    	.select-emp{width: 100px; height:40px; border-radius:10px; outline:none; border-color:black; font-weight:800;}
	</style>
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
 
</head>

<body>
	<jsp:include page="../main/top.jsp"/>

    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">

          <!-- /col-md-12 -->
          <div class="col-md-12 mt">     
            <div class="content-panel">
           	  <form method="post">
              <table class="table table-hover">
                <div>
                	<span style="font-size:25px; margin-left:10px;"><i class="fa fa-angle-right"></i>사원 목록</span>
                	<span style="float:right; margin-right:10px;">
	                	<input type="text" class="sch-bar" name="" id="" placeholder="Search"/>
	                	<input type="button" class="sch-btn" value="Search" />
	                	<input type="hidden" name="eno" value="${emp.eno}"/>
	                	<input type="hidden" name="phone" value="${emp.phone}" />
                	</span>
                </div>
                <thead>
                  <tr>
                    <th>사원번호</th>
                    <th>이름</th>
                    <th>직책</th>
                    <th>부서명</th>
                    <th>이메일</th>
                    <th>핸드폰</th>
                    <th>권한</th>
                    <th>선택</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="emp" items="${elist}">
                  <tr>
                    <th>${emp.eno}</th>
                    <th>${emp.name}</th>
                    <th>${emp.grade}</th>
                    <th>${emp.dept}</th>
                    <td style="width:150px;">${emp.email}</td>
                    <th>${emp.phone}</th>
                    <th>${emp.cname}</th>
                    <th><input type="radio" name="eno" value="${emp.eno}" id="" /></th>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
              </form>
              <!-- pagination -->
	          <div align="center">
			    <ul class="pagination pagination-sm">
			      <li class="page-item disabled">
			        <a class="page-link" href="#">&laquo;</a>
			      </li>
			      <li class="page-item active">
			        <a class="page-link" href="#">1</a>
			      </li>
			      <li class="page-item">
			        <a class="page-link" href="#">&raquo;</a>
			      </li>
			    </ul>
			  </div>   
              <!-- end -->
            </div>
          <!-- change button -->
            <div class="showback" style="text-align:right;">
               <div style="display:inline-block; ">
		           <button type="button" class="btn btn-info"
		           			id="insBtn" style="margin-right:20px;">추가</button>
		           <button type="button" class="btn btn-default">이전</button>
	           </div>
	        </div>
	      <!-- end -->	      
          </div>
          <!-- /col-md-12 -->    
      </section>
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->

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
