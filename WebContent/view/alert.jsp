<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	var cId = '${cId }';
	
	window.onload=function() {
		alert('회원번호는' + cId + '입니다.');
		document.location.href= '../control/shop_control.jsp?action=main';
	}
</script>
</head>
<body>
이동은 했구나..
</body>
</html>