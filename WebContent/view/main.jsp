<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, customer.*, shoppingMall.*"%>
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

	<!-- 이미지 슬라이드 -->
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="../img/slide1.jpg" alt="슬라이드1">
				<div class="carousel-caption">...</div>
			</div>
			<div class="item">
				<img src="../img/slide2.jpg" alt="슬라이드2">
				<div class="carousel-caption">...</div>
			</div>
			<div class="item">
				<img src="../img/slide3.jpg" alt="슬라이드3">
				<div class="carousel-caption">...</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- ============================== -->

	<div class="container">
		<div class="row" style="margin-top: 70px">
			<div class="col-sm-3" align="center">
				<a href="../control/shop_control.jsp?action=viewProductList&category=300001" style="color: #222222; font-size: 15px; text-decoration: none">
					<div class="glyphicon glyphicon-th"></div>&nbsp;다양한 상품 보러가기</a>
			</div>
			<div class="col-sm-9"></div>
		</div>
		<div class="col-md-12">
			<hr>
		</div>
		<div class="col-md-1"></div>
		<c:set var="mainList" value="${requestScope.mainList }" />
			<c:forEach var="product" items="${mainList }">
				<div class="col-md-2">
					<div class="thumbnail">
						<a href="../control/shop_control.jsp?action=oneProductInfo&pId=${product.pId }">
							<img src=${product.pImgName } alt="mainImg">
						</a>
					</div>
				</div>
			</c:forEach>
		<div class="col-md-1"></div>
	</div>
	<br>
	<br>
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