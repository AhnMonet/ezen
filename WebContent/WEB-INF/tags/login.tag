<%@ tag body-content="scriptless" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="../css/*" rel="stylesheet">
<form name="loginform" method="post" action="../control/customer_control.jsp">
	<c:choose>
		<c:when test="${cId != null }">
			<div class="row" style="padding-top: 10px">
			<input type="hidden" name="action" value="logout">
				<div class="col-md-12">
					${sessionScope.cName }님 환영합니다&nbsp;&nbsp;<input type="submit" class="btn btn-default" value="로그아웃">
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="row" style="padding-top: 10px">
				<div class="col-md-4"><input type="text" class="form-control" placeholder="아이디" name="cId"></div>
				<div class="col-md-4"><input type="password" class="form-control" placeholder="비밀번호" name="cPassword"></div>
				<input type="hidden" name="action" value="login">
				<input type="submit" class="btn btn-default" value="로그인">
			</div>
		</c:otherwise>
	</c:choose>
</form>
