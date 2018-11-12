<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- ==================================================================== -->
<title>ezen Shopping Mall</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<%@include file="../view/common/nav.jspf"%>
	</div>
	<!-- ==============================<nav>=================================================== -->

	<div class="container">
		<br>
		<br>
			<div class="col-md-12">
				<hr>
			</div>
			<div class="col-md-1"></div>
			
			<c:set var="categoryList" value="${requestScope.categoryList }" />
			<c:forEach var="product" items="${categoryList }">
				<div class="col-md-2">
					<div class="thumbnail">
						<a href="../control/shop_control.jsp?action=oneProductInfo&pId=${product.pId }">
							<img src=${product.pImgName } alt="toy">
						</a>
						<div class="caption" style="text-align: center;">
							<h5 style="font-weight: bold">${product.pName }</h5>
							<p>가격: ${product.pUnitPrice } 원
							<p>
						</div>
					</div>
				</div>
			</c:forEach>
			
			<div class="col-md-1"></div>
		</div>
		<br>
		<br>
	<!-- ================================<footer>============================================ -->
	<div class="container">
		<%@include file="../view/common/footer.jspf"%>
	</div>
	<!-- ====================================================================================== -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>