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
  <script type="text/javascript">
  $(document).ready(function(){
	 var isReg="${param.name}";
	 // name이 공백이 아닐 때
	 if(isReg!=""){
		 if(!confirm("등록 완료하였습니다\n계속 등록하시겠습니까?")){
			 $(location).attr("href","${path}/PMSemp.do?method=list")
		 }
	 }
	 // 등록 버튼
	 $("#regBtn").click(function(){
		if(confirm("등록합니다")){
			$("form").submit();
		} 
	 });
	 // 이전 버튼
	 $("#preBtn").click(function(){		 
		$(location).attr("href","${path}/PMSemp.do?method=modList") 
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
        <h3><i class="fa fa-angle-right"></i> 사원정보 수정 </h3>
        <!-- BASIC FORM ELELEMNTS -->
        <div class="row mt">
          <div class="col-lg-12">
            <div class="form-panel">
              <h4 class="mb"><i class="fa fa-angle-right"></i>사원정보</h4>
              <form class="form-horizontal style-form" 
              method="post" action="${path}/PMSemp.do?method=insert">
              <!-- 사원번호 HIDDEN처리 (sequence처리 -->
<%--                 <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">사원번호</label>
                  <div class="col-sm-10">
                    <input type="text" value="${pmsemp.eno}" class="form-control">
                  </div>
                </div> --%>

                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">이름</label>
                  <div class="col-sm-10">
                    <span>홍길동</span>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">부서명</label>
                  <select class="sel-dept">
                  	<option name="dept" value="개발1팀">개발1팀</option>
                  	<option name="dept" value="개발2팀">개발2팀</option>
                  	<option name="dept" value="개발3팀">개발3팀</option>
                  	<option name="dept" value="개발4팀">개발4팀</option>
                  	<option name="dept" value="개발5팀">개발5팀</option>
                  	<option name="dept" value="개발6팀">개발6팀</option>
                  	<option name="dept" value="개발7팀">개발7팀</option>
                  	<option name="dept" value="개발8팀">개발8팀</option>
                  	<option name="dept" value="개발9팀">개발9팀</option>
                  	<option name="dept" value="개발10팀">개발10팀</option>
                  </select>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">직책</label>
                  <select class="sel-grade">
                  	<option value="선택">선택</option>
                  	<option name="grade" value="기술이사">기술이사</option>
                  	<option name="grade" value="상무">상무</option>
                  	<option name="grade" value="부장">부장</option>
                  	<option name="grade" value="차장">차장</option>
                  	<option name="grade" value="과장">과장</option>
                  	<option name="grade" value="대리">대리</option>
                  	<option name="grade" value="사원">사원</option>
                  	<option name="grade" value="퇴사">퇴사</option>
                  </select>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">핸드폰</label>
                  <div class="col-sm-10">
                    <span>핸드폰</span>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">이메일</label>
                  <div class="col-sm-10">
                    <span>이메일</span>
                  </div>
                </div>
	            <div class="" style="text-align:right;">
	               <div style="display:inline-block; ">
			           <button type="button" class="btn btn-success" id="modBtn" 
			           			style="margin-right:20px;">수정</button>
			           <button type="button" class="btn btn-warning" id="preBtn"
			           			style="margin-right:20px;">취소</button>
		           </div>
		        </div>
              </form>
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
