<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!-- 
	모든 문서 리스트 공용
	데이터만 따로 불러와 로드
 -->
 
<div  data-ng-app="autoparts" data-ng-controller="MainCtrl">
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				리스트
			</div>
			<table class="table">
				<tr>
					<th>문서번호</th><th>문서명</th>
				</tr>
				<tr data-ng-repeat="l in list">				
					<td>{{l.num}}</td><td><a href="./read.html?num={{l.num}}">{{l.title}}</a></td>
				</tr>
			</table>
		</div>
	</div>
</div>
<nav class="text-center">
	<ul class="pagination pagination-lg">
 			<li data-ng-if="page[0] != null && page[0] != 1">
			<a href="\#{{page[0]-1}}" aria-label="Previous">
			<span aria-hidden="true">&laquo;</span>
			</a>
		</li>
		<li data-ng-repeat="p in page" data-ng-class="{'active':currPage == p}">
			<a href="\#{{p}}" class="page_btn">{{p}}</a>
		</li>
		<li data-ng-if="page[page.length-1] < maxPage">
			<a href="\#{{page[page.length-1]+1}}" aria-label="Next">
			<span aria-hidden="true">&raquo;</span>
			</a>
		</li>
	</ul>
</nav>
</div>

<script>
var app = angular.module('autoparts', []);

app.controller('MainCtrl', function($scope, $http) {
	list($scope, $http);
});

function list($scope, $http){
	$http({
		type: "GET",
		url: './ajax_list.html?page=1&state=1',
		headers: {
			"Accept":"application/json;charset=utf-8",
			"Accept-Charset":"charset=utf-8"
		},
		dataType:"json"
	}).then(function(res){
		$scope.list = res.data.list;
		$scope.currPage = res.data.curr_page;
		$scope.maxPage = res.data.max_page;
		
		var base = Math.floor(($scope.currPage-1)/5)*5;
		
		var p = [];
		for(var i = base+1; i <= Math.min(base+5, $scope.maxPage); i++){
			p.push(i);
		}
		$scope.page = p;
		$scope.$apply();
	},function(res){
		alert("error");
	});
}
</script>