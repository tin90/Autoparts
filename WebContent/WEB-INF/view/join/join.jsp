<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="stylesheet.css" type="text/css"/>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="authNum" value="<%=(String)session.getAttribute(\"authNum\")%>"/>
<c:set var="email" value="<%=(String)session.getAttribute(\"email\") %>"/>
<script type="text/javascript" src="${root}/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
function check(){
	var putNum = document.getElementById("authnum");
	var authNum = "${authNum}";
 	if(!putNum.value){
 		alert(document.getElementById("numChk").value);
		alert("인증번호를 입력하세요.");
		return false;
	}
	if(putNum.value != authNum){
		alert(document.getElementById("numChk").value);
		alert("틀린 인증번호입니다. 인증번호를 다시 입력해주세요.");
		putNum.value="";
		return false;
	}
	if(putNum.value==authNum){
		alert("인증성공");
		document.getElementById("numChk").value = 'suc';
		self.close();
	} 
} 
function test(){
	var email = document.getElementById('id').value;
	var sid= $('#id').val();
	var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
	alert(email);
	if(sid.indexOf('.') != -1 && sid.match(regExp)){
		var newWindow = window.open("about:blank", "이메일인증", "width=	400, height=300, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
		newWindow.location.href = "${root}/join/email.html?email="+ email;
	}else{
		alert("email을 확인하세요.");
	}
}
function join(){
	if(document.getElementById("id").value == "") {
		alert("push ur id");
		return;
	} else if(document.getElementById("id2").value != document.getElementById("id").value ) {
		alert("comfirm id");
		return;
	} else if(document.getElementById("pwd").value  == "") {
		alert("push ur pass");
		return;
	} else if(document.getElementById("pwd").value != document.getElementById("pwd2").value) {
		alert("comfirm pass");
		return;
	} else if(document.getElementById("numChk").value  != 'suc') {
		alert(document.getElementById("numChk").value);
		alert("인증을 확인하세요.");
		return;
	} else {
		alert("ok");
		document.joinform.action = "${root}/join/register.html";
		document.joinform.submit();
	}
}

function openzip(){
	window.open("${root}/user/zipsearch.html","zip","top=200, left=300, width=400, height=300, menubar=no, status=no, toolbar=no, location=no, scrollbars=yes");
}

function idcheck(){
	var root ='${root}';
	//var sid = document.getElementById("id").value;
	var sid= $('#id').val();
	var output='';
	var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
	//alert(sid.length);
	if(sid.indexOf('.') != -1 && sid.match(regExp)){
		$.ajax({
			type : 'POST',
			dataType : 'json',
			url : root + '/join/idCheck.html',
			data : {'sid' : sid},
			success : function(data){
				if(data.idcount == 0){
					output ='<font color="blue">'+ sid +'</font>는 사용가능합니다.';
				}else{
					output ='<font color="red">'+ sid +'</font>는 사용중입니다.';
				}
				$('#idview').css('display', '');
					$('#idview').empty();
				$('#idview').append(output);
			},
			error : function(e){
				
				alert("에러발생!!");
				$('#idview').css('display', 'none');
			}
		});
	}else{
		output ='<font color="red">e-mail형식으로 입력해주세요.</font>';
		$('#idview').css('display', '');
		$('#idview').empty();
		$('#idview').append(output);
	}
}

function sameIdCheck(){
	var id = $('#id').val();
	var id2 = $('#id2').val();
	var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
	//alert(id2);
	if(id2.indexOf('.') != -1  && id2.match(regExp)){
		$.ajax({
			data : {'id2' : id2, 'id': id},
			success : function(data){
				if(id == id2 ){
					output ='<font color="blue">'+ 'Correct' +'</font>';
				}else{
					output ='<font color="red">'+'Incorrect'+'</font>';
				}
				$('#checkIddview').css('display', '');
					$('#checkIddview').empty();
				$('#checkIddview').append(output);
			},
			error : function(e){
				
				alert("에러발생!!");
				$('#checkIddview').css('display', 'none');
			}
		});
	}else{
		output ='<font color="red">아이디는 4자이상 16자이하입니다.</font>';
		$('#checkIddview').css('display', '');
		$('#checkIddview').empty();
		$('#checkIddview').append(output);
	}
}
function samePwdCheck(){
	var pwd = $('#pwd').val();
	var pwd2 = $('#pwd2').val();
	//alert(id2);
	if(pwd2.length > 5){
		$.ajax({
			data : {'pwd2' : pwd2, 'pwd': pwd},
			success : function(data){
				if(pwd == pwd2 ){
					output ='<font color="blue">'+ 'Correct' +'</font>';
				}else{
					output ='<font color="red">'+'Incorrect'+'</font>';
				}
				$('#checkPwdview').css('display', '');
					$('#checkPwdview').empty();
				$('#checkPwdview').append(output);
			},
			error : function(e){
				
				alert("에러발생!!");
				$('#checkPwdview').css('display', 'none');
			}
		});
	}else{
		output ='<font color="red">more than 6 letters</font>';
		$('#checkPwdview').css('display', '');
		$('#checkPwdview').empty();
		$('#checkPwdview').append(output);
	}
}

function pwdCheck(){
	var pwd = $('#pwd').val();
	var chk = '^(?=.*[0-9])(?=.*[a-z])(?=[\\S]+$).{6,12}$';
	if(pwd.match(chk)){
		$.ajax({
			data : {'pwd': pwd},
			success : function(data){
				output ='<font color="blue">'+ 'Possible' +'</font>';
				$('#Pwdview').css('display', '');
				$('#Pwdview').empty();
				$('#Pwdview').append(output);
			},
			error : function(e){
				alert("에러발생!!");
				$('#Pwdview').css('display', 'none');
			}
		});
	}else{
		output ='<font color="red">more than 6 letters</font>';
		$('#Pwdview').css('display', '');
		$('#Pwdview').empty();
		$('#Pwdview').append(output);
	}
}
</script>

<form name ="joinform" method="post" action="">
	<table>
		<tr>
			<th>e-mail address</th>
			
			<td>
				<c:if test="${!empty email}"  >
					<input type="text" name="id" id="id" value="${email}"onkeyup="javascript:idcheck();">
				</c:if>
				<c:if test="${empty email }"  >
					<input type="text" name="id" id="id" value=""onkeyup="javascript:idcheck();">
				</c:if>
			<input type="button" value="인증버튼" onclick="javascript:test();">
			<div id="idview" style="display: none;"></div></td>	
		</tr>
		<tr>
			<th>Type it again</th>	
			<td><input type="text" name="id2" id="id2" onkeyup="javascript:sameIdCheck();">
			<div id="checkIddview" style="display: none;"></div>
			<b>note: plz confirm ur e-mail address again</b>
			</td>
		</tr>
		<tr>
			<th>password</th>
			<td>
				<input type="password" name="pwd" id="pwd" onkeyup="javascript:pwdCheck();">
				<div id="Pwdview" style="display: none;"></div>	
			</td>
		</tr>
		<tr>
			<th>Type it again</th>	
			<td>
				<input type="password" name="pwd2" id="pwd2" onkeyup="javascript:samePwdCheck();">
				<div id="checkPwdview" style="display: none;"></div>
			</td>
		</tr>
		<tr>
			<th>이메일인증</th>	
			<td>
				<input type="text" name="authnum" id="authnum" >
				<input type="button" value="Submit" onClick="return check();">
				<input type=hidden name="numChk" id="numChk" value="">
			</td>
		</tr>
		<tr>
	    	<td align="left">
	        	<input type="button" value="create acount" onclick="javascript:join();">
	&nbsp;&nbsp;
		    	<input type="reset" value="취소" onclick="history.back()">
		    </td>
		</tr>
	</table>
</form>
