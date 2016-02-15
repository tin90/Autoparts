var app = angular.module('autoparts', []);

app.controller('MainCtrl', function($scope) {
	$scope.delC = delC;
	$scope.list = list;
	
	$("#list").selectable({
	    selected: function(event, ui) { 
	        $(ui.selected).addClass("ui-selected").siblings().removeClass("ui-selected");           
	    }                   
	});
	
	$("#list").tooltip({track:true});
	
	$("#delBtn").click(function(){
		$(".ui-selected").each(function(){
			var index = $(this).children(".index").text();
			
			if($scope.list[index].empCount == 0){
				$scope.list.splice(index, 1);
				$scope.$apply();
			}else{
				alert(failC);
			}
		});
	});
	
	$("#modBtn").click(function(){
		$(".ui-selected").each(function(){
			$(this).removeClass("ui-selected");
			
			var i = $(this).children(".index").text();
			var name = $(this).children(".name").text();
			var empCount = $(this).children(".empCount").text();
			
			$(this).text("");
			var input = $("<input>").attr("type","text").val(name);
			input.attr("title",modC);
			$(this).append(input);
			
			var emp = $("<input>").attr("type","hidden").addClass("h_count").val(empCount);
			$(this).append(emp);
			
			var index = $("<input>").attr("type","hidden").addClass("h_index").val(i);
			$(this).append(index);
			
			input.focus();
		});
	});
	
	$("#addBtn").click(function(){
		$(".ui-selected").each(function(){
			$(this).removeClass("ui-selected");
		});
		
		var li = $("<li>");
		li.attr("class","list-group-item").attr("title",inputC);
		var input = $("<input type='text'>");
		li.append(input);
		li.append($("<input type='hidden' class='h_count' value='0'>"))
		$("#list").append(li);
		
		input.focus();
	});
	
	$(document).on("focusout","input[type='text']",function(){
		var name = $(this).val();
		var empCount = $(this).siblings(".h_count").val();
		var index = $(this).siblings(".h_index").val();
		
		$(this).parent().remove();
		
		if(name != ""){
			if(index == null || index == ""){
				$scope.list.push({"name":name,"empCount":empCount});
			}else{
				$scope.list[index] = {"name":name,"empCount":empCount};
			}
			$scope.$apply();
		}
	});
});