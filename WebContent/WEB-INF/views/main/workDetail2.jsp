<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	.input-group-text{width:100%;}
	.input-group-prepend{width:20%;}
	.tdiv-text{text-align:center; font-size:20px; width:120px; background:white; float:left;}
	.div-Btn{height:40px; margin-left:10px;}
#all{
	padding:2%;
}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>
		
		var mdiv = "${mdiv}";
		var tdiv = "${task.tdiv}";
		
		var emno = "${minfo}";
		var tmno = "${task.mno}";
		
		var refno = "${task.refno}";
		var tno = "${task.tno}";
		var tprog = "${task.prog}";
		
		console.log("emno : "+emno);
		console.log("tmno : "+tmno);
		console.log("refno : "+refno);
		
		if(mdiv != 4 && mdiv != 6){
			$("#tDetail").attr('readonly',true);
			$("#tDetail").css('background','white');
			$("#tTitle").attr('readonly',true);
			$("#tTitle").css('background','white');
			$("#tComent").attr('readonly',true);
			$("#tComent").css('background','white');
		}
		if(mdiv != 5 && mdiv != 6){
			$("#textdetail").attr('readonly',true);
			$("#textdetail").css('background','white');
		}
		if(emno == tmno || mdiv == 6){
			$("#prog").attr('readonly',false);
		}else{
			$("#prog").attr('readonly',true);
			$("#prog").css('background','white');
		}
		
		
		
			
		$("#goMain").click(function(){
			$(location).attr("href","${path}/task.do?method=list");			
		});	
		$(".fileInfo").click(function(){
			var fname=$(this).val();
			if(confirm("다운로드하시겠습니까?")){
				$(location).attr("href",
					"${path}/task.do?method=download&fname="+fname);	
			}
			
		});
		$("#uptBtn").click(function(){
			
			if(confirm("수정하시겠습니까?")){
				$("form").attr("action","${path}/task.do?method=update");
				$("form").submit();
			}
		});
		$(".custom-file-input").on("change",function(){
			$(this).next(".custom-file-label").text($(this).val());
		});	
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				var no = $("input[name=tno]").val();
				$(location).attr("href","${path}/task.do?method=delete&tno="+no);					
			}
		});

		$("#coment").click(function(){
			if(mdiv != 4 && mdiv != 6){
				alert("권한이 없습니다.");
			}
			else if(confirm("반려사유 다시겠습니까?")){
				if( tdiv == 23 ){
					$("form").attr("action","${path}/task.do?method=coment");
					$("form").submit();
				}else{
					alert("반려처리 했을 때에만 사유작성 가능합니다.");
				}
				
			}
		});
		
		$("#progBtn").click(function(){
			var prog = $('input[name=prog]').val();
			

			
			if(emno == tmno && refno != tno && refno != 0 && mdiv == 4 || mdiv == 6){
				alert("진행률을 수정 할 수 없는 업무입니다.");
			}
			else if(prog > 100 || prog < 1){
				if(emno == tmno || mdiv == 6){
					alert("진행률은 1~100까지만 수정 가능합니다.");
				}else{
					alert("담당자만 수정 가능합니다.");
				}
			}
			else if(confirm("진행률 수정합니다.")){
				if(tdiv ==22 || tdiv ==24){
					alert("결재 신청이나 완료된 업무는 진행률 수정이 불가합니다.");
				}else{
					$("form").attr("action","${path}/task.do?method=prog");
					$("form").submit();
				}
			}
		});
		$("#divBtn").click(function(){
			var prog = $('input[name=prog]').val();
			if(prog == 100){
				if(confirm("결재 신청 하시겠습니까?")){
					if(tdiv == 22 ){
						alert("이미 결재 신청되었습니다.");
					}else{
						$("form").attr("action","${path}/task.do?method=upTdiv");
						$("form").submit();
					}
				}
			}
		});
		$("#divBtn2").click(function(){
			if(tdiv==22){
				if(confirm("반려 처리 하시겠습니까?")){
					alert("반려처리 되었습니다.");
					$("form").attr("action","${path}/task.do?method=upTdiv2");
					$("form").submit();
				}
			}else{
				alert("신청 여부를 확인 해주세요");
			}
		});
		$("#divBtn3").click(function(){
	
			
			if(tdiv==22){
				if(confirm("결재완료 하시겠습니까?")){
					alert("결재완료 되었습니다.");
					$("form").attr("action","${path}/task.do?method=upTdiv3");
					$("form").submit();
				}
			}else if (emno == tmno && tprog == 100 && refno != tno && refno != 0 && mdiv == 4 || mdiv == 6){
				if(confirm("PM업무 "+tno+"번 결재 하시겠습니까?")){
					$("form").attr("action","${path}/task.do?method=upTdiv4");
					$("form").submit();
				}
			}else{
				alert("신청 여부 혹은 진행률을 확인 해주세요");
			}
			
			
		});
		$("#updetail").click(function(){
			if(mdiv != 5 && mdiv != 6){
				alert("권한이 없습니다.");
			}else if(confirm("업무진행 저장 하시겠습니까?")){
				alert("저장 되었습니다.");
				$("form").attr("action","${path}/task.do?method=upDetail");
				$("form").submit();
			}
		});
		function inNumber(){
			  if(event.keyCode<48 || event.keyCode>57){
			     event.returnValue=false;
			  }
		}
	});
