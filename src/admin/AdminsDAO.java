package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ShoppingUtil.DBManager;
import customer.CustomerDAO;
import customer.Customers;
import shoppingMall.Products;

public class AdminsDAO {
	private static final Logger LOG = LoggerFactory.getLogger(CustomerDAO.class);
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public ArrayList<Customers> AllByCustomers() { // 사용자 목록
		ArrayList<Customers> customerList = new ArrayList<Customers>();
		conn = DBManager.getConnection();
		String sql = "select c_id, c_name, c_email, c_tel from customers;";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Customers customer = new Customers();
				customer.setcId(Integer.toString(rs.getInt(1)));
				customer.setcName(rs.getString(2));
				customer.setcEmail(rs.getString(3));
				customer.setcTel(rs.getString(4));
				customerList.add(customer);
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
		return customerList;
	}
	
	public ArrayList<Customers> dayUnitCustomerOrder() { // 사용자 목록
		ArrayList<Customers> customerList = new ArrayList<Customers>();
		conn = DBManager.getConnection();
		String sql = "select";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Customers customer = new Customers();
				customer.setcId(Integer.toString(rs.getInt(1)));
				customer.setcName(rs.getString(2));
				customer.setcEmail(rs.getString(3));
				customer.setcTel(rs.getString(4));
				customerList.add(customer);
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
		return customerList;
	}
}
