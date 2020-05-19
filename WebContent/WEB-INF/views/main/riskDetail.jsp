<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<link rel="stylesheet" href="${path}/a00_com/bootstrap.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#goMain").click(function(){
			$(location).attr("href","${path}/risk.do?method=list");			
		});	
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				$("#form").attr("action","${path}/risk.do?method=update");
				$("#form").submit();
			}
		});
		$("#cuptBt").click(function(){
			if(confirm("해결방안을 등록하시겠습니까?")){
				$("#form").attr("action","${path}/risk.do?method=comupdate");
				$("#form").submit();
			}
		});
	
		$(".custom-file-input").on("change",function(){
			$(this).next(".custom-file-label").text($(this).val());
		});	
		$(".fileInfo").click(function(){
			var fname=$(this).val();
			if(confirm("다운로드하시겠습니까?")){
				$(location).attr("href",
					"${path}/risk.do?method=download&fname="+fname);	
			}
			
		});
		
				
		$("#cmtBtn").click(function(){		
			alert("등록이 되었습니다");
			$("#cform").submit();
												
		});	

		
		$("#combt").click(function(){	
				$(location).attr("href","${path}/risk.do?method=comment");	
				$("#form").submit();										
		});	
		var ri="${ri}";
		if(ri == 1){
			$('#comment').css('display', 'block');
			$('#combt').css('display', 'none');
		}else{
			$('#comment').css('display', 'none');
		}
		if(ri==3){
			$('#uptBtn').css('display', 'none');
		}
		
		
		// 댓글 수정창 열기(댓글 상세)
		$("#comentbt").click(function(){			
			$(location).attr("href","${path}/risk.do?method=cdetail&rno="+rno);
		
		});
		
	});
		
</script>
</head>
<body>
<section id="container">
	<jsp:include page="top.jsp"/>
	<section id="main-content">
      <section class="wrapper">
		<div id="all">
        <div class="row">
         <!-- /col-md-12 -->
          <div class="col-md-12 mt">
            <div class="content-panel">

	<form method="post"  enctype="multipart/form-data" id="form"
	action="${path}/risk.do?method=comment">
	<input name="ino" type="hidden" value="${risk.ino }"/>
	
	
	
