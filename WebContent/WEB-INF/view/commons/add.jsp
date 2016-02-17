<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div data-ng-app="autoparts" data-ng-controller="MainCtrl">
	<div class="btn-group" role="group">
		<input type="button" class="btn btn-default" id="delBtn" value="삭제">
		<input type="button" class="btn btn-default" id="modBtn" value="수정">
		<input type="button" class="btn btn-default" id="addBtn" value="추가">
		<input type="button" class="btn btn-default" id="complete" value="완료">
	</div>
	<ul id="list" class="list-group">
		<li data-ng-repeat="item in list" class="list-group-item" title="{{delC}}">
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
	var app = angular.module('autoparts', []);

	app.controller('MainCtrl', function($scope) {
		$scope.delC = "${delComment}";
		$scope.modC = "${inputComment}";
		$scope.failC = "${delFailComment}";
		$scope.list = ${list};
		$scope.flag = null;
		
		$("#list").selectable({
		    selected: function(event, ui) { 
		        $(ui.selected).addClass("ui-selected").siblings().removeClass("ui-selected");           
		    }                   
		});
		
		$("#list").tooltip({track:true});
		
		$("#delBtn").click(function(){
			$(".ui-selected").each(function(){
				var index = $(this).children(".index").text();
				
				if($scope.list[index].count == 0){
					if(index != ""){
						alert("기존 등록인데 등록은 0");
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
			$scope.json.del;
			$scope.json.mod;
			$scope.json.add;
		});
	});
</script>