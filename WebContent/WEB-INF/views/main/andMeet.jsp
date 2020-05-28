<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>  
{"andlist":
	[<c:forEach var="meet" items="${andlist}" varStatus="sts">
		{"topic":"${meet.topic}"}
		<c:if test="${!sts.last}">,</c:if></c:forEach>
]}