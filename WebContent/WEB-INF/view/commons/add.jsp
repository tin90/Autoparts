<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row" data-ng-app="autoparts" data-ng-controller="MainCtrl">
	<div class="btn-group" role="group">
		<input type="button" class="btn btn-default" id="delBtn" value="삭제">
		<input type="button" class="btn btn-default" id="modBtn" value="수정">
		<input type="button" class="btn btn-default" id="addBtn" value="추가">
		<input type="button" class="btn btn-default" id="complete" value="저장">
	</div>
	<ul id="list" class="list-group">
		<li data-ng-repeat="item in list" class="list-group-item" title="{{delC}}">
			<span class="mod" data-ng-hide="true"></span>
			<span class="index" data-ng-hide="true">{{$index}}</span>			
			<span class="no" data-ng-hide="true">{{item.no}}</span>
			<span class="name" data-ng-if="$index != flag">{{item.name}}</span>
			<span class="name" data-ng-if="$index == flag">
				<input id="_in" data-ng-model="item.name" title="{{modC}}">
			</span>
			(<span class="empCount">{{item.count}}</span>)
		</li>
	</ul>
</div>

<script>
var json = init();

var app = angular.module('autoparts', []);

app.controller('MainCtrl', function($scope, $http) {
	$scope.delC = "${delComment}";
	$scope.modC = "${inputComment}";
	$scope.failC = "${delFailComment}";
	$scope.flag = null;
	
	list($scope, $http);
	
	$("#list").selectable({
	    selected: function(event, ui) { 
	        $(ui.selected).addClass("ui-selected").siblings().removeClass("ui-selected");           
	    }                   
	});
	
	$("#list").tooltip({track:true});
	
	$("#delBtn").click(function(){
		$(".ui-selected").each(function(){
			var index = $(this).children(".index").text();
			var no = $(this).children(".no").text();
			var name = $(this).children(".name").text();
			
			if($scope.list[index].count == 0){
				if(no != ""){
					json['del'].push(Number(no));
				}
				$scope.list.splice(index, 1);
				$scope.$apply();
			}else{
				alert($scope.failC);
			}
		});
	});
	
	$("#modBtn").click(function(){
		$(".ui-selected").each(function(){
			$(this).removeClass("ui-selected");
			
			var index = $(this).children(".index").text();
			$scope.flag = index;
			$(this).children(".mod").text("m");
			
			$scope.$apply();
			$("#_in").focus();
			
			$("#list").selectable("option","disabled",true);
		});
	});
	
	$("#addBtn").click(function(){
		$(".ui-selected").each(function(){
			$(this).removeClass("ui-selected");
		});
		
		$scope.list.push({"name":"","count":0});
		$scope.flag = $scope.list.length-1;
		
		$scope.$apply();
		$("#_in").focus();
		
		$("#list").selectable("option","disabled",true);
	});
	
	$(document).on("focusout","#_in",function(){
		if($.trim($(this).val()) == ""){
			$scope.list.splice($scope.list.length-1, 1);
		}
		
		$scope.flag = null;
		$scope.$apply();
		
		$("#list").selectable("option","disabled",false);
	});
	
	$("#complete").click(function(){
		$("#list").children().each(function(){
			if($(this).children(".no").text() == ''){
				json['add'].push($(this).children(".name").text());
			}else if($(this).children(".mod").text() == 'm'){
				var o = new Object();
				o["no"] = Number($(this).children(".no").text());
				o["name"] = $(this).children(".name").text();
				json['mod'].push(o);
			}
		});
		
		$.ajax({
			url: "./ajax_add.html",
			data: {"json":JSON.stringify(json)},
			complete: function(data){
				if(data.status == 200){
					json = init();
					list($scope, $http);
					alert("저장되었습니다.");
				}else{
					alert("실패하였습니다.");
				}
			}
		});
		
	});
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

function init(){
	var json = new Object();
	json['mod'] = new Array();
	json['del'] = new Array();
	json['add'] = new Array();
	return json;
}
</script>