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
					<th>문서번호</th><th>기안일자</th><th>결재일자</th><th>문서명</th>
					<th>나의결재</th><th>기안자</th><th>다음결재자</th><th>의견</th>
				</tr>
				<tr>
					<td>1</td><td>16.02.18</td><td>16.02.18</td><td>비품 구매건</td>
					<td></td><td>홍길동</td><td>이도</td><td>1건</td>
				</tr>
			</table>
		</div>
	</div>
</div>
</div>

<script>
var app = angular.module('autoparts', []);

app.controller('MainCtrl', function($scope, $http) {
	list($scope, $http);
});

function list($scope, $http){
	$http({
		type: "GET",
		url: './ajax_list.html',
		headers: {
			"Accept":"application/json;charset=utf-8",
			"Accept-Charset":"charset=utf-8"
		},
		dataType:"json"
	}).then(function(res){
		$scope.list = res.data;
	},function(res){
		alert("error");
	});
}
</script>