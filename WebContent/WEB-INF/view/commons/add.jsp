<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div data-ng-app="autoparts" data-ng-controller="MainCtrl">
	<div class="btn-group" role="group">
		<input type="button" class="btn btn-default" id="delBtn" value="삭제">
		<input type="button" class="btn btn-default" id="modBtn" value="수정">
		<input type="button" class="btn btn-default" id="addBtn" value="추가">
		<input type="button" class="btn btn-default" id="complete" value="완료">
	</div>
	<ul id="list" class="list-group">
		<li data-ng-repeat="item in list" class="list-group-item" title="{{delC}}">
			<span class="index" data-ng-hide="true">{{$index}}</span>
			<span class="no" data-ng-hide="true">{{item.no}}</span>
			<span class="name">{{item.name}}</span>
			(<span class="empCount">{{item.count}}</span>)
		</li>
	</ul>
</div>

<script>
	var delC = "${delComment}";
	var modC = "${modComment}";
	var inputC = "${inputComment}";
	var failC = "${delFailComment}";
	var list = ${list};
</script>
<script src="<c:url value='/js/angular/add.js' />"></script>