package shoppingMall;

public class ShoppingCart {
	private String cId;
	private String pId;
	private String pName;
	private String unitPrice;
	private String pImgName;
	private String quantity;
	private String sum;
	
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getpImgName() {
		return pImgName;
	}
	public void setpImgName(String pImgName) {
		this.pImgName = pImgName;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getSum() {
		return sum;
	}
	public void setSum(String sum) {
		this.sum = sum;
	}
	
	@Override
	public String toString() {
		return "ShoppingCart [cId=" + cId + ", pId=" + pId + ", pName=" + pName + ", unitPrice=" + unitPrice
				+ ", pImgName=" + pImgName + ", quantity=" + quantity + ", sum=" + sum + "]";
	}
}
