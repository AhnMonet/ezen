<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, customer.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="admin" scope="page" class="admin.Admins" />
<jsp:useBean id="aDAO" class="admin.AdminsDAO" />
<jsp:setProperty name="admin" property="*" />

<%
	String action = request.getParameter("action");
	
	
	switch (action) {
		case "customerList" :
			ArrayList<Customers> customerList = aDAO.AllByCustomers();
			request.setAttribute("customerList", customerList);
			pageContext.forward("../admin/customerList.jsp");
			break;
		case "main":
			pageContext.forward("../admin/adminMain.jsp");
			break;
	}
%>