<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ezen Shopping Mall</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<div class="container">
		<%@include file="../admin/common/nav.jspf"%>
	</div>
	<!-- ==============================<nav>=================================================== -->

	<div class="container">
		<div class="row">
			<br>
			<div class="col-md-offset-1 col-md-11">
				<h3>사용자 목록</h3>
			</div>
			<div class="col-md-12">
				<hr>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="pannel-title">ezenMall | 회원가입자 목록</div>
					</div>
					<form name="action" method="post" action="../control/shop_control.jsp?action=realOrder">
						<table class="table table-striped">
							<thead>
								<tr>
									<th class="col-md-2">&nbsp;&nbsp;&nbsp;&nbsp;회원번호</th>
									<th class="col-md-2">이름</th>
									<th class="col-md-2">이메일</th>
									<th class="col-md-2">전화번호</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="customerList" value="${requestScope.customerList}" />
								<c:forEach var="customer" items="${customerList}">
									<tr>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;${customer.cId}</td>
										<td>${customer.cName }</td>
										<td>${customer.cEmail }</td>
										<td>${customer.cTel }</td>
									</tr>
								</c:forEach>
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
	
	<!-- ==============================<footer>================================================ -->
	<div class="container">
		<%@include file="../admin/common/footer.jspf"%>
	</div>
	<!-- ====================================================================================== -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>