<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<div class="row" data-ng-app="autoparts" data-ng-controller="MainCtrl">
<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<form id="form" class="form-inline">
				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
			 			{{typename}} <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
			  			<li id="type-filter">
			  				<a href="#">All</a>
			  				<a href="#">Reg</a>
			  				<a href="#">Unreg</a>
			  			</li>
					</ul>
				</div>
				<div class="form-group">
					<label data-ng-hide="true" for="selDept">DEPT:</label>
					<select class="form-control" id="selDept">
						<option value=""></option>
						<option data-ng-repeat="d in dept" value="{{d.no}}">{{d.name}}</option>
					</select>
					<label data-ng-hide="true" for="selSpot">SPOT:</label>
					<select class="form-control" id="selSpot">
						<option value=""></option>
						<option data-ng-repeat="s in spot" value="{{s.no}}">{{s.name}}</option>
					</select>
					<input id="inputNo" type="hidden" value="{{flag}}">
					<label data-ng-hide="true" for="inputName">NAME:</label>
					<input id="inputName" type="text" class="form-control" placeholder="NAME" disabled>
					<label data-ng-hide="true" for="inputEmail">EMAIL:</label>
					<input id="inputEmail" type="text" class="form-control" placeholder="EMAIL" disabled>
					<label data-ng-hide="true" for="inputPhone">PHONE:</label>
					<input id="inputPhone" type="text" class="form-control" placeholder="PHONE" disabled>
					
					<button data-ng-if="flag == -1" class="btn btn-primary btn-submit">ADD</button>
					<button data-ng-if="flag >= 0" class="btn btn-primary btn-submit">MOD</button>
					<button data-ng-if="flag >= 0" class="btn btn-primary btn-submit">DEL</button>
				</div>
			</form>
		</div><!-- heading -->
		<div class="panel-body">
			<table class="table table-bordered">
				<tr>
					<th data-ng-hide="typename == 'Unreg'" class="text-center">no</th>
					<th class="text-center">id</th>
					<th class="text-center">name</th>
					<th class="text-center">phone</th>
					<th data-ng-hide="true">dept</th>
					<th data-ng-hide="true">spot</th>
				</tr>
				<tr class="clickable-row" data-ng-repeat="l in list">
					<td data-ng-hide="typename == 'Unreg'" class="lno">{{l.empno}}</td>
					<td class="lid">{{l.id}}</td>
					<td class="lname">{{l.name}}</td>
					<td class="lphone">{{l.phone}}</td>
					<td data-ng-hide="true" class="ldept">{{l.dept}}</td>
					<td data-ng-hide="true" class="lspot">{{l.spot}}</td>
				</tr>
			</table>
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
</div>

<script>
var app = angular.module('autoparts', []);

app.controller('MainCtrl', function($scope, $http) {
	$scope.type = "";
	$scope.typename = "Unreg";
	$scope.currPage = 1;
	$scope.flag = -2;
	
	list_down($scope, $http);
	dept_down($scope, $http);
	spot_down($scope, $http);
	
	$(document).on("click", "#type-filter a", function(ev){
		ev.preventDefault();
		var type = $(this).text();
		if(type == "All"){
			$scope.type = "all";
			$scope.typename = "All";
		}else if(type == "Reg"){
			$scope.type = "able";
			$scope.typename = "Reg";
		}else if(type == "Unreg"){
			$scope.type = "disable";
			$scope.typename = "Unreg";
		}
		list_down($scope, $http);
	});
	
	$(document).on("click", ".clickable-row", function(){
		$("#selDept option").prop("selected", false)
							.filter("[value='"+$(this).children(".ldept").text()+"']")
							.prop("selected", true);
		
		$("#selSpot option").prop("selected", false)
							.filter("[value='"+$(this).children(".lspot").text()+"']")
							.prop("selected", true);
		
		$scope.flag = Number($(this).children(".lno").text());
		$("#inputName").val($(this).children(".lname").text());
		$("#inputEmail").val($(this).children(".lid").text());
		$("#inputPhone").val($(this).children(".lphone").text());
		
		$scope.$apply();
	});
	
	$(document).on("click", "#form button.btn-submit", function(){
		var cmd = $(this).text();
		var dept = $("#selDept").val();
		var spot = $("#selSpot").val();
		
		if(cmd != "DEL" && (dept == "" || spot == "")){
			alert("Choose dept or spot.");
			return;
		}
		
		var json = new Object();
		json["no"] = Number($("#inputNo").val());
		json["dept"] = Number(dept);
		json["spot"] = Number(spot);
		json["id"] = $("#inputEmail").val();
		json["name"] = $("#inputName").val();
		
		if(json["id"] != ""){
			var cmd_url;
			
			if(cmd == "DEL"){
				cmd_url = "./ajax_appclient_del.html?json="+JSON.stringify(json);
			}else if(cmd == "ADD"){
				cmd_url = "./ajax_appclient_reg.html?json="+JSON.stringify(json);
			}else if(cmd == "MOD"){
				cmd_url = "./ajax_appclient_mod.html?json="+JSON.stringify(json);
			}
			
			$http({
				method: "GET",
				url: cmd_url,
			}).then(function(res){
				list_down($scope, $http);
			}, function(res){ //내부 네트워크로는 되도 외부 네트워크가 안되니 에러난다.
				list_down($scope, $http);
			});
		}
	});
});

function list_down($scope, $http){
	$http({
		method: "GET",
		url: "./ajax_appclient.html?type="+$scope.type+"&page="+$scope.currPage,
		headers: {
			"Accept":"application/json;charset=utf-8",
			"Accept-Charset":"charset=utf-8"
		}
	}).then(function(res){
		$scope.list = res.data;
		$scope.$apply();
	});
	
	$http({
		method: "GET",
		url: "./ajax_appclient_count.html?type="+$scope.type,
		headers: {
			"Accept":"application/json;charset=utf-8",
			"Accept-Charset":"charset=utf-8"
		}
	}).then(function(res){
		$scope.maxPage = res.data.count;
		var base = Math.floor(($scope.currPage-1)/5)*5;
		
		var p = [];
		for(var i = base+1; i <= Math.min(base+5, $scope.maxPage); i++){
			p.push(i);
		}
		$scope.page = p;
		$scope.$apply();
	});
	
	$("#form")[0].reset();
}

function dept_down($scope, $http){
	$http({
		url: "../employee/ajax_dept_list.html",
		headers: {
			"Accept":"application/json;charset=utf-8",
			"Accept-Charset":"charset=utf-8"
		}
	}).then(function(res){
		$scope.dept = res.data;
	});
}

function spot_down($scope, $http){
	$http({
		url: "../employee/ajax_spot_list.html",
		headers: {
			"Accept":"application/json;charset=utf-8",
			"Accept-Charset":"charset=utf-8"
		}
	}).then(function(res){
		$scope.spot = res.data;
	});
}
</script>