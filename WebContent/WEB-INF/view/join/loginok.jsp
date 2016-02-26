<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>        
<c:if test="${userInfo.id eq null }">
<script>
alert("로그인 후 이용 가능합니다.");
document.location.href = "${root}/main/main.html";
</script>
</c:if>
<c:if test="${userInfo.id ne null }">
<script>
alert("환영합니다.");
document.location.href = "${root}/main/main.html";
</script>
</c:if>