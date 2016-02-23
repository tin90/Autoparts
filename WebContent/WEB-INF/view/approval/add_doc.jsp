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
					<th class="text-center">팀장</th>
					<th class="text-center"></th>
					<th class="text-center"></th>
					<th class="text-center"></th>
					<th class="text-center"></th>
				</tr>
				<tr>
					<td class="text-center">현종석</td>
					<td class="text-center"><button class="btn btn-default">지정</button></td>
					<td class="text-center"><button class="btn btn-default">지정</button></td>
					<td class="text-center"><button class="btn btn-default">지정</button></td>
					<td class="text-center"><button class="btn btn-default">지정</button></td>
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
					<th class="text-center">팀장</th>
					<th class="text-center"></th>
					<th class="text-center"></th>
					<th class="text-center"></th>
					<th class="text-center"></th>
				</tr>
				<tr>
					<td class="text-center">현종석</td>
					<td class="text-center"><button class="btn btn-default">지정</button></td>
					<td class="text-center"><button class="btn btn-default">지정</button></td>
					<td class="text-center"><button class="btn btn-default">지정</button></td>
					<td class="text-center"><button class="btn btn-default">지정</button></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading text-center">
				수신부서/참조자
			</div>
			<table class="table table-bordered">
				<tr>
					<th class="text-center">수신부서</th>
					<td><input type="text" placeholder="수신부서" class="form-control" aria-label="수신"></td>
				</tr>
				<tr>
					<th class="text-center">참조자</th>
					<td><input type="text" placeholder="참조자" class="form-control" aria-label="참조"></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="col-md-12">
		<div class="form-group">
			<input type="date" class="form-control">
		</div>
		<div class="form-group">
			<input type="text" placeholder="title" class="form-control" aria-label="title">
			<textarea class="form-control" style="resize:none" rows="10" placeholder="content"></textarea>
		</div>
	</div>
</div><!-- row -->
</div>

<script>
$("[type='date']").datepicker();
</script>