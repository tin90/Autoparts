<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<div data-ng-app="autoparts" data-ng-controller="MainCtrl">
<div class="row">
	<div class="col-md-6">
		<div class="panel panel-default">
			<div class="panel-heading text-center">
				결재
			</div>
			<table class="table table-bordered">
				<tr>
					<th class="text-center"><span>${emp.spot}</span></th>
					<th class="text-center" data-ng-repeat="i in [0,1,2,3]">
						<span>{{applist[i].spot}}</span>
					</th>
				</tr>
				<tr>
					<td class="text-center"><span>${emp.name}</span></td>
					<td class="text-center" data-ng-repeat="i in [0,1,2,3]">
						<span>{{applist[i].name}}</span>
						<button id="appbtn" data-num="${emp.num}" data-ng-if="appindex == i && applist[i].date == null && applist[i].num == ${emp.num}">결재</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="col-md-6">
		<div class="panel panel-default">
			<div class="panel-heading text-center">
				협조
			</div>
			<table class="table table-bordered">
				<tr>
					<th class="text-center" data-ng-repeat="i in [0,1,2,3,4]">
						<span>{{cooplist[i].spot}}</span>
					</th>
				</tr>
				<tr>
					<td class="text-center" data-ng-repeat="i in [0,1,2,3,4]">
						<span>{{cooplist[i].name}}</span>
						<button id="coopbtn" data-num="${emp.num}" data-ng-if="coopindex == i && cooplist[i].date == null && cooplist[i].num == ${emp.num}">결재</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div><!-- row -->
<div class="row">
	<div class="col-md-12">
		<div class="input-group col-md-12">
			<input id="title" type="text" class="form-control" aria-label="title" value="{{title}}" disabled>
			<textarea id="content" class="form-control" style="resize:none" rows="10" disabled>{{content}}</textarea>
		</div>
	</div>
</div>
</div>

<script>
var app = angular.module('autoparts', []);

app.controller('MainCtrl', function($scope, $http) {
	ajax_read($scope, $http);
	
	$(document).on("click", "#appbtn", function(ev){
		alert($(this).data("num"));
	});
	
	$(document).on("click", "#coopbtn", function(ev){
		alert($(this).data("num"));
	});
});

function ajax_read($scope, $http){
	$http({
		type: "GET",
		url: './ajax_read.html?num=${num}',
		headers: {
			"Accept":"application/json;charset=utf-8",
			"Accept-Charset":"charset=utf-8"
		},
		dataType:"json"
	}).then(function(res){
		$scope.json = res.data;
		$scope.applist = $scope.json.app;
		for(var i = 0; i < $scope.applist.length; i++){
			if($scope.applist[i].date == null){
				$scope.appindex = i;
				break;
			}
		}
		
		$scope.cooplist = $scope.json.coop;
		for(var i = 0; i < $scope.cooplist.length; i++){
			if($scope.cooplist[i].date == null){
				$scope.coopindex = i;
				break;
			}
		}
		
		$scope.title = $scope.json.title;
		$scope.content = $scope.json.content;
		
		$scope.$apply();
	},function(res){
		alert("error");
	});
}
</script>