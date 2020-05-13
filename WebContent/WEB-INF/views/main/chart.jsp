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
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://code.highcharts.com/gantt/highcharts-gantt.js"></script>
<script src="https://code.highcharts.com/gantt/modules/exporting.js"></script>

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
		
		//프로젝트 시작일을 표시, 월은 0부터 시작
	    var today = new Date(2020, 4, 4), 
	    day = 1000 * 60 * 60 * 24,
	    // Utility functions
	    dateFormat = Highcharts.dateFormat,
	    defined = Highcharts.defined,
	    isObject = Highcharts.isObject,
	    reduce = Highcharts.reduce;

		// Set to 00:00:00:000 today
		today.setUTCHours(0);
		today.setUTCMinutes(0);
		today.setUTCSeconds(0);
		today.setUTCMilliseconds(0);
		today = today.getTime();
	
		Highcharts.ganttChart('container', {
		    series: [{
		        name: 'PMS',
		        data: [{
		            name: "총괄진행",	
		            id: '0',
		            owner: '유재인'
		        }, {
		            name: '요구사항 정의서',
		            id: 'requirement_specification',
		            parent: '0',
		            start: today,
		            end: today + (5 * day),
		            completed: {
		                amount: 0.2
		            },
		            owner: '유재인'
		        }, {
		            name: '화면설계',
		            id: 'story_board',
		            parent: '0',
		            start: today + 5 * day,
		            end: today + 11 * day,
		            owner: '유재인'
		        }, {
		            name: '데이터베이스 설계',
		            id: 'db_design',
		            parent: '0',
		            start: today + 11 * day,
		            end: today + 17 * day,
		            owner: '유재인'
		        }, {
		            name: '데이터베이스 생성',
		            id: 'db_create',
		            parent: '0',
		            start: today + 17 * day,
		            end: today + 23 * day,
		            owner: '유재인'
		        }, {
		            name: '웹 구현',
		            id: 'screen_web',
		            parent: '0',
		            start: today + 23 * day,
		            end: today + 29 * day,
		            owner: '유재인'
		        }, {
		            name: '앱 구현',
		            id: 'screen_app',
		            parent: '0',
		            start: today + 29 * day,
		            end: today + 35 * day,
		            owner: '유재인'
		        }, {
		            name: 'Relocate',
		            id: 'relocate',
		            dependency: 'passed_inspection',
		            parent: '0',
		            owner: 'Josh'
		        }, {
		            name: 'Relocate staff',
		            id: 'relocate_staff',
		            parent: 'relocate',
		            start: today + 10 * day,
		            milestone : true,
		            //end: today + 11 * day,
		            owner: 'Mark'
		        }, {
		            name: 'Relocate test facility',
		            dependency: 'relocate_staff',
		            parent: 'relocate',
		            start: today + 11 * day,
		            end: today + 13 * day,
		            owner: 'Anne'
		        }, {
		            name: 'Relocate cantina',
		            dependency: 'relocate_staff',
		            parent: 'relocate',
		            start: today + 11 * day,
		            end: today + 14 * day
		        }]
		    }],
		    tooltip: {
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
		    },
		    title: {
		        text: 'PMS 진행사항'
		    },
		    xAxis: {
		        currentDateIndicator: true,
		        min: today + 1 * day,
		        max: today + 35 * day
		    }
		});
		
		Highcharts.ganttChart('container2', {
		    series: [{
		        name: 'PMS',
		        data: [{
		            name: "총괄진행",	
		            id: '0',
		            owner: '유재인'
		        }, {
		            name: '요구사항 정의서',
		            id: 'requirement_specification',
		            parent: '0',
		            start: today,
		            end: today + (5 * day),
		            completed: {
		                amount: 0.2
		            },
		            owner: '유재인'
		        }, {
		            name: '화면설계',
		            id: 'story_board',
		            parent: '0',
		            start: today + 5 * day,
		            end: today + 11 * day,
		            owner: '유재인'
		        }, {
		            name: '데이터베이스 설계',
		            id: 'db_design',
		            parent: '0',
		            start: today + 11 * day,
		            end: today + 17 * day,
		            owner: '유재인'
		        }, {
		            name: '데이터베이스 생성',
		            id: 'db_create',
		            parent: '0',
		            start: today + 17 * day,
		            end: today + 23 * day,
		            owner: '유재인'
		        }, {
		            name: '웹 구현',
		            id: 'screen_web',
		            parent: '0',
		            start: today + 23 * day,
		            end: today + 29 * day,
		            owner: '유재인'
		        }, {
		            name: '앱 구현',
		            id: 'screen_app',
		            parent: '0',
		            start: today + 29 * day,
		            end: today + 35 * day,
		            owner: '유재인'
		        }, {
		            name: 'Relocate',
		            id: 'relocate',
		            dependency: 'passed_inspection',
		            parent: '0',
		            owner: 'Josh'
		        }, {
		            name: 'Relocate staff',
		            id: 'relocate_staff',
		            parent: 'relocate',
		            start: today + 10 * day,
		            milestone : true,
		            //end: today + 11 * day,
		            owner: 'Mark'
		        }, {
		            name: 'Relocate test facility',
		            dependency: 'relocate_staff',
		            parent: 'relocate',
		            start: today + 11 * day,
		            end: today + 13 * day,
		            owner: 'Anne'
		        }, {
		            name: 'Relocate cantina',
		            dependency: 'relocate_staff',
		            parent: 'relocate',
		            start: today + 11 * day,
		            end: today + 14 * day
		        }]
		    }],
		    tooltip: {
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
		    },
		    title: {
		        text: 'PMS 진행사항'
		    },
		    xAxis: {
		        currentDateIndicator: true,
		        min: today + 1 * day,
		        max: today + 35 * day
		    }
		});
	});
</script>
<style>
#container {
    max-width: 800px;
    margin: 1em auto;
}
}
</style>
</head>

<body>
<div id="list"></div>
<div id="list2">
	${path}/emp.do?method=ajaxList
	<jsp:include page="${path}/emp.do?method=ajaxList" />
</div>
<div id="container"></div>
<div id="dialog" title="Basic dialog">
  <p>This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
</div>
</body>
</html>