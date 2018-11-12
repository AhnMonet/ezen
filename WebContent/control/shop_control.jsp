<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="shoppingMall.*, java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="shopDao" scope="request" class="shoppingMall.ShoppingDAO"/>
<jsp:useBean id="shoppingCart"  class="shoppingMall.ShoppingCart"/>
<jsp:useBean id="inventory" class="shoppingMall.Inventory"/>
<jsp:useBean id="product" class="shoppingMall.Products"/>
<jsp:useBean id="order" class="shoppingMall.Orders"/> 
<jsp:setProperty name="product" property="*"/>
<jsp:setProperty name="order" property="*"/>
<%
	String cId = (String) session.getAttribute("cId");
	//String cId = request.getParameter("cId");
	String action = request.getParameter("action");
	
	switch(action) {
	case "main":
		ArrayList<Products> mainList = shopDao.mainProducts();
		request.setAttribute("mainList", mainList);
		
		request.setAttribute("cId", cId);
		pageContext.forward("../view/main.jsp");
		break;
	case "realOrder":
	      ArrayList<ShoppingCart> scList = (ArrayList<ShoppingCart>) session.getAttribute("shoppingCart");
	      int total = 0;
	      for (ShoppingCart scDto : scList) {
	         int sum = Integer.parseInt(scDto.getSum().replaceAll(",", ""));
	         total += sum;
	      }
	      String price = Integer.toString(total);
	      // DB테이블 orders에 insert
	      shopDao.insertOrder(cId, price);
	 	  // oId 불러오기
	      String orderId = shopDao.getOrderId(cId);
	      scList = (ArrayList<ShoppingCart>) session.getAttribute("shoppingCart");
	      // DB테이블 sold_products에 insert
	      for (ShoppingCart scDto : scList) {
	    	  String productId = scDto.getpId();
	    	  String quantity = scDto.getQuantity();
	    	  shopDao.insertSoldProduct(orderId, productId, quantity);
	      }
	      // shoppingCart 세션 지우기
	      out.println("<script>alert('상품을 주문했습니다.');</script>");
	      session.removeAttribute("shoppingCart");
	      response.sendRedirect("../control/shop_control.jsp?action=main");
	      break;
	case "orderList":
		if(cId == null) {
			out.println("<script>alert('로그인을 해주세요.'); history.go(-1);</script>");
			break;
		}
		ArrayList<Orders> orderList = shopDao.selectOrderList(cId);
		request.setAttribute("orderList", orderList);
		pageContext.forward("../view/orderList.jsp");
		break;
	case "orderInfo":
		String oId = request.getParameter("oId");
		String strPrice = String.format("%,d", Integer.parseInt(request.getParameter("oPrice")));
		ArrayList<Inventory> inventoryList = shopDao.selectInventory(oId);
		System.out.println(inventoryList.toString());
		
		request.setAttribute("oId", oId);
		request.setAttribute("oPrice", strPrice);
		request.setAttribute("inventoryList", inventoryList);
		pageContext.forward("../view/orderInfo.jsp");
		break;
	case "total":
		scList = (ArrayList<ShoppingCart>) session.getAttribute("shoppingCart");
		if(scList == null) {
			out.println("<script>alert('장바구니가 비었습니다.');history.go(-1);</script>");
			break;
		}
		total = 0;
		for(ShoppingCart scDto : scList) {
			int sum = Integer.parseInt(scDto.getSum().replaceAll(",", ""));
			total += sum;
		}
		String oPrice = String.format("%,d", total);
		request.setAttribute("total", oPrice);
		pageContext.forward("../view/shoppingCart.jsp");
		break;
	case "addItem":
		scList = null;
		scList = (ArrayList<ShoppingCart>) session.getAttribute("shoppingCart");
		if (scList == null) {
			scList = new ArrayList<ShoppingCart>();
		}
		
		request.setAttribute("cId", cId);
		String pId = request.getParameter("pId");
		String pName = request.getParameter("pName");
		String unitPrice = request.getParameter("unitPrice");
		String quantity = request.getParameter("quantity");
		String pImgName = request.getParameter("pImgName");
		// 계산용 타입변환
		int pUnitPrice = Integer.parseInt(unitPrice);
		int pQuantity = Integer.parseInt(quantity);
		int intSum = pUnitPrice * pQuantity;
		//String sum = Integer.toString(intSum);
		unitPrice = String.format("%,d", pUnitPrice);
		String sum = String.format("%,d", intSum);
		
		shoppingCart.setcId(cId);
		shoppingCart.setpId(pId);
		shoppingCart.setpName(pName);
		shoppingCart.setUnitPrice(unitPrice);
		shoppingCart.setQuantity(quantity);
		shoppingCart.setpImgName(pImgName);
		shoppingCart.setSum(sum);
		
		System.out.println("addItem: " + shoppingCart.toString());
		scList.add(shoppingCart);
		session.setAttribute("shoppingCart", scList);
		out.println("<script>alert('상품이 추가되었습니다.');history.go(-1);</script>");
		break;
	case "orderDelete":
		session.removeAttribute("shoppingCart");
		out.println("<script>alert('상품주문이 취소되었습니다.');</script>");
		response.sendRedirect("../control/shop_control.jsp?action=main");
		break;
	case "viewProductList":
		int category = Integer.parseInt(request.getParameter("category"));
		ArrayList<Products> categoryList = shopDao.AllByProducts(Integer.toString(category));
		request.setAttribute("categoryList", categoryList);
		pageContext.forward("../view/category.jsp");
		break;
	case "oneProductInfo":
		Products pro = shopDao.selectOneProduct(product.getpId());
		request.setAttribute("product", pro);
		pageContext.forward("../view/productInfo.jsp");
		break;
	}
	
%>