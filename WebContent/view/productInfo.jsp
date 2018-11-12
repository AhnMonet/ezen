<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="shoppingMall.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- ==================================================================== -->
<title>ezen Shopping Mall</title>
<jsp:useBean id="product" scope="request" class="shoppingMall.Products" />
<jsp:useBean id="shoppingCart" scope="request" class="shoppingMall.ShoppingCart" />
<link href="../css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<%@include file="../view/common/nav.jspf"%>
	</div>
	<!-- ==============================<nav>=================================================== -->
	<br>
	<br>

	<div class="container">
		<div class="col-md-1"></div>
		<div class="col-md-5">
			<div class="thumbnail">
				<img src="${product.pImgName }">
			</div>
		</div>
		<div class="col-md-5">
			<form name="form" action="../control/shop_control.jsp?action=addItem" method="post">
				<input type="hidden" name="pId" value="${product.pId}"> 
				<input type="hidden" name="pName" value="${product.pName}"> 
				<input type="hidden" name="unitPrice" value="${product.pUnitPrice}">
				<input type="hidden" name="pImgName" value="${product.pImgName}">
				<table class="table">
					<tbody>
						<tr>
							<td scope="col">상품번호</td>
							<td scope="col">${product.pId }</td>
						</tr>
						<tr>
							<td scope="col">상품명</td>
							<td scope="col">${product.pName }</td>
						</tr>
						<tr>
							<td scope="col">상품가격</td>
							<td scope="col">${product.pUnitPrice }원</td>
						</tr>
						<tr>
							<td scope="col">상품설명</td>
							<td scope="col">${product.pDescription }</td>
						</tr>
						<tr>
							<td scope="col">상품수량&nbsp;&nbsp; <select name="quantity">
									<option selected>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
							</select>
							</td>
							<td scope="row" align="right">
								<button type="submit" class="btn btn-default" value="addItem">
									&nbsp;<div class="glyphicon glyphicon-shopping-cart"></div>&nbsp;장바구니
								</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<div class="col-md-1"></div>
	</div>
	<br>
	<br>
	<br>

	<!-- ==============================<footer>================================================ -->
	<div class="container">
		<%@include file="../view/common/footer.jspf"%>
	</div>
	<!-- ====================================================================================== -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>