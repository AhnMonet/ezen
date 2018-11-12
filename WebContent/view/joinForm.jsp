<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- ==================================================================== -->
<title>ezen mall</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
	boby {
		background-image: url("../img/joinform_bg.png");
		background-size: cover;
		background-repeat: repeat;
	}
</style>
</head>
<body>
	<div class="container">
		<%@include file="../view/common/nav.jspf"%>
	</div>

	<!-- ==============================<nav>=================================================== -->

	<form class="form-horizontal" method="post" action="../control/customer_control.jsp?action=register">
		<fieldset>
			<div class="col-md-offset-2 col-md-8" align="center">
				<h3>회원가입</h3>
				<br> <br>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="name">이 름</label>
				<div class="col-md-4">
					<input name="cName" type="text" placeholder="이름을 입력하세요"
						class="form-control input-md" required>
				</div>
			</div>

			<!-- Password input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="password">비밀번호</label>
				<div class="col-md-4">
					<input name="cPassword" type="password" placeholder="비밀번호를 입력하세요"
						class="form-control input-md" required>

				</div>
			</div>

			<!-- Email input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="email">이메일</label>
				<div class="col-md-4">
					<input name="cEmail" type="email" placeholder="이메일을 입력하세요"
						class="form-control input-md" required>
				</div>
			</div>

			<!-- Tel input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="tel">전화번호</label>
				<div class="col-md-4">
					<input name="cTel" type="tel" placeholder="전화번호를 입력하세요"
						class="form-control input-md" required>
				</div>
			</div>

			<!-- Button -->
			<div class="form-group" align="center">
				<label class="col-md-4 control-label" for="register"></label>
				<div class="col-md-4">
					<button type="submit" class="btn btn-default">회원가입</button>
				</div>
			</div>
		</fieldset>
	</form>

	<!-- ==============================<footer>================================================ -->
	<div class="container">
		<%@include file="../view/common/footer.jspf"%>
	</div>
	<!-- ====================================================================================== -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>