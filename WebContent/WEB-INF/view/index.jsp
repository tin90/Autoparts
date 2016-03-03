<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${root}/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
function check(){
	var form = document.authenform;
	var authNum = ${authNum};
	
	if(!form.authnum.value){
		alert("인증번호를 입력하세요.");
		return false;
	}
	if(form.authnum.value != authNum){
		alert("틀린 인증번호입니다. 인증번호를 다시 입력해주세요.");
		form.authnum.value="";
		return false;
	}
	if(form.authnum.value==authNum){
		alert("인증성공");
		opener.document.userinput.mailChecck.value="인증완료";
		self.close();
	}
	
}
</script>
<div>
	<form method="post" name="authenform" onSubmit="return check();">
		<input type="text" name="authnum"><br/><br/>
		<input type="submit" value="Submit"><br/><br/>
	</form>
</div>