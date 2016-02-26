<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">
function logincheck(){
	if(document.getElementById("id").value  == "") {
		alert("아이디 입력!");
		return;
	} else if(document.getElementById("pwd").value == "") {
		alert("비밀번호 입력!");
		return;
	} else {
		//document.loginform.action = "";
		document.loginform.submit();
	}
}
</script>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Bootstrap Theme Company Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<nav class="navbar navbar-default navbar-fixed-top" >
  <div class="container" style="background-color: #f4511e">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage">Logo</a>
    </div>
    <c:choose>
    	<c:when test="${userInfo.id ne null}">
    		<form class="form-inline" style="float:left" name="loginform" action='${root}/join/login.html' method="post">
    		<input type="password" class="form-control" size="10" placeholder="partNumber" required>
			<button type="button" class="btn btn-danger">button1</button>
			<button type="button" class="btn btn-danger">button2</button>
    		${userInfo.id}님 환연합니다.
    		<button type="button" class="btn btn-danger" onClick="self.location='${root}/join/logout.html'">logout</button>
    		<button type="button" class="btn btn-danger" onClick="self.location='${root}/join/joinInfo.html'">profile</button>
    		</form>
    	</c:when>
    	<c:otherwise>
    		<form class="form-inline" style="float:left" name="loginform" action='${root}/join/login.html' method="post">
			    <input type="password" class="form-control" size="10" placeholder="partNumber" required>
			    <button type="button" class="btn btn-danger">button1</button>
			    <button type="button" class="btn btn-danger">button2</button>
			    <input type="text" class="form-control" size="10" placeholder="id" id="id" name="id" value='123@naver.com' required>
			    <input type="password" class="form-control" size="10" placeholder="password" id="pwd" name="pwd" value='qwe123' required>
			    <button type="submit" class="btn btn-danger" onClick="javascript:logincheck();">login</button>
			    <button type="button" class="btn btn-danger" onClick="self.location='${root}/join/join.html'">register</button>
  			</form>  	
    	</c:otherwise>
    </c:choose>
	<div style="float:right" >
	<a href="<c:url value='/index.html' />">메인</a>
	<a href="<c:url value='/spot/add.html' />">부서</a>
	<a href="<c:url value='/department/add.html' />">직원</a>
	<a href="<c:url value='/employee/list.html' />">사원</a>
	</div>
  </div>
</nav>