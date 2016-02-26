<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>        
<c:if test="${userInfo == null }">
	<script>
		alert("로그아웃 되었습니다.");
		document.location.href = "${root}/main/main.html";
	</script>
</c:if>