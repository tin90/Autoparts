<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<script type="text/javascript">

document.title='CART';

$(document).ready( function(){

	var root = '${root}';
	
	// 장바구니 NET * QTY 값 구하기
	$(".input-lg").keyup(function(){
			//var getindex = $(this).closest('td').index()-1;
			//var net =$(this).closest('tr').find("td:eq("+getindex+")").text();
			var net =$(this).closest('tr').find("td:eq(4)").text();
			var qty = $(this).closest('tr').find("td:eq(5)").children().val();
			
			//getindex=getindex+2;
			net=net.replace(',', '');
			var result = net*qty;
			//result=Math.floor(result*100)/100;
			var setqty = $(this).closest('tr').find("td:eq(6)").text(result+"");

	});
	
	$(".input-lg").one("keyup", function(){
		
		var a = $("<a></a>").text('update');		
		a.attr("id", "update");
		$(this).parent().append(a);
		
		$("#update").mouseover( function(){
			
			var partnum=$(this).closest('tr').find("td:eq(2)").text();
			var memo = $(this).closest('tr').find("td:eq(8)").children().val();
			var qty = $(this).closest('tr').find("td:eq(5)").children().val();
			qty=Math.round(qty);
			if(qty==""){
				qty=0;
			}
			
			if(memo==""){
				memo="";
			}
			
			a.attr("href", root+'/erp/mod_qty.html?id='+'a'+'&partnum='+partnum+'&qty='+qty+"&memo="+memo);
		});
	});
	
	
	
	$(".btn-del").click( function(){
		
		//confirm 버튼 필요하나?
		
		$(this).closest('tr').attr("style", "display : none");
		var getpart =$(this).closest('tr').find("td:eq(2)").text();
		
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : root+'/erp/del_cart.html?partnum='+getpart+'&id=a'
		});
		alert("removed");
	});
	
	
	$("#cart_send").click( function(){
		//alert($("#cart_table tr:eq(2) td:eq(2)").text());
		//db에 저장되어있는걸 쓰기

		/* $.ajax({
			type : 'POST',
			url : '${root}/erp/send_cart.html',
			data : {"id" : 'a'}
		}); */
		
		if($("tr").hasClass("warn")){
			alert("Check Partumber");
		}
		
	});
	
	
	$("#submit_excel").click( function(){
		var text = $("#from_excel").val().trim().split("\n");
		var len = text.length;
		var partnumarr=[],qtyarr=[],memoarr=[];
		
		for(var i=0; i<len; i++){
			
			var st = text[i].split("\t");
			partnumarr.push(st[0]);
			qtyarr.push(st[1]);
			memoarr.push(st[2]);
			
			if(st[1]>400 || st[1]<0){
				alert("qty is only numbers");
				return;
			}
		}

		$.ajax({
			type : 'POST',
			url : '${root}/erp/excel_cart.html',
			data : {"partarr" : partnumarr, "qtyarr" : qtyarr, "memoarr" : memoarr}
		});
		
	});
	
});



</script>
<br>
<br>

<div>
	<a href="#" class="btn btn-info" id="cart_send" >ORDER</a>  
	
</div>

<form class="form-inline">


<!-- modal from excel -->
<div align="right">
<br>
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-list-alt"></span>    Add From Excel</button>
</div>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add From Excel</h4>
        </div>
        <div class="modal-body">
          <p>step 1. Copy in excel, but you must follow below format</p>
          <p>step 2. Paste it</p>
          <p align="right"><button id="submit_excel" type="button" class="btn btn-default" data-dismiss="modal" >ADD ALL</button></p>
          <table style="width: 40%; text-align: center;">
	          <tr>
	          	<td>partnum</td><td>quantity</td><td>memo</td>
	          </tr>
          </table>
          <textarea id="from_excel" class="form-control" style="width: 100%; min-height: 450px;" placeholder="text here"></textarea>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

</form>


<div >
		<table id="cart_table" class="table table-hover" style="width: 100%">
			<tr>
				<th>#</th><th>BRAND</th><th>PART#</th><th>DESCRIPTION</th><th>NET</th><th>QTY</th><th>AMOUNT</th><th>MEMO</th>
			</tr>
			<c:forEach items="${cart_list}" var="item" varStatus="status"> 
	               <c:choose>
		               <c:when test="${item.country ne null}">
		                	 <tr>
		               </c:when>
		               <c:otherwise>
		               		<tr style="background-color: paleVioletRed;" class="warn">
		               </c:otherwise>
	               </c:choose>	
	               	   <td>${status.index+1}</td>
	               	   <td>${item.brand}</td>
	                   <td>${item.partnum}</td> 
	                   <td>${item.description }</td> 
	                   <td>${item.net}</td> 
	                   <td><input type="text" class="form-control input-lg" value="${item.qty}" style="width: 60px"></td>
	                   <td>${item.amount}</td> 
	                   <td><input type="text" class="form-control input-lg" value="${item.memo}"></td> 
	                   <td><a href="#" class="btn btn-del">Remove</a></td>
	               </tr> 
	               
			</c:forEach>
  			
			<!-- <tr>
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
			</tr> -->
		</table>
	
	</div>