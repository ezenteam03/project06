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
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
		var co="${co}";
		if(co == 1){
			$('#comment').css('display', 'block');
			$('#combt').css('display', 'none');
		}else{
			$('#comment').css('display', 'none');
		}
	
		/* 수정, 해결방안 권한 */
		var mno="${mno}"; // 로그인한 사원번호
		var rmno="${risk.mno}"; // 작성자 사원번호
	
		if(mno==rmno){		
			// 작성자
			$('#cuptBt').css('display', 'none');
			
			$("#coment").css('backgroundColor','#ffffff');			
			$("#coment").attr('readOnly',true);
			$("#file01").attr('disabled',false);
			$("#title").attr('readOnly',false);
			$("#detail").attr('readOnly',false);	
		}else{
			// 권한없음
			$('#uptBtn').css('display', 'none');
			$('#cuptBt').css('display', 'none');
			$("#title").css('backgroundColor','#ffffff');
			$("#detail").css('backgroundColor','#ffffff');
			$("#coment").css('backgroundColor','#ffffff');
			$("#coment").attr('readOnly',true);
			$("#title").attr('readOnly',true);
			$("#detail").attr('readOnly',true);
			$("#file01").attr('disabled',true);
		
		}
		// PM권한		
		if(ri==3){
			if(mno!=rmno){
				$('#cuptBt').css('display', 'block');
				$("#title").css('backgroundColor','#ffffff');
				$("#detail").css('backgroundColor','#ffffff');	
				$("#file01").css('backgroundColor','#ffffff');
				$("#file01").attr('disabled',true);
				$("#title").attr('readOnly',true);
				$("#detail").attr('readOnly',true);
				$("#coment").attr('readOnly',false);
			}else{
				$('#uptBtn').css('display', 'block');
				$('#cuptBt').css('display', 'block');
				$("#file01").attr('disabled',false);
				$("#title").attr('readOnly',false);
				$("#detail").attr('readOnly',false);
				$("#coment").attr('readOnly',false);
			}
					
		}		
		// admin권한
		if(ri==4){
			$('#uptBtn').css('display', 'block');
			$('#cuptBt').css('display', 'block');
			$("#file01").attr('disabled',false);
			$("#title").attr('readOnly',false);
			$("#detail").attr('readOnly',false);
			$("#coment").attr('readOnly',false);
		}	
		
	
		
		
	});
		
</script>
<style type="text/css">
.input-group-text{width:100%;}
.input-group-prepend{width:20%;}
</style>
</head>
<body>
<section id="container">
	<jsp:include page="top.jsp"/>
	 <section id="main-content">
      <section class="wrapper">
      
   <div class="jumbotron text-left" style="margin-left:200px;">  
    	<h4><i class="fa fa-th"></i>&ensp;게시판 상세</h4>
    </div>
<div class="container">
	<form method="post"  enctype="multipart/form-data" id="form"
		action="${path}/risk.do?method=comment">
	<input name="ino" type="hidden" value="${risk.ino }"/>
		
<div class="input-group mb-3">				
	<div class="input-group-prepend">
		<span class="bg-success text-white input-group-text">작성자</span>
	</div>
	<input class="form-control"  readonly="readonly"  style="background-color: #ffffff;" 
			value="${risk.name }" placeholder="작성자입력하세요"/>		
</div>	
<div class="input-group mb-3">		
	<div class="input-group-prepend">
		<span class="bg-warning text-white input-group-text">작 성 일</span>
	</div>
		<input  class="form-control" readonly="readonly"  style="background-color: #ffffff;"
			value="<fmt:formatDate type='both' value='${risk.wdate }'/>"  />		
</div>
<div class="input-group mb-3">		
	<div class="input-group-prepend">
		<span class="bg-success text-white input-group-text">제 목</span>
		</div>
		<input name="title" class="form-control" id="title"
			value="${risk.title}"  
			placeholder="제목입력하세요" />	
</div>
<div class="input-group mb-3">		
	<div class="input-group-prepend">
		<span class="bg-warning text-white input-group-text">수정일</span>
	</div>
		<input class="form-control" readonly="readonly"  style="background-color: #ffffff;"
			value="<fmt:formatDate type='both' value='${risk.chdate}'/>" />	
		 
</div>  	
		
