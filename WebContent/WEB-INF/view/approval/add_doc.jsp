<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div data-ng-app="autoparts" data-ng-controller="MainCtrl">
<div class="row">
	<div class="col-md-6">
		<div class="panel panel-default">
			<div class="panel-heading text-center">
				결재
			</div>
			<table class="table table-bordered">
				<tr>
					<th class="text-center"><span>팀장</span></th>
					<th class="text-center" data-ng-repeat="n in [0,1,2,3]">
						<span data-ng-if="app > n">{{applist[n].dept}}</span>
					</th>
				</tr>
				<tr>
					<td class="text-center"><span>현종석</span></td>
					<td class="text-center" data-ng-repeat="n in [0,1,2,3]">
						<span data-ng-if="app > n">{{applist[n].name}}</span>
						<button data-ng-if="app == n+1" data-id="app" class="modal-cancel-btn btn btn-default">취소</button>
						<button data-ng-if="app == n" data-id="app" class="modal-add-btn btn btn-default" data-toggle="modal" data-target="#layerpop">지정</button>
						<button data-ng-if="app < n" disabled class="btn btn-default" data-toggle="modal" data-target="#layerpop">지정</button>
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
					<th class="text-center" data-ng-repeat="n in [0,1,2,3,4]">
						<span data-ng-if="coop > n">{{cooplist[n].dept}}</span>
					</th>
				</tr>
				<tr>
					<td class="text-center" data-ng-repeat="n in [0,1,2,3,4]">
						<span data-ng-if="coop > n">{{cooplist[n].name}}</span>
						<button data-ng-if="coop == n+1" data-id="coop" class="modal-cancel-btn btn btn-default">취소</button>
						<button data-ng-if="coop == n" data-id="coop" class="modal-add-btn btn btn-default" data-toggle="modal" data-target="#layerpop">지정</button>
						<button data-ng-if="coop < n" disabled class="btn btn-default" data-toggle="modal" data-target="#layerpop">지정</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading text-center">
				수신부서/참조자
			</div>
			<table class="table table-bordered">
				<tr>
					<th class="text-center">수신부서</th>
					<td class="input-group">
						<input type="text" placeholder="수신부서" class="form-control" aria-label="수신" >
						<span class="input-group-btn">
							<button data-id="rDept" class="rbtn btn btn-default">수신부서 지정</button>
						</span>
					</td>
				</tr>
				<tr>
					<th class="text-center">참조자</th>
					<td class="input-group">
						<input type="text" placeholder="참조자" class="form-control" aria-label="참조">
						<span class="input-group-btn">
							<button data-id="rEmp" class="rbtn btn btn-default">참조자 지정</button>
						</span>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="col-md-12">
		<div class="form-group">
			<input type="date" class="form-control">
		</div>
		<div class="form-group">
			<input type="text" placeholder="title" class="form-control" aria-label="title">
			<textarea class="form-control" style="resize:none" rows="10" placeholder="content"></textarea>
		</div>
	</div>
</div><!-- row -->

<div class="modal fade" id="layerpop" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">X</button>
				<h4 class="modal-title">검색</h4>
			</div>
			<div class="modal-body">
				<form class="form-inline text-center">
					<div class="form-group">
						<select class="form-control" id="searchOption">
							<option value="3" selected>이름</option>
							<option value="1">부서</option>
							<option value="2">직위</option>
						</select>
						<input id="search_name" data-ng-if="searchSel == 3" type="text" class="form-control">
						<label class="sr-only" data-ng-if="searchSel == 1" for="search_dept">부서:</label>
						<select data-ng-if="searchSel == 1" class="form-control" id="search_dept">
							<option data-ng-repeat="d in dept" value="{{d.no}}">{{d.name}}</option>
						</select>
						<label class="sr-only" data-ng-if="searchSel == 2" for="search_spot">직위:</label>
						<select data-ng-if="searchSel == 2" class="form-control" id="search_spot">
							<option data-ng-repeat="s in spot" value="{{s.no}}">{{s.name}}</option>
						</select>
					</div>
					<div class="form-group">
						<button id="searchBtn" class="btn btn-primary" type="button">검색</button>
					</div>
				</form>
				<ul id="search_result" class="list-group">
					<li data-ng-repeat="e in emp" class="list-group-item">
						<a href="\#{{$index}}">
							<span data-ng-hide="true">{{e.num}}</span>
							<span>{{e.dept}}</span>
							<span>{{e.spot}}</span>
							<span>{{e.name}}</span>
						</a>
					</li>
				</ul>
			</div><!-- modal body -->
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
	</div>
