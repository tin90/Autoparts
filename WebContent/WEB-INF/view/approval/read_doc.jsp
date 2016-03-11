<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
	<div class="col-md-12">
		<div class="form-group">
			<input id="title" type="text" class="form-control" aria-label="title" value="${con.title}" disabled>
			<textarea id="content" class="form-control" style="resize:none" rows="10" disabled>${con.content}</textarea>
		</div>
	</div>
</div>

<script>
var app = angular.module('autoparts', []);

app.controller('MainCtrl', function($scope, $http) {
	//$scope.applist = ${con.applist}
});
</script>