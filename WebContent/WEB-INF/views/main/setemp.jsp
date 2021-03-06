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
  <title>PMS사용자 리스트 : 직급변경 </title>
	<style type="text/css">
		.sch-bar{width:450px; height:40px;border-radius:10px; outline:none; border-color:black;
					padding-left:10px;}
		.sch-btn{width: 100px; height: 40px; border-radius: 10px; outline: none;
    				border-color: black; background-color: black; color: white;}
    	.sel-dept{height: 30px; border-radius: 10px; outline: none; margin-left: 15px;}
    	.sel-grade{height: 30px; border-radius: 10px; outline: none; margin-left: 15px;}
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
  <script src="${path}/a00_com/jquery.min.js"></script>
  <script src="${path}/a00_com/popper.min.js"></script>
  <script src="${path}/a00_com/bootstrap.min.js"></script>
  <script src="${path}/a00_com/jquery-ui.js"></script>
  <script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
  <script type="text/javascript">
  $(document).ready(function(){
	  $("#ceoBtn").click(function(){			 
			 Swal.fire({
				  title:'권한변경 ',
				  text:"CEO로 권한을 변경하시겠습니까?",
				  icon: 'info',
				  showCancelButton: true
			}).then((result) => {
				if (result.value) {
					$("#setForm").attr("action","${path}/PMSemp.do?method=updateCeo");
					$("#setForm").submit();
				}
			});
		 });
	  $("#hrBtn").click(function(){			 
			 Swal.fire({
				  title:'권한변경 ',
				  text:"인사관리자로 권한을 변경하시겠습니까?",
				  icon: 'info',
				  showCancelButton: true
			}).then((result) => {
				if (result.value) {
					$("#setForm").attr("action","${path}/PMSemp.do?method=updateHr");
					$("#setForm").submit();
				}
			});
		 });
	 // CTO 버튼
	/*  $("#ctoBtn").click(function(){		
		$("#setForm").attr("action","${path}/PMSemp.do?method=update");
		$("#setForm").submit();
	 }); */
	 
	 $("#ctoBtn").click(function(){			 
		 Swal.fire({
			  title:'권한변경 ',
			  text:"CTO로 권한을 변경하시겠습니까?",
			  icon: 'info',
			  showCancelButton: true
		}).then((result) => {
			if (result.value) {
				$("#setForm").attr("action","${path}/PMSemp.do?method=update");
				$("#setForm").submit();
			}
		});
	 });
	 
	// PM 버튼
	/* $("#pmBtn").click(function(){		
       $("#setForm").attr({"action":"${path}/PMSemp.do?method=updatePm"});
	   $("#setForm").submit();
	 }); */
	 
	 $("#pmBtn").click(function(){			 
		 Swal.fire({
			  title:'권한변경 ',
			  text:"PM으로 권한을 변경하시겠습니까?",
			  icon: 'info',
			  showCancelButton: true
		}).then((result) => {
			if (result.value) {
				$("#setForm").attr({"action":"${path}/PMSemp.do?method=updatePm"});
				$("#setForm").submit();
			}
		});
	 });
		
	
	 // 이전 버튼
	 $("#preBtn").click(function(){		 
		$(location).attr("href","${path}/PMSemp.do?method=list") 
	 }); 
  });
  </script>
 
</head>

<body>
	<jsp:include page="../main/top.jsp"/>

 <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 사원정보 </h3>
        <!-- BASIC FORM ELELEMNTS -->
        <div class="row mt">
          <div class="col-lg-12">
            <div class="form-panel">
              <h4 class="mb"><i class="fa fa-angle-right"></i>권한설정</h4>
              <form class="form-horizontal style-form" method="post" id="setForm">
              <input type="hidden" name="eno" value="${pemp.eno}"/>
              <input type="hidden" name="peno" value="${pemp.eno}"/>
              <input type="hidden" name="phone" value="${pemp.phone }"/>                         
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">이름</label>
                  <div class="col-sm-10">
                    <span>${pemp.name}</span>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">부서명</label>
                  <div class="col-sm-10">
                    <span>${pemp.dept}</span>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">직책</label>
                  <div class="col-sm-10">
                    <span>${pemp.grade}</span>

                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">핸드폰</label>
                  <div class="col-sm-10">
                    <span>${pemp.phone}</span>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">이메일</label>
                  <div class="col-sm-10">
                    <span>${pemp.email}</span>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">권한</label>
                  <div class="col-sm-10">
                    <span>${pemp.cname==null?"PMS등록안됨":pemp.cname}</span>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">프로젝트</label>
                  <div class="col-sm-10">
                    <span>${pemp.pno==null?"PMS등록안됨":pemp.pno}</span>
	                  <select class="sel-grade" name="pno">
	                  	<c:forEach var="p" items="${plist}" >
	                  		<option value="${p}">${p}</option>
	                  	</c:forEach>
	                  </select>
                  </div>
                </div>
                </form>
	            <div id="btn" style="text-align:right;">
	               <div style="display:inline-block; ">
	              	   <input type="button" class="btn btn-danger" v-if="mdiv==6"
		           				id="ceoBtn" style="margin-right:20px;" value="CEO 설정"/>
		           	   <input type="button" class="btn btn-success" v-if="mdiv==6"
		           				id="hrBtn" style="margin-right:20px;" value="HR 설정"/>
	             	   <input type="button" class="btn btn-primary" v-if="mdiv==2"
		           				id="ctoBtn" style="margin-right:20px;" value="CTO 설정"/>
			           <input type="button" class="btn btn-success" v-if="mdiv==2||mdiv==3"
			           			id="pmBtn" style="margin-right:20px;" value="PM 설정" />
			           <button type="button" class="btn btn-default"
			           			id="preBtn">이전</button>
      
		           </div>
		        </div>
            </div>
          </div>
          <!-- col-lg-12-->
        </div>
        <!-- /row -->
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
        <a href="${path}/Dashio/index.jsp#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
    <!--footer end-->
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
<script>
var vm = new Vue({
	el:"#btn",
	data:{mdiv:${infor_M.mdiv}}
});
</script>
</html>
