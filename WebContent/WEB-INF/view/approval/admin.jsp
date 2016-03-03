<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<div class="row" data-ng-app="autoparts" data-ng-controller="MainCtrl">
<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<button id="ajax">클릭</button>
		</div><!-- heading -->
		<div class="panel-body">
			<form class="form-inline">
				<div class="form-group">
					<label for="selDept">DEPT:</label>
					<select class="form-control" id="selDept">
						<option data-ng-repeat="d in dept" value="{{d.no}}">{{d.name}}</option>
					</select>
					<label for="selSpot">SPOT:</label>
					<select class="form-control" id="selSpot">
						<option data-ng-repeat="s in spot" value="{{s.no}}">{{s.name}}</option>
					</select>
					<label for="inputName">NAME:</label>
					<input id="inputName" type="text" class="form-control" disabled>
					<label for="inputEmail">EMAIL:</label>
					<input id="inputEmail" type="text" class="form-control" disabled>
					<label for="inputPhone">PHONE:</label>
					<input id="inputPhone" type="text" class="form-control" disabled>
					<button data-ng-show="flag == 'add'" id="add_emp" class="btn btn-default">추가</button>
					<button data-ng-show="flag == 'mod'" id="mod_emp" class="btn btn-default">수정</button>
				</div>
			</form>
		</div>
	</div>
	<table class="table table-bordered">
		<tr>
			<th data-ng-if="false" class="text-center">no</th>
			<th class="text-center">id</th>
			<th class="text-center">name</th>
			<th class="text-center">phone</th>
		</tr>
		<tr class="clickable-row" data-ng-repeat="l in list">
			<td data-ng-if="false">{{l.empno}}</td>
			<td class="lid">{{l.id}}</td>
			<td class="lname">{{l.name}}</td>
			<td class="lphone">{{l.phone}}</td>
		</tr>
	</table>
</div>
</div>

<script>
var app = angular.module('autoparts', []);

app.controller('MainCtrl', function($scope, $http) {
	$http({
		url: "./ajax_appclient.html",
		headers: {
			"Accept":"application/json;charset=utf-8",
			"Accept-Charset":"charset=utf-8"
		}
	}).then(function(res){
		$scope.list = res.data;
	});
	
	$http({
		url: "../employee/ajax_dept_list.html",
		headers: {
			"Accept":"application/json;charset=utf-8",
			"Accept-Charset":"charset=utf-8"
		}
	}).then(function(res){
		$scope.dept = res.data;
	});
	
	$http({
		url: "../employee/ajax_spot_list.html",
		headers: {
			"Accept":"application/json;charset=utf-8",
			"Accept-Charset":"charset=utf-8"
		}
	}).then(function(res){
		$scope.spot = res.data;
	});
});

$(document).on("click", ".clickable-row", function(){
	$("#inputName").val($(this).children(".lname").text());
	$("#inputEmail").val($(this).children(".lid").text());
	$("#inputPhone").val($(this).children(".lphone").text());
});
</script>