<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${root}/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
function join(){
	if(document.getElementById("name").value == "") {
		alert("full name");
		return;
	  } else if(document.getElementById("address").value == "") {
		alert("address");
		return;
	 } else if(document.getElementById("zip").value  == "") {
		alert("zip");
		return;
	} else if(document.getElementById("phone").value  == "") {
		alert("phone");
		return;
	} else if(document.getElementById("fax").value  == "") {
		alert("fax");
		return;
	} else if(document.getElementById("com_num").value  != ""){
		if(document.getElementById("c_name").value  == "") {
			alert("c_name");
			return;	
		}
		document.loginform.action = "${root}/join/registerInfo.html";
		document.loginform.submit();
		return;	
	} else if(document.getElementsByName("req")[0].checked == true) {
		if(document.getElementById("c_name").value  == ""){
			alert("c_name");
			return;
		} else if(document.getElementById("com_num").value  == "") {
			alert("businessRegNum");
			return;	
		}
		document.loginform.action = "${root}/join/registerInfo.html";
		document.loginform.submit();
		return;
	}else {
		alert(document.getElementsByName("req")[0].checked);
		alert("ok");
		document.loginform.action = "${root}/join/registerInfo.html";
		document.loginform.submit();
	}
}
function div_OnOff(v,id){
	 // 라디오 버튼 value 값 조건 비교
	 if(v == "com"){
	  document.getElementById(id).style.display = ""; // 보여줌
	 }else{
	  document.getElementById(id).style.display = "none"; // 숨김
	 }
}
function sub(){
	 var x = loginform.nationInfo.value;
	 /* var z = f.sel2.value; */
	 $.ajax({   
	  type: "POST",  
	  url: "join/getNation.html",   
	  data: "region="+x,   //&a=xxx 식으로 뒤에 더 붙이면 됨
	  success: result    //function result 를 의미함
	   }
	 );
} 
function defaultRegNum(){ 
	if(document.getElementsByName("req")[0].checked){
		if(document.getElementById('com_num').value == '')
			document.getElementById('com_num').value = '111-11-11111';	
	}	 
}
	
</script>
<html>
<body>
<form class="form-inline" style="float:left" name ="loginform" method="post" action="">
	<table>
		<!-- <tr>
			<td colspan="2">
				<label for="chk2"><input type="radio" name="chk_info" id="chk2" value="per" checked="checked" onclick="div_OnOff(this.value,'con');">Personal Account</label>
				<label for="chk1"><input type="radio" name="chk_info" id="chk1" value="com" onclick="div_OnOff(this.value,'con');">Company Account</label>
			</td>
			
		</tr> -->
		<tr>
			<th colspan="5">*Required Fields</th>
		</tr>
		<tr>
			<th>Full Name*</th>
			<td><input type="text" name="name" id="name" value="${userInfo.name }"></td>	
		</tr>
		<tr>
			<th>Address*</th>
			<td><input type="text" name="address" id="address" value="${userInfo.address }"></td>	
		</tr>
		<tr>
			<th>Postal Code*</th>	
			<td><input type="text" name="zip" id="zip" value="${userInfo.zip }"></td>
		</tr>
		<tr>
			<th>Phone Number*</th>
			<td><input type="text" name="phone" id="phone" value="${userInfo.phone }"></td>	
		</tr>
		<tr>
			<th>Fax Number*</th>
			<td><input type="text" name="fax" id="fax" value="${userInfo.fax }"></td>	
		</tr>
		<!-- <tbody style="display:none" id="con"> -->
		<tr>
			<th>Company name*</th>
			<td><input type="text" name="c_name" id="c_name" value="${userInfo.c_name }"></td>	
		</tr>
		<tr>
			<th>Corporate registration number*</th>
			<td><input type="text" name="com_num" id="com_num" value="${userInfo.com_num }"></td>	
		</tr>
		<!-- </tbody> -->
		<tr>
			<th>request to company client</th>
			<td>
			<c:choose>
				<c:when test="${userInfo.req eq 'true' }">
					<input type="checkbox" name="req" id="req" value="true" checked="checked" onClick='defaultRegNum()'>
					${userInfo.req}
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="req" id="req" value="true" onClick='defaultRegNum()'>
					bbbb ${userInfo.req}
				</c:otherwise>
			</c:choose>
			 
			
			<br>(essential input Company name , Corporate registeration number)</td>
		</tr>
		<tr>
			<th>Memo</th>
			<td><textarea rows="5" cols="30" name="memo" id="memo" >${userInfo.memo }</textarea></td>	
		</tr>
	</table>
	<input type="button" value="Create Account" onclick="javascript:join();" >
	<input type="button" value="Cancel" onclick="history.back();">
</form>
</body>
</html>