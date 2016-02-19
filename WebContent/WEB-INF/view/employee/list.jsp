<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<div class="an row" data-ng-app="autoparts" data-ng-controller="MainCtrl">
<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			구현중
			<div class="btn-group">
				<button class="btn btn-default">전체선택</button>
			</div>
			<div class="btn-group">
				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		 			부서 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
		  			<li><a href="#">개발부</a></li>
		  			<li><a href="#">영업부</a></li>
		  			<li><a href="#">기획부</a></li>
		  			<li class="divider"></li>
				</ul>
			</div>
			<div class="btn-group">
				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		 			직위 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
		  			<li><a href="#">대리</a></li>
		  			<li><a href="#">과장</a></li>
		  			<li><a href="#">부장</a></li>
		  			<li class="divider"></li>
				</ul>
			</div>
			<div class="btn-group">
				<button class="btn btn-default">추가</button>
			</div>
			<div class="btn-group">
				<button class="btn btn-default">삭제</button>
			</div>
			<form class="form-inline pull-right">
				<div class="form-group">
					<label class="sr-only" for="sel1">조건:</label>
					<select class="form-control" id="sel1">
						<option>부서</option>
						<option>직위</option>
						<option>이름</option>
					</select>
					<input type="text" class="form-control">
				</div>
				<div class="form-group">
					<button class="btn btn-primary" type="button">검색</button>
				</div>
			</form>
		</div><!-- heading -->
		<table class="table">
			<tr>
				<th><input type="checkbox"></th>
				<th>번호</th><th>부서</th><th>직위</th><th>이름</th>
			</tr>
			<tr>
				<td><input type="checkbox"></td>
				<td>1</td><td>개발부</td><td>대리</td><td>홍길동</td>
			</tr>
		</table>
	</div>
	<nav class="text-center">
		<ul class="pagination pagination-lg">
  			<li>
				<a href="#" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li>
				<a href="#" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</ul>
	</nav>
</div>
</div>

<script>
var app = angular.module('autoparts', []);

app.controller('MainCtrl', function($scope) {
	//$scope.list = [11,22,33];
	$scope.list = [{"d":11},{"d":22},{"d":33}];
});
</script>