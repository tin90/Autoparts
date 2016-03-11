<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">

function logincheck(){
	if(document.getElementById("id").value  == "") {
		alert("아이디 입력!");
		return;
	} else if(document.getElementById("pwd").value == "") {
		alert("비밀번호 입력!");
		return;
	} else {
		//document.loginform.action = "";
		document.loginform.submit();
	}
}

$(document).ready(function(){
	
	$("#search_form").hide();
	
	//검색버튼 클릭시 검색결과 호출
	$("#search").click(function(){

		if($("#s_inp").val()==""){
			alert("input part number ass hole :)");
		return;
		}

		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : '${root}/erp/search.html?partnum='+$("#s_inp").val(),
			success : function(data){
				var len = data.list.length;
				
				if(len==0){
					return;
				}else{
					
					var t = $("#s_table");
					t.empty();
					
					for(var i=0; i<len; i++){
						
						var val = "";
						var td = "";
						var tr = $("<tr></tr>");
						
						val=data.list[i].country;
						if(val=="USA"){
							data.list[i].net="$"+data.list[i].net;
						}else if(val=="GER"){
							data.list[i].net="€"+data.list[i].net;
						}
						td = $("<td></td>").text(val);
						td.attr("id", "c"+i);
						tr.append(td);
						
						val=data.list[i].brand;
						td = $("<td></td>").text(val);
						td.attr("id", "b"+i);
						tr.append(td);
						
						val=data.list[i].partnum;
						td = $("<td></td>").text(val);
						td.attr("id", "p"+i);
						tr.append(td);
						
						val=data.list[i].description;
						td = $("<td></td>").text(val);
						td.attr("id", "d"+i);
						tr.append(td);
						
						val=data.list[i].net;
						td = $("<td></td>").text(val);
						td.attr("id", "n"+i);
						tr.append(td);
						
						var inputtag = "<input type='text' id='q"+i+"' class='form-control input-sm' ";
						inputtag+="onkeyup=amount("+i+")>";
	 					td = $("<td></td>").append(inputtag);
	 					td.attr("class", "col-xs-2")
						tr.append(td); 
						
						val='';
						td = $("<td></td>").text(val);
						td.attr("id", "sum"+i);
						tr.append(td);

						var atag = "<a href='#' class='btn btn-info' onclick=add_cart("+i+")>";
						var spantag = "<span id='cart"+i+"' class='glyphicon glyphicon-shopping-cart'></span></a>";
						td = $("<td></td>").append(atag+spantag);
						td.attr("width", "130px");
						tr.append(td);
						 
						t.append(tr);
						
					}
				}
			},
			 error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		 });
		
		//검색폼 토글
		$("#search_form").slideDown(400,function(){});
	});
	
});

//검색폼에서 NET * QTY 구하기
 function amount(i){
	 var val=$("#q"+i).val();	 	 
	 var str=$("#n"+i).text();
	 var prefix = str.substring(0,1);  
	 str=str.substring(1);
	 var result = val*str;
	 result = result.toFixed(2);
	 $("#sum"+i).text(prefix+result);
 }
 
//검색폼에서 cart 추가
 function add_cart(i){
	 
	 $("#cart"+i).attr("class", "view");
	 
	 var country = $("#c"+i).text();
	 var qty = $("#q"+i).val();
	 var net = $("#n"+i).text();
	 net = net.substring(1);
	 $.ajax({
		 type : 'POST',
		 data : { 'partnum' : $("#p"+i).text(),
		 'country' : country,
		 'qty' : qty,
		 'net' : net},
		 url : '${root}/erp/add_cart.html',
		 success : function(){
		 },
		 error : function(){
		 }
	 });
	 $("#cart"+i).text("View in cart");
	 
	 $("#cart"+i).parent().attr("href",'/Autoparts/erp/cart.html');                                             //누르면 카트로넘어감. 왜? 해결방법?
 }

 $(window).scroll(function() {
   $(".slideanim").each(function(){
     var pos = $(this).offset().top;

     var winTop = $(window).scrollTop();
       if (pos < winTop + 600) {
         $(this).addClass("slide");
       }
   });
 });

</script>



