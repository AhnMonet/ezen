<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="shoppingMall.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- ------------------------------------------------------------------------------------------------- -->
<title>ezen Mall</title>
<link href="../css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="../css/login.css" rel="stylesheet">
<jsp:useBean id="shopDao" scope="page" class="shoppingMall.ShoppingDAO" />
<jsp:useBean id="shoppingCart" class="shoppingMall.ShoppingCart" />
<!-- ------------------------------------------------------------------------------------------------- -->
</head>
<body>
	<div class="container">
		<%@include file="../view/common/nav.jspf"%>
	</div>
	<!-- ------------------------------------------------------------------------------------------------- -->

	<div class="container">
		<div class="row">
			<br>
			<div class="col-md-offset-1 col-md-11">
				<h3>장바구니 조회</h3>
			</div>
			<div class="col-md-12">
				<hr>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="pannel-title">${sessionScope.cName}&nbsp;님의 장바구니</div>
					</div>
					<form name="action" method="post" action="../control/shop_control.jsp?action=realOrder">
						<table class="table table-striped">
							<thead>
								<tr>
									<th class="col-md-1">&nbsp;&nbsp;&nbsp;&nbsp;상품번호</th>
									<th class="col-md-3">상품명</th>
									<th class="col-md-1">단가</th>
									<th class="col-md-1">수량</th>
									<th class="col-md-1">금액</th>
								</tr>
							</thead>
							<tbody>

								<c:set var="scList" value="${sessionScope.shoppingCart}" />
								<c:forEach var="cart" items="${scList}">
									<tr>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;${cart.pId}</td>
										<td>${cart.pName }</td>
										<td>${cart.unitPrice }원</td>
										<td>${cart.quantity}</td>
										<td>${cart.sum}원</td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="5" align="center">총금액 : ${requestScope.total }원</td>
								</tr>
								<tr align="center">
									<td colspan="5">
										<input type="submit" class="btn btn-default" name="realOrder" value="구매">&nbsp;&nbsp;
										<button type="button" class="btn btn-default">
											<a href="../control/shop_control.jsp?action=orderDelete" style="text-decoration: none; color: #222222;">취소</a>
										</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>

	<!-- ------------------------------------------------------------------------------------------ -->
	<div class="container">
		<%@include file="../view/common/footer.jspf"%>
	</div>
	<!-- ==================================================================== -->
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>