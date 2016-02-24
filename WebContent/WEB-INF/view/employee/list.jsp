<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="row" data-ng-app="autoparts" data-ng-controller="MainCtrl">
<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="btn-group">
				<button class="btn btn-default">전체선택</button>
			</div>
			<div class="btn-group">
				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		 			부서 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
		  			<li id="dept_change" data-ng-repeat="d in dept">
		  				<span data-ng-hide="true">{{d.no}}</span>
		  				<a href="#">{{d.name}}</a>
		  			</li>
				</ul>
			</div>
			<div class="btn-group">
				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		 			직위 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li id="spot_change" data-ng-repeat="s in spot">
						<span data-ng-hide="true">{{s.no}}</span>
						<a href="#">{{s.name}}</a>
					</li>
				</ul>
			</div>
			<div class="btn-group">
				<button id="addEmp" data-ng-hide="flag == 'add'" class="btn btn-default">추가</button>
				<button id="modEmp" data-ng-hide="flag == 'mod'" class="btn btn-default">수정</button>
			</div>
			<div class="btn-group">
				<button id="delEmp" class="btn btn-default">삭제</button>
			</div>
			<form class="form-inline pull-right">
				<div class="form-group">
					<label class="sr-only" for="searchOption">조건:</label>
					<select class="form-control" id="searchOption">
						<option value="0">전체</option>
						<option value="1">부서</option>
						<option value="2">직위</option>
						<option value="3">이름</option>
					</select>
					<label class="sr-only" data-ng-show="searchSel == 1" for="search_dept">부서:</label>
					<select data-ng-show="searchSel == 1" class="form-control" id="search_dept">
						<option data-ng-repeat="d in dept" value="{{d.no}}">{{d.name}}</option>
					</select>
					<label class="sr-only" data-ng-show="searchSel == 2" for="search_spot">직위:</label>
					<select data-ng-show="searchSel == 2" class="form-control" id="search_spot">
						<option data-ng-repeat="s in spot" value="{{s.no}}">{{s.name}}</option>
					</select>
					<input id="searchName" data-ng-show="searchSel == 3" type="text" class="form-control">
				</div>
				<div class="form-group">
					<button id="searchBtn" class="btn btn-primary" type="button">검색</button>
				</div>
			</form>
		</div><!-- heading -->
		<!-- 사원 입력폼 -->
		<div data-ng-show="flag != null" class="panel-body">
			<form class="form-inline">
				<div class="form-group">
					<input id="inputNo" type="hidden">
					<label for="selDept">부서:</label>
					<select class="form-control" id="selDept">
						<option data-ng-repeat="d in dept" value="{{d.no}}">{{d.name}}</option>
					</select>
					<label for="selSpot">직위:</label>
					<select class="form-control" id="selSpot">
						<option data-ng-repeat="s in spot" value="{{s.no}}">{{s.name}}</option>
					</select>
					<input id="inputName" type="text" placeholder="name" class="form-control">
					<button data-ng-show="flag == 'add'" id="add_emp" class="btn btn-default">추가</button>
					<button data-ng-show="flag == 'mod'" id="mod_emp" class="btn btn-default">수정</button>
				</div>
			</form>
		</div>
		<!-- 사원 데이터 -->
		</div><!-- heading -->
		<table class="table">
			<tr>
				<th></th>
				<th>번호</th><th>부서</th><th>직위</th><th>이름</th>
			</tr>
			<tr data-ng-repeat="e in emp">
				<td><input id="md_chk" type="checkbox" value="{{e.num}}"></td>
				<td class="e_num">{{e.num}}</td>
				<td class="e_dept">{{e.dept}}</td>
				<td class="e_spot">{{e.spot}}</td>
				<td class="e_name">{{e.name}}</td>
			</tr>
		</table>
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
	$scope.currPage = 1;
	$scope.flag = null;
	$scope.searchSel = 0;
	$scope.query = "";
	
	spotList($scope, $http);
	deptList($scope, $http);
	empList($scope, $http);
	
	$(document).on("click", ".pagination li a", function(ev){
		ev.preventDefault();
		$scope.currPage = $(this).attr("href").split("#")[1];
		empList($scope, $http);
	});
	
	$(document).on("click", "#dept_change a", function(ev){
		ev.preventDefault();
		var dept = Number($(this).siblings("span").text());
		var json = new Object();
		json["dept"] = dept;
		json["list"] = new Array();
		$("input:checkbox[id='md_chk']:checked").parent().each(function(){
			json["list"].push(Number($(this).siblings(".e_num").text()));
		});
		
		$.ajax({
			url: "./ajax_mod_dept.html",
			data: {"json":JSON.stringify(json)},
			success: function(data){
				empList($scope, $http);
			}
		});
	});
	
	$(document).on("click", "#spot_change a", function(ev){
		ev.preventDefault();
		var spot = Number($(this).siblings("span").text());
		var json = new Object();
		json["spot"] = spot;
		json["list"] = new Array();
		$("input:checkbox[id='md_chk']:checked").parent().each(function(){
			json["list"].push(Number($(this).siblings(".e_num").text()));
		});

		$.ajax({
			url: "./ajax_mod_spot.html",
			data: {"json":JSON.stringify(json)},
			success: function(data){
				empList($scope, $http);
			}
		});
	});
	
	$("#addEmp").click(function(){
		$scope.flag = "add";
		$scope.$apply();
	});
	$("#add_emp").click(function(){
		var json = new Object();
		var name = $("#inputName").val();

		if(name != null && name.trim() != ""){
			json.name = name;
			json.dept = Number($("#selDept").val());
			json.spot = Number($("#selSpot").val());
			
			$.ajax({
				url: "./ajax_add_emp.html",
				data: json,
				success: function(data){
					empList($scope, $http);
					$scope.flag = null;
				}
			});
			
			$("#inputName").val("");
		}else{
			alert("이름을 입력하세요");
		}
	});
	
	$("#modEmp").click(function(){
		$scope.flag = "mod";
		var checked = $("input:checkbox[id='md_chk']:checked").first().parent();
		$("#inputNo").val(Number(checked.siblings(".e_num").text()));
		
		var dept = checked.siblings(".e_dept").text();
		$.each($scope.dept, function(index, value){
			if(value.name == dept){
				$("#selDept").val(value.no);
				return;
			}
		});
		
		var spot = checked.siblings(".e_spot").text();
		$.each($scope.spot, function(index, value){
			if(value.name == spot){
				$("#selSpot").val(value.no);
				return;
			}
		});
		
		$("#inputName").val(checked.siblings(".e_name").text());
		$scope.$apply();
	});
	$("#mod_emp").click(function(){
		var json = new Object();
		var name = $("#inputName").val();

		if(name != null && name.trim() != ""){
			json.num = Number($("#inputNo").val())
			json.name = name;
			json.dept = Number($("#selDept").val());
			json.spot = Number($("#selSpot").val());
			
			$.ajax({
				url: "./ajax_mod_emp.html",
				data: json,
				success: function(data){
					empList($scope, $http);
					$scope.flag = null;
				}
			});
			
			$("#inputName").val("");
		}else{
			alert("이름을 입력하세요");
		}
	});
	
	$("#searchOption").change(function(){
		$scope.searchSel = $("#searchOption option:selected").val();
		$scope.$apply();
	});
	$("#searchBtn").click(function(){
		var sel = $scope.searchSel;
		
		if(sel == 1){
			$scope.query = $("#search_dept option:selected").val();
		}else if(sel == 2){
			$scope.query = $("#search_spot option:selected").val();
		}else if(sel == 3){
			$scope.query = $("#searchName").val();
			search = "name";
		}else{
			search = "total";
		}
		
		empList($scope, $http);
	});
	
	$("#delEmp").click(function(){
		var del = new Array();
		$("input:checkbox[id='md_chk']:checked").each(function(){
			del.push(Number($(this).val()));
		});
		
		$.ajax({
			url: "./ajax_del_emp.html",
			data: {"json":JSON.stringify(del)},
			success: function(data){
				empList($scope, $http);
			}
		});
	});
});
</script>
<script src="<c:url value='/js/search.js' />"></script>