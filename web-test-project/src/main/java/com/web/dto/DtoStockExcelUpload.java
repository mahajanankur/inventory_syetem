package com.web.dto;

import java.util.Date;

/**
 * @author ankur
 * 
 */
public class DtoStockExcelUpload {

	private int		productId;

	private String	productName;

	private Date	manfDate;

	private Date	expDate;

	private String	status;

	private int		stockId;

	private int		vendorId;

	private int		productWiseQuantity;

	private int		totalQuantity;

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Date getManfDate() {
		return manfDate;
	}

	public void setManfDate(Date manfDate) {
		this.manfDate = manfDate;
	}

	public Date getExpDate() {
		return expDate;
	}

	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getStockId() {
		return stockId;
	}

	public void setStockId(int stockId) {
		this.stockId = stockId;
	}

	public int getVendorId() {
		return vendorId;
	}

	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
	}

	public int getProductWiseQuantity() {
		return productWiseQuantity;
	}

	public void setProductWiseQuantity(int productWiseQuantity) {
		this.productWiseQuantity = productWiseQuantity;
	}

	public int getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(int totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + productId;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DtoStockExcelUpload other = (DtoStockExcelUpload) obj;
		if (productId != other.productId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "DtoStockExcelUpload [productId=" + productId + ", productName="
				+ productName + ", manfDate=" + manfDate + ", expDate="
				+ expDate + ", status=" + status + ", stockId=" + stockId
				+ ", vendorId=" + vendorId + ", productWiseQuantity="
				+ productWiseQuantity + ", totalQuantity=" + totalQuantity
				+ "]";
	}

}
