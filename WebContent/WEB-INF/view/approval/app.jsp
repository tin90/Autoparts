<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<div data-ng-app="autoparts" data-ng-controller="MainCtrl">
구현중
<div class="row">
	<div class="col-md-3">
	<div class="panel panel-default">
		<div class="panel-heading">
			결재할 문서함
		</div>
 		<table class="table">
			<tr><td><a href="#">미결재 <span class="badge">2</span></a></td></tr>
			<tr><td><a href="#">결재완료 <span class="badge">3</span></a></td></tr>
		</table>
	</div>
	</div>
	<div class="col-md-3">
	<div class="panel panel-default">
		<div class="panel-heading">
			<span>개인 문서함 > <a href="#">결재문서 작성</a></span>
		</div>
 		<table class="table">
			<tr>
				<td><a href="#">상신문서 <span class="badge">2</span></a></td>
				<td><a href="#">반려문서 <span class="badge">3</span></a></td>
			</tr>
			<tr>
				<td><a href="#">임시저장 <span class="badge">3</span></a></td>
				<td><a href="#">결재완료 <span class="badge">3</span></a></td>
			</tr>
			<tr>
				<td colspan="2"><a href="#">상신취소 <span class="badge">3</span></a></td>
			</tr>
		</table>
	</div>
	</div>
	<div class="col-md-3">
	<div class="panel panel-default">
		<div class="panel-heading">
			협조 문서함
		</div>
 		<table class="table">
			<tr><td><a href="#">미결재 <span class="badge">2</span></a></td></tr>
			<tr><td><a href="#">결재완료 <span class="badge">3</span></a></td></tr>
		</table>
	</div>
	</div>
	<div class="col-md-3">
	<div class="panel panel-default">
		<div class="panel-heading">
			부서/참조 수신함
		</div>
 		<table class="table">
			<tr><td><a href="#">부서 수신함 <span class="badge">0</span></a></td></tr>
			<tr><td><a href="#">참조 수신함 <span class="badge">0</span></a></td></tr>
		</table>
	</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<span>결재할 문서함 > <a href="#">미결재 문서</a></span>
		</div>
		<table class="table">
			<tr>
				<th>문서번호</th><th>기안일자</th><th>문서명</th>
				<th>기안자</th><th>다음결재자</th><th>의견</th>
			</tr>
			<tr>
				<td>1</td><td>16.02.18</td><td>비품 구매건</td>
				<td>홍길동</td><td>이도</td><td>1건</td>
			</tr>
		</table>
	</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<span>개인 문서함 > <a href="#">상신문서</a></span>
		</div>
		<table class="table">
			<tr>
				<th>문서번호</th><th>기안일자</th><th>문서명</th>
				<th>기안자</th><th>다음결재자</th><th>의견</th>
			</tr>
			<tr>
				<td>1</td><td>16.02.18</td><td>비품 구매건</td>
				<td>홍길동</td><td>이도</td><td>1건</td>
			</tr>
		</table>
	</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<span>협조 문서함 > <a href="#">미결재 문서</a></span>
		</div>
		<table class="table">
			<tr>
				<th>문서번호</th><th>기안일자</th><th>문서명</th>
				<th>기안자</th><th>다음결재자</th><th>의견</th>
			</tr>
			<tr>
				<td>1</td><td>16.02.18</td><td>비품 구매건</td>
				<td>홍길동</td><td>이도</td><td>1건</td>
			</tr>
		</table>
	</div>
	</div>
</div>
</div><!-- angular -->

<script>
var app = angular.module("autoparts", []);

app.controller("MainCtrl", function($scope) {
	//$scope.list = [11,22,33];
	$scope.list = [{"d":11},{"d":22},{"d":33}];
});
</script>