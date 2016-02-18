<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<div class="row" data-ng-app="autoparts" data-ng-controller="MainCtrl">
	<div class="col-md-12 btn-group" role="group">
		<input type="button" class="btn btn-default" id="delBtn" value="삭제">
		<input type="button" class="btn btn-default" id="modBtn" value="수정">
		<input type="button" class="btn btn-default" id="addBtn" value="추가">
		<input type="button" class="btn btn-default" id="complete" value="완료">
	</div>
	<fieldset class="col-md-2">
		<label for="spot" data-ng-hide="true">spot select</label>
		<select name="spot" id="spot">
			<option selected="selected">직위</option>
			<option>대리</option>
			<option>과장</option>
			<option>부장</option>
		</select>
	</fieldset>
	<fieldset class="col-md-2">
		<label for="dept" data-ng-hide="true">dept select</label>
		<select name="dept" id="dept">
			<option selected="selected">부서</option>
			<option>영업부</option>
			<option>개발부</option>
		</select>
	</fieldset>
</div>

<script>
var app = angular.module('autoparts', []);

app.controller('MainCtrl', function($scope) {
	//$scope.list = [11,22,33];
	$scope.list = [{"d":11},{"d":22},{"d":33}];
});

$(function(){
    $("select").css("width","100%");
	$("select").selectmenu().selectmenu("menuWidget");
});
</script>