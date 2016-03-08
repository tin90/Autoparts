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
					<th class="text-center"><span>${emp.spot}</span></th>
					<th class="text-center" data-ng-repeat="n in [0,1,2,3]">
						<span data-ng-if="app > n">{{applist[n].spot}}</span>
					</th>
				</tr>
				<tr>
					<td class="text-center"><span>${emp.name}</span></td>
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
</div><!-- row -->
<div class="row">
<form id="form" method="post" action="<c:url value='/approval/add_proc.html'/>">
	<div class="col-md-12">
		<div class="form-group">
			<input id="title" type="text" placeholder="title" class="form-control" aria-label="title">
			<textarea id="content" class="form-control" style="resize:none" rows="10" placeholder="content"></textarea>
		</div>
	</div>
	<div class="btn-group btn-group-justified col-md-12" role="group">
		<div class="btn-group" role="group">
			<button data-id="save" class="sbtn btn btn-default">임시저장</button>
		</div>
		<div class="btn-group" role="group">
			<button data-id="app" class="sbtn btn btn-default">상신하기</button>
		</div>
	</div>
	<input type="hidden" name="json">
</form>
</div>

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

</div>

<script>
var app = angular.module('autoparts', []);

app.controller('MainCtrl', function($scope, $http) {
	$scope.app = 0;
	$scope.applist = new Array();
	$scope.coop = 0;
	$scope.cooplist = new Array();
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
	
	//submit 'approval/add_proc.html'
	$(".sbtn").click(function(ev){
		var json = new Object();
		json.title = $("#title").val();
		json.content = $("#content").val();
		json.app = $scope.applist;
		json.coop = $scope.cooplist;
		 
		if(json.app.length <= 0){
			alert("결재선을 등록하세요"); 
			ev.preventDefault();
		}else if(json.title == ""){
			alert("제목을 등록하세요");
			ev.preventDefault();
		}else{
			if($(this).data("id") == "save"){
				json.state = 1;
			}else{
				json.state = 0;
			}
			$("#form input[name='json']").val(JSON.stringify(json));
			alert(JSON.stringify(json));
			ev.preventDefault();
		}
	});
});
</script>
<script src="<c:url value='/js/search.js' />"></script>