<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default navbar-fixed-top" >
	<div class="container">
		<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      	</button>
      	<a class="navbar-brand" href="#myPage">Logo</a>
    	</div>
    <form class="form-inline pull-left">
	    <input type="password" class="form-control" size="10" placeholder="partNumber" required>
	    <button type="button" class="btn btn-danger">button1</button>
	    <button type="button" class="btn btn-danger">button2</button>
	    <input type="text" class="form-control" size="10" placeholder="id" required>
	    <input type="password" class="form-control" size="10" placeholder="password" required>
	    <button type="button" class="btn btn-danger">login</button>
  	</form>
	<div class="pull-right">
		<a href="<c:url value='/index.html' />">메인</a>
		<a href="<c:url value='/spot/add.html' />">부서</a>
		<a href="<c:url value='/department/add.html' />">직원</a>
		<a href="<c:url value='/employee/list.html' />">사원</a>
	</div>
	</div>
</nav>