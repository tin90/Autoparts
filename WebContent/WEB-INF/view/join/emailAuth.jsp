<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript">    
    function closeWindow() {  
            setTimeout(function() {  
        window.close();  
            }, 3000);  
        }    
    // 창이 열린 후 3초후에 닫기  
    opener.location.reload(true);  
    window.onload = closeWindow();
</script>  
</head>
<body>
<a href="#" onClick="javascript:closeWindow();">email로 전송하였습니다.</a> 
</body>
</html>