<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
	
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>
		$("h2").text("시작");
		$("h2").click(function(){
			$("#dialog").dialog("open");
		});	
		$( "#dialog" ).dialog({
			autoOpen:false,
			modal:true,
			buttons:{
				"기능버튼":function(){
					alert("버튼클릭!");
				}
			}
		});
		
/*		swal({
		     title: "로그인 성공",	// 큰 문자열   (title:"", 문자열 생략 가능)
		     text: "성공했어요",	// 작은 문자열
		     icon: "success"	// seccess, info, error	
		}).then((value) => {
		    if(value){
		    	// 확인 버튼 클릭시 수행 코드
		    	// ex) submit같은 거
		    	$("[name=proc]").val("main");
		    	$("#loginForm").submit();
		    }
		});*/
		
		Swal.fire({
		     title:"로그아웃",				// 큰 문자열
		     text: "로그아웃 하시겠습니까?",	// 작은 문자열
		     icon: "info", 				// seccess, info, error
		     buttons: ["No", "Yes"],
		}).then((value) => {
		    if(value){
		    	// Yes 버튼 클릭시 수행 코드
		    	$("[name=proc]").val("logout");
		    	$("#logout").submit();
		    }else{
		    	// No 버튼 클릭시 수행 코드
		    	history.back();
		    }
		});
		/*Swal.fire({
			  title: 'Error!',
			  html: '<p>You can use <b>bold text</b>, ' +
				    '<a href="//sweetalert2.github.io">links</a> ' +
				    'and other HTML tags</p>' +
				    '<p>this is second line</p>',
			  icon: 'error',
			  confirmButtonText: 'Cool'
			})*/
	});
</script>
</head>

<body>
<div class="container">
    <h2 align='center'></h2>
</div>
<div id="dialog" title="Basic dialog">
  <p>This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
</div>
</body>
</html>