</script>
</head>

<body>
<section id="container">
	<jsp:include page="top.jsp"/>
	
	<section id="main-content">
      <section class="wrapper">
      
     

<div class="" style="margin-left:200px;">
<div style="float:left;">
 <h3 style=""><i class="fa fa-desktop"></i>&ensp;  업무현황</h3>
  </div>
  <div style="margin-left:180px; width:300px; height:50px; margin-bottom:50px;">
	    		<span>업무 진행률 기준</span>
		    		<ul>
		    		<li>- 요구사항분석 10%</li>
		    		<li>- 화면구현 20%</li>
		    		<li>- 기능구현 30%</li>
		    		<li>- 데이터베이스연동 30%</li>
		    		<li>- 테스트 10%</li>
		    	</ul>
	    	</div>
</div>
<div id="all">
<div class="container">

	<form method="post"  enctype="multipart/form-data" >
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text bg-success text-white">글번호</span>
		</div>
		<input name="tno" class="form-control" readonly style="background:white;"
			value="${task.tno}"/>	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="input-group-text bg-success text-white">담 당 자</span>
		</div>
		<input class="form-control" readonly style="background:white; width:500px;"
			value="${task.name} ${task.grade}" placeholder="" />
			<c:if test="${mdiv == 4 || mdiv == 6}">
			
			
			<select class="sel-grade" name="mem_no" style="padding:10px; font-size:0.9em; margin-left:15px; outline:none;">
				<option value="${task.mno}" selected>담당자 변경</option>
	                   <c:forEach var="pe" items="${pmsElist}">   		      		
							<option value="${pe.eno}">${pe.name} ${pe.grade}</option>               		      		
	                   </c:forEach>
	        </select>
            
		</c:if>
	</div>
		
	<!-- 상위업무가 있는 업무만  -->
	<c:forEach var="rf" items="${ref}">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text bg-success text-white">상위업무명</span>
			</div>
			<input name="refno" class="form-control" readonly style="background:white;"
				value="${rf.tname}"
				placeholder="" />	
		</div>	
	</c:forEach>
	
	<div class="input-group mb-3">
		<!-- 팀원은 수정불가 
		<div class="input-group-prepend">
			<span class="input-group-text" readonly style="background:white;">업무명</span>
		</div> -->
		<c:if test=""></c:if> 
		
		<div class="input-group-prepend" >
			<span class="input-group-text bg-success text-white" >업무명</span>
		</div>
		<input name="tname" class="form-control" id="tTitle"
			value="${task.tname}"  
			placeholder="제목입력하세요" />	
		 
	</div>  	
	<div class="input-group mb-3">	
		
			
			
	</div>		
	<div class="input-group mb-3">	
	<div class="input-group-prepend">
			<span class="bg-warning text-white input-group-text">시작일</span>
		</div>
		<input class="form-control" readonly style="background:white;"
			value="${task.sdate}"/>	
			<!--  -->
		<div class="input-group-prepend">
			<span class="bg-warning text-white input-group-text">마감일</span>
		</div>
		<input class="form-control"  readonly style="background:white;"
			value="${task.edate}"/>	
			<!-- <fmt:formatDate type='both' value='${board.credte }'/> -->
	</div>
	<div class="input-group mb-3" >
		<div class="input-group-prepend ">
			<span class="input-group-text bg-info text-white">업 무 내 용</span>
		</div>
		<textarea name="detail" rows="10" id="tDetail"
			class="form-control" 
			placeholder="내용입력하세요">${task.detail}</textarea>		 
	</div> 
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text bg-info text-white">업 무 진 행 도</span>
		</div>
		<textarea name="updetail" rows="5" style="width:980px;" id="textdetail"
			class="form-control" 
			placeholder="내용 입력하세요">${task.updetail}</textarea>	
			
				
			<!-- 팀원만 보이게 + admin -->
			<c:if test=""></c:if> 
			<div>
				<input type="button" class="btn btn-success" style="width:130px; height:115px;"
				value="저장하기" id="updetail"/>
			</div>	 
	</div> 
	<!-- 
	<c:forEach var="fname"  begin="1" end="2"
		 varStatus="sts">
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">첨부 파일( ${sts.count} / 2 )</span>
		</div>
		<input class="form-control fileInfo" name="fnames"
			value="${board.filenames[sts.index-1]}" />	
		<div class="custom-file">
			<input type="file" name="report" 
				class="custom-file-input" id="file01"/>
			<label class="custom-file-label" for="file01">
			변경할려면 파일을 선택하세요!</label>
		</div>			
		 
		
	</div> 
	</c:forEach>	 -->
	
	<div class="input-group mb-3" style="float:left; ">
			<span class="bg-warning text-white input-group-text" style="font-size:20px;height:40px; width:220px; float:left;">결재 여부</span>
			<c:choose>
				<c:when test="${task.tdiv==21}">
				<span class="input-group-text tdiv-text">업무수행중</span>
				</c:when>
				<c:when test="${task.tdiv==22}">
				<span class="input-group-text tdiv-text">결재신청</span>
				</c:when>
				<c:when test="${task.tdiv==23}">
				<span class="input-group-text tdiv-text">반려</span>
				</c:when>
				<c:when test="${task.tdiv==24}">
				<span class="input-group-text tdiv-text">결재완료</span>
				</c:when>
			</c:choose>
			</t>
			<!-- 팀원만 보이게 + admin -->
			<c:if test="${mdiv==5 || mdiv==6}">
				<button class="btn btn-success div-Btn" id="divBtn">결재신청</button>
			</c:if> 
			<!-- PM만 보이게 + admin -->
			<c:if test="${mdiv == 4 || mdiv == 6}">
				<button class="btn btn-danger div-Btn" id="divBtn2">반려처리</button>
				<button class="btn btn-info div-Btn" id="divBtn3">결재완료</button>
			</c:if> 
			
			<br><br>
			<div class="input-group-prepend">
				<span class="bg-warning text-white input-group-text" style="width:220px;">진행률</span>
				<input type="text" name="prog" value="${task.prog}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
				id="prog">
				
				<!-- 담당자만 보이게 + admin -->
				<c:if test="${mdiv == 4||mdiv==5 || mdiv==6}">
					<input type="button"  class="btn btn-success" id="progBtn" value="진행률수정"/>
				</c:if>
				
			</div>
		</div>
		
		<br>
		
		
		
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text bg-info text-white">반려 사유</span>
		</div>
		<textarea name="coment" rows="3"   style="width:980px;" id="tComent"
			class="form-control" 
			placeholder="사유를 입력하세요" >${task.coment}</textarea>
			<div>
			
				<input type="button" class="btn btn-success" style="width:130px; height:75px;"
				value="사유 등록" id="coment"/>
	
			</div>		 
	</div> 
	<div style="text-align:left;">
	
	</div>
	<div style="text-align:right;">
		
		<c:if test="${mdiv == 4 || mdiv == 6}">
			<input type="button" class="btn btn-info"
				value="수정" id="uptBtn"/>
			<input type="button" class="btn btn-danger"
				value="삭제" id="delBtn"/>	
		</c:if>
			
		<input type="button" class="btn btn-success"
			value="조회 화면으로" id="goMain"/>
	</div>
	</form>
</div>	
</div>
</section></section>
</section>

</body>
</html>