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
		<%--
		사용방법은 이곳을 참고해주세요
		https://sweetalert2.github.io/#examples
		--%>
		Swal.fire({
		  icon: 'success',
		  title: '시작합니다.',
		  text: '작업을 시작합니다.',
		  footer: '<a href="https://sweetalert2.github.io/#examples">사용법은 여기를 참고하세요</a>'
		});
		
		$.ajax({
			type:"post",
			url:"${path}/chart.do?method=ajaxdata",
			data: $("form").serialize(),
			dataType:"json",
			success:function(data){
				var clist = data.chartlist;
				var dataInfo = [];
				$.each(clist,function(idx, chart){
					dataInfo.push({
						name: chart.tname, id: ""+chart.tno+"", 
						parent: ""+chart.refno+"", 
						start: today+((chart.sdate+1) * day), 
						end: today+((chart.edate+1) * day),
						completed : chart.prog,
						owner : ""+chart.name+"", y : idx+1,
						collapsed : true, description : chart.level,
						});
				});
				...
				Highcharts.ganttChart('chartpm', cInfo);	
			}
		});
		
		$.ajax({
			type:"post", // Http 요청방식(GET, POST)
			// 요청이 전송되는 URL이 포함된 문자열
			url:"${path}/chart.do?method=ajaxdata",
			data: $("form").serialize(), // Http요청 후 return하는 값
			dataType:"json", // return받은 데이터의 Type을 지정
			// 성공적으로 값을 서버로 보냈을 경우 처리하는 코드
			success:function(data){	
				console.log("데이터 불러오기 성공")				
			},
			// 값을 제대로 받아오지 못했을 때 처리하는 코드
			error:function(err){
				console.log("ajax처리 에러");
				console.log(err);
			}
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