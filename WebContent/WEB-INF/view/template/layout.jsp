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
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.min.css" />
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.5/angular.min.js"></script>
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