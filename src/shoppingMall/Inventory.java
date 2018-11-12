package shoppingMall;

public class Inventory {
	private String pId;
	private String pName;
	private String unitPrice;
	private String quantity;
	
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
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
	@Override
	public String toString() {
		return "pId=" + pId + ", pName=" + pName + ", unitPrice=" + unitPrice + ", quantity=" + quantity + " | ";
	}
}
