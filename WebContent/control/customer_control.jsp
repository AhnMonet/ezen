<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="customer.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="customer" scope="page" class="customer.Customers" />
<jsp:useBean id="cDAO" class="customer.CustomerDAO" />
<jsp:setProperty name="customer" property="*" />

<%
	String action = request.getParameter("action");
	
	switch (action) {
	case "register":
		if (cDAO.addCustomer(customer)) {
			String cId = cDAO.getCustomerId(customer);
			//System.out.println(cId);
			//out.println("<script>alert('아이디는 +  + 입니다.');</script>");
			//response.sendRedirect("../control/shop_control.jsp?action=main");
			request.setAttribute("cId", cId);
			pageContext.forward("../view/alert.jsp");
		} else {
			out.println("<script>alert('같은 아이디가 존재 합니다.');history.go(-1);</script>");
		}
		break;
	case "login":
		if (cDAO.login(customer.getcId(), customer.getcPassword())) {
			session.setAttribute("cId", customer.getcId());
			Customers cust = cDAO.getCustomer(customer.getcId());
			session.setAttribute("cName", cust.getcName());
			response.sendRedirect("../control/shop_control.jsp?action=main");
		} else {
			out.println("<script>alert('아이디나 비밀번호가 틀렸습니다.');</script>");
		}
		break;
	case "logout":
		session.invalidate();
		response.sendRedirect("../control/shop_control.jsp?action=main");
		break;
	}
%>