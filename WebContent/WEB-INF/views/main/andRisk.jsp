<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>  
{"andlist":
	[<c:forEach var="risk" items="${andlist}" varStatus="sts">
		{"ino":${risk.ino},"title":"${risk.title}","name":"${risk.name}","wdate":"${risk.wdate}","views":${risk.views}}
		<c:if test="${!sts.last}">,</c:if></c:forEach>
]}