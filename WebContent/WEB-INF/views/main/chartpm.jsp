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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<title>Dashio - Bootstrap Admin Template</title>

<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://code.highcharts.com/gantt/highcharts-gantt.js"></script>
<script src="https://code.highcharts.com/gantt/modules/exporting.js"></script>

<!-- Favicons -->
<link href="${path}/Dashio/img/favicon.png" rel="icon">
<link href="${path}/Dashio/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Bootstrap core CSS -->
<link href="${path}/Dashio/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!--external css-->
<link href="${path}/Dashio/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="${path}/Dashio/lib/advanced-datatable/css/demo_page.css" rel="stylesheet" />
<link href="${path}/Dashio/lib/advanced-datatable/css/demo_table.css" rel="stylesheet" />
<link rel="stylesheet" href="${path}/Dashio/lib/advanced-datatable/css/DT_bootstrap.css" />

<link rel="stylesheet" type="text/css" href="${path}/Dashio/lib/bootstrap-fileupload/bootstrap-fileupload.css" />
<link rel="stylesheet" type="text/css" href="${path}/Dashio/lib/bootstrap-datepicker/css/datepicker.css" />
<link rel="stylesheet" type="text/css" href="${path}/Dashio/lib/bootstrap-daterangepicker/daterangepicker.css" />
<link rel="stylesheet" type="text/css" href="${path}/Dashio/lib/bootstrap-timepicker/compiled/timepicker.css" />
<!-- Custom styles for this template -->
<link href="${path}/Dashio/css/style.css" rel="stylesheet">
<link href="${path}/Dashio/css/style-responsive.css" rel="stylesheet">

<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>
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
		
		$.ajax({
			type:"post",
			url:"${path}/chart.do?method=ajaxdata",
			data: $("form").serialize(),
			dataType:"json",
			success:function(data){
				
				var todayOrigin = new Date(2020, 4, 4); 
				var today = new Date(2020, 4, 4); 
			    day = 1000 * 60 * 60 * 24;
			    
			    today.setUTCHours(0);
				today.setUTCMinutes(0);
				today.setUTCSeconds(0);
				today.setUTCMilliseconds(0);
				today = today.getTime();
				
				// data.모델명
				var clist = data.chartlist;
				var dataInfo = [];
				
				dataInfo.push({
	            	name: '총괄진행',	
	            	id: '0',
	            	owner: '유재인'
				});
				
				$.each(clist,function(idx, chart){
					dataInfo.push({
						name: chart.tname, 
						id: ""+chart.tno+"", 
						parent: ""+chart.refno+"", 
						start: today+(chart.sdate * day), 
						end: today+(chart.edate * day),
						completed : { amount : chart.prog },
						owner : ""+chart.name+""
						});
				});
				var seriesInfo = [{
			        name: 'PMS',
			        data: dataInfo
			    }];
				var tooltipInfo = {
				        pointFormatter: function () {
				            var point = this,
				                format = '%e. %b',
				                options = point.options,
				                completed = options.completed,
				                amount = isObject(completed) ? completed.amount : completed,
				                status = ((amount || 0) * 100) + '%',
				                lines;
			
				            lines = [{
				                value: point.name,
				                style: 'font-weight: bold;'
				            }, {
				                title: '시작',
				                value: dateFormat(format, point.start)
				            }, {
				                visible: !options.milestone,
				                title: '끝',
				                value: dateFormat(format, point.end)
				            }, {
				                title: '진행도',
				                value: status
				            }, {
				                title: '담당자',
				                value: options.owner || 'unassigned'
				            }];
			
				            return reduce(lines, function (str, line) {
				                var s = '',
				                    style = (
				                        defined(line.style) ? line.style : 'font-size: 0.8em;'
				                    );
				                if (line.visible !== false) {
				                    s = (
				                        '<span style="' + style + '">' +
				                        (defined(line.title) ? line.title + ': ' : '') +
				                        (defined(line.value) ? line.value : '') +
				                        '</span><br/>'
				                    );
				                }
				                return str + s;
				            }, '');
				        }
				    };
				var titleInfo = {
				        text: 'PMS 진행사항'
			    };
				var xAxisInfo = {
				        currentDateIndicator: true,
				        min: today + 1 * day, //프로젝트 첫날
				        max: today + 35 * day, //프로젝트 마지막날
				    };
				
				var cInfo = {
						series : seriesInfo,
						tooltip : tooltipInfo,
						title: titleInfo,
						xAxis: xAxisInfo
				};
				
				console.log(todayOrigin);
				console.log(today);
				console.log(clist);
				console.log(dataInfo);
				console.log(cInfo);
			    dateFormat = Highcharts.dateFormat,
			    defined = Highcharts.defined,
			    isObject = Highcharts.isObject,
			    reduce = Highcharts.reduce;
				
				Highcharts.ganttChart('chartpm', cInfo);
			},
			error:function(err){
				console.log("ajax처리 에러");
				console.log(err);
			}
		});
	});
</script>
<style>
#chart {
    max-width: 800px;
    margin: 1em auto;
}
</style>
</head>

<body>
  <section id="container">
	<jsp:include page="top.jsp"/>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper" style="height:300px; margin-top:0;">
         <!-- FORM VALIDATION -->
        <div class="row mt">
          <div class="col-lg-12">
	        <h4><i class="fa fa-angle-right" style="padding-left:15px; font-size:1.5em;">간트차트(PM)</i></h4>
            <div class="form-panel">
              <div id="chartpm"></div>
            </div>
            <!-- /form-panel -->
          </div>
          <!-- /col-lg-12 -->
        </div>
        <!-- /row -->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
        <!--footer start-->

    <!--footer end-->
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="${path}/Dashio/lib/jquery/jquery.min.js"></script>
  <script src="${path}/Dashio/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="${path}/Dashio/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${path}/Dashio/lib/jquery.scrollTo.min.js"></script>
  <script src="${path}/Dashio/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <!--script for this page-->
  <script src="${path}/Dashio/lib/jquery-ui-1.9.2.custom.min.js"></script>
  <script type="text/javascript" src="${path}/Dashio/lib/bootstrap-fileupload/bootstrap-fileupload.js"></script>
  <script type="text/javascript" src="${path}/Dashio/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
  <script type="text/javascript" src="${path}/Dashio/lib/bootstrap-daterangepicker/date.js"></script>
  <script type="text/javascript" src="${path}/Dashio/lib/bootstrap-daterangepicker/daterangepicker.js"></script>
  <script type="text/javascript" src="${path}/Dashio/lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
  <script type="text/javascript" src="${path}/Dashio/lib/bootstrap-daterangepicker/moment.min.js"></script>
  <script type="text/javascript" src="${path}/Dashio/lib/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
  <script src="${path}/Dashio/lib/advanced-form-components.js"></script>
  <!--common script for all pages-->
  <script src="${path}/Dashio/lib/common-scripts.js"></script>
  <!--script for this page-->
  <script type="text/javascript">
    $(document).ready(function() {
    });
  </script>
</body>
</html>