</div><!-- modal -->

<div class="modal fade" id="search_modal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">X</button>
				<h4 class="modal-title">검색</h4>
			</div>
			<div class="modal-body">
				<div class="col-md-6">
					<ul class="list-group">
						<li data-ng-if="search_id == 'rDept'" data-ng-repeat="d in dept" class="list-group-item">
							<a href="\#{{$index}}">
								<span data-ng-hide="true">{{d.num}}</span>
								<span>{{d.name}}</span>
							</a>
						</li>
						<li data-ng-if="search_id == 'rEmp'" data-ng-repeat="e in emp" class="list-group-item">
							<a href="\#{{$index}}">
								<span data-ng-hide="true">{{e.num}}</span>
								<span>{{e.dept}}</span>
								<span>{{e.spot}}</span>
								<span>{{e.name}}</span>
							</a>
						</li>
					</ul>
					<nav class="text-center">
						<ul class="pagination">
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
				<div class="list-group col-md-6">
					<p data-ng-if="search_id == 'rDept'" data-ng-repeat="d in receiveDept">
						<span>{{d.name}}</span>
					</p>
					<p data-ng-if="search_id == 'rEmp'" data-ng-repeat="e in receiveEmp">
						<span>{{e.dept}}</span>
						<span>{{e.spot}}</span>
						<span>{{e.name}}</span>
					</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>

</div>

<script>
$("[type='date']").datepicker();

var app = angular.module('autoparts', []);

app.controller('MainCtrl', function($scope, $http) {
	//session이나 param 등으로 현재 로그인 상태를 알아와 0번에 넣어야
	//지금은 그냥 안 넣고 있다.
	$scope.app = 0;
	$scope.applist = new Array();
	$scope.coop = 0;
	$scope.cooplist = new Array();
	$scope.receiveDept = new Array();
	$scope.receiveEmp = new Array();
	$scope.searchSel = 3;
	$scope.currPage = 1;
	
	$(document).on("click", ".modal-add-btn", function(){
		$scope.at = $(this).data("id");
		spotList($scope, $http);
		deptList($scope, $http);
	});
	$(document).on("click", ".modal-cancel-btn", function(){
		var at = $(this).data("id");
		
		if(at == "app"){
			$scope.applist.pop();
			$scope.app = $scope.applist.length;	
		}else if(at == "coop"){
			$scope.cooplist.pop();
			$scope.coop = $scope.cooplist.length;
		}
		
		$scope.$apply();
	});
	
	$("#searchOption").change(function(){
		$scope.searchSel = $("#searchOption option:selected").val();
		$scope.$apply();
	});
	$("#searchBtn").click(function(){
		var sel = $scope.searchSel;
		
		if(sel == 3){
			$scope.query = $("#search_name").val();
			search = "name";
		}else if(sel == 1){
			$scope.query = $("#search_dept option:selected").val();
		}else if(sel == 2){
			$scope.query = $("#search_spot option:selected").val();
		}else{
			search = "total";
		}
		
		empList($scope, $http);
	});
	$(document).on("click", ".pagination li a", function(ev){
		ev.preventDefault();
		$scope.currPage = $(this).attr("href").split("#")[1];
		empList($scope, $http);
	});
	
	$(document).on("click", "#search_result li a", function(ev){
		ev.preventDefault();
		var index = $(this).attr("href").split("#")[1];
		
		if($scope.at == "app"){
			$scope.applist.push($scope.emp[index]);
			$scope.app = $scope.applist.length;
		}else if($scope.at == "coop"){
			$scope.cooplist.push($scope.emp[index]);
			$scope.coop = $scope.cooplist.length;
		}
		
		$scope.$apply();
		$("#layerpop").modal("hide");
	});
	
	$(".rbtn").click(function(){
		$("#search_modal").modal("show");
		$scope.search_id = $(this).data("id");
		
		if($scope.search_id == "rDept"){
			deptList($scope, $http);
		}else{
			$scope.searchSel = 0;
			empList($scope, $http);
		}
	});
	$(document).on("click", "#search_modal li a", function(ev){
		ev.preventDefault();
		var index = $(this).attr("href").split("#")[1];
		
		if($scope.search_id == "rDept"){
			$scope.receiveDept.push($scope.dept[index]);
		
		}else{
			$scope.receiveEmp.push($scope.emp[index]);
		}
		
		$scope.$apply();
	});
});
</script>
<script src="<c:url value='/js/search.js' />"></script>