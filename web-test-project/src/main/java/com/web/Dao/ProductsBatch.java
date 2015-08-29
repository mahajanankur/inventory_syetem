package com.web.Dao;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.web.enums.StockStatus;

/**
 * @author ankur
 * 
 */
@Entity
@Table(name = "product_batch")
public class ProductsBatch {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "batch_id")
	private int			batchId;

	@Column(name = "manf_date")
	private Date		manfDate;

	@Column(name = "expiry_date")
	private Date		expiryDate;

	@Column(name = "vendor_id")
	private int			vendorId;

	@Column(name = "stock_id")
	private int			stockId;

	@Column(name = "product_id")
	private int			productId;

	@Column(name = "product_name")
	private String		productName;

	@Column(name = "status")
	private StockStatus	status;

	@Column(name = "sold_on")
	private Timestamp	soldOn;

	@Column(name = "client_id")
	private int			clientId;

	/**
	 * @return the batchId
	 */
	public int getBatchId() {
		return batchId;
	}

	/**
	 * @param batchId
	 *            the batchId to set
	 */
	public void setBatchId(int batchId) {
		this.batchId = batchId;
	}

	/**
	 * @return the manfDate
	 */
	public Date getManfDate() {
		return manfDate;
	}

	/**
	 * @param manfDate
	 *            the manfDate to set
	 */
	public void setManfDate(Date manfDate) {
		this.manfDate = manfDate;
	}

	/**
	 * @return the expiryDate
	 */
	public Date getExpiryDate() {
		return expiryDate;
	}

	/**
	 * @param expiryDate
	 *            the expiryDate to set
	 */
	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	/**
	 * @return the vendorId
	 */
	public int getVendorId() {
		return vendorId;
	}

	/**
	 * @param vendorId
	 *            the vendorId to set
	 */
	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
	}

	/**
	 * @return the stockId
	 */
	public int getStockId() {
		return stockId;
	}

	/**
	 * @param stockId
	 *            the stockId to set
	 */
	public void setStockId(int stockId) {
		this.stockId = stockId;
	}

	/**
	 * @return the productId
	 */
	public int getProductId() {
		return productId;
	}

	/**
	 * @param productId
	 *            the productId to set
	 */
	public void setProductId(int productId) {
		this.productId = productId;
	}

	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}

	/**
	 * @param productName
	 *            the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}

	/**
	 * @return the status
	 */
	public StockStatus getStatus() {
		return status;
	}

	/**
	 * @param status
	 *            the status to set
	 */
	public void setStatus(StockStatus status) {
		this.status = status;
	}

	/**
	 * @return the soldOn
	 */
	public Timestamp getSoldOn() {
		return soldOn;
	}

	/**
	 * @param soldOn
	 *            the soldOn to set
	 */
	public void setSoldOn(Timestamp soldOn) {
		this.soldOn = soldOn;
	}

	/**
	 * @return the clientId
	 */
	public int getClientId() {
		return clientId;
	}

	/**
	 * @param clientId
	 *            the clientId to set
	 */
	public void setClientId(int clientId) {
		this.clientId = clientId;
	}

	/*
	 * (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ProductsBatch [batchId=" + batchId + ", manfDate=" + manfDate
				+ ", expiryDate=" + expiryDate + ", vendorId=" + vendorId
				+ ", stockId=" + stockId + ", productId=" + productId
				+ ", productName=" + productName + ", status=" + status
				+ ", soldOn=" + soldOn + ", clientId=" + clientId + "]";
	}

}