<div class="container-fluid">    
    <!-- Second navbar for sign in -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-2">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href='${root}'>
      		<img width="35px" height="35px" src="${root}/etc/ic_polymer_white_144dp.png" ></img>
      	  </a>
        </div>
    
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-collapse-2">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="${root}"><span class="glyphicon glyphicon-home"></span></a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"> </span></a></li>
            <li><a href="${root}/erp/cart.html" ><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
            <li>
              <a class="btn btn-default btn-outline btn-circle collapsed"  data-toggle="collapse" href="#nav-search" aria-expanded="false" aria-controls="nav-search">Search</a>
            </li>
            <li>
              <a class="btn btn-default btn-outline btn-circle collapsed"  data-toggle="collapse" href="#nav-collapse2" aria-expanded="false" aria-controls="nav-collapse2">Sign in</a>
            </li>
          </ul>
          <div class="collapse nav navbar-nav nav-collapse slide-down" id="nav-collapse2">
          <c:choose>
			<c:when test="${userInfo.id ne null}">
	            <form class="navbar-form navbar-right form-inline" role="form" name="loginform" action='${root}/join/login.html' method="post">
	              <div class="form-group">
	              ${userInfo.id}님 환영합니다.
	              </div>
	              <button type="button" class="btn btn-success" onClick="self.location='${root}/join/logout.html'">logout</button>
	              <button type="button" class="btn btn-danger" onClick="self.location='${root}/join/joinInfo.html'">profile</button>
	            </form>
            </c:when>
			<c:otherwise>
	            <form class="navbar-form navbar-right form-inline" role="form" name="loginform" action='${root}/join/login.html' method="post">
	              <div class="form-group">
	                <label class="sr-only" for="Email">Email</label>
	                <input type="email" class="form-control" placeholder="Email" autofocus  id="id" name="id" value='123@naver.com' required />
	              </div>
	              <div class="form-group">
	                <label class="sr-only" for="Password">Password</label>
	                <input type="password" class="form-control" placeholder="Password" id="pwd" name="pwd" value='qwe123' required />
	              </div>
	              <button type="submit" class="btn btn-success" onClick="javascript:logincheck();">Sign in</button>
	              <button type="button" class="btn btn-danger" onClick="self.location='${root}/join/join.html'">register</button>
	            </form>
	        </c:otherwise>
   			</c:choose>
          </div>
          <div class="collapse nav navbar-nav nav-collapse slide-down" id="nav-search">
            <form class="navbar-form navbar-right" role="search">
              <div class="form-group">
                <input id="s_inp" type="text" class="form-control" placeholder="Search" style="min-width: 200px" value="0001401860"/>
              </div>
              <button id="search" type="button" class="btn btn-danger" ><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
            </form>
          </div>
        </div><!-- /.navbar-collapse -->
        <%-- 
        <div class="pull-right">
			<a href="<c:url value='/index.html' />">메인</a>
			<a href="<c:url value='/spot/add.html' />">부서</a>
			<a href="<c:url value='/department/add.html' />">직원</a>
			<a href="<c:url value='/employee/list.html' />">사원</a>
		</div>
	 --%>
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
</div><!-- /.container-fluid -->

	<div id="search_form" style="margin-top: 7px; color: #ffffff; margin-left: 10%; margin-right: 10%;" class="table-responsive" >
	<table class="table">
		<tr>
			<th>COUNTRY</th>
			<th>BRAND</th>
			<th>PART#</th>
			<th>DESCRIPTION</th>
			<th>NET</th>
			<th>QTY</th>
			<th>AMOUNT</th>
			<th>CART</th>
		</tr>
		
		<tbody id="s_table">
			<tr>
				<td></td><td></td><td></td><td>check partnumber</td><td></td><td></td><td></td>
				<td><a href="#" class="btn btn-info"><span class="glyphicon glyphicon-shopping-cart"></span></a></td>
			</tr>
			
		</tbody>
		
	<!--
			<tr>
				<td>USA</td><td>BMW</td><td>1234512345</td><td>OPERATING INSTRUCTIONS:861061</td>
				<td>$999.00</td><td align="left" class="col-xs-2"><input type="text" class="form-control input-sm"></td><td>$1998.00</td>
				<td><a href="#" class="btn btn-info"><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</a></td>
			</tr> 	
			<tr>
				<td>USA</td><td>BMW</td><td>1234512345</td><td>Schlauchklemme</td>
				<td>$999.00</td><td class="col-xs-2"><input type="text" class="form-control input-sm"></td><td>$1998.00</td>
				<td><a href="#" class="btn btn-info"><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</a></td>
			</tr>
			<tr>
				<td>USA</td><td>BMW</td><td>1234512345</td><td>Schlauchklemme</td>
				<td>$999.00</td><td class="col-xs-2"><input type="text" class="form-control input-sm"></td><td>$1998.00</td>
				<td><a href="#" class="btn btn-info"><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</a></td>
			</tr> -->
	</table>
</div>