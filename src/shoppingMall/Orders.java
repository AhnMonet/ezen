package shoppingMall;

import java.util.Date;

public class Orders {
	// DB order���̺� : o_id, o_customerId, o_date, o_price
	// �ֹ���� : �ֹ���ȣ ��ǰ �Ѱ��� ��¥
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

