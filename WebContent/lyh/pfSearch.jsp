<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
{ "plist":
	[
<c:forEach var="pf" items="${plist}" varStatus="sts">
	{				
		"name":"${pf.name}","poster":"${pf.poster}","price":${pf.price}}
					<c:if test="${!sts.last}">,</c:if></c:forEach>
	]
}
