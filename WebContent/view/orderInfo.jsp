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
				<h3>주문상세조회</h3>
			</div>
			<div class="col-md-12">
				<hr>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="pannel-title">주문번호&nbsp;${requestScope.oId }&nbsp;&nbsp;|&nbsp;&nbsp;상세조회</div>
					</div>
						<table class="table table-striped">
							<thead>
								<tr>
									<th class="col-md-1">&nbsp;&nbsp;&nbsp;&nbsp;상품번호</th>
									<th class="col-md-2">상품명</th>
									<th class="col-md-2">상품금액</th>
									<th class="col-md-1">상품수량</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="inventoryList" value="${requestScope.inventoryList }" />
								<c:forEach var="inventory" items="${inventoryList }">
									<tr>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;${inventory.pId }</td>
										<td>${inventory.pName }</td>
										<td>${inventory.unitPrice }원</td>
										<td>${inventory.quantity }</td>
									</tr>
								</c:forEach>
									<tr>
										<td colspan="4" align="center">총 주문금액 : ${requestScope.oPrice }원</td>
									</tr>
								<tr align="center">
									<td colspan="4">
										<input type="button" class="btn btn-default" value="주문조회로 돌아가기" onclick="history.go(-1);">
									</td>
								</tr>
								
							</tbody>
						</table>
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