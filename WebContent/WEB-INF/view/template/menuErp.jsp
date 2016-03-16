<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<style>
    body { background-color: #F5F5F5; margin-top:30px;}
 	.btn-group button{cursor:pointer; } 
  	#sub-order .breadcrumb{display:none; float:left; position:absolute;} 
  	#sub-part .breadcrumb{display:none; float:left; position:absolute;} 
  	#sub-dealer .breadcrumb{display:none; float:left; position:absolute;} 
</style>

<div class="btn-group" role="group" aria-label="..."> 
	<button id="nav-order"  class="btn btn-default" style="background-color: #ECFFEB;width: 100px;">ORDER</button> 
	<button id="nav-part"  class="btn btn-default" style="background-color: #ECFFEB;width: 100px;">PART</button> 
	<button id="nav-dealer"  class="btn btn-default" style="background-color: #ECFFEB;width: 100px;">DEALER</button> 
 </div> 
<div id="sub-order">
	<ol class="breadcrumb"> 
 	  <li><a href="${root}/erp/orderPo.html">Order by PO</a></li> 
 	  <li><a href="#">Order by Number</a></li> 
 	  <li class="active">Commercial Invoice List</li> 
 	</ol> 
 </div>
 <div id="sub-part">
	<ol class="breadcrumb"> 
 	  <li><a href="#">Net Search</a></li> 
 	  <li><a href="${root}/erp/partUpdate.html">Update Level</a></li> 
 	  <li class="active">Company Class</li> 
 	</ol> 
 </div>
 <div id="sub-dealer">
	<ol class="breadcrumb"> 
 	  <li><a href="#">Net Search</a></li> 
 	  <li><a href="#">Update Level</a></li> 
 	  <li class="active">Company Class</li> 
 	</ol> 
 </div>
 
 
<script>
 $(document).ready(function(){
 	$("#nav-order").click(function(){
 		var submenu = $("#sub-order .breadcrumb");
 		if(submenu.is(":visible")){
 			submenu.slideUp();
 		}else{
 			submenu.slideDown();
 		}
 		}).mouseover(function(){
 		$("#sub-order .breadcrumb").slideDown("#sub-order .breadcrumb");
 		$("#sub-part .breadcrumb").slideUp("#sub-order .breadcrumb");
 		$("#sub-dealer .breadcrumb").slideUp("#sub-order .breadcrumb");
 	});
 	$("#nav-part").click(function(){
 		var submenu = $("#sub-part .breadcrumb");
 		if(submenu.is(":visible")){
 			submenu.slideUp();
 		}else{
 			submenu.slideDown();
 		}
 		}).mouseover(function(){
 		$("#sub-order .breadcrumb").slideUp("#sub-order .breadcrumb");
 		$("#sub-part .breadcrumb").slideDown("#sub-order .breadcrumb");
 		$("#sub-dealer .breadcrumb").slideUp("#sub-order .breadcrumb");
 	});
 	$("#nav-dealer").click(function(){
 		var submenu = $("#sub-dealer .breadcrumb");
 		if(submenu.is(":visible")){
 			submenu.slideUp();
 		}else{
 			submenu.slideDown();
 		}
 		}).mouseover(function(){
 		$("#sub-order .breadcrumb").slideUp("#sub-order .breadcrumb");
 		$("#sub-part .breadcrumb").slideUp("#sub-order .breadcrumb");
 		$("#sub-dealer .breadcrumb").slideDown("#sub-order .breadcrumb");
 	});
 });
</script>

 
 