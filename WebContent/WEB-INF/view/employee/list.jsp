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
		  			<li data-ng-repeat="d in dept"><a href="#">{{d.name}}</a></li>
		  			<li class="divider"></li>
				</ul>
			</div>
			<div class="btn-group">
				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		 			직위 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li data-ng-repeat="s in spot"><a href="#">{{s.name}}</a></li>
		  			<li class="divider"></li>
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
					<input data-ng-show="searchSel == 3" type="text" class="form-control">
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
<<<<<<< HEAD
		</div>
		<!-- 사원 데이터 -->
=======
		</div><!-- heading -->
>>>>>>> refs/remotes/origin/master
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
  			<li>
				<a href="#" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			<li data-ng-repeat="p in page"><a href="#" class="page_btn">{{p}}</a></li>
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

app.controller('MainCtrl', function($scope, $http) {
	$scope.flag = null;
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
	
	$scope.currPage = 1;
	
	$scope.searchSel = 0;
	$("#searchOption").change(function(){
		$scope.searchSel = $("#searchOption option:selected").val();
		$scope.$apply();
	});
	
	$scope.query = "";
	$("#searchBtn").click(function(){
		var sel = $scope.searchSel;
		
		if(sel == 1){
			$scope.query = $("#search_dept option:selected").val();
		}else if(sel == 2){
			$scope.query = $("#search_spot option:selected").val();
		}else if(sel == 3){
			search = "name";
		}else{
			search = "total";
		}
		
		empList($scope, $http);
	});
	
	spotList($scope, $http);
	deptList($scope, $http);
	empList($scope, $http);
	
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
	
	$(document).on("click", ".page_btn", function(){
		$scope.currPage = Number($(this).text());
		empList($scope, $http);
	});
});

function spotList($scope, $http){
	$http({
		type: "GET",
		url: './ajax_spot_list.html',
		headers: {
			"Accept":"application/json;charset=utf-8",
			"Accept-Charset":"charset=utf-8"
		},
		dataType:"json"
	}).then(function(res){
		$scope.spot = res.data;
		$scope.$apply();
	},function(res){
		alert("error");
	});
}

function deptList($scope, $http){
	$http({
		type: "GET",
		url: './ajax_dept_list.html',
		headers: {
			"Accept":"application/json;charset=utf-8",
			"Accept-Charset":"charset=utf-8"
		},
		dataType:"json"
	}).then(function(res){
		$scope.dept = res.data;
		$scope.$apply();
	},function(res){
		alert("error");
	});
}

function empList($scope, $http){
	var search = "total";
	var sel = $scope.searchSel;
	
	if(sel == 1){
		search = "dept";
	}else if(sel == 2){
		search = "spot";
	}else if(sel == 3){
		search = "name";
	}else{
		search = "total";
	}
	
	alert('./ajax_emp_list.html?search='+search
			+'&page='+$scope.currPage+'&q='+$scope.query);
	
	$http({
		type: "GET",
		url: './ajax_emp_list.html?search='+search
				+'&page='+$scope.currPage+'&q='+$scope.query,
		headers: {
			"Accept":"application/json;charset=utf-8",
			"Accept-Charset":"charset=utf-8"
		},
		dataType:"json"
	}).then(function(res){
		$scope.emp = res.data;
		pageCount($scope, $http);
		$scope.$apply();
	},function(res){
		alert("error");
	});
}

function pageCount($scope, $http){
	var search = "total";
	var sel = $scope.searchSel;
	
	if(sel == 1){
		search = "dept";
	}else if(sel == 2){
		search = "spot";
	}else if(sel == 3){
		search = "name";
	}else{
		search = "total";
	}
	
	$http({
		type: "GET",
		url: './ajax_emp_page_count.html?search='+search+'&q='+$scope.query,
		headers: {
			"Accept":"application/json;charset=utf-8",
			"Accept-Charset":"charset=utf-8"
		},
		dataType:"json"
	}).then(function(res){
		var p = [];
		for(var i = 1; i <= res.data.count; i++){
			p.push(i);
		}
		$scope.page = p;
		$scope.$apply();
	},function(res){
		alert("error");
	});
}
</script>