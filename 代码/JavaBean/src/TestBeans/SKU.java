package TestBeans;

public class SKU {
	private String SKUID; // ������ƷID
	private String SKUName; // ������Ʒ����
	private float unitPrice; // ������Ʒ����

	public SKU(String SKUID, String SKUName, float unitPrice) {
		this.SKUID = SKUID;
		this.SKUName = SKUName;
		this.unitPrice = unitPrice;
	}

	public String getSKUID() {
		return SKUID;
	}

	public void setSKUID(String sKUID) {
		SKUID = sKUID;
	}
	public String getSKUName() {
		return SKUName;
	}

	public void setSKUName(String sKUName) {
		SKUName = sKUName;
	}

	public float getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(float unitPrice) {
		this.unitPrice = unitPrice;
	}
}
