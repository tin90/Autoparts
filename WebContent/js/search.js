function spotList($scope, $http){
	$http({
		type: "GET",
		url: "../employee/ajax_spot_list.html",
		headers: {
			"Accept":"application/json;charset=utf-8",
			"Accept-Charset":"charset=utf-8"
		},
		dataType:"json"
	}).then(function(res){
		$scope.spot = res.data;
		$scope.$apply();
	},function(res){
		alert("spot error");
	});
}

function deptList($scope, $http){
	$http({
		type: "GET",
		url: "../employee/ajax_dept_list.html",
		headers: {
			"Accept":"application/json;charset=utf-8",
			"Accept-Charset":"charset=utf-8"
		},
		dataType:"json"
	}).then(function(res){
		$scope.dept = res.data;
		$scope.$apply();
	},function(res){
		alert("dept error");
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
	
	$http({
		type: "GET",
		url: "../employee/ajax_emp_list.html?search="+search+"&page="+$scope.currPage+"&q="+$scope.query,
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
		alert("emp error");
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
		url: "../employee/ajax_emp_page_count.html?search="+search+"&q="+$scope.query,
		headers: {
			"Accept":"application/json;charset=utf-8",
			"Accept-Charset":"charset=utf-8"
		},
		dataType:"json"
	}).then(function(res){
		$scope.maxPage = res.data.count;
		var base = Math.floor(($scope.currPage-1)/5)*5;
		
		var p = [];
		for(var i = base+1; i <= Math.min(base+5, $scope.maxPage); i++){
			p.push(i);
		}
		$scope.page = p;
		$scope.$apply();
	},function(res){
		alert("page error");
	});
}