<div class="input-group mb-3">		
	<div class="input-group-prepend">
		<span class="bg-info text-white input-group-text">내 용</span>
	</div>
	<textarea name="detail" rows="10" style="resize:none" id="detail"
			class="form-control" placeholder="내용입력하세요" >${risk.detail}</textarea>		 
</div> 

<div class="input-group mb-3">		
	<div class="input-group-prepend">
		<span class="bg-success text-white input-group-text">첨부 파일</span>
	</div>
		<input class="form-control fileInfo" name="fnames" id="fnames"
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
		<span class="bg-success text-white input-group-text">해결방안 작성일</span>
	</div>
		<input  class="form-control"  readonly="readonly"  style="background-color: #ffffff;"
			value="<fmt:formatDate type='both' value='${risk.cdate}'/>"  />	
</div>	
<div class="input-group mb-3">		
	<div class="input-group-prepend">
		<span class="bg-info text-white input-group-text">해결방안</span>
	</div>
		<textarea name="coment"  rows="5" style="resize:none" id="coment"
			class="form-control" 
			placeholder="내용입력하세요" >${risk.coment}</textarea>		 
</div> 

	<div style="text-align:right;">
	<input style="float:right;" type="button" class="btn btn-success"
			value="뒤로가기" id="goMain"/>	
	<input style="float:right;" type="button" class="btn bg-warning"
			value="해결방안 저장" id="cuptBt"/>			
		<input style="float:right;" type="button" class="btn btn-info"
			value="수정" id="uptBtn"/>					
		
	</div>
	
	<br>
	</form>
	
	
	<form method="post" enctype="multipart/form-data" id="cform"
	 	action="${path}/risk.do?method=cinsert">	
	     <input name="refno" type="hidden"
			 value="0" />	 	
	     <input name="ino" type="hidden"
			 value="${risk.ino}" />	 		  	
	  	 <input name="mno" type="hidden"
			 value="${mno}" />		  	
	<input type="button" value="댓글창 열기" id="combt">
	<!-- 댓글 -->
	<div id="comment">
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="bg-info text-white input-group-text">댓글</span>
		</div>	
		<textarea  rows="5" style="resize:none; "
			class="form-control" name="detail"
			placeholder="내용입력하세요" >${comment.detail}</textarea>	
			 
	</div> 
	<div style="text-align:right;" >
			<button class="btn bg-warning" id="cmtBtn">입력</button>
	</div>	
	<div class="col-md-12 mt">
            <div class="content-panel">
   <table class="table table-hover">
   
      <c:forEach var="comment" items="${clist}">
    
      <tr class="text-center">
      <td class="num">${comment.name}</td>
       <!-- 댓글 들여쓰기 -->
       <td class="text-left" >
       		<c:forEach varStatus="sts" 
        		begin="2" end="${comment.level}">&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${comment.level>1 and sts.last}">┗></c:if>	
        	</c:forEach>${comment.detail}      		         	
       </td>
        
     
        <td class="num" ><input type="button" class="btn btn-info" onclick="coment(${comment.rno})" value="수정"/></td>
        <td class="num"><input type="button" class="btn btn-info" onclick="ccoment(${comment.rno},${risk.ino})"
			value="댓글"  />	</td>
		<td class="num2"><fmt:formatDate type='both' value='${comment.wdate}'/></td>
      </tr>
   
      </c:forEach>
    
  </table>  
</div></div>
</div>
	</form>

	</div>
</section></section>
	
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


<style type="text/css">
	.input-group-text{width:100%;}
	.input-group-prepend{width:10%;}
	.input-group-append{width:20%;}
.num2{width: 12%}
.num{width: 10%}
.txt{width: 48%}

</style>
<script type="text/javascript">

function cpopup(rno) { 
	window.open("http://localhost:5080/project06_git/risk.do?method=cdetail&rno="+rno, "1", "width=780, height=500, left=300, top=100");
}
function coment(rno){
	cpopup(rno);
};
function ccpopup(rno,ino) { 
	window.open("http://localhost:5080/project06_git/risk.do?method=cinsForm&rno="+rno+"&ino="+ino, "2", "width=780, height=500, left=300, top=100");
}
function ccoment(rno,ino){
	ccpopup(rno,ino);
};

//
//+"&name="+'name'+"&detail="+detail
	
</script>
</html>