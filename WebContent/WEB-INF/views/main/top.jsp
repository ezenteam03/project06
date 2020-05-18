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
  
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
  <script src="${path}/Dashio/lib/jquery/jquery.min.js"></script>
<style>
.popup_btn a {
  display: inline-block;
  padding: 20px;
  background: darkred;
  color: #fff;
}

.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
  opacity: 0;
  z-index: 900;
}

.overlay:target {
  visibility: visible;
  opacity: 1;
}

.popup {
  position: fixed;
  width: 60%;
  padding: 10px;
  max-width: 500px;
  border-radius: 10px;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: rgba(255, 255, 255, .9);
  /* "delay" the visibility transition */
  -webkit-transition: opacity .5s, visibility 0s linear .5s;
  transition: opacity .5s, visibility 0s linear .5s;
  z-index: 1;
}

.popup:target {
  visibility: visible;
  opacity: 1;
  /* cancel visibility transition delay */
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}

.popup-close {
  position: absolute;
  padding: 10px;
  max-width: 500px;
  border-radius: 10px;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: rgba(255, 255, 255, .9);
}

.popup .close {
  position: absolute;
  right: 5px;
  top: 5px;
  padding: 5px;
  color: #000;
  transition: color .3s;
  font-size: 2em;
  line-height: .6em;
  font-weight: bold;
}

.popup .close:hover {
  color: #00E5EE;
}

.popup03 {
  position: fixed;
  width: 60%;
  padding: 10px;
  max-width: 800px;
  border-radius: 10px;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: rgba(255, 255, 255, .9);
  /* "delay" the visibility transition */
  -webkit-transition: opacity .5s, visibility 0s linear .5s;
  transition: opacity .5s, visibility 0s linear .5s;
  z-index: 1;
}

.form-login01 {
	max-width: 700px;
	margin-left:5%;
	background: #fff;
	border-radius: 5px;
	-webkit-border-radius: 5px;
}
.form-login01 h2.form-login01-heading {
	margin: 0;
	padding: 25px 20px;
	text-align: center;
	background: #4ecdc4;
	border-radius: 5px 5px 0 0;
	-webkit-border-radius: 5px 5px 0 0;
	color: #fff;
	font-size: 20px;
	text-transform: uppercase;
	font-weight: 300;
}

