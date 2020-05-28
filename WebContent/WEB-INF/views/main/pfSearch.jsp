<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
{ "wlist":
	[
<c:forEach var="work" items="${wlist}" varStatus="sts">
	{				
		"tno":${work.tno},"tname":"${work.tname}","tdiv":${work.tdiv},"name":"${work.name}"}
					<c:if test="${!sts.last}">,</c:if></c:forEach>
	]
}
