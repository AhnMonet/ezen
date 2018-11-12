package shoppingMall;

import java.util.Date;

public class Orders {
	// DB order테이블 : o_id, o_customerId, o_date, o_price
	// 주문목록 : 주문번호 상품 총가격 날짜
	private String oId;
	private String cId;
	private String oPrice;
	private Date oDate;
	
	public String getoId() {
		return oId;
	}
	public void setoId(String oId) {
		this.oId = oId;
	}
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getoPrice() {
		return oPrice;
	}
	public void setoPrice(String oPrice) {
		this.oPrice = oPrice;
	}
	public Date getoDate() {
		return oDate;
	}
	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}
}

