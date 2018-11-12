package shoppingMall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ShoppingUtil.DBManager;
import customer.CustomerDAO;

public class ShoppingDAO{
	private static final Logger LOG = LoggerFactory.getLogger(CustomerDAO.class);
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public ArrayList<Products> mainProducts() { // 메인화면에 노출되는 랜덤 5개 상품
		ArrayList<Products> categoryList = new ArrayList<Products>();
		conn = DBManager.getConnection();
		String sql = "select * from products order by rand() limit 5;";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Products products = new Products();
				products.setpId(Integer.toString(rs.getInt(1)));
				products.setpName(rs.getString(2));
				products.setpUnitPrice(Integer.toString(rs.getInt(3)));
				products.setpImgName(rs.getString(4));
				products.setpDescription(rs.getString(5));
				categoryList.add(products);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			LOG.info("Error Code : {}", e.getErrorCode());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return categoryList;
	}

	public ArrayList<Products> AllByProducts(String pId) { // 상품목록
		ArrayList<Products> categoryList = new ArrayList<Products>();
		conn = DBManager.getConnection();
		String sql = "select * from products where p_id >= ? limit 5;";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(pId));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Products products = new Products();
				products.setpId(Integer.toString(rs.getInt(1)));
				products.setpName(rs.getString(2));
				products.setpUnitPrice(Integer.toString(rs.getInt(3)));
				products.setpImgName(rs.getString(4));
				products.setpDescription(rs.getString(5));
				categoryList.add(products);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			LOG.info("Error Code : {}", e.getErrorCode());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return categoryList;
	}

	public Products selectOneProduct(String pId) { // 상품 하나
		LOG.trace("selectOneProduct()");
		conn = DBManager.getConnection();
		String sql = "select*from products where p_id=?";
		Products product = new Products();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(pId));
			rs = pstmt.executeQuery();
			rs.next();
			product.setpId(Integer.toString(rs.getInt(1)));
			product.setpName(rs.getString(2));
			product.setpUnitPrice(Integer.toString(rs.getInt(3)));
			product.setpImgName(rs.getString(4));
			product.setpDescription(rs.getString(5));
			rs.close();
			return product;
		} catch (SQLException e) {
			e.printStackTrace();
			LOG.info("Error Code : {}", e.getErrorCode());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public Orders insertOrder(String cId, String oPrice) { // 주문하기
		LOG.trace("addOrder()");
		conn = DBManager.getConnection();
		String sql = "insert into orders(o_customerId, o_date, o_price) values(?, now(), ?);";
		Orders order = new Orders();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cId));
			pstmt.setInt(2, Integer.parseInt(oPrice));
			pstmt.executeUpdate();
			return order;
		} catch (SQLException e) {
			e.printStackTrace();
			LOG.info("Error Code : {}", e.getErrorCode());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public String getOrderId(String cId) { // 주문번호 구하기
		LOG.trace("getOrderId()");
		conn = DBManager.getConnection();
		String sql = "select o_id from orders where o_customerId=? order by o_id desc limit 1;";
		String oId = "";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cId));
			rs = pstmt.executeQuery();
			rs.next();
			oId = Integer.toString(rs.getInt(1));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			LOG.info("Error Code : {}", e.getErrorCode());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return oId;
	}

	public void insertSoldProduct(String oId, String pId, String quantity) { // sold_products에 insert
		LOG.trace("insertSoldProduct()");
		conn = DBManager.getConnection();
		String sql = "insert into sold_products(s_orderId, s_productId, s_quantity) values (?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(oId));
			pstmt.setInt(2, Integer.parseInt(pId));
			pstmt.setInt(3, Integer.parseInt(quantity));
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			LOG.info("Error Code : {}", e.getErrorCode());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public ArrayList<Orders> selectOrderList(String cId) {
		ArrayList<Orders> orderList = new ArrayList<Orders>();
		LOG.trace("selectOrderList()");
		conn = DBManager.getConnection();
		String sql = "select o_id, o_price, o_date from orders where o_customerId=?;";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cId));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Orders order = new Orders();
				order.setoId(rs.getString(1));
				order.setoPrice(rs.getString(2));
				order.setoDate(rs.getDate(3));
				orderList.add(order);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			LOG.info("Error Code : {}", e.getErrorCode());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return orderList;
	}
	
	public ArrayList<Inventory> selectInventory(String oId) {
		LOG.trace("selectInventory()");
		conn = DBManager.getConnection();
		String sql = "select p.p_id, p.p_name, p.p_unitPrice, sp.s_quantity from products as p " +
					"join sold_products as sp on sp.s_productId=p.p_id where s_orderId=?;";
		ArrayList<Inventory> inventoryList = new ArrayList<Inventory>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(oId));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Inventory order = new Inventory();
				order.setpId(rs.getString(1));
				order.setpName(rs.getString(2));
				order.setUnitPrice(rs.getString(3));
				order.setQuantity(rs.getString(4));
				inventoryList.add(order);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			LOG.info("Error Code : {}", e.getErrorCode());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return inventoryList;
	}
}
