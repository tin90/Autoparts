<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div align="right">
	<a href="#" class="btn btn-info" >SEND</a>  
	<a href="#" class="btn btn-info" >OK</a>
</div>

<form class="form-inline">
<div class="form-group">
<span>
	<input type="radio" name="radio">USA <input type="text" class="form-control input-sm"> <a href="#" class="btn btn-info">SEARCH</a>
</span>
</div>

<div align="right">
	<label>PO# </label><input type="text" class="form-control input-sm">
</div>
</form>

<div >
		<table class="table table-hover" >
			<tr>
				<td>#</td><td>BRAND</td><td>PART#</td><td>DESCRIPTION</td><td>NET</td><td>QTY</td><td>AMOUNT</td><td>VIN</td><td>MEMO</td>
			</tr>
			<tr>
				<td>1</td><td>BMW</td><td>1234512345</td><td>Schlauchklemme</td>
				<td>$999.00</td><td><input type="text" class="form-control input-sm"></td><td>$1998.00</td>
				<td><input type="text" class="form-control input-sm"></td><td><input type="text" class="form-control input-sm"></td>
			</tr>
			<tr>
				<td>2</td><td>BMW</td><td>1234512345</td><td>Schlauchklemme</td>
				<td>$999.00</td><td><input type="text" class="form-control input-sm"></td><td>$1998.00</td>
				<td><input type="text" class="form-control input-sm"></td><td><input type="text" class="form-control input-sm"></td>
			</tr>
			<tr>
				<td>3</td><td>BMW</td><td>1234512345</td><td>Schlauchklemme</td>
				<td>$999.00</td><td><input type="text" class="form-control input-sm"></td><td>$1998.00</td>
				<td><input type="text" class="form-control input-sm"></td><td><input type="text" class="form-control input-sm"></td>
			</tr>
		</table>
	
	</div>