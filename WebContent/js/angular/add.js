var app = angular.module('autoparts', []);

app.controller('MainCtrl', function($scope) {
	$scope.delC = delC;
	$scope.modC = modC;
	$scope.failC = failC;
	$scope.list = ${list};
	$scope.flag = null;
	
	var json = new Object();
	json['mod'] = new Array();
	json['del'] = new Array();
	json['add'] = new Array();
	return json;
	
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
		
		var jsondata = JSON.stringify(json);
		$.ajax({
			url: "./ajax_add.html",
			data: {"json":jsondata},
			success: function(data){
				if(data == 'ok'){
					alert("저장되었습니다.");
				}else if(data == 'error'){
					alert("실패하였습니다.");
				}
			}
		});
	});
});