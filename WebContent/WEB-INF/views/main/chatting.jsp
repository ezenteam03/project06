<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style type="text/css">
	.input-group-text{width:100%;background-color:linen;color:black;font-weight:bolder;}
	.input-group-prepend{width:20%;}
	#chatArea{
		width:80%;height:200px;overflow-y:auto;text-align:left;
		border:1px solid green;
	}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){

		var wsocket;
		$("h2").text("채팅");
		$("#sendBtn").click(function(){
			sendMsg();
		});
		$("#msg").keyup(function(e){
			
			if(e.keyCode==13){
				sendMsg();
			}
		});
		$("#exitBtn").click(function(){
			wsocket.send("msg:"+$("#id").val()+":연결 접속 종료했습니다.");
			wsocket.close();
		});
		function sendMsg(){
			var id=$("#id").val();//보내는 사람 id
			var msg=$("#msg").val();//보내는 메시지
			
			wsocket.send("msg:"+id+":"+msg)
			$("#msg").val("");$("#msg").focus();
		}
		$("#id").keyup(function(e){
			
			if(e.keyCode==13){
				start();
				$("#msg").focus();
			}
		});				
		$("#enterBtn").click(function(){
			start()
		});
		function start(){
			if(confirm("채팅창 접속합니다!")){
				
				wsocket = new WebSocket("ws://192.168.4.112:7080/${path}/chat-ws.do");
				
				wsocket.onopen=function(evt){					
				
					console.log(evt);
					wsocket.send("msg:"+$("#id").val()+":연결 접속했습니다.");
				};
				// 2. 메시지를 전송해주고, 전송 받을 때 처리 내용.
				wsocket.onmessage = function(evt){
					var data = evt.data;
					if(data.substring(0,4)=="msg:"){
						revMsg=data.substring(4);
						recieveMsg(revMsg);
					}
				};
				// 3. 접속 종료 후, 처리할 메서드
				wsocket.onclose = function(){
					// 서버단에서 접속 종료 후, 처리할 front단 내용
					alert("접속 종료합니다!");
					$("#chatMessageArea").text("");
					$("#id").val("");
					$("#id").focus();
				};
			}			
		}
		// 메시지 처리 공통 함수 정의
		function recieveMsg(revMsg){
			// 전송해 온 메시지를 화면에서 추가 처리.
			$("#chatMessageArea").append(revMsg+"<br>");
			var ht = parseInt($("#chatArea").height());
			var mx = parseInt($("#chatMessageArea").height());
			/*
			chatMessageArea의 div가 메시지가 계속 추가되게 처리
			추가된 높이의 크기만큼 chatArea div의 scrolling 부분을 변경처리
			*/
			console.log(ht+":"+(mx));
			$("#chatArea").scrollTop(mx);
		}
		
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2></h2>
</div>
<div class="container">
 	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">아이디</span>
		</div>
		<input id="id" class="form-control" 
			placeholder="접속할 아이디를 입력하세요" />	
		<input type="button" class="btn btn-info"
			value="채팅입장" id="enterBtn"/>
		<input type="button" class="btn btn-success"
			value="나가기" id="exitBtn"/>		 
	</div>  
	<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="input-group-text">메시지</span>
		</div>
		<input id="msg" class="form-control" 
			placeholder="보낼 메시지 입력하세요" />	
		<input type="button" class="btn btn-info"
			value="전송" id="sendBtn"/>
	</div>		
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">내 용</span>
		</div>
		<!-- #chatArea -->
		<div id="chatArea" class="input-group-append">
			<div id="chatMessageArea" ></div>
		</div>	 
	</div> 
</div>
</body>
</html>