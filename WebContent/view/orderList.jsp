<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="shoppingMall.*, java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- ==================================================================== -->
<title>ezen Mall</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<jsp:useBean id="shopDao" scope="request" class="shoppingMall.ShoppingDAO"/>
<style type="text/css">
.bs-example {
	margin: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<%@include file="../view/common/nav.jspf"%>
	</div>
	<!-- ==============================<nav>=================================================== -->

	<div class="container">
		<div class="row">
			<div class="col-md-offset-1 col-md-11">
				<h3>주문내역</h3>
			</div>
			<div class="col-md-12">
				<hr>
			</div>
		</div>

		<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="bs-example">
				<div class="panel-group" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="panel-title">${sessionScope.cName}&nbsp;님의 주문내역</div>
							<p style="font-size: 12px">(주문번호를 누르면 주문상세정보를 확인할 수 있습니다.)</p>
						</div>
					</div>

					<c:set var="orderList" value="${requestScope.orderList}" />
					<c:forEach var="order" items="${orderList}">
					
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title" >
									<a style="font-weight: bold;" href="../control/shop_control.jsp?action=orderInfo&oId=${order.oId }&oPrice=${order.oPrice }">
										주문번호 :&nbsp;&nbsp;${order.oId }</a>
								</h4>
							</div>
							
								<div class="panel-body">
									<table class="table">
									<thead>
										<tr>
											<th class="col-md-2">#</th>
											<th class="col-md-3">주문번호</th>
											<th class="col-md-4">주문금액</th>
											<th class="col-md-3">주문일자</th>
										</tr>
									</thead>
									<tbody>
											<tr>
												<td> </td>
												<td>${order.oId }</td>
												<td>${order.oPrice }원</td>
												<td>${order.oDate }</td>
											</tr>
									</tbody>
									</table>
								</div>
							</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="col-md-1"></div>
		</div>
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
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>