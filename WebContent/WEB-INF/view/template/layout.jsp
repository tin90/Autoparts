<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${title}</title>
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />">
<link rel="stylesheet" href="<c:url value='/css/bootstrap-theme.min.css' />">
<script src="<c:url value='/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/js/jquery-2.1.4.min.js' />"></script>
<script src="<c:url value='/js/jquery-ui.min.js' />"></script>
<link rel="stylesheet" href="<c:url value='/css/jquery-ui.min.css' />" />
<script src="<c:url value='/js/angular.min.js' />"></script>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
</head>
<body>

<header class="container">
	<tiles:insertAttribute name="header" />
</header>
<article class="container">
	<tiles:insertAttribute name="body" />
</article>
<footer class="container">
	<tiles:insertAttribute name="footer" />
</footer>

</body>
</html>