<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="input-group-text">작성자</span>
		</div>
		<input class="form-control" readonly="readonly"  style="background-color: #ffffff;"
			value="${risk.name }" placeholder="작성자입력하세요"/>	
			
		<div class="input-group-prepend">
			<span class="input-group-text">작 성 일</span>
		</div>
		<input  class="form-control" readonly="readonly"  style="background-color: #ffffff;"
			value="<fmt:formatDate type='both' value='${risk.wdate }'/>" 
			 />	
	
	</div>		
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">제 목</span>
		</div>
		<input name="title" class="form-control"
			value="${risk.title}"  
			placeholder="제목입력하세요" />	
		<div class="input-group-prepend">
			<span class="input-group-text">수정일</span>
		</div>
		<input class="form-control" readonly="readonly"  style="background-color: #ffffff;"
			value="<fmt:formatDate type='both' value='${risk.chdate}'/>" />	
		 
	</div>  	
		
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">내 용</span>
		</div>
		<textarea name="detail" rows="10" style="resize:none"
			class="form-control" 
			placeholder="내용입력하세요" >${risk.detail}</textarea>		 
	</div> 

	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">첨부 파일</span>
		</div>
		<input class="form-control fileInfo" name="fnames" 
			value="${risk.filenames[0]}" />	
		<div class="custom-file">
			<input type="file" name="report" 
				class="custom-file-input" id="file01"/>
			<label class="custom-file-label" for="file01">
			변경할려면 파일을 선택하세요!</label>
		</div>			
		 
	</div> 	
	

	<div class="input-group mb-3">	
						
		<div class="input-group-prepend">
			<span class="input-group-text">해결방안 작성일</span>
		</div>
		<input  class="form-control"  readonly="readonly"  style="background-color: #ffffff;"
			value="<fmt:formatDate type='both' value='${risk.cdate}'/>" 
			 />	
	</div>	
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">해결방안</span>
		</div>
		<textarea name="coment"  rows="5" style="resize:none"
			class="form-control" 
			placeholder="내용입력하세요" >${risk.coment}</textarea>		 
	</div> 

	<div style="text-align:right;">
		<input type="button" class="btn btn-info"
			value="뒤로가기" id="goMain"/>		
		<input type="button" class="btn btn-warning"
			value="수정" id="uptBtn"/>					
		<input type="button" class="btn btn-success"
			value="해결방안 저장" id="cuptBt"/>
	</div>
	
	<br>
	</form>
	
	
	<form method="post" enctype="multipart/form-data" id="cform"
	 	action="${path}/risk.do?method=cinsert">	
	     <input name="refno" type="hidden"
			 value="${empty comment.refno?0:comment.refno}" />	 	
	     <input name="ino" type="hidden"
			 value="${risk.ino}" />	 		  	
	<input type="button" value="댓글창 열기" id="combt">
	<!-- 댓글 -->
	<div id="comment">
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">댓글</span>
		</div>	
		<textarea  rows="5" style="resize:none; "
			class="form-control" name="cdetail"
			placeholder="내용입력하세요" >${comment.cdetail}</textarea>	
		<div class="input-group-append">
			<button class="input-group-text" id="cmtBtn">입력</button>
		</div>		 
	</div> 
	
	<div class="col-md-12 mt">
            <div class="content-panel">
   <table class="table table-hover">
   
      <c:forEach var="comment" items="${clist}">
 
      <tr class="text-center">
      <td class="num">${comment.mno}</td>
       
       <td class="txt" >${comment.cdetail}</td>
        
     
        <td class="num" ><a id="comentbt" href="#popup">수정</a></td>
        <td class="num"><input type="button" class="btn btn-info"
			value="댓글" id="cComment" />	</td>
		<td class="num2"><fmt:formatDate type='both' value='${comment.wdate}'/></td>
      </tr>
   
      </c:forEach>
    
  </table>  
</div></div>
</div>
	</form>
<div id="popup" class="overlay">
	<div class="popup">
		<a href="#none" class="close">&times;</a>
	
		<form class="form-login" id="inforCheckForm" method="post" style="background-color:#e0e0e0;margin-top:0%">

		<h2 class="form-login-heading">댓글 수정</h2>
		<div class="login-wrap">
			<label>작성자</label>
			<input type="text" class="form-control" value="${mno}" name="mno" readonly="readonly"/>
			
			<br>
			<label>작성일</label><br>
			<fmt:formatDate type='both' value='${comment.wdate}'/>
			
			<br>
			
			<label>댓글 내용</label>
				<input type="text" class="form-control" value="${comment.cdetail}" name="mno" />
		
			<button class="btn btn-theme btn-block" type="button" id="inforBtn" style="margin-top:10%;"><i class="fa fa-lock"></i>&nbsp;CHECK</button>
								
		</div>
			
		</form>
	</div>
</div>
	</div>
	</div></div></div></section></section>
	
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
        <a href="${path}/Dashio/advanced_form_components.jsp#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
    <!--footer end-->	
	</section>
</body>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<link rel="stylesheet" href="${path}/a00_com/bootstrap.css" >

<style type="text/css">
	.input-group-text{width:100%;}
	.input-group-prepend{width:10%;}
	.input-group-append{width:20%;}
.num2{width: 12%}
.num{width: 10%}
.txt{width: 48%}

</style>
<script type="text/javascript">
var regBtn = document.querySelector("#regBtn");
var close = document.querySelector("#close");
function go(ino){
	cdetail.style.visibility="visible";
}
close.onclick=function(){
	regDiv.style.visibility="hidden";
}	
	
</script>
</html>