th{text-align:center;}
.name{width:20%}
.post{width:15%}
.contact{width:40%}
.status{width:25%}
					
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		var check01=0;
		$("#pass01").keyup(function(){
			var num = checkPW($(this).val());
			if(num == 1){
				$("#txtOut").text("8~20자리로 적어주세요");
			}else if(num == 2){
				$("#txtOut").text("공백은 사용이 불가능합니다");
			}else if(num == 3){
				$("#txtOut").text("숫자,영문,특수문자로 조합하세요");
			}else{
				check01=1;
				$("#txtOut").text("사용 가능한 비밀번호입니다");
			}
			
		});
		
		var check02=0;
		$("#pass02").keyup(function(){
			if($("#pass01").val() == $(this).val()){
				check02=1;
				$("#txtOut").text("비밀번호가 일치합니다.");
			}else{
				$("#txtOut").text("비밀번호가 일치하지 않습니다.");
			}
		});
		
		$("#btn01").click(function(){
			$(location).attr('href','#none');
		});

		$("#inforBtn").click(function(){
			$("#inforCheckForm").submit();
		});
		
		$("#updateBtn").click(function(){
			if(check01 == 1 && check02 == 1){
				$("#updateInforForm").submit();
			}
		});
		
		var ck = "${ck}";
		if(ck == 1){
			$(location).attr('href','#pop02');
		}else if(ck == 2){
			Swal.fire({
				  title:'비밀번호',
				  text:"비밀번호를 확인하세요",
				  icon: 'error'
				}).then((result) => {
					if (result.value) {
						$(location).attr('href','#pop01');
					}
				})
		}else if(ck == 3){
			Swal.fire({
				  title:'정보 수정',
				  text:"정보 수정 완료",
				  icon: 'success'
				}).then((result) => {
					if (result.value) {
						$(location).attr('class','close');
					}
				})
		}
		
		$("[name=ck]").click(function(){
			var ckPhone = $("#ckPhone").is(":checked");
			var ckMail = $("#ckMail").is(":checked");
			if(ckPhone){
				var txt = $("#phone").val();
				$("#con").val(txt);
			}else if(ckMail){
				var txt = $("#mail").val();
				$("#con").val(txt);
			}
		});

	});
	
	function checkPW(pass){
		var pass01 = pass;
		var num = pass01.search(/[0-9]/g);
		var eng = pass01.search(/[a-z]/ig);
		var spe = pass01.search(/[`~!@#$%^&*;:\/?]/gi);
		
		if(pass01.length < 8 || pass01.length > 20){ // 8~20
			return 1;
		}else if(pass01.search(/\s/) != -1){	// 공백
			return 2;
		}else if(num < 0 || eng < 0 || spe < 0) {	// 숫자영문특수문자
			return 3;
		}else{
			return 0;
		}
	}
	function logOut(){
		Swal.fire({
			  title:'로그아웃 ',
			  text:"로그아웃 하시겠습니까?",
			  icon: 'info',
			  showCancelButton: true
			}).then((result) => {
				if (result.value) {
					$(location).attr("href","${path}/PmsMember.do?method=logout");
				}
			})
	}

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
      <a href="#" class="logo"><img src="${path}/Jin/img/logo1-1.png" style="width:35px;height:35px;margin-top:-5px;">&nbsp;&nbsp;&nbsp;<b>Project<span>&nbsp;&nbsp;&nbsp;${proName }</span></b></a>
      <!--logo end-->
      
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li><a class="logout" href="#pop01">개인정보</a></li>
          <li><a class="logout" href="#pop03">참여인원</a></li>
          <li><a class="logout" href="javascript:logOut();">LogOut</a></li>

        </ul>
      </div>
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
         <li>
         <img src="${path}/Jin/img/logo1-1.png" style="width:100px;height:100px;margin-left:40px;">
         <br>
         <h3 style="color:white" align="center">${emp.grade} ${emp.name}</h3>
         </li>
          <li class="mt">
            <a class="active" href="${path }/DashTeam.do?method=list">
              <i class="fa fa-dashboard"></i>
              <span>대시보드</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="#">
              <i class="fa fa-desktop"></i>
              <span>업무관리</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="${path }/chart.do?method=pm2">
              <i class="fa fa-cogs"></i>
              <span>일정관리</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="${path}/notice.do?method=list">
              <i class="fa fa-book"></i>
              <span>공지사항</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="${path}/meet.do?method=list">
              <i class="fa fa-tasks"></i>
              <span>회의록</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="#">
              <i class="fa fa-th"></i>
              <span>이슈리스트</span>
              </a>
          </li>
          <li>
            <a href="${path}/PMSemp.do?method=list">
              <i class="fa fa-group"></i>
              <span>인적자원관리(팀원 비활성화) </span>
              </a>
          </li>        
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->
    
<div id="pop01" class="overlay">
	<div class="popup">
		<a href="#none" class="close">&times;</a>
	
		<form class="form-login" id="inforCheckForm" action="${path}/PmsMember.do?method=information" method="post" style="background-color:#e0e0e0;margin-top:0%">

		<h2 class="form-login-heading">INFORMATION</h2>
	
		<div class="login-wrap">
			<label>사원번호</label>
			<input type="text" class="form-control" value="${mno}" name="mno" readonly="readonly">
			
			<br>
			
			<label>비밀번호</label>
				<input type="password" class="form-control" name="pass" id="pop01Pass" placeholder="비밀번호를 입력하세요" autofocus>
		
			<button class="btn btn-theme btn-block" type="button" id="inforBtn" style="margin-top:10%;"><i class="fa fa-lock"></i>&nbsp;CHECK</button>
								
		</div>
			
		</form>
	</div>
</div>

<div id="pop02" class="overlay">
	<div class="popup" style="margin-top:40px;">
		<a href="#none" class="close">&times;</a>
	
		<form class="form-login" id="updateInforForm" action="${path}/PmsMember.do?method=updateInfor" method="post" style="background-color:#e0e0e0;margin-top:0%">
	
		<h2 class="form-login-heading">INFORMATION</h2>
	
		<div class="login-wrap">
		
			<label>사원번호</label>
			<input type="text" class="form-control" name="mno" value="${mno}" readonly="readonly">
			
			<br>
			
			<label>이름</label>
			<input type="text" class="form-control" value="${emp.name }" readonly="readonly">
			
			<br>
			
			<label>직책</label>
			<input type="text" class="form-control" value="${emp.grade }" readonly="readonly">
			
			<br>
			
			<label>부서</label>
			<input type="text" class="form-control" value="${emp.dept }" readonly="readonly">
		
			<br>
			
			<label>전화번호</label>
			<input type="text" class="form-control" value="${emp.phone }" id="phone" value="010-1234-1234" readonly="readonly">
			
			<br>
			
			<label>이메일</label>
			<input type="text" class="form-control" value="${emp.email }" id="mail" value="qweasd@naver.com" readonly="readonly">
			
			<br>
			
			<label>새 비밀번호</label>
				<input type="password" class="form-control" id="pass01" placeholder="새 비밀번호를 입력하세요" autofocus>
				<input type="password" class="form-control" id="pass02" name="pass" placeholder="비밀번호를 다시 입력하세요">
			<div id="txtOut"></div>
			
			<br>
				
			<label>희망 연락처</label>
				<input type="text" class="form-control" id="con" name="wcon" placeholder="희망 연락처 입력하세요">
			<div>
				<input type="radio" value="remember-me" name="ck" id="ckPhone" style="margin-left:1%;">전화번호&nbsp;
				<input type="radio" value="remember-me" name="ck" id="ckMail" style="margin-left:1%;">이메일
			</div>	

		</div>
		
		<div>
			<button class="btn btn-theme btn-block" type="button" id="updateBtn"><i class="fa fa-repeat"></i>&nbsp;MODIFY</button>								
		</div>
			
		</form>
	</div>
</div>

<div id="pop03" class="overlay">
	<div class="popup03">
		<a href="#" id="btn01" class="close">&times;</a>
	
		<form class="form-login01" action="#" style="background-color:#e0e0e0;margin-top:0%">
	
		<h2 class="form-login01-heading">PARTICIPANTS</h2>
		
		<div style="width:700px;margin-top:-30px;">
			<div class="row">
			<div class="col-md-12 mt">
			<div class="content-panel">
			
			<div align="right" style="margin-right:20px;">
				<div class="form-inline">
					<input type="email" class="form-control" placeholder="사원 이름">
					&nbsp;
					<button type="button" class="btn btn-theme">Search</button>
				</div>
			</div>
			
			<br>
			
			<table class="table table-hover">
				<tr>
					<th class="name">이름</th>
					<th class="post">직책</th>
					<th class="contact">희망 연락처</th>
					<th class="status">상태</th>
				</tr>
				
				<tr><td>코코아</td><td>대리</td><td>010-1234-1234</td><td>로그인</td></tr>
				<tr><td>코코아</td><td>대리</td><td>cocoa@naver.com</td><td>로그인</td></tr>
				<tr><td>코코아</td><td>대리</td><td>010-1234-1234</td><td>로그아웃</td></tr>
			</table>
			
			<div>페이징 처리</div>
			
			</div>	
			</div>
			</div>
		</div>
		
		
			
		</form>
	</div>
</div>

  </section>
</body>

</html>
